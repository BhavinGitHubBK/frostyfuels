@php
$categories = get_property_categories(['indent' => '↳', 'conditions' => ['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED]]);
$backgroundImage = $shortcode->background_image ?: theme_option('home_banner');
$enableProjectsSearch = $shortcode->enable_search_projects_on_homepage_search ? $shortcode->enable_search_projects_on_homepage_search == 'yes' : (theme_option('enable_search_projects_on_homepage_search', 'yes') == 'yes');
$defaultSearchType = $shortcode->default_home_search_type ?: theme_option('default_home_search_type', 'project');
@endphp

@if(count($advertisementSliderImageData) > 0)
<style>
    /* * {
        box-sizing: border-box;
    }

    body {
        font-family: Verdana, sans-serif;
    } */

    .mySlides {
        display: none;
    }

    img {
        vertical-align: middle;
    }

    /* Slideshow container */
    .slideshow-container {
        /* max-width: 1000px; */
        position: relative;
        margin: auto;
        z-index: 0;
    }

    .topsearch-imageslider {
        position: absolute;
        z-index: 1;
        top: 4%;
        left: 25%;
    }

    /* .slideshow-container {
        position: relative;
        z-index: 0;
    } */

    /* Caption text */
    .text {
        color: #f2f2f2;
        font-size: 15px;
        padding: 8px 12px;
        position: absolute;
        bottom: 8px;
        width: 100%;
        text-align: center;
    }

    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    /* The dots/bullets/indicators */
    .dot {
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
    }

    .active_slider {
        background-color: #717171;
    }

    /* Fading animation */
    .slide {
        animation-name: slide;
        animation-duration: 1.5s;
    }

    @keyframes slide {
        from {
            opacity: .4
        }

        to {
            opacity: 1
        }
    }

    /* On smaller screens, decrease text size */
    @media only screen and (max-width: 300px) {
        .text {
            font-size: 11px
        }
    }
</style>
<div class="slideshow-container">
    @foreach($advertisementSliderImageData as $imageData)
    @if ($imageData->status->getValue() == 'published' && strtotime($imageData->approved_at) + ($imageData->number_of_days * 24 * 60 * 60) > time())
    <div class="mySlides slide home_banner">
        <img src="{{ asset('storage/' . $imageData->slider_image) }}" alt="Slider Image" style="width: 100%; height: 500px">
    </div>
    @else
    <div class="home_banner" style="background-image: url({{ $backgroundImage ? RvMedia::getImageUrl($backgroundImage) : Theme::asset()->url('images/banner.jpg') }})"></div>
    @break
    @endif
    @endforeach
</div>
<div class="topsearch topsearch-imageslider">
    @if (theme_option('home_banner_description'))<h1 class="text-center text-white mb-4 banner-text-description">{{ $shortcode->title ?: theme_option('home_banner_description') }}</h1>@endif
    <form @if ($enableProjectsSearch && $defaultSearchType=='project' ) action="{{ RealEstateHelper::getProjectsListPageUrl() }}" data-ajax-url="{{ route('public.projects') }}" @else action="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}" @endif method="GET" id="frmhomesearch">
        <div class="typesearch" id="hometypesearch">
            @if ($enableProjectsSearch)
            <a href="javascript:void(0)" @if ($defaultSearchType=='project' ) class="active" @endif rel="project" data-url="{{ RealEstateHelper::getProjectsListPageUrl() }}" data-ajax-url="{{ route('public.projects') }}">{{ __('Projects') }}</a>
            @endif
            <a href="javascript:void(0)" rel="sale" @if ($defaultSearchType=='sale' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Sale') }}</a>
            <a href="javascript:void(0)" rel="rent" @if ($defaultSearchType=='rent' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Rent') }}</a>
            <a href="javascript:void(0)" rel="ressale" @if ($defaultSearchType=='ressale' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Resale') }}</a>
            <a href="javascript:void(0)" rel="holiday_home" @if ($defaultSearchType=='holiday_home' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Holiday Home') }}</a>

        </div>
        <div class="input-group input-group-lg">

            <input type="hidden" name="type" @if ($enableProjectsSearch && $defaultSearchType=='project' ) value="project" @else value="{{ $defaultSearchType ?: 'sale' }}" @endif id="txttypesearch">

            <div class="input-group-prepend">
                <span class="input-group-text"><i class="far fa-search"></i></span>
            </div>
            <div class="keyword-input">
                <input type="text" class="form-control" name="k" placeholder="{{ __('Enter keyword...') }}" id="txtkey" autocomplete="off">
                <div class="spinner-icon">
                    <i class="fas fa-spin fa-spinner"></i>
                </div>
            </div>
            <div class="input-group-prepend">
                <span class="input-group-text"><i class="far fa-location"></i></span>
            </div>
            <div class="location-input" data-url="{{ route('public.ajax.cities') }}">
                <input type="hidden" name="city_id">
                <input class="select-city-state form-control" name="location" value="{{ BaseHelper::stringify(request()->input('location')) }}" placeholder="{{ __('City, State') }}" autocomplete="off">
                <div class="spinner-icon">
                    <i class="fas fa-spin fa-spinner"></i>
                </div>
                <div class="suggestion">

                </div>
            </div>
            <div class="input-group-append search-button-wrapper">
                <button class="btn btn-orange" type="submit">{{ __('Search') }}</button>
            </div>

            <div class="advanced-search">
                <a href="#" class="advanced-search-toggler">{{ __('Advanced') }} <i class="fas fa-caret-down"></i></a>
                <div class="advanced-search-content property-advanced-search">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-4 px-md-1">
                                {!! Theme::partial('real-estate.filters.by-project') !!}
                            </div>
                            <div class="col-sm-4 px-md-1">
                                {!! Theme::partial('real-estate.filters.categories', compact('categories')) !!}
                            </div>
                            <div class="col-sm-4 px-md-1">
                                {!! Theme::partial('real-estate.filters.price') !!}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 col-sm-6 px-md-1">
                                {!! Theme::partial('real-estate.filters.bedroom') !!}
                            </div>
                            <div class="col-md-4 col-sm-6 px-md-1">
                                {!! Theme::partial('real-estate.filters.bathroom') !!}
                            </div>
                            <div class="col-md-4 col-sm-6 pl-md-1">
                                {!! Theme::partial('real-estate.filters.floor') !!}
                            </div>
                        </div>
                    </div>
                </div>

                @if ($enableProjectsSearch)
                <div class="advanced-search-content project-advanced-search">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                {!! Theme::partial('real-estate.filters.categories', compact('categories')) !!}
                            </div>
                            <div class="col-md-8">
                                {!! Theme::partial('real-estate.filters.price') !!}
                            </div>
                        </div>
                    </div>
                </div>
                @endif
            </div>
        </div>
        <div class="listsuggest">

        </div>
    </form>
</div>
<br>

<div style="text-align:center; display:none">
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
</div>
<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_slider", "");
        }
        slides[slideIndex - 1].style.display = "block";
        // dots[slideIndex - 1].className += " active_slider";
        setTimeout(showSlides, 2000); // Change image every 2 seconds
    }
</script>
@else
<div class="home_banner" style="background-image: url({{ $backgroundImage ? RvMedia::getImageUrl($backgroundImage) : Theme::asset()->url('images/banner.jpg') }})">
    <div class="topsearch">
        @if (theme_option('home_banner_description'))<h1 class="text-center text-white mb-4 banner-text-description">{{ $shortcode->title ?: theme_option('home_banner_description') }}</h1>@endif
        <form @if ($enableProjectsSearch && $defaultSearchType=='project' ) action="{{ RealEstateHelper::getProjectsListPageUrl() }}" data-ajax-url="{{ route('public.projects') }}" @else action="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}" @endif method="GET" id="frmhomesearch">
            <div class="typesearch" id="hometypesearch">
                @if ($enableProjectsSearch)
                <a href="javascript:void(0)" @if ($defaultSearchType=='project' ) class="active" @endif rel="project" data-url="{{ RealEstateHelper::getProjectsListPageUrl() }}" data-ajax-url="{{ route('public.projects') }}">{{ __('Projects') }}</a>
                @endif
                <a href="javascript:void(0)" rel="sale" @if ($defaultSearchType=='sale' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Sale') }}</a>
                <a href="javascript:void(0)" rel="rent" @if ($defaultSearchType=='rent' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Rent') }}</a>
                <a href="javascript:void(0)" rel="ressale" @if ($defaultSearchType=='ressale' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Resale') }}</a>
                <a href="javascript:void(0)" rel="holiday_home" @if ($defaultSearchType=='holiday_home' ) class="active" @endif data-url="{{ RealEstateHelper::getPropertiesListPageUrl() }}" data-ajax-url="{{ route('public.properties') }}">{{ __('Holiday Home') }}</a>

            </div>
            <div class="input-group input-group-lg">

                <input type="hidden" name="type" @if ($enableProjectsSearch && $defaultSearchType=='project' ) value="project" @else value="{{ $defaultSearchType ?: 'sale' }}" @endif id="txttypesearch">

                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="far fa-search"></i></span>
                </div>
                <div class="keyword-input">
                    <input type="text" class="form-control" name="k" placeholder="{{ __('Enter keyword...') }}" id="txtkey" autocomplete="off">
                    <div class="spinner-icon">
                        <i class="fas fa-spin fa-spinner"></i>
                    </div>
                </div>
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="far fa-location"></i></span>
                </div>
                <div class="location-input" data-url="{{ route('public.ajax.cities') }}">
                    <input type="hidden" name="city_id">
                    <input class="select-city-state form-control" name="location" value="{{ BaseHelper::stringify(request()->input('location')) }}" placeholder="{{ __('City, State') }}" autocomplete="off">
                    <div class="spinner-icon">
                        <i class="fas fa-spin fa-spinner"></i>
                    </div>
                    <div class="suggestion">

                    </div>
                </div>
                <div class="input-group-append search-button-wrapper">
                    <button class="btn btn-orange" type="submit">{{ __('Search') }}</button>
                </div>

                <div class="advanced-search">
                    <a href="#" class="advanced-search-toggler">{{ __('Advanced') }} <i class="fas fa-caret-down"></i></a>
                    <div class="advanced-search-content property-advanced-search">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-4 px-md-1">
                                    {!! Theme::partial('real-estate.filters.by-project') !!}
                                </div>
                                <div class="col-sm-4 px-md-1">
                                    {!! Theme::partial('real-estate.filters.categories', compact('categories')) !!}
                                </div>
                                <div class="col-sm-4 px-md-1">
                                    {!! Theme::partial('real-estate.filters.price') !!}
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 col-sm-6 px-md-1">
                                    {!! Theme::partial('real-estate.filters.bedroom') !!}
                                </div>
                                <div class="col-md-4 col-sm-6 px-md-1">
                                    {!! Theme::partial('real-estate.filters.bathroom') !!}
                                </div>
                                <div class="col-md-4 col-sm-6 pl-md-1">
                                    {!! Theme::partial('real-estate.filters.floor') !!}
                                </div>
                            </div>
                        </div>
                    </div>

                    @if ($enableProjectsSearch)
                    <div class="advanced-search-content project-advanced-search">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    {!! Theme::partial('real-estate.filters.categories', compact('categories')) !!}
                                </div>
                                <div class="col-md-8">
                                    {!! Theme::partial('real-estate.filters.price') !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    @endif
                </div>
            </div>
            <div class="listsuggest">

            </div>
        </form>
    </div>
</div>
@endif