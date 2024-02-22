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
    <title>Album example Â· Bootstrap v5.0</title>

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

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form class="mx-1 mx-md-4" action="join" method="post"enctype="multipart/form-data">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="mid" name="id" class="form-control chk" />
                      <div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
                      <label class="form-label" for="form3Example1c">Your ID</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" id="pw" name="pw" class="form-control chk" />
                      <div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
                      <label class="form-label" for="form3Example4c">Password</label>
                    </div>
                  </div>
                                    
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" id="pw2" name="pw_ck" class="form-control chk" />
                      <div class="valid">비밀번호를 다시 입력하세요.</div>
                      <label class="form-label" for="form3Example4cd">Repeat your password</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="name" name="name" class="form-control chk" />
                      <label class="form-label" for="form3Example1c">Your Name</label>                  
                    </div>
                  </div>
                <!--  
                  <div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="male" checked>
					  <label class="form-check-label" for="flexRadioDefault1">
					    남
					  </label>
				  </div>
				 <div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="female" >
					  <label class="form-check-label" for="flexRadioDefault2">
					    여
					  </label>
				 </div>
				 -->  
                <div > 성별
                <label><input class="form-check-input" type="radio" name="gender" value="남" checked/>남</label>
				<label><input class="form-check-input" type="radio" name="gender" value="여" />여</label>
				</div>
				
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="email" id="email" name="email" class="form-control chk" />
                      <div class="valid">이메일을 입력하세요.</div>
                      <label class="form-label" for="form3Example3c">Your Email</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <a class='btn-fill-s' onclick="daum_post()">우편번호 찾기</a>
						<input type="text"  class="form-control" name="post"  class="w-px60" readonly />
						<input type="text"  class="form-control" name="addr" readonly/>
						<input type="text"  class="form-control" name="addr" />
                      <label class="form-label" for="form3Example3c">Your Address</label>
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



                  <div class="form-check d-flex justify-content-center mb-5">
                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
                    <label class="form-check-label" for="form2Example3">
                      I agree all statements in <a href="#!">Terms of service</a>
                    </label>
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
//아이디 중복 검사
 $('#mid').on('change', function() {
 	id_check();
 });

 //올바른 아이디 입력 형태인지 파악하여 유효하지 않다면 중복확인 불필요
 function id_check() {
 	var $id = $('[name=id]');
 	if($id.hasClass('chked')) return;
 	console.log('go check');
 	
 	var data = join.tag_status($id);
 	if(data.code != 'valid') {
 		alert('아이디 중복 확인 불필요\n' + data.desc);
 		$id.focus();
 		return;
 	}

 	$.ajax({
 		type: 'post',
 		url: 'id_check',
 		data: {id: $id.val()},
 		success: function(data) {
 			data = join.id_usable(data);
 			display_status($id.siblings('div'), data);
 			$id.addClass('chked');
 		},
 		error: function(req, text) {
 			alert(text + ': ' + req.status);
 		}
 	});
 }


 //유효성 검사
 $('.chk').on('keyup', function(){
 	if($(this).attr('name') == 'id') {
 		if(event.keyCode == 13) { id_check(); }
 		else {
 			$(this).removeClass('chked');
 			validate( $(this) );
 		}
 	} else {
 		validate($(this));
 	}
 });

 function validate(t) {
 	var data = join.tag_status(t);
 	display_status(t.siblings('div'), data);
 }

 function display_status(div, data) {
 	div.text(data.desc);
 	div.removeClass();
 	div.addClass(data.code)
 }

 // 만 13세 이상만 선택 가능하게 처리
 var today = new Date();
 var endDay = new Date( today.getFullYear()-13, today.getMonth(), today.getDate() );


/*  $('[name=birth]').datepicker({  // jquery datepicker 구글검색필요
 	dateFormat : 'yy-mm-dd',
 	changeYear : true,
 	changeMonth :true,
 	showMonthAfterYear: true,
 	dayNamesMin: ['일','월','화','수','목','금','토'],
 	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
 	minDate: new Date('1950-01-01'),
 	yearRange: "1950:2013",  // 연도 선택 시 1950년까지 한번에 표시(mindate가 1950년이라, 1950년 이전으로는 선택이 안됨)
 	maxDate: endDay
 	//beforeShowDay: after	//오늘 이후로 선택 못하게 하는 함수

 });


 $('[name=birth]').change(function() {
 	$('#delete').css('display', 'inline-block');
 });

 $('#delete').click(function(){
 	$('[name=birth]').val('');
 	$('#delete').css('display', 'none');
 });

 function after(date) {
 	if(date > new Date()) {
 		return [false];
 	} else {
 		return [true];
 	}
 }
 */
 
 function daum_post() {
     new daum.Postcode({
         oncomplete: function(data) {
 			$('[name=post]').val( data.zonecode );	//우편번호
             //지번 주소 : J, 도로명 주소 : R
             var address = data.userSelectedType == 'J' ? data.jibunAddress : data.roadAddress;	//클릭한 지번주소나, 도로명주소가 저장됨
             if(data.buildingName != '') {
 				address += ' (' + data.buildingName + ')';	//건물 명이 있으면 건물 명을 붙여줌
             }
             $('[name=addr]').eq(0).val( address );
         }
     }).open();
 }

 function go_join() {
 	if( $('[name = name]').val() == '') {
 		alert('성명을 입력하세요!');
 		$('[name = name]').focus();
 		return;
 	}

 	//필수 항목의 유효성을 판단하도록 한다.
 	//중복확인 한 경우
 	if($('[name=id]').hasClass('chked') ) {
 		//이미 사용중인 경우는 회원가입 불가
 		if($('[name = id]').siblings('div').hasClass('invalid')) {
 			alert('회원가입 불가\n' + join.id.unusable.desc);
 			$('[name=id]').focus();
 			return;
 		}
 	} else {
 		//중복확인 하지 않은 경우
 		if( !item_check($('[name=id]')) ) return;
 		else {
 			alert('회원가입 불가\n' + join.id.valid.desc);
 			$('[name=id]').focus();
 			return;
 		}
 	}
 	
 	if(!item_check($('[name=pw]'))) return;
 	if(!item_check($('[name=pw_ck]'))) return;
 	if(!item_check($('[name=email]'))) return;
 	
 	$('form').submit();
 }

 function item_check(item) {
 	var data = join.tag_status(item);
 	if(data.code == 'invalid') {
 		alert('회원가입 불가! \n' + data.desc);
 		item.focus();
 		return false;
 	} else return true;
 }

//  그림 파일 업로드 관련 ======================================================================================================= 
function isImage(filename){
	//ab.txt, abc.png, abc.JPG, abcd.hwp, ...
	var ext = filename.substring(filename.lastIndexOf('.') + 1 ).toLowerCase(); // 마지막 점(.) 다음 위치에서부터 끝까지 뽑고 소문자로 변환
	var imgs = ['png', 'jpg', 'jpeg', 'gif', 'bmp'];
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
 
 