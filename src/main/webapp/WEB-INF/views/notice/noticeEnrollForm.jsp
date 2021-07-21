<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment Admin</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩4 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<style>
	.outer{margin:auto; width:1000px; height:800px;}
    .outer .insert{
        background-color: rgb(34, 188, 253);
        color:white;
        border: none;
        float:right;
        width:100px;
        height:40px;
        font-size: 16px;
        margin-bottom: 20px;
    }
    .outer .insert:hover{background:rgb(34, 188, 253);}
    .outer table{width:100%; text-align: center; font-size:15px; font-weight: lighter;}
    .outer table tbody{border-top:1px solid lightgray; }
    .outer .contentArea{
        height:500px; 
        width:100%; 
        border:1px solid lightgray;
        background: rgb(247, 247, 247); 
        padding:10px; 
        margin:30px 0 30px 0; 
        resize: none;
    }
</style>
</head>
<body class="sb-nav-fixed">
    <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark2">
		<jsp:include page="../common/adminHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/adminMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            <form class="outer" action="insertNotice.admin" method="post">
                <br><br>
                <h1><b>NOTICE</b></h1>

                <button href="" type="submit" onclick="return validate()" class="btn btn-primary insert">등록하기</button>
                <div class="summernote">
                <table>
                    <thead>
                        <tr><input type="text" class="form-control title" name="title" value="" placeholder="제목을 입력해주세요." required></tr>
                    </thead>
                    <tbody>
                        <tr>
                        	<div>
                        	    <textarea id="summernote" class="form-control contentArea" rows="15" name="content" value="" style="resize:none;" required></textarea>
                        	</div>
                        </tr>
                    </tbody>
                </table>
                </div>
            </form>
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
        $(document).ready(function(){
            	$('#summernote').summernote({
                	height: 300,
                    minHeight:null,
                    maxHeight:null,
                    focus:true
                 });
            });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>


