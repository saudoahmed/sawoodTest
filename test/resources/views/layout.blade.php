<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>
  <body>
  <div class="container">

      <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-8">
                <div class="panel panel-warning">
                  <!-- Default panel contents -->
                  <div class="panel-heading ">
                        <div class="row">
                              <div class="col-xs-6 col-md-4"> <h3 class="text-left"> @yield('back')</h3> </div>
                              <div class="col-xs-6 col-md-4"><h3 class="text-center">単語帳・例文帳一覧</h3> </div>
                              <div class="col-xs-6 col-md-4"> <h3 class="text-right">テスト</h3> </div>
                        </div>

                        <div class="panel-body">
                            @yield ('content')
                        </div>
                            @yield('button')
                    </div>

                </div>
            </div>
        </div>
     </div>
  </body>
</html>
