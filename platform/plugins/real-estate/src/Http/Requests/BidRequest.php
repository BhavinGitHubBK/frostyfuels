<?php

namespace Botble\RealEstate\Http\Requests;

use Botble\RealEstate\Enums\BidStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class BidRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => Rule::in(BidStatusEnum::values()),
        ];
    }
}
