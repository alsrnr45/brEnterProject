<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- include libraries(jQuery, bootstrap) -->
<!--  
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 


<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>

	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input */
	input:focus, input[type]:focus, .uneditable-input:focus, button:focus, button:active{
		border-color: rgb(155, 89, 182) !important; 
		box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
		outline: 0 none !important;
	}
	
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	p{font-size: 15px; text-align: left; margin-top: 7px; margin-left: 15px;}
	
	/* 페이징바 */
	.pagination a {color: black;}
	.pagination a:hover, 
	.pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color: black;}
	.pagination a:active {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
	.page-item.active .page-link, .page-item.active .pagination a, .pagination .page-item.active a, .pagination li.active .page-link, .pagination li.active a {
	    z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
	.pagination .active a, .pagination .active a:focus, .pagination .active a:hover {background-color: rgb(155, 89, 182); box-shadow: none;} 
	#pagingArea{margin: auto;}

	/* 카테고리, 검색창 */
	.headArea{width: 1200px; height: 100px; text-align: center; margin: auto; padding: 50px 85px 0px 85px;}
	.headArea>div {float: left;}
	.input-group {width: 250px; margin-left: 630px;}
	#form-group {width: 150px;}
	.btn-light {background-color: rgb(215, 215, 215); border-radius: 0rem 0.25rem 0.25rem 0rem;}

	/* 자유게시판 작성 */	
	h1{margin-top: 20px; margin-left: 60px;}  
    #boardFreeEnrollForm>.content_1>table{
    	margin-left: 60px;
        width: 85%;
    }
    
    /* summernote textarea */
    .summernote{margin-left: 100px;}
    
</style>	
</head>
<body class="sb-nav-fixed">
	<!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="../common/userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
    
    	<!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/userMenu.jsp"/>
        </div>
        
        	<!-- 컨텐츠 -->
        	<div id="layoutSidenav_content">
        		<div class="wrap">

	                <h1>자유게시판</h1><hr>
	
	                <div class="content">
	                    <div class="boardFreeEnrollArea">
	
	                        <form id="boardFreeEnrollForm" method="post" action="insertBoardFree.bf" enctype="multipart/form-data">
	                            
	                            <div style="margin-left:870px;">
	                                <button type="submit" onclick="return validate()" class="btn btn-secondary" style="background-color:rgb(155, 89, 182); border-color:rgb(155, 89, 182);">
	                                    등록하기</button>
	                                <a class="btn btn-primary" href="boardFreeList.bf" style="background-color:lightgray; border-color:lightgray;">목록으로</a>
	                            </div><br><br>
	                            
	                          	
	                            <div class="content_1">
	                            	<div class="summernote">
		                            	<table class="boardFreeTable">
		                                    <tr>
		                                        <th width="80"><label for="freeTitle">제목</label></th>
		                                        <td width="800"><input type="text" name="freeTitle" id="freeTitle" class="form-control" required></td>
		                                    </tr>	
		                                    <tr>
						                        <td><input type="hidden" id="memNo" class="form-control" value="${ loginUser.memNo }" name="memNo" readonly></td>
						                    </tr>	                                    
		                                    <tr>
		                                        <th><label for="upfile">첨부파일</label></th>
		                                        <td><input type="file" name="upfile" id="upfile" class="form-control-file border" ></td>
		                                    </tr>
		                                    <tr>
		                                        <th colspan="2"><label for="freeCnt">내용</label></th>
		                                    </tr>
		                                    <tr>
		                                        <th colspan="2"><textarea class="form-control" required name="freeCnt" id="summernote" rows="15" style="resize:none;"></textarea></th>
		                                    </tr>
		                                </table>
	                            	</div>	                              
	                            </div>
	                            
	                        </form>
	                        
	                    </div>  
	                </div>
                
        		</div>
       		</div>      	
    </div>
    
    
    <script>
    
 		// 글등록 유효성 체크
    	function validate(){
    	
	    	var summernote = document.getElementById("summernote");
	    	var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자 이상 등록
    	   	
	    	if(!regExp.test(summernote.value)){
	    		alert("내용을 입력해주세요.");
	    	
	    		summernote.value="";
	    		summernote.focus();
	    		
	    		return false;
	    	}
	    	
	
	    	var result = confirm("게시글을 등록하시겠습니까?");
	    	if(result){
	    		//alert("게시글이 등록되었습니다.");
	    		
	    	} else {
	    		alert("게시글 등록이 취소되었습니다.");
	    		return false;
	    	}       
	    
	    }
    
       
        // 썸머노트
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 250,                    	// 에디터 높이
                lang: "ko-KR",						// 에디터 한글 설정
                focus: true,                    	// 에디터 커서 이동 
                minHeight: null,                	// 최소 높이
                maxHeight: null,               		// 최대 높이   
                placeholder: '내용을 입력해주세요.',		// placeholder 설정
                toolbar: [
                  ['fontname', ['fontname']],
                  ['fontsize', ['fontsize']],
                  ['style', ['style']],
                  ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],  // 굵기, 기울임꼴, 밑줄, 취소 선, 서식지우기
                  ['color', ['forecolor','color']], 									// 글자색
                  ['para', ['ul', 'ol', 'paragraph']],									// 글머리 기호, 번호매기기, 문단정렬
                  ['table', ['table']],													// 표만들기
                  ['insert', ['link', 'picture', 'video']],								// 링크, 사진, 동영상 첨부
                  ['view', ['fullscreen', 'codeview', 'help']]							// 코드 보기, 확대해서 보기, 도움말
                ],
            	// 추가한 글꼴
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                // 추가한 폰트 사이즈 
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']          
            });
        });
    </script>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>