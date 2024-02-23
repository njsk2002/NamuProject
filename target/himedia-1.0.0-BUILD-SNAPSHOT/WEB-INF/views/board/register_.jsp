<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <%@include file="../includes/header.jsp" %>

 <div class="row">
     <div class="col-lg-12">
      <h1 class="page-header">Board Register</h1>
     </div>
     <!-- /.col-lg-12 -->
 </div>
 
 <!--  /.row -->
 <div class="row">
  <div class="col-lg-12"></div>
  <div class="panel panel-default">
  <div class="panel-heading">Board Register</div>
  <!-- /.panel-heading -->
  <div class="panel-body">
     
       <form action="/board/register" method="post">
         <div class="form-group">
         <label>Title</label> <input class="form-control" name='title'>
         </div>
         
         <div class="form-group">
         <label>Text area</label>
         <Textarea Class="form-control" row="3" name='content'></Textarea>
         </div>
         
         <div class="form-group">
         <label>Writer</label><input class="form-control" name="writer"/>
         </div>
         <button type="submit" class="btn btn-primary">Submit</button>
         <button type="reset" class="btn btn-warning">Reset Button</button>
         
       </form>
       
       <!-- end panel-body -->

  </div>
    <!-- end panel-body -->
  
  </div>
   <!-- end panel-body panel-->
 </div>
  <!-- row -->
  <%@include file="../includes/footer.jsp" %>