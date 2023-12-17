<form action="{{ route('send.bid.details') }}" method="post" id="bid-form" class="generic-form">
    @csrf
    <input type="hidden" value="{{ $type }}" name="type">
    <input type="hidden" value="{{ $data->id }}" name="data_id">
    <div class="head">{{ __('Place Bid') }}</div>
    <div class="form-group">
        <input type="text" name="name" class="form-control" placeholder="{{ __('Name') }} *">
    </div>
    <div class="form-group">
        <input type="text" name="phone" class="form-control" placeholder="{{ __('Phone') }}">
    </div>
    <div class="form-group">
        <input type="text" name="email" class="form-control" placeholder="{{ __('Email') }} *">
    </div>
    <div class="form-group">
        <input type="text" name="amount" class="form-control" placeholder="{{ __('Bid Amount') }} *">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="{{ __('Subject') }} *" value="{{ $data->name }}" readonly>
    </div>
    <div class="form-group">
        <textarea name="content" class="form-control" rows="5" placeholder="{{ __('Message') }} *"></textarea>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-lg btn-orange btn-block">{{ __('Send') }}</button>
    </div>
</form>