<?php

namespace App\Http\Controllers;

use App\Models\Service;
use App\Models\Program;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ServicesController extends Controller
{
    public function services() {
        $services = Service::orderBy('order', 'asc')->get();
        return view('xweb.service', [
            'services'  => $services
        ]);
    }

    public function show($slug) {
        $single_service = Service::where('slug', $slug)->firstOrFail();
        $bar_services = Service::get();
        return view('xweb.service-single', [
            'single_service'  => $single_service,
            'bar_services'  => $bar_services,
        ]);
    }

    public function programs() {
        $programs = Program::orderBy('created_at', 'asc')->paginate('9');
        return view('xweb.program', [
            'programs'  => $programs
        ]);
    }

    public function showPrograms($slug) {
        $single_program = Program::where('slug', $slug)->firstOrFail();
        $bar_programs = Program::get();
        return view('xweb.program-single', [
            'single_program'  => $single_program,
            'bar_programs'  => $bar_programs,
        ]);
    }
}
