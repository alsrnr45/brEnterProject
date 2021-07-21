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
    
    <!-- modal 라이브러리 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
<title>Insert title here</title>

<style>
    .card-footer{
        text-align: end;
    }
    
    .dataTable-table > tbody > tr > td, .dataTable-table > tbody > tr > th, 
    .dataTable-table > tfoot > tr > td, .dataTable-table > tfoot > tr > th, 
    .dataTable-table > thead > tr > td, .dataTable-table > thead > tr > th {
        text-align:center;
    }

    .bg-dark{
        background-color: rgb(155, 89, 182) !important;
    }

    .btn .btn-primary{
        text-align: inherit;
    }

    .btn-primary.focus, .btn-primary:focus{
        background-color: rgba(155, 89, 182, 0.6);
        border-color: rgba(155, 89, 182, 0.6);
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
    }
    
    .btn-check:focus + .btn-primary, .btn-primary:hover{
        background-color: rgba(155, 89, 182, 0.6);
        border-color: rgba(155, 89, 182, 0.6);
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
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
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">주소록</h1>
                    <br>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="far fa-address-book"></i>
                            주소록 전체보기
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="mailList">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>이름</th>
                                        <th>휴대폰번호</th>
                                        <th>사내이메일</th>
                                        <th>일반이메일</th>
                                        <th>회사(부서)</th>
                                        <th>주소록 이름</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td><input type="button" hidden><i class="far fa-star"></i></input></td>
                                        <th><i class="far fa-envelope"></i></th>
                                        <!-- <th><i class="far fa-envelope-open"></i></th>-->
                                        <td>kimjava@br.com</td>
                                        <td>kimjava@naver.com</td>
                                        <td>br엔터</td>
                                        <td>기본주소록, 축구동아리</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th><input type="checkbox"></th>
                                        <th><button onclick="important()"><i class="far fa-star"></i></button></th>
                                        <th></th>
                                        <th>Age</th>
                                        <th>Sta rt date</th>
                                        <th>Salary</th>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="card-footer">
                                  <!-- Button to Open the Modal -->
                                <button type="button" class="btn btn-primary" ">주소록추가</button>
                                <a id="pbPopup" class="btn btn-primary" data-toggle="modal" data-target="#myModal" >주소록</a>
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
                                                <a href="#" class="tree"><i class="fas fa-plus-square"></i></a><a href="#" class="open">br엔터</a>
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
	                                    <a id=""class="btn btn-primary">추가 &gt</a><br><br>
	                                    <a class="btn btn-primary">&lt 제외</a>
	                                </div>
                                <div class="new-list">
                                	
                                </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
    
</body>
<script>
	$(document).ready(function() {
		
		$('#pbPopup').on('click',(function(){
			$.ajax({
				type: "POST",
				url: "popup.pb",
				success: function(map){
					let mlist = map.mlist;
					let dlist = map.dlist;
					let plist = map.plist;
					
					for( var i in dlist ){
						let d = dlist[i];
						$('.deptName').append('<li><a href="#" class="tree"><i class="fas fa-plus-square"></i></a><a href="#" class="open">' + d['deptName'] + '</a></li>');
					};
					
					for( var i in mlist){
						let m = mlist[i];
						$('.phoneBook>tbody').append('<tr>' + 
										  '<td><input type="checkbox"></td>' + 
										  '<td>' + m['memName'] + '</td>' + 
										  '<td>' + m['deptName'] + '</td>' + 
										  '<td>' + m['posiName'] + '</td>' +
										  '<td>' + m['officeEmail'] + '</td>'
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
			});
		}))
		
		// 부서별 사원 조회
		$('.tree').on('click', function(){
			
		})
		
		$('.open').on('click',fun)
		
		// 보내고 싶은 사람 이메일 주소 넘기기
		$().on('click', function(){
			$('#myModal>input:checkbox')
			
		})
		
	})

</script>
</html>
