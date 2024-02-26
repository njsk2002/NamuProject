<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list jsp</title>
  <!-- 게시판 -->
   <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
   <link href="resources/css_ext/styles.css" rel="stylesheet" />
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
   <link href="resources/css_ext/bootstrap.min.css" rel="stylesheet">
   <link href="resources/css_ext/kfonts2.css" rel="stylesheet"> 




 <style>
 /* DETAIL_INLIST.JSP 반영    */ 
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

/* LIST.JSP 반영    */ 
table { table-layout:fixed; }
table td { overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
.grid li div span{ float: right; }


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

<!-- 게시판 -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="resources/js_ext/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- 주석처리하면 header tab 메뉴동작함.  <script src="resources/js/bootstrap.min.js"></script> -->  

<div class="container-fluid px-4">
	<h1 class="mt-4">Tables</h1>
	<div>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
			<li class="breadcrumb-item active">Tables</li>
		</ol>

	</div>

	<div class="row g-3">
		<div class="col-sm-6">
			<div class="col-sm-12 col-md-6">
				<div class="invalid-feedback">Valid first name is required.</div>
			</div>
		</div>
	</div>
</div>
<!-- 테스트용 현재는 의미없음 -->
<div class="clearfix">
                <ul class="nav nav-tabs ">
		         <li class="active"><a href="#">메뉴1</a></li>
		         <li><a href="#">메뉴2</a></li>
		         <li><a href="#">메뉴3</a></li>
		         <li><a href="#">메뉴4</a></li>
               </ul>
</div>
<div class="card mb-4">
	<div class="card-body">
	
	
		<form id="list" method="post" action="">
			<input type="hidden" name="curPage" value="1" /> 
			<input type="hidden" name="bno" />
			<input type="hidden" name="detail">
			<div id="list-top">
				<div>
				
					<!-- 검색 -->
					<ul class="nav nav-tabs">
						<li>
						  <select name="search" class="w-px80">
								<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
								<option value="title"
									${page.search eq 'title' ? 'selected' : '' }>제목</option>
								<option value="content"
									${page.search eq 'content' ? 'selected' : '' }>내용</option>
								<option value="writer"
									${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
						  </select>
						</li>
						<li><input type="text" name="keyword" class="w-px300" /></li>
						<li><a class="btn-fill" onclick="$('form').submit()">검색</a></li>

						<li><select name="pageList" class="w-px80"
							onchange="$('[name=curPage]').val(1); $('form').submit()">
								<option value="10" ${page.pageList eq 10 ? 'selected' : '' }>10개씩</option>
								<option value="20" ${page.pageList eq 20 ? 'selected' : '' }>20개씩</option>
								<option value="30" ${page.pageList eq 30 ? 'selected' : '' }>30개씩</option>
						</select></li>
						<li><select name="viewType" class="w-px100" onchange="$('form').submit()">
								<option value="list"
									${page.viewType eq 'list' ? 'selected' : '' }>리스트 형태</option>
								<option value="grid"
									${page.viewType eq 'grid' ? 'selected' : '' }>바둑판 형태</option>
						</select></li>
						<!-- 로그인되어 있으면 글쓰기 가능 -->
						<c:if test="${!empty login_info }">
							<li>
								<!-- 글쓰기 버튼 --> <a class="btn-fill" href="new.bo">글쓰기</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="card mb-4">
	<div class="card-body">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net/">official
			DataTables documentation</a> .
	</div>
</div>

<div id="data-list">
	<c:if test="${page.viewType eq 'list'}">
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
			
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="vo" items="${page.list}">
					<tr>
					    <td class="col-md-2">
						    <p class="fw-normal mb-1"><a onclick="go_detail(${vo.bno}, 'y')">${vo.title}</a></p>
						    <%-- <p><input type="button" class="btn btn-success" id="detailbtn${vo.bno}" onclick="move_detail('${vo.bno}')" value="자세히">
						    <input type="button" class="btn btn-primary" id="closebtn${vo.bno}" style="display: none;" onclick="move_close('${vo.bno}')" value="닫기"></p> --%>
					    </td>
					    <td class="col-md-4">${vo.content}</td>
					
						
						<td class="col-md-2">
							<div class="d-flex align-items-center">
								<img src="${vo.mfilepath }" alt=" "
									style="width: 45px; height: 45px" class="rounded-circle" />
								<div class="ms-3">
									<p class="fw-bold mb-1">${vo.writer}</p>
								</div>
							</div>
						</td>
						<td class="col-md-2">${vo.writedate}</td>
						<td class="col-md-1">${vo.readcnt }</td>
						<td class="col-md-1">${vo.filename}</td>
                    						
					</tr>
					
				
   <%--  TR안에 DIV를 사용하는것은 웹표준에 어긋나는것임으로, 테이블 펼치기는 하지 않음.                
  <tr id="detail${vo.bno }" class="detail" style="display: none;">   
  ==========================================  DETAIL ==================================================  
                    <td colspan = "6" >
                    <div class="album py-5 bg-light">
  
  <!-- class="album": Bootstrap의 앨범 클래스입니다. 이 클래스는 앨범 컴포넌트의 스타일을 정의합니다.
  py-5: 상단(Padding Top)과 하단(Padding Bottom)에 5단위의 여백을 추가합니다.
  bg-light: 배경색을 밝은 색으로 지정합니다. 이 클래스는 Bootstrap에서 제공하는 배경색 클래스 중 하나입니다. -->
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-1 g-3">
      <!-- "row" 클래스: Bootstrap 그리드 시스템에서 행을 정의합니다.
      "row-cols-1" 클래스: 작은 화면 크기에서는 한 열(column)로 배치합니다.
      "row-cols-sm-2" 클래스: 중간 크기 화면에서는 두 개의 열로 배치합니다.
      "row-cols-md-2" 클래스: 중간 크기 이상의 화면에서도 두 개의 열로 배치합니다.
      "g-3" 클래스: 열 간의 간격을 3단위로 설정합니다. 이것은 열 사이의 간격을 조절하는 데 사용됩니다. -->
      
      
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
              <image x="0" y="0" width="100%" height="100%" xlink:href="img/IU.png" />
            </svg>
            
            <div class="card-body">
                    <div class="my-3 py-3">
				        <h2 class="display-5">${vo.title}</h2>
				        <p class="lead">${vo.writer}
				        <img src="${vo.mfilepath }" alt="작성자" style="width: 45px; height: 45px" class="rounded-circle" /></p>
				        <c:if test="${!empty vo.filename }"><p>파일명
				          
				          <a href="download.bo?id=${vo.bno }"><img src="img/paperclip.svg"></i>${vo.filename }</a></p>
			            </c:if>
				        
				    </div> 
				 <div class=" content-block">         
                 <p class="card-text ">${vo.content}</p>
                 </div>
              <div class="d-flex justify-content-between align-items-center">
              
              <!-- d-flex: Flexbox 컨테이너를 나타냅니다. 이 클래스는 해당 요소를 Flexbox로 설정하여 자식 요소들을 유연하게 배치할 수 있도록 합니다.
              justify-content-between: 자식 요소들을 수평으로 정렬할 때 요소들 사이에 공간을 균등하게 분배합니다. 첫 번째 요소는 시작 부분에, 마지막 요소는 끝 부분에 정렬됩니다.
              align-items-center: 자식 요소들을 수직으로 정렬할 때 가운데 정렬합니다. 이 클래스는 자식 요소들의 높이가 서로 다를 때 사용됩니다.
              즉, 위의 코드는 Flexbox를 사용하여 요소들을 수평으로 정렬하고, 첫 번째 요소는 시작 부분에, 두 번째 요소는 끝 부분에 정렬하며, 자식 요소들의 높이를 가운데 정렬합니다. 
              이는 부트스트랩을 사용하여 반응형 디자인을 구현하는 데 유용한 기능 중 하나입니다. -->
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

   </div>
 </div>
 </div> 
 </td> 
 </tr>	
 --%>
				  
             
               								 
				</c:forEach>

			</tbody>
		</table>
	</c:if>

	<%-- <c:if test="${page.viewType eq 'grid' }">
	    <c:forEach items="${page.list }" var="vo">
		<ul class="grid">
			
				<li>
					<div>
						<a onclick="go_detail(${vo.bid})">${vo.title }</a>
					</div>
					<p class="text-muted mb-0">john.doe@gmail.com</p>
					<div>${vo.writer }</div>
					<div>
						${vo.writedate } <span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
					</div>
					<div>${vo.content}</div>
					<div>${vo.writedate}</div>
					<div>${vo.readcnt}</div>
					<div>${vo.filename}</div>
				</li>
		
		</ul>
			</c:forEach>
	</c:if> --%>
	
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
       <c:if test="${page.viewType eq 'grid' }">
         <c:forEach items="${page.list }" var="vo">
        <div class="col">
          <div class="card shadow-sm">
           <!--  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
            <img src="${vo.filepath }" style="width: 300px; height: 150px">
             <div class="card-body">

              <img src="${vo.mfilepath }" alt="" style="width: 45px; height: 45px" class="rounded-circle" />

              <img src="${vo.filepath}" alt="" style="width: 45px; height: 45px" class="rounded-circle" />

              <div>
					<a onclick="go_detail(${vo.bid})">${vo.title }</a>
					<button type="button" class="btn btn-success" id="detail">자세히</button>
					</div>
					<p class="text-muted mb-0">john.doe@gmail.com</p>
					<div>${vo.writer }</div>
					<%-- <div>
						${vo.writedate } <span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
					</div> --%>
					<div>${vo.content}</div>
					<div>${vo.writedate}</div>
					<div>${vo.readcnt}</div>
					<div>${vo.filename}</div>
					
					
			   <button type="button" class="btn btn-default">기본 버튼 모양 </button>

              <button type="button" class="btn btn-primary">중요한 버튼</button>
       
               <button type="button" class="btn btn-success">긍정적 의미의 버튼</button>
       
               <button type="button" class="btn btn-info">정보제공 버튼</button>
					<div>
           <div> <label class="label label-primary">제목</label> <h2>${vo.title}</h2> </div>
          <p>${vo.content}</p>
          <span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
          <a href="#" class="btn btn-primary">
            자세히 보기
          </a>
        </div>
					
					
					
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>	
        </c:forEach> 
       </c:if>
    
 </div> 
	
	
	
	
	
	
	
</div>

<div class="btnSet">
	<jsp:include page="/WEB-INF/views/includes/page.jsp" />
</div>

<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(bno,detail) {
	$('[name=bno]').val(bno);
	$('[name=detail]').val(detail);
	$('form').attr('action', 'detail.bo');
	$('form').submit();	
}


function move_detail(bno){
	 
	var idval = bno;
	var idadd = "detail" + idval;
	var closebtn = "closebtn" + idval;
	var detailbtn = "detailbtn" + idval;
	console.log(idadd);
   //document.querySelector('.detail').setAttribute("id", idadd);
    document.getElementById(idadd).style.display = 'block';
    document.getElementById(closebtn).style.display = 'block';
    document.getElementById(detailbtn).style.display = 'none';
   	
}

function move_close(bno){
	 
	var idval = bno;
	var idadd = "detail" + idval;
	var closebtn = "closebtn" + idval;
	var detailbtn = "detailbtn" + idval;
	console.log(idadd);
   //document.querySelector('.detail').setAttribute("id", idadd);
    document.getElementById(idadd).style.display = 'none';
    document.getElementById(closebtn).style.display = 'none';
    document.getElementById(detailbtn).style.display = 'block';
   

	
}


/* function go_img(imgsrc){
	var subimg = imgsrc.substr(1); 
	console.log(subimg);
	
} */

// 버튼눌를때 bno의 값을 던진면  함수는  bno+id를 해서 div id를 설정한다.
/* $(function(){
	
//	$("#detailview").hide();
//	$("#close").hide();
//     var test = '<c:out value="${detail}"/>';
    var test = document.getElementById('content');
    console.log(test)
	$("#detail+'${vo.bno}'").click(function() {
	    $("#detailview+'${vo.bno}'").show();
	    $("#detail+'${vo.bno}'").hide();
	    $("#close+'${vo.bno}'").show();
	    // goodsBtn을 클릭하면 goodsDiv를 보여줘라
	 
	});
	 
	$(".closebtn+'${vo.bno}'").click(function() {
		 $("#detail+'${vo.bno}'").show();
		 $("#detailview+'${vo.bno}'").hide();
		 $("#close+'${vo.bno}'").hide();
	 
	});
	
	
	
	
})
 */



</script>

</body>
</html>



