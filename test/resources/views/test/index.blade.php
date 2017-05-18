@extends ('layout')


    @section ('content')
     @if(count($sentencelist))
        @foreach ($sentencelist as $sentence)
            <p  class="text-left">
                {{ $sentence->japanese }} </p>
            <p  class="text-right">
                {{ $sentence->english }}</p>
            <hr>
        @endforeach
    @else

    <p class="text-left">   単語データはありません。</p>
     @endif
    @endsection


    @section ('button')

      <a href="/create" class="btn btn-default btn-lg pull-right">
           <span class="glyphicon glyphicon-plus-sign " aria-hidden="true"></span>
           </a>
     @endsection
