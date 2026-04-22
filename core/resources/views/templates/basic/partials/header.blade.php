@php
    $contact = getContent('contact_us.content', true);
@endphp
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row align-items-center gy-2">
                <div class="col-lg-6 col-md-8 col-sm-9">
                    <ul
                        class="header__info-list d-flex flex-wrap align-items-center justify-content-sm-start justify-content-center">
                        <li><a href="tel:{{ __($contact->data_values->contact_number) }}"><i class="las la-phone"></i>
                                {{ __($contact->data_values->contact_number) }}</a></li>
                        <li><a href="mailto:{{ __($contact->data_values->email_address) }}"><i
                                    class="las la-envelope"></i> {{ __($contact->data_values->email_address) }}</a></li>
                    </ul>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-3 text-sm-end text-center">
                    @if (gs('multi_language'))
                        @php
                            $language = App\Models\Language::all();
                            $selectedLang = $language->where('code', session('lang'))->first();
                        @endphp
                        <div class="dropdown-lang dropdown mt-0 d-block">
                            <a href="#" class="language-btn dropdown-toggle" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <img class="flag"
                                    src="{{ getImage(getFilePath('language') . '/' . @$selectedLang->image, getFileSize('language')) }}"
                                    alt="us">
                                <span class="language-text text-white">{{ @$selectedLang->name }}</span>
                            </a>
                            <ul class="dropdown-menu">
                                @foreach ($language as $lang)
                                    <li><a href="{{ route('lang', $lang->code) }}"><img class="flag"
                                                src="{{ getImage(getFilePath('language') . '/' . @$lang->image, getFileSize('language')) }}"
                                                alt="@lang('image')">
                                            {{ @$lang->name }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>

</header>
<div class="header__bottom">
    <div class="container">
        <nav class="navbar navbar-expand-xl p-0 align-items-center">
            <a class="site-logo site-title" href="{{ route('home') }}">
                <img src="{{ getImage(getFilePath('logoIcon') . '/logo.png') }}" alt="@lang('logo')">
            </a>
            <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="menu-toggle"></span>
            </button>
            <div class="collapse navbar-collapse mt-lg-0 mt-3" id="navbarSupportedContent">
                <ul class="navbar-nav main-menu ms-auto">
                    <li class="{{ menuActive('home') }}">
                        <a href="{{ route('home') }}">@lang('Home')</a>
                    </li>
                    @foreach ($pages as $k => $data)
                        @php $isActive = route('pages', [$data->slug]) == request()->url(); @endphp
                        <li class="@if ($isActive) active @endif">
                            <a href="{{ route('pages', [$data->slug]) }}">{{ __($data->name) }}</a>
                        </li>
                    @endforeach
                    <li class="{{ menuActive(['blog', 'blog.details']) }}">
                        <a href="{{ route('blog') }}">@lang('Blog')</a>
                    </li>
                    <li class="{{ menuActive('contact') }}">
                        <a href="{{ route('contact') }}">@lang('Contact')</a>
                    </li>
                </ul>
                <div class="nav-right">
                    <a href="{{ route('apply.donor') }}" class="btn btn-md btn--base d-flex align-items-center"><i
                            class="las la-user fs--18px me-2"></i> @lang('Apply as a Donor')</a>
                </div>
            </div>
        </nav>
    </div>
</div>
