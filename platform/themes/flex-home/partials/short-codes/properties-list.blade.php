@php
    if (theme_option('show_map_on_properties_page', 'yes') == 'yes') {
        Theme::asset()->usePath()->add('leaflet-css', 'libraries/leaflet/leaflet.css');
        Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libraries/leaflet/leaflet.js');
        Theme::asset()->container('footer')->usePath()->add('leaflet.markercluster-src-js', 'libraries/leaflet/leaflet.markercluster-src.js');
    }

    $categories = get_property_categories([
        'indent' => '↳',
        'conditions' => ['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED],
    ]);
@endphp

<section class="main-homes pb-3">

    @php
        $showImage = false;
        $imagePath = '';

        if (request()->getQueryString() == 'type=sale') {
            if (!empty($advertisementNewSaleImageData)) {
                if ($advertisementNewSaleImageData->status->getValue() == 'published' && strtotime($advertisementNewSaleImageData->approved_at) + ($advertisementNewSaleImageData->number_of_days * 24 * 60 * 60) > time()) {
                    $showImage = true;
                    $imagePath = $advertisementNewSaleImageData->new_sale_image;
                }
            }
        } elseif (request()->getQueryString() == 'type=ressale') {
            if (!empty($advertisementSecondaryImageData)) {
                if ($advertisementSecondaryImageData->status->getValue() == 'published' && strtotime($advertisementSecondaryImageData->approved_at) + ($advertisementSecondaryImageData->number_of_days * 24 * 60 * 60) > time()) {
                    $showImage = true;
                    $imagePath = $advertisementSecondaryImageData->secondary_image;
                }
            }
        } elseif (request()->getQueryString() == 'type=rent') {
            if (!empty($advertisementLeasingImageData)) {
                if ($advertisementLeasingImageData->status->getValue() == 'published' && strtotime($advertisementLeasingImageData->approved_at) + ($advertisementLeasingImageData->number_of_days * 24 * 60 * 60) > time()) {
                    $showImage = true;
                    $imagePath = $advertisementLeasingImageData->leasing_image;
                }
            }
        } elseif (request()->getQueryString() == 'type=holiday_home') {
            if (!empty($advertisementHolidayHomesImageData)) {
                if ($advertisementHolidayHomesImageData->status->getValue() == 'published' && strtotime($advertisementHolidayHomesImageData->approved_at) + ($advertisementHolidayHomesImageData->number_of_days * 24 * 60 * 60) > time()) {
                    $showImage = true;
                    $imagePath = $advertisementHolidayHomesImageData->holiday_homes_image;
                }
            }
        }
    @endphp

    @if ($showImage)
        <div class="bgheadproject hidden-xs" style="background: url('{{ asset('storage/' . $imagePath) }}')">
    @else
        <div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
    @endif
    <!-- <div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')"> -->
        <div class="description">
            <div class="container-fluid w90">
                <h1 class="text-center">{{ $title ?? __('Discover our properties') }}</h1>
                <p class="text-center">{{ $description ?? theme_option('properties_description') }}</p>
                {!! Theme::partial('breadcrumb') !!}
            </div>
        </div>
    </div>
    <div class="container-fluid w90 padtop30">
        <div class="projecthome">
            <form action="{{ $actionUrl ?? RealEstateHelper::getPropertiesListPageUrl() }}" method="get" id="ajax-filters-form" data-ajax-url="{{ $ajaxUrl ?? route('public.properties') }}">
                @include(Theme::getThemeNamespace() . '::views.real-estate.includes.search-box', ['type' => 'property', 'categories' => $categories])
                <div class="row rowm10">
                    <div class="@if (theme_option('show_map_on_properties_page', 'yes') == 'yes' && Arr::get($_COOKIE, 'show_map_on_properties', 1)) col-lg-7 left-page-content @else col-lg-12 full-page-content @endif"
                         @if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
                             data-class-full="col-lg-12 full-page-content"
                         data-class-left="col-lg-7 left-page-content"
                         @endif
                         id="properties-list">
                        @include(Theme::getThemeNamespace() . '::views.real-estate.includes.filters', ['isChangeView' => theme_option('show_map_on_properties_page', 'yes') == 'yes'])
                        <div class="data-listing mt-2">
                            {!! Theme::partial('real-estate.properties.items', compact('properties')) !!}
                        </div>
                    </div>
                    @if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
                        <div class="col-md-5 @if (!Arr::get($_COOKIE, 'show_map_on_properties', 1)) d-none @endif" id="properties-map">
                            <div class="rightmap h-100">
                                <div
                                    id="map"
                                    data-type="{{ request()->input('type') }}"
                                    data-url="{{ route('public.ajax.properties.map') }}{{ isset($city) && $city ? '?city_id=' . $city->id : '' }}"
                                    data-center="{{ json_encode(RealEstateHelper::getMapCenterLatLng()) }}" data-max-zoom="18"></div>
                            </div>
                        </div>
                    @endif
                </div>
            </form>
        </div>
    </div>
</section>

@if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
    <script id="traffic-popup-map-template" type="text/x-custom-template">
        {!! Theme::partial('real-estate.properties.map', ['property' => get_object_property_map()]) !!}
    </script>
@endif
