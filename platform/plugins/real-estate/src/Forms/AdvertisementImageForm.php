<?php

namespace Botble\RealEstate\Forms;

use Botble\Base\Forms\FormAbstract;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\RealEstate\Models\AdvertisementImage;
use Botble\RealEstate\Models\AdvertisementPackage;
use Botble\RealEstate\Http\Requests\AdvertisementImageRequest;

class AdvertisementImageForm extends FormAbstract
{
    public function buildForm(): void
    {
        $this
            ->setupModel(new AdvertisementImage())
            ->setValidatorClass(AdvertisementImageRequest::class)
            ->withCustomFields()
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => BaseStatusEnum::labels(),
            ])
            ->addMetaBoxes([
                'information' => [
                    'title' => 'Advertisement Image Information',
                    'content' => $this->renderView(),
                    'attributes' => [
                        'style' => 'margin-top: 0',
                    ],
                ],
            ])
            ->setBreakFieldPoint('status');
    }

    protected function renderView()
    {
        $advertisementImage = $this->getModel();
        $advertisementImageData = AdvertisementPackage::join('advertisement_images', 'advertisement_packages.id', '=', 'advertisement_images.advertisement_package_id')
            ->where('advertisement_images.id', $advertisementImage->id)
            ->get();

        return view('plugins/real-estate::advertisementimageinfo', [
            'advertisementimage' => $advertisementImage,
            'advertisementImageData' => $advertisementImageData, // Make sure this variable is passed correctly
        ])->render();
    }
}
