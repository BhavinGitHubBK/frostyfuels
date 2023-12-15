<?php

namespace Botble\RealEstate\Tables;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Facades\Html;
use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Models\Property;
use Botble\RealEstate\Models\PropertyAccess;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\DataTables;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Eloquent\Relations\Relation as EloquentRelation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ProjectApprovalTable extends TableAbstract
{
    protected $hasActions = true;

    protected $hasFilter = true;

    public function __construct(DataTables $table, UrlGenerator $urlGenerator, PropertyAccess $model)
    {
        parent::__construct($table, $urlGenerator);

        $this->model = $model;
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('id', function (Property $item) {
                return Html::link(route('property.edit', $item->id), $item->name);
            })     
            ->editColumn('created_at', function (Property $item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('is_approved', function (Property $item) {
                return BaseHelper::clean($item->status->toHtml());
            })
          
            ->addColumn('operations', function (Property $item) {
                return $this->getOperations('property.edit', 'property.destroy', $item);
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
            'property_id',
            'user_id',
            'created_at',
            'is_approved',
        ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return ['id','property_id','user_id','created_at','is_approved'];
    }

   
    
}
