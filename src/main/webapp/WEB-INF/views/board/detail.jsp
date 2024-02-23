<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- 게시판 -->
   
   <link href="resources/css_ext/styles.css" rel="stylesheet" /> 
   <link href="resources/css_ext/bootstrap.min.css" rel="stylesheet">
   <link href="resources/css_ext/kfonts2.css" rel="stylesheet"> 

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
      
      
     .content-block {
		  display: block;
		  word-break:break-all;
		  position: relative;
		 
		  width: fit-content;
		  padding: 15px;
		  max-width: 400px;
		  margin: 0 auto 2px 0;
		  border-radius: 16px;
        }

    </style>  
   
</head>
<body>
<main>

<div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3 content-block">
<div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden content-block" >
      <div class="my-3 py-3">
        <h2 class="display-5">${vo.title}</h2>
        <p class="lead">${vo.writer}
        <img src="${vo.mfilepath }" alt="작성자" style="width: 45px; height: 45px" class="rounded-circle" /></p>
      </div>
      <div class="bg-light shadow-sm mx-auto" style="width: 85%; height: 300px; border-radius: 21px 21px 0 0;">
         <img src = "${vo.filepath }" style="width: 100%; height: 300px;">
      </div>
      
 </div>
</div>  
 <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3 content-block">    
     <div class="bg-light shadow-sm mx-auto content-block " style="width: 100%; height: 300px; border-radius: 21px 21px 0 0;">     
        <p style="width: 100%; height: 300px;" >${vo.content } </p>
     </div>
</div>
</main>
</body>
</html>