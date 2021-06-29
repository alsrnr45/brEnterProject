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

<style>
	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(155, 89, 182); 
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(155, 89, 182); 
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}

	/* 컨텐츠 */
    #btn{
        background-color: lightgray;
        color:white;
        border: none;
        float:right;
        width:100px;
        height:40px;
        font-size: 16px;
    }
    .outer{width:1000px; margin:auto;}
    .topTable{width:100%;}

    /* 아티스트 상세정보 테이블 */
    .detail_table{width:1000px;}
    .table_left{font-size:14px; width:60%; padding-right: 20px;}
    .table_right{
        width:40%;
        padding-left:10px;
        top:0px;
        padding-top: 0px;
        position:sticky;
    }
    .table_right pre{font-size:12px;}
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

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
                        <div class="outer">
                <br><br>
                <h1><b>BLACKPINK</b></h1>
                <br><br>
               
                <table class="topTable">
                    <tr>
                        <th><h4><b>ABOUT</b></h4></th>
                        <th><button id="btn" class="btn btn-warning">목록으로</button></th>
                    </tr>
                </table>
                <hr>

                <!-- 아티스트 상세정보 테이블 -->
                <table class="detail_table">
                    <tr>
                        <td class="table_left">
                            <small>
                                블랙핑크는 2016년 'SQUARE ONE'으로 데뷔하자마자 대중을 사로잡으며 대형 신인 그룹의 탄생을 알렸다. 이후 미니앨범 'SQUARE UP'과 'Kill This Love'를 발표하며 글로벌 아티스트로 성장해 성공적인 월드투어를 통해 세계적인 인기를 확인, 또 미국 최대 음악 페스티벌 '코첼라'무대에 서면서 그 위력을 증명했다. 올해 중순, 카리스마 넘치는 'How You Like That'과 반전 매력의 'Ice Cream'으로 돌아와 빌보드 핫 100차트 13위를 달성하는 등 전 세계적인 영향력을 입증한 블랙핑크는 오는 10월 2일 데뷔 첫 정규앨범을 발매하며 다시 한 번 새로운 도전에 나선다
                            </small>
                        </td>
                        <td class="table_right" rowspan="2">
                            <div>
                            <h5><b>DISCOGRAPHY</b></h5>
                            <pre>
2020. 10. 02 [THE ALBUM]
2020. 08. 28 [Ice Cream (with Selena Gomez)]
2020. 06. 26 [How You Like That]
2018. 06. 15 1st Mini Album [SQUARE UP]
                            </pre>
                        
                            <h5><b>ACHIEVEMENT & AWARDS</b></h5>
                            <h6><b>음악방송</b></h6>
                            <pre>
2018. 07. 08 SBS [인기가요] '뚜두뚜두' 1위 (트리플크라운)
2018. 07. 07 MBC [쇼! 음악중심] '뚜두뚜두' 1위(트리플크라운)
2018. 07. 05 M.net [엠카운트다운] '뚜두뚜두' 1위 (2주 연속)
                            </pre>
            
                            <h6>방송프로그램</h6>
                            <pre>
2018. 01. 06 [블핑하우스]
                            </pre>
            
                            <h6>수상내역</h6>
                            <pre>
2018. 2. 제 7회 가온차트 뮤직 어워즈 [올해의 월드루키상]
2018. 1. 제 27회 서울가요대상 [본상]
                            </pre>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_left">
                            <img src="../artistUpfiles/BLACKPINK.png" alt="">
                        </td>
                    </tr>
                </table>
                <hr>
                <img src="../artistUpfiles/copyright.png" alt="">
                <br><br>
            </div>
        </div>
    </div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>
