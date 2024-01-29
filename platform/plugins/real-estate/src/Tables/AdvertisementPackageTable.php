<?php

namespace Botble\RealEstate\Tables;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Facades\Html;
use Botble\RealEstate\Models\AdvertisementPackage;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\DataTables;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class AdvertisementPackageTable extends TableAbstract
{
    protected $hasActions = true;

    protected $hasFilter = true;

    public function __construct(DataTables $table, UrlGenerator $urlGenerator, AdvertisementPackage $model)
    {
        parent::__construct($table, $urlGenerator);

        $this->model = $model;

        if (! Auth::user()->hasAnyPermission(['advertisement-package.edit', 'advertisement-package.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function (AdvertisementPackage $item) {
                if (! Auth::user()->hasPermission('advertisement-package.edit')) {
                    return BaseHelper::clean($item->name);
                }

                return Html::link(route('advertisement-package.edit', $item->id), BaseHelper::clean($item->name));
            })
            ->editColumn('checkbox', function (AdvertisementPackage $item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('created_at', function (AdvertisementPackage $item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function (AdvertisementPackage $item) {
                return BaseHelper::clean($item->status->toHtml());
            })
            ->addColumn('operations', function (AdvertisementPackage $item) {
                return $this->getOperations('advertisement-package.edit', 'advertisement-package.destroy', $item);
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
            'number_of_days',
            'created_at',
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
            'number_of_days' => [
                'title' => 'Number of Days',
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

    public function buttons(): array
    {
        return $this->addCreateButton(route('advertisement-package.create'), 'advertisement-package.create');
    }

    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('advertisement-package.deletes'), 'advertisement-package.destroy', parent::bulkActions());
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'number_of_days' => [
                'title' => trans('core/base::tables.number_of_days'),
                'type' => 'text',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }
}
