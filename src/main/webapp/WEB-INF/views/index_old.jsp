<!-- %@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  -->
<!DOCTYPE html>
<html>




<head>
<!-- meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  meta charset= "UTF-8"> -->
<!-- meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />




<title>Insert title here</title>
</head>
<body>



<div class="container">
<form role="form">
<div class="form-group">
<label for="exampleInputEmail1">Email address</label>
<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
</div>
<div class="form-group">
<label for="exampleInputPassword1">Password</label>
<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
</div>
<div class="form-group">
<label for="exampleInputFile">File input</label>
<input type="file" id="exampleInputFile">
<p class="help-block">Example block-level help text here.</p>
</div>
<div class="checkbox">
<label>
<input type="checkbox"> Check me out
</label>
</div>
<button type="submit" class="btn btn-default">Submit</button>



<div class="drop">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropup2
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li class="dropdown-header">Dropdown header</li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>


<div class="btn-group btn-group-justified" role="group" aria-label="...">
  <button type="button" class="btn btn-default">Left</button>
  <button type="button" class="btn btn-default">Middle</button>
  <button type="button" class="btn btn-default">Right</button>
</div>

<!-- Split button -->
<div class="btn-group">
  <button type="button" class="btn btn-danger">Action</button>
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>


<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">@</span>
  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
</div>

</form>
</div>


<script type="text/javascript" src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>