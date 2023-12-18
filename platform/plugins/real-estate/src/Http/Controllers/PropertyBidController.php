<?php

namespace Botble\RealEstate\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Forms\BidForm;
use Botble\RealEstate\Http\Requests\BidRequest;
use Botble\RealEstate\Repositories\Interfaces\BidInterface;
use Botble\RealEstate\Tables\propertyBidTable;
use Exception;
use Illuminate\Http\Request;

class PropertyBidController extends BaseController
{
    public function __construct(protected BidInterface $consultRepository)
    {
    }

    public function index(propertyBidTable $table)
    {
        PageTitle::setTitle(trans('plugins/real-estate::consult.name'));

        return $table->renderTable();
    }

    public function edit(int|string $id, FormBuilder $formBuilder, Request $request)
    {
        $consult = $this->consultRepository->findOrFail($id, ['project', 'property']);

        event(new BeforeEditContentEvent($request, $consult));

        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $consult->name]));

        $bid = $consult;

        return $formBuilder->create(BidForm::class, ['model' => $bid])->renderForm();
    }

    public function update(int|string $id, BidRequest $request, BaseHttpResponse $response)
    {
        $consult = $this->consultRepository->findOrFail($id);

        $consult->fill($request->input());

        $this->consultRepository->createOrUpdate($consult);

        event(new UpdatedContentEvent(CONSULT_MODULE_SCREEN_NAME, $request, $consult));

        return $response
            ->setPreviousUrl(route('consult.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(int|string $id, Request $request, BaseHttpResponse $response)
    {
        try {
            $consult = $this->consultRepository->findOrFail($id);

            $this->consultRepository->delete($consult);

            event(new DeletedContentEvent(CONSULT_MODULE_SCREEN_NAME, $request, $consult));

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
            $consult = $this->consultRepository->findOrFail($id);
            $this->consultRepository->delete($consult);
            event(new DeletedContentEvent(CONSULT_MODULE_SCREEN_NAME, $request, $consult));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
