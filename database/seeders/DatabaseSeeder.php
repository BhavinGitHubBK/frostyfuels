<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends BaseSeeder
{
    public function run(): void
    {
        Artisan::call('db:wipe');

        DB::purge();
        DB::unprepared('USE `' . config('database.connections.mysql.database') . '`');
        DB::connection()->setDatabaseName(config('database.connections.mysql.database'));
        DB::getSchemaBuilder()->dropAllTables();
        DB::unprepared(file_get_contents(base_path('database.sql')));

        $this->activateAllPlugins();

        $this->call([
            LanguageSeeder::class,
            CurrencySeeder::class,
            CategorySeeder::class,
            FacilitySeeder::class,
            FeatureSeeder::class,
            PackageSeeder::class,
            AccountSeeder::class,
            UserSeeder::class,
            SettingSeeder::class,
            PageSeeder::class,
            LatLongSeeder::class,
            MenuSeeder::class,
            ThemeOptionSeeder::class,
            BlogSeeder::class,
            ProjectSeeder::class,
            PropertySeeder::class,
            ReviewSeeder::class,
        ]);

        $this->uploadFiles('banner');
        $this->uploadFiles('cities');
        $this->uploadFiles('logo');
        $this->uploadFiles('projects');
        $this->uploadFiles('properties');
        $this->uploadFiles('users');

        $this->finished();
    }
}
