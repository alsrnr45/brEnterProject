<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>

<!-- 부트스트랩 탬플릿 -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
/* 폰트 */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

/* input 스타일 */
input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(155, 89, 182);
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(155, 89, 182, 0.6);
	outline: 0 none;
}

/* 드롭박스 스타일 */
.dataTable-selector:focus, .dataTable-selector:active {
	border-color: rgb(155, 89, 182);
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(155, 89, 182, 0.6);
	outline: 0 none;
}

option:checked {
	background: rgb(155, 89, 182);
	color: white;
}

/* 페이징바 스타일 */
.dataTable-pagination a {
	color: black;
}

.dataTable-pagination a:hover, .dataTable-pagination a:focus {
	background: rgb(245, 238, 248);
	border-color: #dee2e6;
	color: black;
}

.dataTable-pagination a:active {
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(155, 89, 182, 0.6);
}

.page-item.active .page-link, .page-item.active .dataTable-pagination a,
	.dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link,
	.dataTable-pagination li.active a {
	z-index: 3;
	color: #fff;
	background-color: rgb(155, 89, 182);
	border-color: #dee2e6;
}

.dataTable-pagination .active a, .dataTable-pagination .active a:focus,
	.dataTable-pagination .active a:hover {
	background-color: rgb(155, 89, 182);
	box-shadow: none;
}

/* 주소 */
.address {
	border-style: solid;
	border-color: rgb(236, 236, 236);
	border-radius: 3px;
	color: gray;
	font-weight: 500;
	font-size: 16px;
	width: 500px;
	height: 32px;
	/* position:absolute;
    right:406px; */
	margin: auto;
}

/* 지도 */
.map {
	border-style: solid;
	border-color: rgb(236, 236, 236);
	height: 400px;
	width: 500px;
	margin: auto;
}
</style>
<link rel="stylesheet" href="resources/css/leaflet.css" />
<script type="text/javascript" src="resources/js/leaflet.js"></script>
<script type="text/javascript" src="resources/js/CmWorldLayer.js"></script>

</head>
<body class="sb-nav-fixed">
	<!-- 상단바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="../common/userHeader.jsp" />
	</nav>

	<div id="layoutSidenav">

		<!-- 메뉴바 -->
		<div id="layoutSidenav_nav">
			<jsp:include page="../common/userMenu.jsp" />
		</div>

		<!--컨텐츠-->
		<div id="layoutSidenav_content">

			<div class="offOuter">
				<br> <br>

				<h2 align="center">BR SHOP 오시는길</h2>
				<br>

				<div class="address">위치 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F,
					4F, 5F, 6F</div>
				<br> <br>

				<div class="map">
					<div id="mapid" style="width: 100%; height: 100%;"></div>
					<script>
						var mymap = L.map('mapid'); //지도 컨트롤로 맵 설정

						L.tileLayer.CmWorld('naver').addTo(mymap); //,{  //배경지도로 사용할 지도가 NAVER 지도임을 명시.

						mymap.setView([ 37.49898463104028, 127.03287899494173 ], 12); //지도 로딩 위치 설정
						
					    var marker = L.marker([37.49898463104028, 127.03287899494173]).addTo(mymap);
					    marker.bindPopup("BREnt").openPopup();
					</script>
				</div>

			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>
