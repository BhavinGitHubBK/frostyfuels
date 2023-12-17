<?php

namespace Botble\RealEstate\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static BidStatusEnum UNREAD()
 * @method static BidStatusEnum READ()
 */
class BidStatusEnum extends Enum
{
    public const READ = 'read';
    public const UNREAD = 'unread';
}
