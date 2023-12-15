<?php

namespace Botble\RealEstate\Http\Controllers;

use App\Models\User;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\Assets;
use Botble\Base\Facades\EmailHandler;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Optimize\Facades\OptimizerHelper;
use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Forms\AccountPropertyForm;
use Botble\RealEstate\Http\Requests\AccountPropertyRequest;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\CustomFieldValue;
use Botble\RealEstate\Models\Property;
use Botble\RealEstate\Models\PropertyAccess;
use App\Notifications\ProjectApprovalEmail;
use Botble\ACL\Notifications\ProjectNotification;
use Botble\RealEstate\Repositories\Eloquent\PropertyRepository;
use Botble\RealEstate\Repositories\Interfaces\AccountActivityLogInterface;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\RealEstate\Services\SaveFacilitiesService;
use Botble\RealEstate\Services\StorePropertyCategoryService;
use Botble\RealEstate\Tables\AccountPropertyTable;
use Botble\SeoHelper\Facades\SeoHelper;
use Carbon\Carbon;
use Illuminate\Contracts\Config\Repository;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Mail;

class AccountPropertyController extends Controller
{
    public function __construct(
        Repository $config,
        protected AccountInterface $accountRepository,
        protected PropertyInterface $propertyRepository,
        protected AccountActivityLogInterface $activityLogRepository
    ) {
        Assets::setConfig($config->get('plugins.real-estate.assets'));

        OptimizerHelper::disable();
    }

    public function index(AccountPropertyTable $propertyTable)
    {
        SeoHelper::setTitle(trans('plugins/real-estate::account-property.properties'));

        return $propertyTable->render('plugins/real-estate::account.table.base');
    }

    public function create(FormBuilder $formBuilder)
    {
        if (!auth('account')->user()->canPost()) {
            return back()->with(['error_msg' => trans('plugins/real-estate::package.add_credit_alert')]);
        }

        SeoHelper::setTitle(trans('plugins/real-estate::account-property.write_property'));

        return $formBuilder->create(AccountPropertyForm::class)->renderForm();
    }

    public function store(
        AccountPropertyRequest $request,
        BaseHttpResponse $response,
        AccountInterface $accountRepository,
        StorePropertyCategoryService $propertyCategoryService,
        SaveFacilitiesService $saveFacilitiesService
    ) {
        if (!auth('account')->user()->canPost()) {
            return back()->with(['error_msg' => trans('plugins/real-estate::package.add_credit_alert')]);
        }

if( $request['project_id'] != 21){
    $checkIfUserAllowed = $this->checkUserAssociatedWithProject(auth('account')->id(), $request['project_id']);
}

        if (!$checkIfUserAllowed) {
            $user = User::where('super_user', 1)->first();
            $user->notify(new ProjectApprovalEmail());
            return back()->with(['error_msg' => trans('plugins/real-estate::package.add_project_to_property_alert')]);
        }

        $property = $this->propertyRepository->getModel();

        $property->fill(array_merge($this->processRequestData($request), [
            'author_id' => auth('account')->id(),
            'author_type' => Account::class,
        ]));

        $property->expire_date = Carbon::now()->addDays(RealEstateHelper::propertyExpiredDays());

        if (setting('enable_post_approval', 1) == 0) {
            $property->moderation_status = ModerationStatusEnum::APPROVED;
        }

        $property = $this->propertyRepository->createOrUpdate($property);

        if ($property) {
            if (RealEstateHelper::isEnabledCustomFields()) {
                $this->saveCustomFields($property, $request->input('custom_fields', []));
            }

            $property->features()->sync($request->input('features', []));

            $saveFacilitiesService->execute($property, $request->input('facilities', []));

            $propertyCategoryService->execute($request, $property);
        }

        event(new CreatedContentEvent(PROPERTY_MODULE_SCREEN_NAME, $request, $property));

        $this->activityLogRepository->createOrUpdate([
            'action' => 'create_property',
            'reference_name' => $property->name,
            'reference_url' => route('public.account.properties.edit', $property->id),
        ]);

        if (RealEstateHelper::isEnabledCreditsSystem()) {
            $account = $accountRepository->findOrFail(auth('account')->id());
            $account->credits--;
            $account->save();
        }

        EmailHandler::setModule(REAL_ESTATE_MODULE_SCREEN_NAME)
            ->setVariableValues([
                'post_name' => $property->name,
                'post_url' => route('property.edit', $property->id),
                'post_author' => $property->author->name,
            ])
            ->sendUsingTemplate('new-pending-property');

        return $response
            ->setPreviousUrl(route('public.account.properties.index'))
            ->setNextUrl(route('public.account.properties.edit', $property->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }


    public function checkUserAssociatedWithProject($user_id, $project_id)
    {
        $isAuthForProperty =  PropertyAccess::where('user_id', $user_id)
            ->where('project_id', $project_id)
            ->where('is_approved', 1)
            ->first();

        if ($isAuthForProperty) {
            return true;
        } else {
            PropertyAccess::create([
                'project_id' => $project_id,
                'user_id' => $user_id,
                'is_approved' => 0,
            ]);

            return false;
        }
    }

    public function edit(int|string $id, FormBuilder $formBuilder, Request $request)
    {
        $property = $this->propertyRepository->getFirstBy([
            'id' => $id,
            'author_id' => auth('account')->id(),
            'author_type' => Account::class,
        ]);

        if (!$property) {
            abort(404);
        }

        event(new BeforeEditContentEvent($request, $property));

        SeoHelper::setTitle(trans('plugins/real-estate::property.edit') . ' "' . $property->name . '"');

        return $formBuilder
            ->create(AccountPropertyForm::class, ['model' => $property])
            ->renderForm();
    }

    public function update(
        int|string $id,
        AccountPropertyRequest $request,
        BaseHttpResponse $response,
        StorePropertyCategoryService $propertyCategoryService,
        SaveFacilitiesService $saveFacilitiesService
    ) {
        $property = $this->propertyRepository->getFirstBy([
            'id' => $id,
            'author_id' => auth('account')->id(),
            'author_type' => Account::class,
        ]);

        if (!$property) {
            abort(404);
        }

        $property->fill($this->processRequestData($request));

        $this->propertyRepository->createOrUpdate($property);

        if (RealEstateHelper::isEnabledCustomFields()) {
            $this->saveCustomFields($property, $request->input('custom_fields', []));
        }

        $property->features()->sync($request->input('features', []));

        $saveFacilitiesService->execute($property, $request->input('facilities', []));

        $propertyCategoryService->execute($request, $property);

        event(new UpdatedContentEvent(PROPERTY_MODULE_SCREEN_NAME, $request, $property));

        $this->activityLogRepository->createOrUpdate([
            'action' => 'update_property',
            'reference_name' => $property->name,
            'reference_url' => route('public.account.properties.edit', $property->id),
        ]);

        return $response
            ->setPreviousUrl(route('public.account.properties.index'))
            ->setNextUrl(route('public.account.properties.edit', $property->id))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    protected function processRequestData(Request $request): array
    {
        $shortcodeCompiler = shortcode()->getCompiler();

        $request->merge([
            'content' => $shortcodeCompiler->strip($request->input('content'), $shortcodeCompiler->whitelistShortcodes()),
        ]);

        $except = [
            'is_featured',
            'author_id',
            'author_type',
            'expire_date',
        ];

        foreach ($except as $item) {
            $request->request->remove($item);
        }

        return $request->input();
    }

    public function destroy(int|string $id, BaseHttpResponse $response)
    {
        $property = $this->propertyRepository->getFirstBy([
            'id' => $id,
            'author_id' => auth('account')->id(),
            'author_type' => Account::class,
        ]);

        if (!$property) {
            abort(404);
        }

        $this->propertyRepository->delete($property);

        $this->activityLogRepository->createOrUpdate([
            'action' => 'delete_property',
            'reference_name' => $property->name,
        ]);

        return $response->setMessage(__('Delete property successfully!'));
    }

    public function renew(int|string $id, BaseHttpResponse $response)
    {
        $property = $this->propertyRepository->findOrFail($id);

        $account = auth('account')->user();

        if (RealEstateHelper::isEnabledCreditsSystem() && $account->credits < 1) {
            return $response->setError()->setMessage(__('You don\'t have enough credit to renew this property!'));
        }

        $property->expire_date = $property->expire_date->addDays(RealEstateHelper::propertyExpiredDays());
        $property->save();

        if (RealEstateHelper::isEnabledCreditsSystem()) {
            $account->credits--;
            $account->save();
        }

        return $response->setMessage(__('Renew property successfully'));
    }

    protected function saveCustomFields(Property $property, array $customFields = []): void
    {
        $customFields = CustomFieldValue::formatCustomFields($customFields);

        $property->customFields()
            ->whereNotIn('id', collect($customFields)->pluck('id')->all())
            ->delete();

        $property->customFields()->saveMany($customFields);
    }
}
