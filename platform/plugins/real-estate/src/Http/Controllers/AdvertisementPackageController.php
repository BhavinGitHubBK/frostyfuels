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
use Botble\RealEstate\Forms\AdvertisementPackageForm;
use Botble\RealEstate\Http\Requests\AdvertisementPackageRequest;
use Botble\RealEstate\Repositories\Interfaces\AdvertisementPackageInterface;
use Botble\RealEstate\Tables\AdvertisementPackageTable;
use Exception;
use Illuminate\Http\Request;

class AdvertisementPackageController extends BaseController
{
    public function __construct(protected AdvertisementPackageInterface $packageRepository)
    {
    }

    public function index(AdvertisementPackageTable $table)
    {
        PageTitle::setTitle(trans('plugins/real-estate::package.name'));

        return $table->renderTable();
    }

    public function create(FormBuilder $formBuilder)
    {
        PageTitle::setTitle(trans('plugins/real-estate::package.create'));

        return $formBuilder->create(AdvertisementPackageForm::class)->renderForm();
    }

    public function store(AdvertisementPackageRequest $request, BaseHttpResponse $response)
    {
        // Get the package name from the request
        $packageName = $request->input('name');

        // Generate the advertisement_package_code
        $advertisementPackageCode = strtolower(str_replace(' ', '_', $packageName));

        // Add the generated advertisement_package_code to the request data
        $requestData = $request->input();
        $requestData['advertisement_package_code'] = $advertisementPackageCode;

        // Create the AdvertisementPackage
        $package = $this->packageRepository->createOrUpdate($requestData);

        event(new CreatedContentEvent(PACKAGE_MODULE_SCREEN_NAME, $request, $package));

        return $response
            ->setPreviousUrl(route('advertisement-package.index'))
            ->setNextUrl(route('advertisement-package.edit', $package->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(int|string $id, FormBuilder $formBuilder, Request $request)
    {
        $package = $this->packageRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $package));

        PageTitle::setTitle(trans('plugins/real-estate::package.edit') . ' "' . $package->name . '"');

        return $formBuilder->create(AdvertisementPackageForm::class, ['model' => $package])->renderForm();
    }

    public function update(int|string $id, AdvertisementPackageRequest $request, BaseHttpResponse $response)
    {
        $package = $this->packageRepository->findOrFail($id);

        // Get the package name from the request
        $packageName = $request->input('name');

        // Generate the advertisement_package_code
        $advertisementPackageCode = strtolower(str_replace(' ', '_', $packageName));

        // Set the advertisement_package_code in the package model
        $package->advertisement_package_code = $advertisementPackageCode;

        // Fill other fields from the request
        $package->fill($request->input());

        // Save the package
        $this->packageRepository->createOrUpdate($package);

        event(new UpdatedContentEvent(PACKAGE_MODULE_SCREEN_NAME, $request, $package));

        return $response
            ->setPreviousUrl(route('advertisement-package.index'))
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
