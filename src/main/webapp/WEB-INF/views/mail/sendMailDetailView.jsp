<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 탬플릿 -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="resources/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
  	<!-- fullcalendar CDNs-->
    <link href='resources/scheduleResources/lib/main.css' rel='stylesheet' />
    <script src='resources/scheduleResources/lib/main.js'></script>
    <script src='resources/scheduleResources/lib/locales/ko.js'></script>

	<!-- summer note -->
	
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <script src="resources/mailResources/lang/summernote-ko-KR.js"></script>
    
    <!-- email input  -->
    <link rel="stylesheet" href="resources/mailResources/email.multiple.css">
    
    <style>
        #layoutAuthentication_content{
            margin: auto;
        }

        .col-lg-5{
            width:1000px;
        }


        .dataTable-input{
            display: inline-block;
        }

        .input-explain{
            display: inline-block;
            width:70px;
        }

        #schTitle, #attendance, #schCategory, #schContent{
            width: 90%;
        }

        #startDate, #endDate, #startTime, #endTime{
            height:40px; width:130px;
        }

        #schContent{
            resize: none;
            width:68%
        }
		
		#email-check{
			display:none;
            color:red;
		}
		
		.to-input{
		padding-top:3px;
		padding-bottom:3px;
		margin-bottom:5px;}
		
        /* btn css */
        #toggle_fileList:link, #toggle_fileList:visited, #toggle_fileList:hover, #toggle_fileList:active{
            text-decoration: none;
            text-decoration: underline;
            color:black;
        }

        .btn-block{
            margin-bottom:5px;
        }

        .svg-inline--fa{
            vertical-align:middle;
        }
		/* file_list css */
		li{
			list-style :none;
		}
		
		#file_download:link, #file_download:hover, #file_download:visited{
			color: gray; 
			text-decoration: none;
		}

        #content_explain{
            clear:both;
        }

        /* summernote css */
        .note-modal-footer{
            height:50px;
            padding-right:30px;
            border-top:1px solid #e5e5e5;
        }
    </style>
<title>Insert title here</title>
</head>
<body>
       <!-- 상단바 -->
       <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="../common/userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/userMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutAuthentication_content">
            <main>
                <br><br>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4"><i class="far fa-envelope"></i> 메일 </h3></div>
                                <form name="sendMail" id="sendMail" action="doForward.mail" method="post" enctype="multipart/form-data">

                                    <input type="hidden" id="is_receiver_check" value="F">
                                    <div class="card-body">
                                    	<input type="hidden" id="writer" name="mailWriter" value="${ loginUser.officeEmail }" >
                                    	<input type="hidden" id="memberNo" name="memNo" value="${ loginUser.memNo }">       
                                        <input type="text" id="mailReceiver" placeholder="Email">
                                        
                                        <label for=""></label><br>
                                        <div id="email-check"></div><br>
                                        <div id="send_date"><span class="to-inpt">보낸 날짜 :</span>${s.mailSendDate}</div><br>
                                        <span class="input-explain">제목</span>${s.mailTitle} 
                                        <label for=""></label>

                                        <br>

                                        <div id="file_wrap">
                                            <div id="target_file_wrap">
                                                <span>파일첨부</span>
												<div class="card-header" style="width:100%;">
												<ul>
												<i class="fas fa-paperclip"></i>
												<c:forEach  var="mf" items="${mflist}">
													<li><a class="file_download" href="/filedown/${mf.mailUpdate}" download="${mf.mailOrigin}">${mf.mailOrigin}( ${String.format("%.2f", mf.mailFSize/1024/1024)} MB ) </a></li>
												</c:forEach>
												</ul>
												</div>

                                            </div>
                                            <div id="drop_zone" ondrop="dropHandler(event);">
                                                <span></span>
                                            </div>
                                        </div>
                                        <br><div id="content_explain">내용</div>
                                        <br>
                                        <div>
                                            ${s.mailContent}
                                        </div>
                                        <div class="card-footer text-center py-3">
                                            <div class="small">
                                                <button type="button" id="againList" class="btn btn-primary btn-block"><a href="send.mail" style="color:white; text-decoration:none;">목록으로</a></button>
                                            </div>
                                        </div>    
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

</body>
<script>

	//보낸메일 화면 뿌려주기
	$(function(){
	$(document).on('click', '.title', function(){
		$('input').attr('disabled', true);
		$(this).prevAll().find('input').attr('disabled', false);
		$('#slist').submit();
		})
	})

	
	$(document).ready(function() {
		
	    $('#summernote').summernote({
	    	lang: 'ko-KR',
	    	placeholder: '내용을 입력해주세요.',
	        tabsize: 2,
	        height: 340,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	      });
	});
	
    jQuery(document).ready(function($) {
        var target_id = "upfile"; 
        $("#" + target_id).bind('change', function() {
            selectFile(this.files, target_id); 
        }); 
    }); 

    // 파일 선택시 
    function selectFile(fileObject, target_id) { 
        var files = null; 
        var totalFileSize = 0; 
        // 직접 파일 등록시 
        files = jQuery('#' + target_id)[0].files; 
        console.log(files);
        // 다중파일 등록 
        $("#drop_zone").html('');

        if (files != null) { 
            for (var i = 0; i < files.length; i++) { 
                // 파일 이름 
                var fileName = files[i].name; 
                var fileNameArr = fileName.split("\."); 
                // 확장자 
                var ext = fileNameArr[fileNameArr.length - 1]; 
                var fileSize = files[i].size; 
                // 파일 사이즈(단위 :byte) console.log("fileSize="+fileSize); 
                if (fileSize <= 0) { 
                    console.log("0kb file return"); 
                    return; 
                } 
                var fileSizeKb = fileSize / 1024; 
                // 파일 사이즈(단위 :kb) 
                var fileSizeMb = fileSizeKb / 1024;
                // 파일 사이즈(단위 :Mb) 
                var fileSizeStr = ""; 
                if ((1024*1024) <= fileSize) { 
                // 파일 용량이 1메가 이상인 경우 console.log("fileSizeMb="+fileSizeMb.toFixed(2)); 
                    fileSizeStr = fileSizeMb.toFixed(2) + " Mb"; 
                } else if ((1024) <= fileSize) { 
                    console.log("fileSizeKb="+parseInt(fileSizeKb)); 
                    fileSizeStr = parseInt(fileSizeKb) + " kb"; 
                } else { 
                    console.log("fileSize="+parseInt(fileSize)); 
                    fileSizeStr = parseInt(fileSize) + " byte"; 
                }
                
            } 
        } else{ 
            alert("ERROR"); 
        } 
    }
    
    $("").toggle(); // show -> hide , hide -> show)

    function toggle_layer() {
	if($("#drop_zone").css("display") == "none"){
		$(".fa-caret-square-up").attr('class', 'fa-caret-square-down');
        $("#drop_zone").show();
	}else{
		$("#drop_zone").hide();
        $(".fa-caret-square-down").attr('class', 'fa-caret-square-up');
	}
}
    
// 이메일 받는 사람 관련 js    
(function($){

    $.fn.email_multiple = function(options) {

        let defaults = {
            reset: true,
            fill: false,
            data: null
        };

        //let settings = $.extend(defaults, options);
        let email = "";

        return this.each(function()
        {	
            $(this).after("<span class=\"to-input\">보낸사람 : </span>\n" +
                    "<div class=\"all-mail\"><span class=\"email-ids\">" + "${s.mailWriter}" + "</span></div>\n<br>"
                    + "<br><span class=\"to-input\">받는사람 : </span>\n" +
                "<div class=\"all-mail\"><span class=\"email-ids\">" + "${s.mailReceiver}" + "</span></div>\n" 
                );
            let $orig = $(this);
            let $element = $('.enter-mail-id');
            $element.keydown(function (e) {
                $element.css('border', '');
                if (e.keyCode === 13 || e.keyCode === 32) {
                    let getValue = $element.val();
                    if (/^[a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,6}$/.test(getValue)){
                        $('.all-mail').append('<span class="email-ids">' + getValue + '<span class="cancel-email">x</span></span>');
                        $('.all-mail').append('<input type="hidden" name="mailReceiver" value="' + getValue + '">');
                        $('#is_receiver_check').attr('value', 'T');
                        $('#email-check').hide();
                        $element.val('');

                        email += getValue
                    } else {
                        $element.css('border', '1px solid red')
                        $('#email-check').html('<span>유효하지 않은 이메일입니다. 다시 입력해주세요.</span>');
                        $('#email-check').show();
                    }
                }
                $orig.val(email.slice(0))
            });

            $(document).on('click','.cancel-email',function(){
                $(this).parent().next().remove();
                $(this).parent().remove();
            });

            return $orig.hide();
        });
    };

})(jQuery);

    
    // email input js
	$(document).ready(function($){
	  let data = [
	    ]
	  $("#mailReceiver").email_multiple({
	      data: data
	  })
	});
    
    // 이메일 보낼 때 체크제약조건
	$('#insertCheck').click(function(e) {
        e.preventDefault();
        
        if($('#is_receiver_check').val() !== 'T'){
            $('.enter-mail-id').css('border', '1px solid red');
            $('.enter-mail-id').focus();
            $('#email-check').show();
            $('#email-check').change($('#email-check').html('<span>받은 사람이 지정되지 않았습니다. 받는 사람 주소를 입력해주세요. </span>'));
            return false;
        }
        $('#sendMail').submit();        
	});
    
	$('#againList').click(function(e) {
        
	});
	
	// 전달
	$("#forward").click(function(){
		var length = $('input:checked').length; // 체크된 숫자갯수
		console.log("숫자갯수" + length);
		if(length == 0){
			alert('답장할 메일을 선택해주세요.');
		} if(length > 1){
			alert("메일 한 개만 선택해주세요.");
		} if(length == 1){
			$('#rlist').attr('action','forward.mail');
			$('input').attr("disabled", true);
			$('input:checked').parent().parent().find('input').attr("disabled", false);
			$('#rlist').submit();
		}
	});		
</script>
</html>