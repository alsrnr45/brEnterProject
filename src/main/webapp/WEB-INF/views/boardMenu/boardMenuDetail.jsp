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

.menuBoardDetailOuter {
	position:absolute;
	width: 59%;
	left:28%;
	top:5%;
	
}

/* 버튼  */
.listBtn {
	text-decoration: none;
	border: 4px solid rgb(155, 89, 182);
	background: rgb(155, 89, 182);
	color: white;
	border-radius: 3px;
	font-size: 0.8125em;
	position: relative;
	bottom: 5%;
	left: 92%;
	
}

/* 게시판 */
#menuDetailtable {
	font-size: 0.8125em;
}

.menuDay {
	width: 20%;
}

/* 댓글  작성 폼*/
#replyContent {
	font-size: 0.8125em;
	width: 85%;
}

/* 댓글 버튼 */
.replyBtn {
	font-size: 0.8125m;
	border: 19px solid rgb(155, 89, 182);
	background: rgb(155, 89, 182);
	border-radius: 3px;
	color: white;
	position: absolute;
}

.replyBtn:hover {
	color: black;
}

/* 댓글 내용*/
.replyInfo {
	font-size: 0.8125em;
}

.replyName, .replyCount {
	font-weight: bold;
}

.replyDay {
	color: rgb(181, 180, 180);
}

/* 본인이 작성한 댓글에만 보여질 버튼 */
.btns {
	position: absolute;
}

.replyChangeBtn:hover, .replyDeleteBtn:hover {
	color: gray;
}

.replychangeBtn, .replyDeleteBtn {
	border: 1px solid rgb(207, 154, 228);
	background: rgb(207, 154, 228);
	border-radius: 3px;
	color: white;
	font-size: 0.75em;
}
</style>

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

			<div class="menuBoardDetailOuter">
				<a href="boardMenuList.bm" class="listBtn">목록으로</a>


				<div>
					<form name="menuDetailtable" id="menuDetailtable" method="post"
						action="">

						<br> 제목 <input type="text" name="weekmenuTitle"
							style="width: 100%;" value="${ Detail.weekmenuTitle}" disabled="disabled"> <br>
						<br>
						<div>
	        			<c:if test="${Detail != null }">
	        			${ Detail.weekmenuCnt}
	        			</c:if>
	        			</div>

					</form>
				</div>
				<br> <br> <br>

				<div id="replyArea">
				<form name="replytable" action="boardMenuReplyInsert.bm">
					<table border="1" align="center">
						<thead>
							<tr>
								<textarea id="replyContent" name="weekmenuReplyCnt" cols="50" rows="3"
									style="resize: none" placeholder="내용을 입력하세요."></textarea>
							</tr>
							&nbsp;
							<tr>
								<button class="replyBtn" type="submit">댓글등록</button>
							</tr>
							<input type="hidden" name="weekmenuNo" value="${Detail.weekmenuNo }">
						</thead>
						<tbody>

						</tbody>
					</table>
					</form>
						<div class="replyCount">
						댓글(<c:out value="${replyCount}"/>)
						</div>
						
					<c:forEach items="${reply }" var="reply">
					<div class="replyInfo">
						<br> <span class="replyName"><c:out value="${reply.memName}"/></span> <span
							class="replyDay">&nbsp;&nbsp;<c:out value="${reply.weekmenuReplyEnroll}"/></span> <span
							class="replyContent"><c:out value="${reply.weekmenuReplyCnt}"/></span>
						<!-- 본인이 작성한 댓글에만 보여질 버튼 -->
						<c:if test="${reply.memNo == loginUser.memNo }">
						<span class="btns">&nbsp;&nbsp;&nbsp;
						<input type="hidden" id="weekmenuReplyNo" name="weekmenuReplyNo" value="${reply.weekmenuReplyNo }">
						<input type="hidden" id="weekmenuNo" name="weekmenuNo" value="${Detail.weekmenuNo }">
							<button class="replyDeleteBtn">삭제</button>
						</span>
						</c:if>
					</div>
					</c:forEach>
					<script>
	        		$(function(){
	        			$(".replyDeleteBtn").click(function(){
	        				location.href="boardMenuReplyDelete.bm?weekmenuNo=" + $(this).prev("#weekmenuNo").val()+"&weekmenuReplyNo="+$(this).prev().prev("#weekmenuReplyNo").val();
	        			})
	        		})
	        	</script>
	        	<br><br>
				</div>


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
