<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <%@include file="../includes/header.jsp" %>

 <div class="row">
     <div class="col-lg-12">
      <h1 class="page-header">Board Detail</h1>
     </div>
     <!-- /.col-lg-12 -->
 </div>
 
 <!--  /.row -->
 <div class="row">
  <div class="col-lg-12"></div>
  <div class="panel panel-default">
  <div class="panel-heading">게시판 세부내용</div>
  <!-- /.panel-heading -->
  <div class="panel-body">
     

         <div class="form-group">
         <label>NO</label> <input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>Title</label>
         <input class="form-control" name='title' value='<c:out value="${board.title }"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>Text area</label>
         <Textarea Class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content}"/></Textarea>
         </div>
         
         
         <form id="operForm" action="/board/modify" method="get">
          
          <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
        
         <div class="form-group">
         <label>Writer</label>
         <input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>RegDate</label>
         <input class="form-control" name='regdate' value='<fmt:formatDate pattern = "yyyy:MM:dd" value="${board.regdate}"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>Update Date</label>
         <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy:MM:dd" value="${board.updateDate}"/>' readonly="readonly">
         </div>
         <!-- a href 방식 
         <button data-oper='modify' class="btn btn-primary"><a href="/board/modify?bno=<c:out value='${board.bno }'/>">수정</a></button>
         <button data-oper='list' class="btn btn-info"><a href="/board/list">게시판</a></button>
          -->
         <button data-oper='modify' class="btn btn-primary">수정</button>
         <button data-oper='list' class="btn btn-info">게시판</button>
         
          </form>
       
       <!-- end panel-body -->

  </div>
    <!-- end panel-body -->
  
  </div>
   <!-- end panel-body panel-->
 </div>
  <!-- row -->
  <%@include file="../includes/footer.jsp" %>
  
  <script type="text/javascript">
    $(document).ready(function(){
    	var operForm = $("#operForm");
      
    	$("button[data-oper='modify']").on("click",function(e){
    		operFrom.attr("action", "/board/modify").submit();
    	});
    	
        $("button[data-oper='list']").on("click",function(e){
        	operForm.find("#bno").remove();
        	operForm.attr("action","/board/list");
        	operForm.submit();
        });
    });
  
  
  
  </script>