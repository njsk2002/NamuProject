<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
      
      
/*      .content-block {
		  display: block;
		  word-break:break-all;
		  position: relative;
		 
		  width: fit-content;
		  padding: 15px;
		  max-width: 400px;
		  margin: 0 auto 2px 0;
		  border-radius: 16px;
        } */

    </style>  
   
</head>
<body>
<main>

<%-- <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3 content-block">
<div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden content-block" >
      <div class="my-3 py-3">
        <h2 class="display-5">${vo.title}</h2>
        <p class="lead">${vo.writer}
        <img src="${vo.mfilepath }" alt="작성자" style="width: 45px; height: 45px" class="rounded-circle" /></p>
      </div>
      <div class="bg-light shadow-sm mx-auto" style="width: 85%; height: 300px; border-radius: 21px 21px 0 0;">
         <img src = "${vo.filepath }" style="width: 100%; height: 300px;">
      </div>
       <p style="width: 50%; height: 300px;" >${fn:replace(vo.content, crlf, '<br>') }</p>
 </div>
</div>   --%>

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
              <image x="0" y="0" width="100%" height="100%" xlink:href="${vo.filepath }" />
            </svg>
            
            <div class="card-body">
                    <div class="my-3 py-3">
				        <h2 class="display-5">${vo.title}</h2>
				        <p class="lead">${vo.writer}
				        <img src="${vo.mfilepath }" alt="작성자" style="width: 45px; height: 45px" class="rounded-circle" /></p>
				        <c:if test="${!empty vo.filename }"><p>파일명
				          
				          <a href="download.bo?bno=${vo.bno }"><img src="img/paperclip.svg">${vo.filename }</a></p>
			            </c:if>
				        
				    </div>          
                 <p class="card-text">${fn:replace(vo.content, crlf, '<br>') }</p>
              <div class="d-flex justify-content-between align-items-center">
              
              <!-- d-flex: Flexbox 컨테이너를 나타냅니다. 이 클래스는 해당 요소를 Flexbox로 설정하여 자식 요소들을 유연하게 배치할 수 있도록 합니다.
              justify-content-between: 자식 요소들을 수평으로 정렬할 때 요소들 사이에 공간을 균등하게 분배합니다. 첫 번째 요소는 시작 부분에, 마지막 요소는 끝 부분에 정렬됩니다.
              align-items-center: 자식 요소들을 수직으로 정렬할 때 가운데 정렬합니다. 이 클래스는 자식 요소들의 높이가 서로 다를 때 사용됩니다.
              즉, 위의 코드는 Flexbox를 사용하여 요소들을 수평으로 정렬하고, 첫 번째 요소는 시작 부분에, 두 번째 요소는 끝 부분에 정렬하며, 자식 요소들의 높이를 가운데 정렬합니다. 
              이는 부트스트랩을 사용하여 반응형 디자인을 구현하는 데 유용한 기능 중 하나입니다. -->
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-secondary" onclick="go_list()" value="목록으로">
                  <c:if test="${login_info.id eq vo.writer}"> 
                  <input type="button" class="btn btn-sm btn-outline-secondary" value="수정" onclick="$('form').attr('action', 'modify.bo'); $('form').submit()">
                  </c:if>
                  <c:if test="${login_info.id eq vo.writer or login_info.admin eq 'y' }">
                  <input type="button" class="btn btn-sm btn-outline-secondary" value="삭제" onclick="if( confirm('정말 삭제하시겠습니까?') ) { $('form').attr('action', 'delete.bo'); $('form').submit(); } ">
                  </c:if>
                 
                </div>
                <small class="text-muted">나무프로젝트</small>
                </div>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				    댓글
				</button>
		
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">			   
				   <div style="margin:0 auto; padding-top:20px; width:100%;">
						<div id="comment_regist" class="card card-body">
							<span class="right"><input type="button" class="btn-fill-s" onclick="comment_regist()" value="등록"></span>
							<textarea id="comment" style="width:99%; height:60px; margin-top:5px; resize:none;"></textarea>
						</div>
				  <div class="card card-body">			   
				   <div style="margin:0 auto; padding-top:20px; width:100%;">
						<div id="comment_list" style="text-align:left"></div>				
				  </div>

				 </div>				   
				  </div>                      
              </div>
              
            </div>
          </div>
        </div>

   </div>
 </div>
 </div>

 
 <form method="post" action="list.bo">
	<input type="hidden" name="bno" value="${vo.bno }" />
	<input type="hidden" name="curPage" value="${page.curPage }" />
	<input type="hidden" name="search" value="${page.search }" />
	<input type="hidden" name="keyword" value="${page.keyword }" />
	<input type="hidden" name="viewType" value="${page.viewType }" />
	<input type="hidden" name="pageList" value="${page.pageList }" />
</form>


<div id="popup" onclick ="$('#popup, #popup-background').css('display', 'none')"></div>
<div id="popup-background"></div>

<script type="text/javascript">
function go_list() {
	$('form').submit();
}


function showAttachImage(id) {
	//첨부된 파일이 이미지인 경우 보여지게
	var filename = '${vo.filename}';
	var ext = filename.substring( filename.lastIndexOf('.') + 1 ).toLowerCase(); //확장자
	var imgs = [ 'gif', 'jpg', 'jpeg', 'png', 'bmg','jfif' ];
	if( imgs.indexOf(ext) > -1 ) {
		var img = '<img src="' + '${vo.filepath}'.substring(1) + '" '
			+ 'id="preview-img" ' 
			+ 'class="' + (id == '#popup' ? 'popup' : 'file-img') + '" '
			+ 'style="border-radius: 50%"/>';
		$(id).html(img);
	}
}

if( ${!empty vo.filename} ) {
	showAttachImage('#preview');
}

$('#preview-img').click(function() {
	$('#popup, #popup-background').css('display', 'block');
	showAttachImage('#popup');
});

function comment_regist() {
	if(${empty login_info}) {
		alert("댓글을 등록하려면 로그인하세요!");
		return;	
	}
	
	if( $("#comment").val() == "" ) {
		alert("댓글을 입력하세요!");
		$("#comment").focus();
		return;
	}

	$.ajax({
		url: "board/comment/insert",
		data: { bno:${vo.bno}, comment: $("#comment").val() },
		success: function(data) {
				if(data) {
					$("#comment").val('');
					comment_list();
				}
		},
		error: function(req, text) {
			alert(text + " : " + req.status)
		}
	});
}

function comment_list() {
	$.ajax({
		url: 'board/comment/${vo.bno}',
		success: function(data) {
			$("#comment_list").html(data);
		},
		error: function(req, text) {
			alert(text + ' : ' + req.status);
		}
		
	});
}

comment_list();

</script>

 </main>
</body>
</html>
