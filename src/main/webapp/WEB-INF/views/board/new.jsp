<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>게시판등록</title>

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
   

      
  </head>
  <body>

<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">게시글 작성</p>

                <form class="mx-1 mx-md-4" id="form" action="insert.bo" method="post" enctype="multipart/form-data">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="title" name="title" class="form-control chk" />
                      <div class='valid'>100자 이내로 작성해주세요!</div>
                      <label class="form-label" for="form3Example1c">제목</label>
                    </div>
                  </div>

                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <textarea id="content" name="content" style="height: 100px;" class="form-control chk" ></textarea>
                       <div class='valid'>500자 이내로 작성해주세요!</div>
                      <label class="form-label" for="form3Example1c">게시글</label>                  
                    </div>
                  </div>
 
                    
                <!--  이미지 선택 -->  
                <div class="d-flex flex-row align-items-center mb-4">
				<label class="btn btn-primary">
					<input type="file" name="file" id="attach-file" >			
                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
                 <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0z"/>
                 </svg>
				</label>				
				<span id="file-name"></span>
				<span id="preview"></span>
				<span id="delete-file" style="color:red; margin-left:20px;">
					<i class="fas fa-times font-img" ></i>
				</span>
			   </div>


                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="button" class="btn btn-primary btn-lg" onclick="go_join()">Register</button>
                  </div>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <!-- <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                  class="img-fluid" alt="IU image">  -->
                  <img src="resources/images/IU.png" class="img-fluid" alt="IU image">
                  

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



<!--  스크립트 파일 모음  -->
<script type="text/javascript" src="resources/js_ext/file_attach.js"></script>
<script type="text/javascript" src="resources/js_ext/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
<script type="text/javascript" src="resources/js_ext/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script> <!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	<!-- jQuery ui -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- 다음 우편번호 api -->
 

    
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
     <!-- 게시판 -->
 <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    
 <script type="text/javascript">

 function go_join() {
 	if( $('[name = title]').val() == '') {
 		alert('제목을 입력해주세요!'); 		
 		$('[name = title]').focus();
 		return;
 	} else if( $('[name = content]').val() == '') {
 		 alert('내용을 입력하세요!'); 		
 		$('[name = content]').focus();
 		return;
 	} else{
 		$('#form').submit();
 	}

}
 



//  그림 파일 업로드 관련 ======================================================================================================= 
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
			var img = "<img id='preview-img' class='file-img' src='' style='border-radius:50%'/>";
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

</body>
</html>
 
 