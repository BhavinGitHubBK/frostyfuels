<?php

namespace Botble\RealEstate\Repositories\Eloquent;

use Botble\RealEstate\Enums\BidStatusEnum;
use Botble\RealEstate\Repositories\Interfaces\BidInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class BidRepository extends RepositoriesAbstract implements BidInterface
{
    public function getUnread($select = ['*']): Collection
    {
        $data = $this->model->where('status', BidStatusEnum::UNREAD)->select($select)->get();
        $this->resetModel();

        return $data;
    }

    public function countUnread(): int
    {
        $data = $this->model->where('status', BidStatusEnum::UNREAD)->count();
        $this->resetModel();

        return $data;
    }
}
