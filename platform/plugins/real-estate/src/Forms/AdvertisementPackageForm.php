<?php

namespace Botble\RealEstate\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FormAbstract;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Http\Requests\AdvertisementPackageRequest;
use Botble\RealEstate\Models\AdvertisementPackage;
use Botble\RealEstate\Repositories\Interfaces\CurrencyInterface;

class AdvertisementPackageForm extends FormAbstract
{
    public function __construct(protected CurrencyInterface $currencyRepository)
    {
        parent::__construct();
    }

    public function buildForm(): void
    {
        Assets::addScripts(['input-mask']);

        $currencies = $this->currencyRepository->pluck('title', 'id');

        $this
            ->setupModel(new AdvertisementPackage())
            ->setValidatorClass(AdvertisementPackageRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label' => trans('core/base::forms.name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('rowOpen1', 'html', [
                'html' => '<div class="row">',
            ])
            ->add('number_of_days', 'text', [
                'label' => 'Number of Days',
                'label_attr' => ['class' => 'control-label'],
                'wrapper' => [
                    'class' => 'form-group mb-3 col-md-4',
                ],
                'attr' => [
                    'id' => 'price-number',
                    'placeholder' => 'Number of Days',
                    'class' => 'form-control input-mask-number',
                ],
            ])
            // ->add('price', 'text', [
            //     'label' => trans('plugins/real-estate::package.price') . ' ' . ('(Per Image)'),
            //     'label_attr' => ['class' => 'control-label'],
            //     'wrapper' => [
            //         'class' => 'form-group mb-3 col-md-6',
            //     ],
            //     'attr' => [
            //         'id' => 'price-number',
            //         'placeholder' => trans('plugins/real-estate::package.price') . ' ' . ('Per Image'),
            //         'class' => 'form-control input-mask-number',
            //         'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
            //         'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
            //     ],
            // ])
            // ->add('currency_id', 'customSelect', [
            //     'label' => trans('plugins/real-estate::package.currency'),
            //     'label_attr' => ['class' => 'control-label'],
            //     'wrapper' => [
            //         'class' => 'form-group mb-3 col-md-6',
            //     ],
            //     'attr' => [
            //         'class' => 'form-control select-full',
            //     ],
            //     'choices' => $currencies,
            // ])
            ->add('rowClose2', 'html', [
                'html' => '</div>',
            ])
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => BaseStatusEnum::labels(),
            ])
            ->setBreakFieldPoint('status');
    }
}
