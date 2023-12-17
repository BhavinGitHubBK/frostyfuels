<?php

namespace Botble\RealEstate\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Avatar;
use Botble\Media\Facades\RvMedia;
use Botble\RealEstate\Enums\BidStatusEnum;
use Exception;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BidDetails extends BaseModel
{
    protected $table = 'property_bid_details';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'amount',
        'project_id',
        'property_id',
        'ip_address',
        'status',
        'content',
    ];

    protected $casts = [
        'status' => BidStatusEnum::class,
        'name' => SafeContent::class,
        'content' => SafeContent::class,
    ];

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class);
    }

    public function property(): BelongsTo
    {
        return $this->belongsTo(Property::class);
    }

    protected function avatarUrl(): Attribute
    {
        return Attribute::make(
            get: function () {
                try {
                    return (new Avatar())->create($this->name)->toBase64();
                } catch (Exception) {
                    return RvMedia::getDefaultImage();
                }
            },
        );
    }
}
