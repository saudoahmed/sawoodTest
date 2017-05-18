@extends ('layout')

@section('back')
<a href="/"> 戻る </a>
@endsection
@section ('content')

<form method="POST" action="/listing">
{{ csrf_field() }}

	 @if(count($errors))
	  <div class="alert alert-danger">
	  		@foreach ($errors->all() as $error)
		  		<li>{{ $error }}</li>
		  	@endforeach
	   </div>
	 @endif

  <div class="form-group">
    <label for="japanese">単語・例文</label>
    <input type="text" name="japanese" class="form-control" placeholder="日本語で書いてください" >
  </div>

  <div class="form-group">
    <label for="english">英語訳</label>
    <input type="text" name="english" class="form-control" placeholder="Please write in english" >
  </div>
  <button type="submit" class="btn btn-default">登録</button>
</form>

 @endsection
