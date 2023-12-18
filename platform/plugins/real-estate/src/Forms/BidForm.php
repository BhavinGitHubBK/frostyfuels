<?php

namespace Botble\RealEstate\Forms;

use Botble\Base\Forms\FormAbstract;
use Botble\RealEstate\Enums\BidStatusEnum;
use Botble\RealEstate\Http\Requests\BidRequest;
use Botble\RealEstate\Models\BidDetails;

class BidForm extends FormAbstract
{
    public function buildForm(): void
    {
        $this
            ->setupModel(new BidDetails())
            ->setValidatorClass(BidRequest::class)
            ->withCustomFields()
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => BidStatusEnum::labels(),
            ])
            ->addMetaBoxes([
                'information' => [
                    'title' => 'Bid Information',
                    'content' => view('plugins/real-estate::bidinfo', ['bid' => $this->getModel()])->render(),
                    'attributes' => [
                        'style' => 'margin-top: 0',
                    ],
                ],
            ])
            ->setBreakFieldPoint('status');
    }
}
