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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<main>



 <form method="post" action="list.bo" id="form" enctype="multipart/form-data">
	<input type="hidden" name="bno" value="${vo.bno }" />
	<input type="hidden" name="attach" value=" " />
	<input type="hidden" name="filepath" value=" " />
	<input type="hidden" name="filename" value=" " />
	<input type="hidden" name="curPage" value="${page.curPage }" />
	<input type="hidden" name="search" value="${page.search }" />
	<input type="hidden" name="keyword" value="${page.keyword }" />
	<input type="hidden" name="viewType" value="${page.viewType }" />
	<input type="hidden" name="pageList" value="${page.pageList }" />

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
		                <div class="mb-3">
							  <label for="exampleFormControlInput1 label-primary" class="form-label">변경할 제목</label>
							  <input type="text" name="title" class="form-control form-control-lg" id="exampleFormControlInput1" aria-label=".form-control-lg example" placeholder="${vo.title }">
						</div>
		                
				 
				        <p class="lead">${vo.writer}
				        <img src="${vo.mfilepath }" alt="작성자" style="width: 45px; height: 45px" class="rounded-circle" /></p>
				        
			            
			                            <!--  이미지 선택 -->  
		               <div class="d-flex flex-row align-items-center mb-4">
						<label class="btn btn-primary">
						  <%--  <c:if test="${!empty vo.filename }">	 --%>		          
				               <%-- <a href=""><img src="img/paperclip.svg">${vo.filename }</a></p> --%>
				               
				               <input type="file" name="file" id="attach-file" >
				               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
				                 <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
				                </svg>
				                <span id="file-name">${vo.filename }</span>
								<span id="preview"></span>
								<span id="delete-file" style="color:red; margin-left:20px;">
									<i class="fas fa-times font-img" ></i>
								</span>				               
			               <%--  </c:if>  --%>
			                <%-- <c:if test="${empty vo.filename }">	
							   <input type="file" name="file" id="attach-file" >
							   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
				                 <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
				                </svg>
				                <span id="file-name">${vo.filename }</span>
								<span id="preview"></span>
								<span id="delete-file" style="color:red; margin-left:20px;">
									<i class="fas fa-times font-img" ></i>
								</span>				               
							   			
							</c:if> --%>
		                 
										
						
						</label>
					  </div>
			            
				        
				    </div>  
				 <div class="mb-3">
					 <label for="exampleFormControlTextarea1" class="form-label">변경할 내용</label>
					 <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="5" placeholder ="${fn:replace(vo.content, crlf, '<br>') }"></textarea>
				</div>   
				                          
              
              <!-- d-flex: Flexbox 컨테이너를 나타냅니다. 이 클래스는 해당 요소를 Flexbox로 설정하여 자식 요소들을 유연하게 배치할 수 있도록 합니다.
              justify-content-between: 자식 요소들을 수평으로 정렬할 때 요소들 사이에 공간을 균등하게 분배합니다. 첫 번째 요소는 시작 부분에, 마지막 요소는 끝 부분에 정렬됩니다.
              align-items-center: 자식 요소들을 수직으로 정렬할 때 가운데 정렬합니다. 이 클래스는 자식 요소들의 높이가 서로 다를 때 사용됩니다.
              즉, 위의 코드는 Flexbox를 사용하여 요소들을 수평으로 정렬하고, 첫 번째 요소는 시작 부분에, 두 번째 요소는 끝 부분에 정렬하며, 자식 요소들의 높이를 가운데 정렬합니다. 
              이는 부트스트랩을 사용하여 반응형 디자인을 구현하는 데 유용한 기능 중 하나입니다. -->
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-secondary" onclick="go_list()" value="목록으로">
                  <c:if test="${login_info.id eq vo.writer}"> 
                  <input type="button" class="btn btn-sm btn-outline-secondary" value="수정제출" onclick="go_update('${vo.filepath}','${vo.filename }')">
                  </c:if>
                  <c:if test="${login_info.id eq vo.writer or login_info.admin eq 'y' }">
                  <input type="button" class="btn btn-sm btn-outline-secondary" value="취소" onclick="$('form').attr('action', 'detail.bo'); $('form').submit() ">
                  </c:if>
                 
                </div>
                <small class="text-muted">나무프로젝트</small>
                </div>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">  
				</button>
		
			
          </div>
        </div>

   </div>
 </div>
 </div>

 

</form>


<div id="popup" onclick ="$('#popup, #popup-background').css('display', 'none')"></div>
<div id="popup-background"></div>

<script type="text/javascript">
function go_list() {
	$('form').submit();
}

function go_update(filepath, filename) {
 	if( $('[name = title]').val() == '') {
 		alert('제목을 입력해주세요!'); 		
 		$('[name = title]').focus();
 		return;
 	} else if( $('[name = content]').val() == '') {
 		 alert('내용을 입력하세요!'); 		
 		$('[name = content]').focus();
 		return;
  
 	} else if($('[name = file]').val() == ''){
 		var prefile = $('#file-name').text();
 		console.log(prefile);
 		/* $('[name = attach]').attr('value', prefile); */
 		$('[name=attach]').val( $('#file-name').text()); 
 		$('[name=filepath]').val( filepath); 
 		$('[name=filename]').val( filename); 
 		$('form').attr('action', 'update.bo');
 		$('#form').submit();
 		return;
 	
 	} else if($('[name = file]').val() != ''){
 		var prefile = $('#attach-file').val();
 		console.log(prefile);
 		$('[name = attach]').attr('value', prefile); 
 		$('form').attr('action', 'update.bo');
 		$('#form').submit();
 		return;
 	}

 
 

}

//그림 파일 업로드 관련 ======================================================================================================= 
function isImage(filename){
	//ab.txt, abc.png, abc.JPG, abcd.hwp, ...
	var ext = filename.substring(filename.lastIndexOf('.') + 1 ).toLowerCase(); // 마지막 점(.) 다음 위치에서부터 끝까지 뽑고 소문자로 변환
	var imgs = ['png', 'jpg', 'jpeg', 'gif', 'bmp','jfif'];
	if ( imgs.indexOf(ext) > -1 ) { return true; }
	else { return false; }
}

$('#attach-file').on('change', function() {
	var attach = this.files[0];
	if( attach ) {
		if( isImage(attach.name) ) {
			var img = "<img id='preview-img' class='file-img' src='' style='width: 70px; height: 70px; border-radius:50%;' class='rounded-circle' />";
			$('#preview').html(img);

			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		} else {
			$('#preview').html('')
		}
	}
});

$('#delete-file').on('click', function() {
	$('#preview').html('')
});


</script>

</main>
</body>
</html>