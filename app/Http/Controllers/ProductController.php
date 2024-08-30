<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\Ordering;
use App\Models\Brand;

class ProductController extends Controller
{
    public function products() {
        $products = Product::paginate(12);
        $categories = ProductCategory::get();

        return view('xweb.products', [
            'products' => $products,
            'categories' =>  $categories
        ]);
    }

    public function brands() {
        $brands = Brand::get();

        return view('xweb.brands', [
            'brands' =>  $brands
        ]);
    }

    public function brandShow($data) {
        $brand = Brand::where('slug', $data)->firstOrFail();
        $products = Product::where('brand', $brand->id)->paginate(16);

        return view('xweb.brandshow', [
            'products' => $products,
            'brand' => $brand,
        ]);
    }

    public function category($data) {
        $category = ProductCategory::where('slug', $data)->firstOrFail();
        $products = Product::where('category', $category->id)->paginate(16);

        return view('xweb.category', [
            'products' => $products,
            'category' => $category,
        ]);
    }

    public function show($slug) {
        $single_product = Product::where('id', $slug)->firstOrFail();
        $category = ProductCategory::where('id', $single_product->category)->firstOrFail();
        $single_rproducts = Product::where('category', $single_product->category )->take(4)->get();
        $images = json_decode($single_product->more_images);
        if($images == null) {
            $images = [];
        }
        return view('xweb.products-single', [
            'single_product' => $single_product,
            'single_rproducts' => $single_rproducts,
            'images' => $images,
            'category' => $category
        ]);
    }

        public function ordering(Request $request){
        $this->validate($request, [
            'name'	    =>	'required|max:50',
            'phone'     =>  'required',
        ]);

        $data = $request->all();
        $message = new Ordering();
        $message->name = $request->name;
        $message->phone = $request->phone;
        $message->product = $request->product;
        $message->question = $request->question ? $request->question  : "";
//        if($message->save()){
//            Mail::to('artyom1996a@gmail.com')->send(new Contact($data));
//            $requestMessage = 'Request have been sent';
//            return redirect()->back();
//        }
        if($message->save()) {
            return redirect()->back()->with('status', 'success');
        }
    }
}
