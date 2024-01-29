<div class="row">
    <div class="col-md-6">
        {{-- Access AdvertisementPackage data --}}
        @foreach ($advertisementImageData as $item)
            <p><strong>Advertisement Package Name</strong>: <i>{{ $item->name }}</i></p>
            <p><strong>Number Of Days</strong>: <i>{{ $item->number_of_days }}</i> (Days will start after published (Approval))</p>
        @endforeach
        @if ($advertisementimage->approved_at)
            <p><strong>Approved At</strong>: <i>{{ $advertisementimage->approved_at }}</i>
        @endif
    </div>
    <div class="col-md-12">
        <p><strong>Image Preview</strong>:</p>
        @if ($advertisementimage->new_project_image)
            <img src="{{ asset('storage/' . $advertisementimage->new_project_image) }}" alt="New Project Image" height="400" width="900">
        @endif

        @if ($advertisementimage->new_sale_image)
            <img src="{{ asset('storage/' . $advertisementimage->new_sale_image) }}" alt="New Sale Image" height="400" width="900">
        @endif

        @if ($advertisementimage->secondary_image)
            <img src="{{ asset('storage/' . $advertisementimage->secondary_image) }}" alt="Secondary Image" height="400" width="900">
        @endif

        @if ($advertisementimage->leasing_image)
            <img src="{{ asset('storage/' . $advertisementimage->leasing_image) }}" alt="Leasing Image" height="400" width="900">
        @endif

        @if ($advertisementimage->holiday_homes_image)
            <img src="{{ asset('storage/' . $advertisementimage->holiday_homes_image) }}" alt="Holiday Homes Image" height="400" width="900">
        @endif

        @if ($advertisementimage->slider_image)
            <img src="{{ asset('storage/' . $advertisementimage->slider_image) }}" alt="Holiday Homes Image" height="400" width="900">
        @endif
    </div>

</div>