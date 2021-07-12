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
	select{background: url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	p{font-size: 15px; text-align: left; margin-top: 7px; margin-left: 15px;}
	
	/* 자유게시판 디테일 */	
	.wrap{width: 1200px;}	
	h1{margin-top: 20px; margin-left: 60px;}  
    .boardFreeDetailArea, .boardFreeReplyArea{margin-left: 100px;}
    a:hover{color: rgb(155, 89, 182);}
    
	
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

                    <a class="btn btn-primary" href="boardFreeList.bf" style="background-color: lightgray; border-color: lightgray; margin-left: 960px;">
                    목록으로</a> 
                    <br><br><br>

                    <div class="content">
                    
                        <div class="boardFreeDetailArea">
                            <div class="boardFreeTable">
                                <table id="boardFreeContnet">
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
                                            <p style="height:250px;">${ bf.freeCnt }</p>
                                        </td>
                                    </tr>
                                </table>
                            </div><br>
							
							
							<!-- 로그인한 유저와 게시글 작성한 멤버 아이디가 일치할 경우에만 수정/삭제 버튼 보이도록 -->
							<c:if test="${ loginUser.id eq bf.memNo }">							
	                            <div class="boardFreeBtn" style="margin-left:780px;">   
	                                <a class="btn btn-primary" onclick="postFormSubmit(1);" style="background-color: rgb(255, 231, 136); border-color: rgb(255, 231, 136);">
	                                수정하기</a>
	                                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
	                            </div><br><br>
	                            
	                            <form id="postForm" action="" method="post">
		                            <input type="hidden" name="bfno" value="${ bf.freeNo }">
		                            <input type="hidden" name="filePath" value="${ bf.freeFileUpdate }"> 
	                            </form>
								
								
								<script>
					            	function postFormSubmit(num){
					            		if(num == 1){ // 수정하기 클릭 시 
					            			$("#postForm").attr("action", "updateBoardFreeForm.bf").submit();
					            		}else { // 삭제하기 클릭 시 
					            			var result = confirm("게시글을 삭제하시겠습니까?"); 
					            			if(result){
					            				$("#postForm").attr("action", "deleteBoardFree.bf").submit();
					            				return true;   
					            			} else{
					            				alert("삭제가 취소되었습니다.")
					            				return false; 
					            			}
					            			
					            		}
					            	}
					            </script>
					            
				            </c:if>
                        </div>


                        <div class="boardFreeReplyArea">

                            <table id="replyArea" width="960" style="background-color: rgb(248, 248, 248)">
                                <thead>
                                    <tr>
                                        <th colspan="2">
                                            <textarea class="form-control" name="freeReplyCnt" id="freeReplyCnt" cols="55" rows="2" style="resize: none;"></textarea>
                                        </th>
                                        <th style="vertical-align: middle" width="150">
                                        	<button class="btn btn-secondary" onclick="addReply();" style="background-color: rgb(155, 89, 182); border-color: rgb(155, 89, 182)">
                                            댓글<br>등록</button></th>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="50">댓글 (<span id="rcount">0</span>)</td>                                        
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
			
		//	setInterval(selectReplyList, 1000);
		})
		
		
		// 댓글 리스트 조회 ajax 
     	function selectReplyList(){
	         $.ajax({
	            url:"rlist.bf", 
	            data:{bfno:${bf.freeNo}},
	            success:function(list){
	                console.log(list);
	               
	               var value="";
	               $.each(list, function(i, obj){
	                  value += "<tr>"
	                        +    "<th>" + obj.memNo 
	                        +    '<input type="hidden" name="rno" value="' + obj.freeReplyNo + '">'                   
	                        +    "</th>"
	                        + 	 '"<td rowspan="2" style="color:gray;">' + obj.freeReplyEnroll + "</td>" 
	                        
	                        // 댓글 작성한 본인일 경우에만 수정/삭제 버튼 나타나도록 => 수정/삭제 버튼 누르면 저장/취소로 변경하기   
	                        if('${loginUser.id}' == obj.memNo) {
	                        	value   +=    '<td rowspan="2" width="100">'  
				 	                    +         '<input type="button" style="color:purple;" id="updateBtn" value="수정" onclick="updateReply();">'
				 	                    +         '<input type="button" style="color:purple;" id="deleteBtn" value="삭제" onclick="deleteReply(' + obj.freeReplyNo + ');">' 
				 	                    +     "</td>"
	                        }
	                        
				 	  value += "</tr>"          
	                        + "<tr>"                    
	   	                    // 수정 버튼 누를 때 textarea로 변환 
	   	                    +    '"<td width="550">' + obj.freeReplyCnt + "</td>"
	   	                    //+    '"<td width="550">' + '<textarea></textarea>' + "</td>"
	   	                    + "</tr>";
	                                               
	                      
	               })
	               
	               $("#replyArea tbody").html(value); 
	               $("#rcount").text(list.length); 
	               
	            },error:function(){
	               console.log("selectReplyList fail"); 
	            }
	         })
	    }
		
		
		
		// 댓글 작성 ajax 
		function addReply(){
			
			if($("#freeReplyCnt").val().trim().length != 0){ // 댓글 작성되어 있을 경우 
				
				$.ajax({
					url:"rinsert.bf",
					data:{
						freeReplyCnt:$("#freeReplyCnt").val(),
						freeNo:${bf.freeNo}, 
						memNo:'${loginUser.memNo}' 
					},
					success:function(status){
						if(status == "success"){
							$("#freeReplyCnt").val(""); 
							selectReplyList(); 
						}
					},error:function(){
						console.log("댓글 작성용 ajax 통신 실패"); 
					}
				})
					
				
			}else { // 댓글 미작성일 경우 => alert 
				alert("댓글 작성 후 버튼을 눌러주세요.");
			}
				
		}	
		
		
		
		// 댓글 삭제 ajax 
		function deleteReply(rno){			
				
			$.ajax({
				url: "rdelete.bf",
				data: {rno:rno},
				success:function(status){
					if(status == "success"){
						selectReplyList(); 
						console.log("delete success");
						
						
					}					
				}, error: function(){
					console.log("delete fail"); 
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