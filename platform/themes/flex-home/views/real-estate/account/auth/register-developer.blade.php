<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 auth-form-wrapper">
            <div class="card login-form">
                <div class="card-body">
                    <h4 class="text-center">{{ trans('plugins/real-estate::dashboard.register-title') }}</h4>
                    <br>
                    @include(Theme::getThemeNamespace() . '::views.real-estate.account.auth.includes.messages')
                    <br>
                    <form method="POST" action="{{ route('public.account.register.developer') }}">
                        @csrf
                        <div class="form-group">
                            <input id="first_name" type="text"
                                   class="form-control{{ $errors->has('first_name') ? ' is-invalid' : '' }}"
                                   name="first_name" value="{{ old('first_name') }}" required autofocus
                                   placeholder="{{ trans('plugins/real-estate::dashboard.first_name') }}">
                            @if ($errors->has('first_name'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('first_name') }}</strong>
                                    </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <input id="last_name" type="text"
                                   class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}"
                                   name="last_name" value="{{ old('last_name') }}" required
                                   placeholder="{{ trans('plugins/real-estate::dashboard.last_name') }}">
                            @if ($errors->has('last_name'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('last_name') }}</strong>
                                    </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <input id="username" type="text"
                                   class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}"
                                   name="username" value="{{ old('username') }}" required
                                   placeholder="{{ trans('plugins/real-estate::dashboard.username') }}">
                            @if ($errors->has('username'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('username') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <input id="email" type="email"
                                   class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                                   name="email" value="{{ old('email') }}" required
                                   placeholder="{{ trans('plugins/real-estate::dashboard.email') }}">
                            @if ($errors->has('email'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>
                     
                        <div class="form-group">
                            <input id="password" type="password"
                                   class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                   name="password" required
                                   placeholder="{{ trans('plugins/real-estate::dashboard.password') }}">
                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                            @endif
                        </div>

                        <div class="form-group">
                            <input id="password-confirm" type="password" class="form-control"
                                   name="password_confirmation" required
                                   placeholder="{{ trans('plugins/real-estate::dashboard.password-confirmation') }}">
                        </div>
                    <input type="hidden" name="role_id"  value="2"/>
                        @if (is_plugin_active('captcha') && setting('enable_captcha') && setting('real_estate_enable_recaptcha_in_register_page', 0))
                            <div class="form-group mb-3">
                                {!! Captcha::display() !!}
                            </div>
                        @endif

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-full fw6">
                                {{ trans('plugins/real-estate::dashboard.register-cta') }}
                            </button>
                        </div>
                         

                        <div class="form-group text-center">
                            <p>{{ __('Have an account already?') }} <a href="{{ route('public.account.login') }}" class="d-block d-sm-inline-block text-sm-left text-center">{{ __('Login') }}</a></p>
                        </div>

                        <div class="text-center">
                            {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\RealEstate\Models\Account::class) !!}
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
