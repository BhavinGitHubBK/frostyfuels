@if ($bid)
<div class="row">
    <div class="col-md-6">
        <p><strong>Name</strong>: <i>{{ $bid->name }}</i></p>
        <p><strong>Time</strong>: <i>{{ $bid->created_at }}</i></p>
        <!-- <p><strong>{{ trans('plugins/real-estate::consult.consult_id') }}</strong>: <i>AB00000{{ $bid->id }}</i></p> -->
        @if ($bid->ip_address)
        <p><strong>Bid Amount</strong>: <i>{{ $bid->amount }}</i></a></p>
        @endif
    </div>
    <div class="col-md-6">
        <p><strong>email</strong>: <i><a href="mailto:{{ $bid->email }}">{{ $bid->email }}</a></i></p>
        <p><strong>phone</strong>: <i>@if ($bid->phone) <a href="tel:{{ $bid->phone }}">{{ $bid->phone }}</a> @else N/A @endif</i></p>
        @if ($bid->project_id && $bid->project)
        <p><strong>project</strong>: <a href="{{ $bid->project->url }}" target="_blank"><i>{{ $bid->project->name }}</i></a></p>
        @endif
        @if ($bid->property_id && $bid->property)
        <p><strong>property</strong>: <a href="{{ $bid->property->url }}" target="_blank"><i>{{ $bid->property->name }}</i></a></p>
        @endif
    </div>
</div>
<p><strong>content</strong>: <i>{{ $bid->content ?: '...' }}</i></p>
@endif