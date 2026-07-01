<section class="page-hero">
    <div class="page-hero__banner" @if(!empty($image)) style="background-image:linear-gradient(rgba(46,48,147,0.82),rgba(46,48,147,0.7)),url('{{ $image }}')" @endif>
        <div class="container mx-auto px-4 page-hero__content text-white">
            @if(!empty($eyebrow))
                <p class="page-hero__eyebrow">{{ $eyebrow }}</p>
            @endif
            <h1 class="page-hero__title font-heading">{{ $title }}</h1>
            @if(!empty($subtitle))
                <p class="page-hero__subtitle">{{ $subtitle }}</p>
            @endif
        </div>
    </div>
</section>
