<?php

namespace Botble\RealEstate\Tables;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Facades\Html;
use Botble\RealEstate\Models\AdvertisementImage;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\DataTables;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class AdvertisementImageTable extends TableAbstract
{
    protected $hasActions = true;

    protected $hasFilter = false;

    public function __construct(DataTables $table, UrlGenerator $urlGenerator, AdvertisementImage $model)
    {
        parent::__construct($table, $urlGenerator);

        $this->model = $model;

        if (!Auth::user()->hasAnyPermission(['advertisement-image.edit', 'advertisement-image.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function (AdvertisementImage $item) {
                if (!Auth::user()->hasPermission('advertisement-image.edit')) {
                    return BaseHelper::clean($item->name);
                }

                return Html::link(route('advertisement-image.edit', $item->id), BaseHelper::clean($item->name));
            })
            ->editColumn('checkbox', function (AdvertisementImage $item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('created_at', function (AdvertisementImage $item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function (AdvertisementImage $item) {
                return BaseHelper::clean($item->status->toHtml());
            })
            ->addColumn('operations', function (AdvertisementImage $item) {
                return $this->getOperations('advertisement-image.edit', 'advertisement-image.destroy', $item);
            });

        return $this->toJson($data);
    }

    // public function query(): Relation|Builder|QueryBuilder
    // {
    //     $query = $this
    //         ->getModel()
    //         ->query()
    //         ->select([
    //         'id',
    //         'created_at',
    //         'status',
    //     ]);

    //     return $this->applyScopes($query);
    // }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'advertisement_images.id',
                'advertisement_images.created_at',
                'advertisement_images.approved_at',
                'advertisement_images.status',
                'advertisement_packages.name as package_name',
                'advertisement_packages.number_of_days as number_of_days',
            ])
            ->join('advertisement_packages', 'advertisement_images.advertisement_package_id', '=', 'advertisement_packages.id');

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            'id' => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'package_name' => [
                'title' => 'Package Name',
                // 'class' => 'text-start',
                'width' => '100px',
            ],
            'number_of_days' => [
                'title' => 'Number of Days',
                'width' => '100px',
            ],
            'approved_at' => [
                'title' => 'Approved At',
                'width' => '100px',
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

    // public function buttons(): array
    // {
    //     return $this->addCreateButton(route('advertisement-image.create'), 'advertisement-image.create');
    // }

    // public function bulkActions(): array
    // {
    //     return $this->addDeleteAction(route('advertisement-image.deletes'), 'advertisement-image.destroy', parent::bulkActions());
    // }

    // public function getBulkChanges(): array
    // {
    //     return [
    //         // 'name' => [
    //         //     'title' => trans('core/base::tables.name'),
    //         //     'type' => 'text',
    //         //     'validate' => 'required|max:120',
    //         // ],
    //         // 'number_of_days' => [
    //         //     'title' => trans('core/base::tables.number_of_days'),
    //         //     'type' => 'text',
    //         // ],
    //         'status' => [
    //             'title' => trans('core/base::tables.status'),
    //             'type' => 'select',
    //             'choices' => BaseStatusEnum::labels(),
    //             'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
    //         ],
    //         'created_at' => [
    //             'title' => trans('core/base::tables.created_at'),
    //             'type' => 'datePicker',
    //         ],
    //     ];
    // }
}
