@if ($paginator->hasPages())
    <ul>
            {{-- Previous Page Link --}}
            @if ($paginator->onFirstPage())
                <li class="prev"  aria-disabled="true" aria-label="">
                    <a class="disabled " aria-hidden="true">
                        <i class="ph-bold ph-arrow-left"></i>
                    </a>
                </li>
            @else
                <li class="prev" >
                    <a class="" href="{{ $paginator->previousPageUrl() }}" rel="prev" aria-label="">
                        <i class="ph-bold ph-arrow-left"></i>
                    </a>
                </li>
            @endif

            {{-- Pagination Elements --}}
            @foreach ($elements as $element)
                {{-- "Three Dots" Separator --}}
                @if (is_string($element))
                    <li class=" disabled" aria-disabled="true"><span class="">{{ $element }}</span></li>
                @endif

                {{-- Array Of Links --}}
                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $paginator->currentPage())
                            <li aria-current="page"><a class="current" >{{ $page }}</a></li>
                        @else
                            <li class=""><a class="" href="{{ $url }}">{{ $page }}</a></li>
                        @endif
                    @endforeach
                @endif
            @endforeach

            {{-- Next Page Link --}}
            @if ($paginator->hasMorePages())
                <li class="next">
                    <a class="" href="{{ $paginator->nextPageUrl() }}" rel="next" aria-label="">
                        <i class="ph-bold ph-arrow-right"></i>
                    </a>
                </li>
            @else
                <li class="next" aria-disabled="true" aria-label="">
                    <a class=" disabled" aria-hidden="true">
                        <i class="ph-bold ph-arrow-right"></i>
                    </a>
                </li>
            @endif
        </ul>
@endif
