<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <%@include file="../includes/header.jsp" %>


                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판 테스트</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Board List Page</h6>
                              <button id="regBtn" type="button" class="btn btn-secondary">글등록</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                              
                      <c:forEach var="board" items="${list}">
                        <tr>
                           <td>${board.bno }</td>
                           <td><a href='/board/get?bno=<c:out value="${board.bno }"/>' >${board.title}</a></td>
                          <!--   <td><a href='/board/get?bno=<c:out value="${board.bno }"/>' target='_blank'>${board.title}</a></td>
                            target='_blank'는 새창을 띄어서 이동 -->
                           <td>${board.writer}</td>
                           <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                           <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                        </tr>
                      </c:forEach>
                      </table>
                                               
                    </div>
                </div>
   
     <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            
 <%@include file="../includes/footer.jsp" %>
 

 

 
       <!-- Modal 추가 -->
                      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                      <div class="modal-content">
                      <div class="modal-header">                  
                      <h4 class="modal-title" id="myModalLabel">게시판 등록 결과 </h4>
                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      </div>
                      <div class="modal-body">처리가 완료되었습니다.</div>
                      <div class="modal-footer">
                       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                       <button type="button" class="btn btn-primary" >Save changes</button>
                       
                      </div>
                      </div>
                      <!-- /.modal-content -->                   
                            </div>
                            <!-- /.modal-dialog -->      
                        </div>
                        <!-- /.modal-->  
 
 

 <script type="text/javascript">
 
 $(document).ready(function(){
	 var result = '<c:out value="${result}"/>';
	 
	 checkModal(result);
	 
	 //모달창 이전메뉴선택시 팝업 방지
	 history.replaceState({},null,null);
	 
	 function checkModal(result){
		if(result === '' || history.state){ // history.state는 체크
			
			return;
		 }
		
		if(parseInt(result) > 0){
		 $(".modal-body").html("게시글" + parseInt(result) + " 번이 등록되었습니다.");	
		}
		$("#myModal").modal("show");
	 }
	 
	 $("#regBtn").on("click", function(){
		 self.location ="/board/register";
	 });
 });

</script>
