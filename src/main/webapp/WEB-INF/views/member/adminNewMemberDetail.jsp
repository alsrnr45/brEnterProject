<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEnter Admin</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(255, 227, 14); 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(255, 227, 14) !important;
	    box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6) !important;
	    outline: 0 none !important;}
	option:checked {background: rgb(255, 227, 14); color: black;}
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important; background-color: white !important; width: 248.08px !important;}
	p{font-size:15px; text-align: left; margin-top: 7px; margin-left: 15px;}

	/* button 스타일 */
	.btn-danger {background-color: rgb(255, 134, 134); border-color: rgb(255, 134, 134); color: black;}
	.btn-warning {background-color: rgb(255, 227, 115); border-color: rgb(255, 227, 115);}
	.btn-secondary {background-color: #dfdfdf; border-color: #c3c4c4; color: black;}
	.btn-light {background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215);}
	
	/* 스타일 */
	.content {
	    width: 1100px; 
	    height: 600px; 
	    margin: auto;
	    background-color:rgb(240, 240, 240); 
	    box-shadow: 0 7px 15px rgb(0 0 0 / 40%);
	}
	
	/* .content div {outline: 1px solid blueviolet;} */
	.content div {float: left;}
	.content1 {width: 250px; height: 100%; padding: 52px 0px 50px 50px;}
	.productImage {width: 200px; height: 200px; border-radius: 70%; overflow: hidden;}
	.titleImg {width: 100%; height: 100%; object-fit: cover;}
	
	.content2 {width: 850px; height: 100%; padding: 52px 0px 50px 0px;}
	.information{width: 800px; height: 100%;}
	
	.information table {width:100%;}
	.information>table *{margin-bottom: 8px;}
	.information>table th {text-align:center; width:150px; font-size: 17px;}
	
	input{height:40px;}
	#personalInformation button{height:38px; width:100px; text-align:center;}
	
	.input-group-text{border-radius: 0rem 0.25rem 0.25rem 0rem; height: 40px;}
	.mb-3 {margin-bottom: 0 !important;}
	.input-group-append {margin-bottom: 0 !important;}
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

        <!-- 컨텐츠 -->
        <div id="layoutSidenav_content">
            <div class="content">
                
                <form id="personalInformation" method="post" action="enrollNewMember.admin" enctype="multipart/form-data">
                    <div class="content1">
	                    <div class="productImage">                  
							<img class="titleImg" src="${ m.profile }" alt="" required>
							<input type="file" name="upfile" id="upfile" onchange="loadImg(this, 1);" required>
						</div>
                    </div>
                    

                    <div class="content2">
                        
                        <div class="information">
                            
                            <table align="center">
                                <tr>
                                    <th><label for="memName">사원명</label></th>
                                    <td><input type="text" id="memName" class="form-control" name="memName" value="${ m.memName }" readonly></td>
                                    <th><label for="memNo">사원번호</label></th>
                                    <td><input type="text" id="memNo" class="form-control" name="memNo" value="${ m.memNo }" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="deptNo">부서명</label></th>
                                    <td><div id="form-group">
											<select class="form-control" name="deptNo">
												<option value="1">개발팀</option>
												<option value="2">기획팀</option>
												<option value="3">마케팅팀</option>
												<option value="4">매니지먼트팀</option>
												<option value="5">미디어팀</option>
												<option value="6">인사팀</option>
												<option value="7">총무회계팀</option>
											</select>
										</div>
									</td>
                                    <th><label for="posiNo">직급명</label></th>
                                    <td>
                                    	<div id="form-group">
											<select class="form-control" name="posiNo">
												<option value="6">사원</option>
												<option value="5">대리</option>
												<option value="4">과장</option>
												<option value="3">차장</option>
												<option value="2">부장</option>
											</select>
										</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="phnoe">연락처</label></th>
                                    <td><input type="text" id="phnoe" class="form-control" name="phnoe" value="${ m.phone }" readonly></td>
                                    <th><label for="hireDate">입사일</label></th>
                                    <td><input type="date" id="hireDate" class="form-control" name="hireDate" value="${ m.hireDate }" required></td>
                                    
                                </tr>
                                <tr>
                                    <th><label for="account">계좌번호</label></th>
                                    <td>
                                        <div class="input-group mb-3">
                                            <input type="text" id="account" class="form-control" name="account" value="${ m.account }" style="width: 100px;" required>
                                            <div class="input-group-append">
                                                <span class="input-group-text">${ m.bank }</span>
                                            </div>
                                        </div>
                                    </td>
                                    <th><label for="regi">주민등록번호</label></th>
                                    <td colspan="3"><input type="text" id="regi" class="form-control" name="regi" value="${ m.regi }" required></td>
                                </tr>
                                <tr>
                                    <th><label for="officeEmail">사내이메일</label></th>
                                    <td><input type="text" id="officeEmail" class="form-control" name="officeEmail" value="${ m.officeEmail }" readonly></td>
                                    <th><label for="personalEmail">개인이메일</label></th>
                                    <td><input type="text" id="personalEmail" class="form-control" name="personalEmail" value="${ m.personalEmail }" readonly></td>
                                </tr><tr>
                                    <th><label for="address">주소</label></th>
                                    <td><input type="text" id="address" class="form-control" name="address" value="${ m.post }" readonly></td>
                                    <td style="padding-left: 7px;"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><label for=""></label></th>
                                    <td colspan="3"><input type="text" id="roadAddress" class="form-control" name="roadAddress" value="${ m.roadAddress }" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for=""></label></th>
                                    <td colspan="3"><input type="text" id="detailAddress" class="form-control" name="detailAddress" value="${ m.detailAddress }" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="memEnrollDate">가입신청일</label></th>
                                    <td><input type="text" id="memEnrollDate" class="form-control" name="memEnrollDate" value="${ m.memEnrollDate }" readonly></td>
                                    	<th>
                                    	<!--  
                                    		<label for="acceptStatus">승인여부</label>
                                    	-->
                                    	</th>
                                    <td>
                                    	<!--  
                                    	<input type="text" id="acceptStatus" class="form-control" name="" value="${ m.acceptStatus }" required>
                                    	<select class="form-control">
												<option value="">${ m.acceptStatus }</option>
												<option value="">Y</option>
										</select>
										-->
                                    </td>
                                </tr>
                            </table>

                            <div style="float:right; margin-top: 15px;">
                                <button type="button" class="btn btn-light" onclick="javascript:history.go(-1);">뒤로가기</button>
                                <button type="button" class="btn btn-warning" style="margin-left: 7px;">반려하기</button>
                                <button type="submit" class="btn btn-danger" style="margin-left: 7px;">등록하기</button>
                            </div>
                        </div><!--information-->
                    </div><!--content2-->
                </form>

             </div><!--content-->
        </div>
    </div>
    
    <script>
    	// 상품사진
        $(function(){
            
            $("#upfile").hide();

            $(".titleImg").click(function(){
                $("#upfile").click();
            });

        })

        function loadImg(inputFile, num){
            // inputFile : 현재 변화가 생긴 input type="file" 요소객체
            // num : 몇번째 input요소인지 확인 후 해당 그 영역에 미리보기하기 위해

            // 파일을 선택하는 순간 inputFile.files라는 속성배열에 0번인덱스에 파일 담김
            if(inputFile.files.length == 1){ // 선택된 파일이 있을 경우

                // 파일을 읽어들일 FileReader 객체 생성
                var reader = new FileReader();

                // 선택된 파일을 읽어들이기
                // => 읽어들이는 순간 해당 그 파일만의 고유한 url 부여됨
                reader.readAsDataURL(inputFile.files[0]);

                // 파일 읽어들이기가 다 완료된 순간 실행할 함수 정의
                reader.onload = function(e){
                    // 각 영역에 맞춰서 이미지 미리보기
                    switch(num){
                        case 1: $(".titleImg").attr("src", e.target.result); break;
                    }
                }

            }else{ // 선택된 파일이 사라졌을 경우 

                switch(num){
                    case 1: $(".titleImg").attr("src", null); break;
                }

            }

        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>


