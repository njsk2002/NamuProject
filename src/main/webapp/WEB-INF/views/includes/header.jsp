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
     <!-- 게시판 -->
   <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
   <link href="resources/css_ext/styles.css" rel="stylesheet" /> 
      
  </head>
  <body>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
     <!-- 게시판 -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="resources/js_ext/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <!-- <script src="resources/js_ext/datatables-simple-demo.js"></script>   -->
<header>

<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" name="form" action="" method="post">

  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">우리가 꿈꾸는 세상 조금 더 밝은 세상이 될 수 있도록 작은 힘이 나마 조금씩 내어 한걸음 한걸음 앞으로 나가 보세요!. 
                                 때론 실패하고 가끔 상처도 받고 길을 잃고 헤메기도 하겠지만 그건 그때의 일일뿐이에요.
                                 가끔 좌우를 살펴보고, 뒤도 돌아보면서 앞으로 걷다 보면 예상보다 많은 변화가 기다리고 있을꺼에요!</p>
        
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>

        </div>
       </div>
    </div>
       <div class="container">
		      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
		          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
		        </a>
		
		        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
		          <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
		          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
		          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
		          <li><a href="list.bo" class="nav-link px-2 text-white">FAQs</a></li>
		          <li><a href="#" class="nav-link px-2 text-white">About</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 	 
		          <li><input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search"></li>     
		        </ul>
		        
		        <c:if test="${!empty login_info }">
		         <div class="text-end">	
		         <div> ${login_info.name } [${login_info.id }] </div>
		         <button type="button" class="btn btn-warning" onclick="go_logout()">Logout</button>		
		        </div>        
		        </c:if>
		        <c:if test="${empty login_info }">
		        <div class="text-end">		           
		          <button type="button" class="btn btn-outline-light me-2"><a href='loginpage'>Login</a></button>
		          <button type="button" class="btn btn-warning"><a href='member'>Sign-up</a></button>
		        </div>
		        </c:if>
		        
	   
		     </div>
       
	  </div>
      
      
  
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>Album</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
  
 </form>
</header>
