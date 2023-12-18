<?php

namespace Botble\RealEstate\Tables;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Facades\Html;
use Botble\RealEstate\Enums\BidStatusEnum;
use Botble\RealEstate\Models\BidDetails;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\DataTables;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class propertyBidTable extends TableAbstract
{
    protected $hasActions = true;

    protected $hasFilter = true;

    public function __construct(DataTables $table, UrlGenerator $urlGenerator, BidDetails $model)
    {
        parent::__construct($table, $urlGenerator);

        $this->model = $model;

        if (! Auth::user()->hasAnyPermission(['property-bid.edit', 'property-bid.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function (BidDetails $item) {
                if (! Auth::user()->hasPermission('property-bid.edit')) {
                    return BaseHelper::clean($item->name);
                }

                return Html::link(route('property-bid.edit', $item->id), BaseHelper::clean($item->name));
            })
            ->editColumn('checkbox', function (BidDetails $item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('created_at', function (BidDetails $item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function (BidDetails $item) {
                return BaseHelper::clean($item->status->toHtml());
            })
            ->addColumn('operations', function (BidDetails $item) {
                return $this->getOperations('property-bid.edit', 'property-bid.destroy', $item);
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'phone',
                'email',
                'created_at',
                'amount',
                'status',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            'id' => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'name' => [
                'title' => trans('core/base::tables.name'),
                'class' => 'text-start',
            ],
            'email' => [
                'title' => trans('plugins/real-estate::consult.email.header'),
                'class' => 'text-start',
            ],
            'phone' => [
                'title' => trans('plugins/real-estate::consult.phone'),
            ],
            'amount' => [
                'title' => 'Bid Amount',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
            ],
        ];
    }

    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('property-bid.deletes'), 'property-bid.destroy', parent::bulkActions());
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => BidStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BidStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }
}
