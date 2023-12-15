<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Category;
use Botble\Language\Models\LanguageMeta;
use Botble\Menu\Facades\Menu;
use Botble\Menu\Models\Menu as MenuModel;
use Botble\Menu\Models\MenuLocation;
use Botble\Menu\Models\MenuNode;
use Botble\Page\Models\Page;
use Illuminate\Support\Arr;

class MenuSeeder extends BaseSeeder
{
    public function run(): void
    {
        $data = [
            [
                'name' => 'Main menu',
                'slug' => 'main-menu',
                'location' => 'main-menu',
                'items' => [
                    [
                        'title' => 'Projects',
                        'url' => '/projects',
                    ],
                    [
                        'title' => 'Properties',
                        'url' => '/properties',
                    ],
                    [
                        'title' => 'Agents',
                        'url' => '/agents',
                    ],
                    [
                        'title' => 'News',
                        'reference_id' => 2,
                        'reference_type' => Page::class,
                    ],
                    [
                        'title' => 'Careers',
                        'url' => '/careers',
                    ],
                    [
                        'title' => 'Contact',
                        'reference_id' => 4,
                        'reference_type' => Page::class,
                    ],
                ],
            ],
            [
                'name' => 'About',
                'slug' => 'about',
                'items' => [
                    [
                        'title' => 'About us',
                        'reference_id' => 3,
                        'reference_type' => Page::class,
                    ],
                    [
                        'title' => 'Contact us',
                        'reference_id' => 4,
                        'reference_type' => Page::class,
                    ],
                    [
                        'title' => 'Careers',
                        'url' => '/careers',
                    ],
                    [
                        'title' => 'Terms & Conditions',
                        'reference_id' => 5,
                        'reference_type' => Page::class,
                    ],
                ],
            ],
            [
                'name' => 'More information',
                'slug' => 'more-information',
                'items' => [
                    [
                        'title' => 'All projects',
                        'url' => '/projects',
                    ],
                    [
                        'title' => 'All properties',
                        'url' => '/properties',
                    ],
                    [
                        'title' => 'Houses for sale',
                        'url' => '/properties?type=sale',
                    ],
                    [
                        'title' => 'Houses for rent',
                        'url' => '/properties?type=rent',
                    ],
                ],
            ],
            [
                'name' => 'News',
                'slug' => 'news',
                'items' => [
                    [
                        'title' => 'Latest news',
                        'reference_id' => 2,
                        'reference_type' => Page::class,
                    ],
                    [
                        'title' => 'House architecture',
                        'reference_id' => 2,
                        'reference_type' => Category::class,
                    ],
                    [
                        'title' => 'House design',
                        'reference_id' => 4,
                        'reference_type' => Category::class,
                    ],
                    [
                        'title' => 'Building materials',
                        'reference_id' => 6,
                        'reference_type' => Category::class,
                    ],
                ],
            ],
        ];

        MenuModel::query()->truncate();
        MenuLocation::query()->truncate();
        MenuNode::query()->truncate();

        foreach ($data as $index => $item) {
            $menu = MenuModel::query()->create(Arr::except($item, ['items', 'location']));

            if (isset($item['location'])) {
                $menuLocation = MenuLocation::query()->create([
                    'menu_id' => $menu->id,
                    'location' => $item['location'],
                ]);

                LanguageMeta::saveMetaData($menuLocation);
            }

            foreach ($item['items'] as $menuNode) {
                $this->createMenuNode($index, $menuNode, $menu->id);
            }

            LanguageMeta::saveMetaData($menu, 'en_US');
        }

        Menu::clearCacheMenuItems();
    }

    protected function createMenuNode(int $index, array $menuNode, int|string $menuId, int|string $parentId = 0): void
    {
        $menuNode['menu_id'] = $menuId;
        $menuNode['parent_id'] = $parentId;

        if (isset($menuNode['url'])) {
            $menuNode['url'] = str_replace(url(''), '', $menuNode['url']);
        }

        if (Arr::has($menuNode, 'children')) {
            $children = $menuNode['children'];
            $menuNode['has_child'] = true;

            unset($menuNode['children']);
        } else {
            $children = [];
            $menuNode['has_child'] = false;
        }

        $createdNode = MenuNode::query()->create($menuNode);

        if ($children) {
            foreach ($children as $child) {
                $this->createMenuNode($index, $child, $menuId, $createdNode->id);
            }
        }
    }
}
