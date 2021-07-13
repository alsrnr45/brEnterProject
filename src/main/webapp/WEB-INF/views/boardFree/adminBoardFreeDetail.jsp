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

<style>

	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(255, 227, 14); 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(255, 227, 14); 
	    box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(255,235,152);}
	    
	/* 관리자 자유게시판 디테일 */
	.wrap{width: 1200px;}
	h1{margin-top: 20px; margin-left: 60px;}  
    .adBoardFreeDetailArea, .adBoardFreeReplyArea{margin-left: 100px;}
    a:hover{color: rgb(255, 235, 152);}
	
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
        		<div class="wrap">
    
                    <h1>자유게시판</h1><hr>
        
                    <a class="btn btn-primary" href="adminBoardFreeList.bf" style="background-color: lightgray; border-color: lightgray; margin-left: 960px;">
                    목록으로</a> 
                    <br><br><br>
        
                    <div class="content">

                        <div class="adBoardFreeDetailArea">   

                            <div class="boardFreeTable"> 
                                <table id="adBoardFreeContnet">
                                    <tr style="text-align:center;">
                                        <th width="70">No.</th> 
                                        <th width="600">제목</th>
                                        <th width="100">작성자</th>
                                        <th width="80">조회수</th>
                                        <th width="100">작성일</th>
                                    </tr>
                                    <tr style="text-align:center;">
                                        <td width="70">${ bf.freeNo }</td> 
                                        <td width="600">${ bf.freeTitle }</td>
                                        <td width="100">${ bf.memNo }</td>
                                        <td width="80">${ bf.freeCount }</td>
                                        <td width="100">${ bf.freeEnrolldate }</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" height="50"><i class="fas fa-file-image"></i>&nbsp;
                                            <c:choose>
                                                <c:when test="${ empty bf.freeFileOrigin }">
                                                    첨부파일이 없습니다.
                                                </c:when>
                                                <c:otherwise>
                                                    첨부파일 : <a href="${ bf.freeFileUpdate }" download="${ bf.freeFileOrigin }">${ bf.freeFileOrigin }</a>
                                                </c:otherwise>
                                            </c:choose> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="background-color: rgb(248, 248, 248);"> 
                                            <p style="height: 250px;">${ bf.freeCnt }</p>
                                        </td>
                                    </tr>
                                </table>
                            </div><br>
                            
                            <form id="postForm" action="" method="post">
	                            <input type="hidden" name="bfno" value="${ bf.freeNo }">
	                            <input type="hidden" name="filePath" value="${ bf.freeFileUpdate }"> 
                            </form>
                            
                        </div>


                        <div class="adBoardFreeReplyArea">                                                   
                            <table id="replyArea" width="960" style="background-color: rgb(248, 248, 248)"> 
                                <thead> 
                                	<tr>
                                        <th colspan="3">
                                            <textarea class="form-control" name="freeReplyCnt" id="freeReplyCnt" cols="55" rows="2" style="resize:none;" readonly></textarea>
                                        </th>
                                        <th colspan="3" style="vertical-align: middle" width="150">
                                        	<button class="btn btn-secondary" onclick="addReply();" style="background-color: rgb(255, 232, 141); border-color: rgb(255, 232, 141)" readonly>
                                            댓글<br>등록</button></th><br>
                                    </tr>
                                	<tr>
                                        <td colspan="6" height="50">댓글 (<span id="rcount">0</span>)
                                            <button class="btn btn-danger">댓글 삭제</button>
                                        </td> 
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                </tbody>
                            </table>     
                        </div>   
                    </div>                                      
                </div>    
            </div>        
    </div>
    
    
    
    <script>
	    $(function(){
	    	
			selectReplyList();
			
			setInterval(selectReplyList, 1000);
		})
    
    	
		// 댓글 리스트 조회 ajax 
    	function selectReplyList(){
	    	
			$.ajax({
				url:"adminRlist.bf", 
				data:{bfno:${bf.freeNo}},
				success:function(list){
					// console.log(list);
					var value="";
					$.each(list, function(i, obj){
						value += "<tr>"
							   +    '"<th colspan="5">' + '<input type="checkbox" name="rno" id="rno" value="${ r.freeReplyNo }">' + "&nbsp;" + obj.memNo + "</th>"						      						            						   
						       +    '"<td style="color:gray;" >' + obj.freeReplyEnroll + "</td>" 
						       + "</tr>"
						       + "<tr>"
						       +    '"<td colspan="6" style="width:900px;">' + obj.freeReplyCnt + "</td>"
						       + "</tr>";
					})
						
					$("#replyArea tbody").html(value); 
					$("#rcount").text(list.length); 
						
				},error:function(){
					console.log("댓글 리스트 조회용 ajax 실패"); 
				}
			})
	    }
    </script>
    
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>


