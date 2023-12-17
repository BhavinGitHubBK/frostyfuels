<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\RepositoryHelper;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\RealEstate\Repositories\Interfaces\ProjectInterface;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\Shortcode\Compilers\Shortcode;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Illuminate\Support\Facades\App;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    if (is_plugin_active('real-estate')) {
        add_shortcode('featured-projects', __('Featured projects'), __('Featured projects'), function ($shortcode) {
            $projects = collect();

            if (is_plugin_active('real-estate')) {
                $projects = app(ProjectInterface::class)->advancedGet([
                    'condition' => [
                            're_projects.is_featured' => true,
                        ] + RealEstateHelper::getProjectDisplayQueryConditions(),
                    'take' => (int) $shortcode->limit ?: (int)theme_option('number_of_featured_projects', 4),
                    'with' => RealEstateHelper::getProjectRelationsQuery(),
                    'order_by' => ['re_projects.created_at' => 'DESC'],
                ]);
            }

            if (! $projects->count()) {
                return null;
            }

            return Theme::partial('short-codes.featured-projects', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'projects' => $projects,
            ]);
        });

        shortcode()->setAdminConfig('featured-projects', function ($attributes, $content) {
            return Theme::partial('short-codes.featured-projects-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('projects-by-locations', __('Projects by locations'), __('Projects by locations'), function ($shortcode) {
            $cities = collect();

            if (is_plugin_active('location')) {
                $cities = app(CityInterface::class)->advancedGet([
                    'condition' => [
                        'cities.is_featured' => true,
                        'cities.status' => BaseStatusEnum::PUBLISHED,
                    ],
                    'take' => (int) $shortcode->limit ?: 10,
                    'select' => ['cities.id', 'cities.name', 'cities.image', 'cities.slug'],
                    'order_by' => ['order' => 'ASC', 'name' => 'ASC'],
                ]);
            }

            if (! $cities->count()) {
                return null;
            }

            return Theme::partial('short-codes.projects-by-locations', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'limit' => (int) $shortcode->limit ?: 10,
                'cities' => $cities,
            ]);
        });

        shortcode()->setAdminConfig('projects-by-locations', function ($attributes, $content) {
            return Theme::partial('short-codes.projects-by-locations-admin-config', compact('attributes', 'content'));
        });

        add_shortcode(
            'properties-by-locations',
            __('Properties by locations'),
            __('Properties by locations'),
            function ($shortcode) {
                $cities = collect();

                if (is_plugin_active('location')) {
                    $cities = app(CityInterface::class)->advancedGet([
                        'condition' => [
                            'cities.is_featured' => true,
                            'cities.status' => BaseStatusEnum::PUBLISHED,
                        ],
                        'take' => (int) $shortcode->limit ?: 10,
                        'select' => ['cities.id', 'cities.name', 'cities.image', 'cities.slug'],
                        'order_by' => ['order' => 'ASC', 'name' => 'ASC'],
                    ]);
                }

                if (! $cities->count()) {
                    return null;
                }

                return Theme::partial('short-codes.properties-by-locations', [
                    'title' => $shortcode->title,
                    'subtitle' => $shortcode->subtitle,
                    'cities' => $cities,
                ]);
            }
        );

        shortcode()->setAdminConfig('properties-by-locations', function ($attributes, $content) {
            return Theme::partial('short-codes.properties-by-locations-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('featured-properties', __('Featured properties'), __('Featured properties'), function ($shortcode) {
            $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                [
                    're_properties.is_featured' => true,
                ] + RealEstateHelper::getPropertyDisplayQueryConditions(),
                (int)$shortcode->limit ?: 8,
                RealEstateHelper::getPropertyRelationsQuery()
            );

            return Theme::partial('short-codes.featured-properties', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('featured-properties', function ($attributes, $content) {
            return Theme::partial('short-codes.featured-properties-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('properties-for-sale', __('Properties for sale'), __('Properties for sale'), function ($shortcode) {
            $conditions = [
                    're_properties.type' => PropertyTypeEnum::SALE,
                ] + RealEstateHelper::getPropertyDisplayQueryConditions();

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                $conditions,
                (int)$shortcode->limit ?: 8,
                RealEstateHelper::getPropertyRelationsQuery()
            );

            return Theme::partial('short-codes.properties-for-sale', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-for-sale', function ($attributes, $content) {
            return Theme::partial('short-codes.properties-for-sale-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('properties-for-bid', __('Properties for bid'), __('Properties for bid'), function ($shortcode) {
            $conditions = [
                    're_properties.type' => PropertyTypeEnum::BID,
                ] + RealEstateHelper::getPropertyDisplayQueryConditions();

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                $conditions,
                (int)$shortcode->limit ?: 8,
                RealEstateHelper::getPropertyRelationsQuery()
            );

            return Theme::partial('short-codes.properties-for-bid', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-for-bid', function ($attributes, $content) {
            return Theme::partial('short-codes.properties-for-sale-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('properties-for-resale', __('Properties for Resale'), __('Properties for Resale'), function ($shortcode) {
            $conditions = [
                    're_properties.type' => PropertyTypeEnum::RESSALE,
                ] + RealEstateHelper::getPropertyDisplayQueryConditions();

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                $conditions,
                (int)$shortcode->limit ?: 8,
                RealEstateHelper::getPropertyRelationsQuery()
            );

            return Theme::partial('short-codes.properties-for-resale', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-for-resale', function ($attributes, $content) {
            return Theme::partial('short-codes.properties-for-sale-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('properties-for-holday-homes', __('Properties for Holiday Homes'), __('Properties for Holiday Homes'), function ($shortcode) {
            $conditions = [
                    're_properties.type' => PropertyTypeEnum::HOLIDAY_HOME,
                ] + RealEstateHelper::getPropertyDisplayQueryConditions();

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                $conditions,
                (int)$shortcode->limit ?: 8,
                RealEstateHelper::getPropertyRelationsQuery()
            );

            return Theme::partial('short-codes.properties-for-holiday-homes', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-for-holday-homes', function ($attributes, $content) {
            return Theme::partial('short-codes.properties-for-sale-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('properties-for-rent', __('Properties for rent'), __('Properties for rent'), function ($shortcode) {
            $conditions = [
                    're_properties.type' => PropertyTypeEnum::RENT,
                ] + RealEstateHelper::getPropertyDisplayQueryConditions();

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                $conditions,
                (int)$shortcode->limit ?: 8,
                RealEstateHelper::getPropertyRelationsQuery()
            );

            return Theme::partial('short-codes.properties-for-rent', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-for-rent', function ($attributes, $content) {
            return Theme::partial('short-codes.properties-for-rent-admin-config', compact('attributes', 'content'));
        });

        add_shortcode(
            'recently-viewed-properties',
            __('Recent Viewed Properties'),
            __('Recently Viewed Properties'),
            function ($shortcode) {
                $cookieName = App::getLocale() . '_recently_viewed_properties';
                $jsonRecentViewProduct = null;

                if (isset($_COOKIE[$cookieName])) {
                    $jsonRecentViewProduct = $_COOKIE[$cookieName];
                }

                if (empty($jsonRecentViewProduct)) {
                    return null;
                }

                $ids = collect(json_decode($jsonRecentViewProduct, true))->flatten()->all();

                $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                    [
                        ['re_properties.id', 'IN', $ids],
                    ] + RealEstateHelper::getPropertyDisplayQueryConditions(),
                    (int)$shortcode->limit ?: 8,
                    RealEstateHelper::getPropertyRelationsQuery()
                );

                $reversed = array_reverse($ids);

                $properties = $properties->sortBy(function ($model) use ($reversed) {
                    return array_search($model->id, $reversed);
                });

                return Theme::partial('short-codes.recently-viewed-properties', [
                    'title' => $shortcode->title,
                    'description' => $shortcode->description,
                    'subtitle' => $shortcode->subtitle,
                    'properties' => $properties,
                ]);
            }
        );

        shortcode()->setAdminConfig('recently-viewed-properties', function ($attributes, $content) {
            return Theme::partial('short-codes.recently-viewed-properties-admin-config', compact('attributes', 'content'));
        });

        add_shortcode(
            'featured-agents',
            __('Featured Agents'),
            __('Featured Agents'),
            function ($shortcode) {
                $agents = app(AccountInterface::class)->advancedGet([
                    'condition' => [
                        're_accounts.is_featured' => true,
                    ],
                    'order_by' => [
                        're_accounts.id' => 'DESC',
                    ],
                    'take' => (int)$shortcode->limit ?: 4,
                    'withCount' => [
                        'properties' => function ($query) {
                            return RepositoryHelper::applyBeforeExecuteQuery($query, $query->getModel());
                        },
                    ],
                    'with' => ['avatar'],
                ]);

                return Theme::partial('short-codes.featured-agents', [
                    'title' => $shortcode->title,
                    'description' => $shortcode->description,
                    'subtitle' => $shortcode->subtitle,
                    'agents' => $agents,
                ]);
            }
        );

        shortcode()->setAdminConfig('featured-agents', function ($attributes, $content) {
            return Theme::partial('short-codes.featured-agents-admin-config', compact('attributes', 'content'));
        });

        add_shortcode(
            'search-box',
            __('Search box'),
            __('Search box'),
            function ($shortcode) {
                return Theme::partial('short-codes.search-box', compact('shortcode'));
            }
        );

        shortcode()->setAdminConfig('search-box', function ($attributes, $content) {
            return Theme::partial('short-codes.search-box-admin-config', compact('attributes', 'content'));
        });

        add_shortcode('properties-list', __('Properties List'), __('Properties List'), function (Shortcode $shortcode) {
            $properties = RealEstateHelper::getPropertiesFilter((int)$shortcode->per_page ?: 12);

            return Theme::partial('short-codes.properties-list', [
                'title' => $shortcode->title,
                'description' => $shortcode->description,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-list', function (array $attributes) {
            return Theme::partial('short-codes.properties-list-admin-config', compact('attributes'));
        });

        add_shortcode('projects-list', __('Projects List'), __('Projects List'), function (Shortcode $shortcode) {
            $projects = RealEstateHelper::getProjectsFilter((int)$shortcode->per_page ?: 12);

            return Theme::partial('short-codes.projects-list', [
                'title' => $shortcode->title,
                'description' => $shortcode->description,
                'projects' => $projects,
            ]);
        });

        shortcode()->setAdminConfig('projects-list', function (array $attributes) {
            return Theme::partial('short-codes.properties-list-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('blog')) {
        add_shortcode('latest-news', __('Latest news'), __('Latest news'), function ($shortcode) {
            $posts = app(PostInterface::class)
                ->getFeatured((int)$shortcode->limit ?: 4, ['slugable', 'categories', 'categories.slugable']);

            return Theme::partial('short-codes.latest-news', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'posts' => $posts,
            ]);
        });

        shortcode()->setAdminConfig('latest-news', function ($attributes, $content) {
            return Theme::partial('short-codes.latest-news-admin-config', compact('attributes', 'content'));
        });
    }

    if (is_plugin_active('contact')) {
        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.contact-form';
        }, 120);
    }
});
