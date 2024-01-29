@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
<div class="settings" id="app-real-estate">
  <div class="container">
    <div class="row">
      @include('plugins/real-estate::account.settings.sidebar')
      <div class="col-12 col-md-9">
        <div class="main-dashboard-form">
          <div class="mb-5">
            <!-- Title -->
            <div class="row">
              <div class="col-12">
                <h4 class="with-actions">{{ trans('plugins/real-estate::dashboard.packages_title') }}</h4>
              </div>
            </div>

            <!-- Content -->
            @if (session('status'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              {{ session('status') }}
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
              </button>
            </div>
            @endif

            <packages-component url="{{ route('public.account.ajax.packages') }}" subscribe_url="{{ route('public.account.ajax.package.subscribe') }}"></packages-component>

          </div>

          <div class="mb-5">
            <!-- Title -->
            <div class="row">
              <div class="col-12">
                <h4 class="with-actions">Advertisement Package</h4>
              </div>
            </div>

            <div class="packages-listing">
              <div>
                <div class="row flex-items-xs-middle flex-items-xs-center">
                  <div class="col-xs-12 col-lg-4" style="margin-top: 30px;">
                    <div class="card text-xs-center">
                      <div class="card-block">
                        <h4 class="card-title">Buy Advertisement Packages</h4>
                        <a href="{{ route('public.account.uploadadvertisementimagespackages') }}" class="btn btn-primary mt-2">Purchase</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>

        <div class="main-dashboard-form">
          <div class="mb-5">
            <!-- Title -->
            <div class="row">
              <div class="col-12">
                <h4 class="with-actions">{{ trans('plugins/real-estate::dashboard.transactions_title') }}</h4>
              </div>
            </div>

            <!-- Content -->
            @if (session('status'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              {{ session('status') }}
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
              </button>
            </div>
            @endif

            <payment-history-component></payment-history-component>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection