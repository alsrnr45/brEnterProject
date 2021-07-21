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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <script src="resources/mailResources/lang/summernote-ko-KR.js"></script>
    
    <!-- email input  -->
    <link rel="stylesheet" href="resources/mailResources/email.multiple.css">
    
    <!-- modal 라이브러리 -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
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

        /* file input css*/
        #file_wrap{
        }


        input[type="file"]{
            display: none;
        }

        #file_showAndHideBtn{
            size:7;
        }
        
        .fa-caret-square-up, .fa-caret-square-down{
            font-size:30px;
        }

        #target_file_wrap{
            float:left;
        }

        #drop_zone{
            border:1px solid #e5e5e5;
            float:right;
            width:80%;
            height:120px;
            display:none;
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
        
        /* modal css */
    .modal-backdrop.show{
        opacity :0;
    }

    .modal-body-content{
        width:100%;
        padding: 16px 24px;
        display:flex;
        flex-direction: row;
    }

    .content{
        display:flex;
        flex:5;
    }

    .content, .move-tab, .new-list{
        box-sizing:border-box;
        height: 460px;
    }

    .content-org-tree{
        border: 1px solid #c9c9c9;
        flex:0.8;
    }
    
    .content-list{
        border: 1px solid #c9c9c9;
        flex:2.2;
       	height:460px;
		overflow:auto;
    }

    .search-wrap, .scroll-wrap{
       
    } 

    .move-tab{
        text-align:center;
        flex:0.4;
    }

    .new-list{
        border: 1px solid #c9c9c9;
        flex:1;
    }

    ul, li{
        list-style : none;
    }

    .open{
        color:rgba(155, 89, 182);
        style:none;
    }

    .close{
        font-family: 'Noto Sans KR', sans-serif
        
    }

    .open:hover, .close:hover {
        style:none;
    }
    
    #datatablesSimple{
    border-box:1px solid black;
    }
    
    a{
    	text-decoration:none;
    }

/* 모달 css*/

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  font-size:15px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  text-align: left;
  background-color: rgba(155, 89, 182);
  color: white;
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
                                <div class="card-header"><h3 class="text-center font-weight-light my-4"><i class="far fa-envelope"></i> 메일 쓰기</h3></div>
                                <form name="sendMail" id="sendMail" action="insert.mail" method="post" enctype="multipart/form-data">
                                    <input type="hidden" id="is_receiver_check" value="F">
                                    <div class="card-body">
                                    
                                    	<input type="hidden" id="writer" name="mailWriter" value="${ loginUser.officeEmail }" >
                                    	<input type="hidden" id="memberNo" name="memNo" value="${ loginUser.memNo }">       
                                        <input type="text" id="mailReceiver" placeholder="Email">
                                        
										<!--<input type="text" class="dataTable-input" id="receiver" style="width: 72%;" pattern="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b" > -->
                                        
                                        <a id="pbPopup" class="btn btn-primary" data-toggle="modal" data-target="#myModal" >주소록</a>
                                        <a id="toMe" class="btn btn-primary btn-block" href="#">내게 쓰기</a>
                                        <label for=""></label><br>
                                        <div id="email-check"></div><br><br>
                                        <span class="input-explain">제목</span><input class="dataTable-input" id="title" name="mailTitle" type="text" min=0 placeholder="" />
                                        <label for=""></label>

                                        <br>

                                        <div id="file_wrap">
                                            <div id="target_file_wrap">
                                                <span>파일첨부</span>
                                                <input multiple type="file" id="upfile" name="upfile">
                                                <a id="toggle_fileList" href="#" onclick="toggle_layer();"><i class="far fa-caret-square-up"></i></a>
                                                <a href="#" onclick="$('#upfile').click()" class="btn btn-primary">내 PC</a>

                                            </div>
                                            <div id="drop_zone" ondrop="dropHandler(event);">
                                                <span></span>
                                            </div>
                                        </div>
                                        <br><div id="content_explain">내용</div>
                                        <br>
                                        <div>
                                            <textarea id="summernote" name="mailContent"></textarea>
                                        </div>
                                        <div class="card-footer text-center py-3">
                                            <div class="small">
                                                <button type="button" id="insertCheck" class="btn btn-primary btn-block">보내기</button>
                                                <button type="button" id="sendTemp" class="btn btn-primary btn-block">임시저장</button>
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

			<!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">주소록 추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="modal-body-content">
                                <div class="content">
                                    <div class="content-org-tree">
                                        <ul>
                                            <li>
                                                <a href="#" class="tree"><i class="fas fa-plus-square"></i></a><a href="#" class="open"> br엔터</a>
                                                <ul class="deptName">
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="content-list">
                                        <div class="search-wrap">
                                        	<div class="dataTable-search">
                                        		<input class="dataTable-input" placeholder="이름/이메일 검색" type="text">
                                        	</div>
                                        </div>
                                        <div class="scroll-wrap">
					                            <table id="customers" class="phoneBook">
					                                <thead>
					                                    <tr>
					                                    	<th></th>
					                                        <th>이름</th>
					                                        <th>부서</th>
					                                        <th>직급</th>
					                                        <th>이메일</th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                </tbody>
					                            </table> 
                                    	</div>
                                	</div>
	                                <div class="move-tab">
	                                    <a id="add" class="btn btn-primary">추가 &gt</a><br><br>
	                                    <a id="remove" class="btn btn-primary">&lt 제외</a>
	                                </div>
                                <div class="new-list">
                                	
                                </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                        	<a id="sendEmail" class="btn btn-primary">메일 보내기</a>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>



</body>
<script>

	
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
		/*
        if($('.fileSelector').length > 10) {
        	alret(10개이상)
        	return false;
        }
        */
        
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
                // 업로드 파일 목록 생성 
                $("#drop_zone").append('<div><input type="checkbox" id="#' + files[i] + '"> ' + fileName + ' (' + fileSizeStr + ')' + '<span class="cancel-file">x</span></div>');
                $("#drop_zone").show();
                $(".fa-caret-square-up").attr('class', 'fa-caret-square-down');
                
                $(document).on('click','.cancel-file',function(){
                    $(this).parent().next().remove();
                    $(this).parent().remove();
                });
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
 
    // 회원가입 넘길때 check요소 없을 시, 제약걸기
    // $('#insertCheck').click(function(e) {
    //     e.preventDefault();

    //     // 이메일 전송 Check
    //     if($('#receiver').val() == null) {
    //          alert('받는 사람이 지정되지 않았습니다.' + '받는 사람 주소를 입력해주세요');
    //          return false;
    //     }

    //     $('#sendMail').submit();
    // });
    
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
            $(this).after("<span class=\"to-input\">받는사람</span>\n<br>" +
                "<div class=\"all-mail\"></div>\n" +
                "<input type=\"text\" class=\"enter-mail-id\" placeholder=\"이메일 입력 후 엔터를 누르세요.\" />");
            let $orig = $(this);
            let $element = $('.enter-mail-id');
            let mrarr = [];
            $element.keydown(function (e) {
                $element.css('border', '');
                if (e.keyCode === 13 || e.keyCode === 32) {
                    let getValue = $element.val();
                    if (/^[a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,6}$/.test(getValue)){
                    	//배열 생성
							if( mrarr.includes(getValue) ){
								alert('똑같은 메일주소는 보낼 수 없습니다.');	
								return false;
							}
						
						$('.all-mail').append('<span class="email-ids">' + getValue + '<span class="cancel-email">x</span></span>');
                        $('.all-mail').append('<input type="hidden" name="mailReceiver" value="' + getValue + '">');
                        
                        $('#is_receiver_check').attr('value', 'T');
                        $('#email-check').hide();
                        $element.val('');

                    	email += getValue
                    	mrarr.push(getValue);

                            
                    } else {
                        $element.css('border', '1px solid red')
                        $('#email-check').html('<span>유효하지 않은 이메일입니다. 다시 입력해주세요.</span>');
                        $('#email-check').show();
                    }
                $orig.val(email.slice(0))
                }});

            $(document).on('click','.cancel-email',function(){
                $(this).parent().next().remove();
                $(this).parent().remove();
            });

            return $orig.hide()
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
    
    // 이메일 임시저장 
    $('#sendTemp').click(function(e){
    	e.preventDefault();
    	if(checkValue() === false){
    		alert('임시저장할 수 없습니다. 내용을 넣어주세요.');
    		return false;
    	} else{
            $('#sendMail').attr('action','sendTemp.mail');
            $('#sendMail').submit();
    	}
    	
    	function checkValue(){
    		if($('input[type=text]').val()  == "" && $('#title').val() == "" && $('.note-editable').children('p').html() == '<br>'){
    			return false;
    		} 
    		return true;
        };
    })
    
		$(document).ready(function(){

			$.ajax({
				type: "POST",
				url: "popup.pb",
				success: function(map){
					let mlist = map.mlist;
					let dlist = map.dlist;
					let plist = map.plist;
					
					for( var i in dlist ){
						let d = dlist[i];
						$('.deptName').append('<li><a href="#" class="tree"><i class="fas fa-plus-square"></i>' + d['deptName'] + '</a></li>');
					};
					
					for( var i in mlist){
						let m = mlist[i];
						$('.phoneBook>tbody').append('<tr>' + 
										  '<td><input type="checkbox"></td>' + 
										  '<td>' + m['memName'] + '</td>' + 
										  '<td>' + m['deptName'] + '</td>' + 
										  '<td>' + m['posiName'] + '</td>' +
										  '<td class="pbEmail">' + m['officeEmail'] + '</td>'
										  + '</tr>');
						$('.phoneBook>tbody>tr>td').each(function(){
							if($(this).text() == '${loginUser.memName}'){
								$(this).parent().remove();
							}
						})
					}
				},
				error: function(data){
					window.location.reload();
				}
			})
		});
			
		// 부서별 사원 조회
		$('#sendEmail').on('click',function(){
			let pbarr = [];
			$('input:checked').each(function(){
				
				var pbEmail = $(this).parent().siblings('.pbEmail').text();
				
				pbarr.push(pbEmail);
			})
			
			pbarr.shift();
			pbarr.shift();
			$('#myModal').modal('hide');
			
			for(var i=0; i<pbarr.length; i++){
				
				$('.all-mail').append('<span class="email-ids">'+ pbarr[i] +  '<span class="cancel-email">x</span></span>');
                $('.all-mail').append('<input type="hidden" name="mailReceiver" value="' + pbarr[i] + '">');
			}
		})
		
		$('#toMe').on('click', function(){
			$('.all-mail').append('<span class="email-ids">' + $('#writer').val()  +   '<span class="cancel-email">x</span></span>');
            $('.all-mail').append('<input type="hidden" name="mailReceiver" value="' + $('#writer').val() + '">');
		})
		
		
</script>
</html>