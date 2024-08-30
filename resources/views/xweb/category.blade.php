@extends('layouts.front')

@section('content')
    <section class="product__area pt-30 pb-100">
      <div class="container">
         <div class="row">
            <div class="col-xxl-12">
               <div class="product__filter-tab">
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="nav-grid-tab" role="tabpanel" aria-labelledby="nav-grid-tab">
                        <div class="row">
                            @foreach($products as $product)
                            <div class="col-xxl-3 col-xl-3 col-lg-4 col-md-6 mt-30">
                              <div class="product__item mb-20 text-center transition-3 border-style">
                                 <div class="product__thumb p-relative mb-30 w-img fix">
                                    <a href="{{route('products.show', $product->id)}}">
                                       <img class="prod-image" src="{{ Voyager::image($product->image) }}" alt="">
                                    </a>
                                    <div class="product__icon">
                                       <a href="{{route('products.show', $product->id)}}"><i class="fal fa-eye"></i></a>
                                    </div>
                                 </div>
                                 <div class="product__content">
                                    <h4 class="product__title">
                                       <a href="{{route('products.show', $product->id)}}">{{$product->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</a>
                                    </h4>
                                    <div class="product__price">
                                       <span class="price">{{ $product->price }}</span>
                                    </div>
                                 </div>
                              </div>
                            </div>
                             @endforeach

                           <div class="basic-pagination text-center pt-40">
                              <nav>
                                 {{ $products->links() }}
                               </nav>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
@endsection
