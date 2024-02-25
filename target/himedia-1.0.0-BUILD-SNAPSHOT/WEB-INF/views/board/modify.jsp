<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <%@include file="../includes/header.jsp" %>

 <div class="row">
     <div class="col-lg-12">
      <h1 class="page-header">Board Modify</h1>
     </div>
     <!-- /.col-lg-12 -->
 </div>
 
 <!--  /.row -->
 <div class="row">
  <div class="col-lg-12"></div>
  <div class="panel panel-default">
  <div class="panel-heading">게시판 수정</div>
  <!-- /.panel-heading -->
  <div class="panel-body">
     
       <form role="form" action="/board/modify" method="post">
       
         <div class="form-group">
         <label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>Title</label>
         <input class="form-control" name='title' value='<c:out value="${board.title }"/>'>
         </div>
         
         <div class="form-group">
         <label>Text area</label>
         <Textarea Class="form-control" rows="3" name='content'><c:out value="${board.content}"/></Textarea>
         </div>
         
                 
         <div class="form-group">
         <label>Writer</label>
         <input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>RegDate</label>
         <input class="form-control" name='regdate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate}"/>' readonly="readonly">
         </div>
         
         <div class="form-group">
         <label>Update Date</label>
         <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate}"/>' readonly="readonly">
         </div>
         

         
         <button type="submit" data-oper='modify' class="btn btn-primary">Modify</button>
         <button type="submit" data-oper='remove' class="btn btn-warning">Remove</button>
         <button type="submit" data-oper='list' class="btn btn-info">게시판</button>
         
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
    	var formObj = $("form");
    	
    	$('button').on("click", function(e){
    		e.preventDefault();
    		
    		var operation = $(this).data("oper");
    		console.log(operation);
    		
    		if(operation === "remove"){
    			formObj.attr("action","/board/remove");
    		} else if( operation ==="modify"){
    			formObj.attr("action","/board/modify");
    			console.log("모디파이")
    		} else if(operation === "list"){
    			//move to list
    			//self.location="/board/list";
    			//return;
    			formObj.attr("action","board/list").attr("method","get");
    			formObj.empty();
    		
    		}
    		  formObj.submit();
    	});
    	
    });
  
</script>
  
  
  