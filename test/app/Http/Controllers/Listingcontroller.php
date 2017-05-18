<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Listing;


class ListingController extends Controller
{
   // 

	public function index()
	{
		$sentencelist = Listing::all();
  	    return view('test.index', compact('sentencelist'));
	}

	public function create()
	{
		return view('test.create');
	}

	public function store()
	{
		$this->validate(request(),[

			'english'  => 'required',
			'japanese' => 'required'

			]);
		Listing::create(request(['english', 'japanese']));

		return redirect('/');
	}

}
