<?php

namespace Botble\RealEstate\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static PropertyTypeEnum SALE()
 * @method static PropertyTypeEnum RENT()
 */
class PropertyTypeEnum extends Enum
{
    public const SALE = 'sale';
    public const RENT = 'rent';
    public const RESSALE = 'ressale';
    public const HOLIDAY_HOME = 'holiday_home';
    public const BID = 'bid';

    public static $langPath = 'plugins/real-estate::property.types';

    public function toHtml(): HtmlString|string|null
    {
        return match ($this->value) {
            self::SALE => Html::tag('span', self::SALE()->label(), ['class' => 'label-success status-label'])
                ->toHtml(),
            self::RENT => Html::tag('span', self::RENT()->label(), ['class' => 'label-info status-label'])
                ->toHtml(),
            self::RESSALE => Html::tag('span', self::RENT()->label(), ['class' => 'label-info status-label'])
            ->toHtml(),
            self::HOLIDAY_HOME => Html::tag('span', self::RENT()->label(), ['class' => 'label-info status-label'])
            ->toHtml(),
            self::BID => Html::tag('span', self::SALE()->label(), ['class' => 'label-info status-label'])
            ->toHtml(),
            default => null,
        };
    }
}
