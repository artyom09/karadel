<?php

namespace App\Http\Controllers;

use App\Models\ContactUs;
use App\Models\Message;
use App\Models\Photozona;
use App\Models\Accessory;
use App\Models\Clothes;
use Mail;
use App\Mail\Reservation;
use Illuminate\Http\Request;

class ContactUsController extends Controller
{
    public function reservation() {
        $contact_us = ContactUs::where('id', 1)->first();
        $photozonas = Photozona::get();
        $accessories = Accessory::orderBy('sort', 'desc')->get();
        $clothes = Clothes::get();
        return view('xweb.reservation', [
            'contact_us' => $contact_us,
            'photozonas' => $photozonas,
            'accessories' => $accessories,
            'clothes' => $clothes,
        ]);
    }

    public function reserv(Request $request) {
        $this->validate($request, [
            'name'	    =>	'required|max:50',
            'phone'     =>  'required',
            'address'	=>	'required',
            'message'	=>	'required',
        ]);

        $photozonas = [];
        $accessories = [];
        $clothes = [];

        $selectedPhotos = $request->input('selected_photos', []);

        if (isset($selectedPhotos['photozone'])) {
            $photozonas = $selectedPhotos['photozone'];
        }

        if (isset($selectedPhotos['accessory'])) {
            $accessories = $selectedPhotos['accessory'];
        }

        if (isset($selectedPhotos['clothe'])) {
            $clothes = $selectedPhotos['clothe'];
        }

        $reservation = new Message();
        $reservation->photozona = json_encode($photozonas);
        $reservation->accessories = json_encode($accessories);
        $reservation->clothes =  json_encode($clothes);
        $reservation->name = $request->name;
        $reservation->phone = $request->phone;
        $reservation->address = $request->address;
        $reservation->date = $request->date;
        $reservation->message = $request->message;

        if($reservation->save()) {
            Mail::send(new Reservation($reservation));
            return redirect()->back()->with('status', 'հաջողությամբ ուղարկվել է');
        }
    }

    public function message(Request $request){
        $this->validate($request, [
            'name'	    =>	'required|max:50',
            'phone'     =>  'required',
            'message'	=>	'required',
        ]);

        $data = $request->all();
        $message = new Message();
        $message->name = $request->name;
        $message->email = $request->email;
        $message->phone = $request->phone;
        $message->subject = $request->subject ? $request->subject : "";
        $message->message = $request->message;
//        if($message->save()){
//            Mail::to('artyom1996a@gmail.com')->send(new Contact($data));
//            $requestMessage = 'Request have been sent';
//            return redirect()->back();
//        }
        if($message->save()) {
            return redirect()->back()->with('status', 'հաջողությամբ ուղարկվել է');
        }
    }
}
