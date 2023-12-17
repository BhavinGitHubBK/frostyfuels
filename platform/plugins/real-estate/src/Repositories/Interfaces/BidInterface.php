<?php

namespace Botble\RealEstate\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface BidInterface extends RepositoryInterface
{
    public function getUnread(array $select = ['*']): Collection;

    public function countUnread(): int;
}
