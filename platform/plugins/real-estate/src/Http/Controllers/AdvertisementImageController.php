<?php

namespace Botble\RealEstate\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Forms\AdvertisementImageForm;
use Botble\RealEstate\Http\Requests\AdvertisementImageRequest;
use Botble\RealEstate\Repositories\Interfaces\AdvertisementImageInterface;
use Botble\RealEstate\Tables\AdvertisementImageTable;
use Exception;
use Illuminate\Http\Request;

class AdvertisementImageController extends BaseController
{
    public function __construct(protected AdvertisementImageInterface $packageRepository)
    {
    }

    public function index(AdvertisementImageTable $table)
    {
        PageTitle::setTitle(trans('plugins/real-estate::package.name'));

        return $table->renderTable();
    }

    public function create(FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('plugins/real-estate::package.create'));

        return $formBuilder->create(AdvertisementImageForm::class)->renderForm();
    }

    public function store(AdvertisementImageRequest $request, BaseHttpResponse $response)
    {
        $package = $this->packageRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(PACKAGE_MODULE_SCREEN_NAME, $request, $package));

        return $response
            ->setPreviousUrl(route('advertisement-image.index'))
            ->setNextUrl(route('advertisement-image.edit', $package->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(int|string $id, FormBuilder $formBuilder, Request $request)
    {
        $package = $this->packageRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $package));

        PageTitle::setTitle(trans('plugins/real-estate::package.edit') . ' "' . $package->name . '"');

        return $formBuilder->create(AdvertisementImageForm::class, ['model' => $package])->renderForm();
    }

    public function update(int|string $id, AdvertisementImageRequest $request, BaseHttpResponse $response)
    {
        $package = $this->packageRepository->findOrFail($id);

        // Set approved_at to the current timestamp if status is published and approved_at is empty
        if ($request->input('status') === 'published' && empty($package->approved_at)) {
            $package->approved_at = now();
        }

        $package->fill($request->input());

        $this->packageRepository->createOrUpdate($package);

        event(new UpdatedContentEvent(PACKAGE_MODULE_SCREEN_NAME, $request, $package));

        return $response
            ->setPreviousUrl(route('advertisement-image.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }


    public function destroy(int|string $id, Request $request, BaseHttpResponse $response)
    {
        try {
            $package = $this->packageRepository->findOrFail($id);

            $this->packageRepository->delete($package);

            event(new DeletedContentEvent(PACKAGE_MODULE_SCREEN_NAME, $request, $package));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $package = $this->packageRepository->findOrFail($id);
            $this->packageRepository->delete($package);
            event(new DeletedContentEvent(PACKAGE_MODULE_SCREEN_NAME, $request, $package));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
