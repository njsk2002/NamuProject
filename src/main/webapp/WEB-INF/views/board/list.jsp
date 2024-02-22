<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
table { table-layout:fixed; }
table td { overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
.grid li div span{ float: right; }
</style>


</head>
<body>

<!-- 게시판 -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="resources/js_ext/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="resources/js/bootstrap.min.js"></script>

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
			<input type="hidden" name="id" />
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
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>조회수</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="vo" items="${page.list}">
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<img src=" " alt=""
									style="width: 45px; height: 45px" class="rounded-circle" />
								<div class="ms-3">
									<p class="fw-bold mb-1">${vo.writer}</p>
									<p class="text-muted mb-0">john.doe@gmail.com</p>
								</div>
							</div>
						</td>
						<td>
							<p class="fw-normal mb-1">${vo.title}</p>
						</td>

						<td>${vo.content}</td>
						<td>${vo.writedate}</td>
						<td>${vo.readcnt}</td>
						<td>${vo.filename}</td>
					</tr>
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
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

             <div class="card-body">
              <img src="https://mdbootstrap.com/img/new/avatars/8.jpg" alt="" style="width: 45px; height: 45px" class="rounded-circle" />
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

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'detail.bo');
	$('form').submit();	
}

function go_img(imgsrc){
	var subimg = imgsrc.substr(1); 
	console.log(subimg);
	
}

</script>

</body>
</html>



