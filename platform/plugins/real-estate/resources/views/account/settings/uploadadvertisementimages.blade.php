@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
<div class="settings" id="app-real-estate">
    <div class="container">
        <div class="row">
            @include('plugins/real-estate::account.settings.sidebar')
            <div class="col-12 col-md-9">
                <div class="main-dashboard-form">
                    <div class="mb-5">
                        <div class="container">
                            <form method="POST" action="{{ route('public.account.storeadvertisementimages') }}" accept-charset="UTF-8" id="botble-real-estate-forms-upload-advertisement-images-form" class="js-base-form dirty-check" enctype="multipart/form-data" novalidate="novalidate">
                                @csrf
                                <!-- <input name="_token" type="hidden" value="ZcvFPIzsBfDoUWwat8GVhnvSFLmBR52pLEqQ0GFL"> -->
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="main-form">
                                            <div class="form-body">
                                                @foreach($advertisementPackages as $package)
                                                <!-- advertisement_package_code -->
                                                @if ($package->advertisement_package_code == 'slider_image')
                                                <div class="form-group mb-3">
                                                    <label for="name" class="control-label">Upload {{ $package->name }} for {{ $package->number_of_days }} days</label>
                                                    <div id="dynamicAddRemove">
                                                        <div class="subject-container row" style="margin-bottom: 2%;">
                                                            <div class="col-11">
                                                                <input type="file" accept="image/*" class="form-control" name="images[{{ $package->advertisement_package_code }}0]" @error('images.' . $package->advertisement_package_code) is-invalid @enderror>
                                                            </div>
                                                            <div class="col-1">
                                                                <button type="button" class="btn btn-outline-primary dynamic-ar"><i class="fas fa-plus"></i></button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                @else
                                                <div class="form-group mb-3">
                                                    <label for="name" class="control-label">Upload {{ $package->name }} for {{ $package->number_of_days }} days</label>
                                                    <input type="file" accept="image/*" class="form-control" name="images[{{ $package->advertisement_package_code }}]" @error('images.' . $package->advertisement_package_code) is-invalid @enderror>
                                                </div>
                                                @endif
                                                <div class="clearfix"></div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 right-sidebar">
                                        <div class="widget meta-boxes form-actions form-actions-default action-horizontal">
                                            <div class="widget-title">
                                                <h4><span>Publish</span></h4>
                                            </div>
                                            <div class="widget-body">
                                                <button type="submit" name="submit" class="btn btn-sm btn-success" value="apply" fdprocessedid="l99xyr">
                                                    <i class="fa fa-check-circle"></i> Save </button>
                                            </div>
                                        </div>
                                    </div>
                                    <strong style="color: red;">NOTE: Your images will be display on respective page after administration approve.</strong>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@Push('scripts')
<script type="text/javascript">
    var i = 0;
    $(".dynamic-ar").click(function() {
        ++i;
        $("#dynamicAddRemove").append('<div class="subject-container row" style="margin-bottom: 2%;"><div class="col-11"><input type="file" accept="image/*" class="form-control" name="images[slider_images' + i +
            ']" /></div><div class="col-1"><button type="button" class="btn btn-outline-danger remove-input-field"><i class="fas fa-trash"></i></button></div></div>'
        );
    });

    $(document).on('click', '.remove-input-field', function() {
        $(this).closest('.subject-container').remove();
    });
</script>
@endpush