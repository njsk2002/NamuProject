<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Album example Â· Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
   
    
    <!-- Bootstrap core CSS -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
       
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
   

      
  </head>
  <body>

    
<link href="resources/css_ext/signin.css" rel="stylesheet">    
<main class="form-signin">
   
    <form id = "form" name="form" action ="login" method = "post">
    <img class="mb-4" src="resources/images/four.ico" alt="" width="72" height="57">
     <h1 class="h3 mb-3 fw-normal">로그인 화면</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="id" name="id" placeholder="please input your ID">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pw" name="pw" onkeypress="if(event.keyCode == 13) {go_login()}" placeholder="비밀번호" >
      <label for="floatingPassword">패스워드</label>
       
      
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="button" onclick="go_login()">로그인</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
</form>
</main>

 <script>
function go_login() {
	if( $('#id').val() == '' ) {
		alert('아이디를 입력하세요!');
		$('#id').focus();
		return;
	} else if( $('#pw').val() == '' ) {
		alert('비밀번호를 입력하세요!');
		$('pw').focus();
		return;
	} else {
		 $('#form').submit();
	}
}

function go_logout() {
	$.ajax({
		type: "post",
		url: "logout",
		success: function() {
			location.reload();
			
			
		},
		error: function(req, text) {
			 alert(text + ': ' + req.status);
	 	}
	});
}
</script>

</body>
</html>