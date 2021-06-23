<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>	
	
	#container {
    	width: 500px;
        height: 800px;
        border: 1px solid lightgray;
        background: rgb(245, 238, 248);
    }
    #chatTop {
        height: 10%;
        background-color: rgb(155, 89, 182);
    }
    #chatLogo{
        color: rgb(155, 89, 182);
        text-align : center;
        font-size: 15px;
    }
    img{
         border-radius: 50px;
    }
    #chatProfile{
         height: 50px;
         margin-left: 10px;
    }
    #chatList{
         margin-left: 10px;
    }
    
</style>
</head>
<body>
    <!-- 폰트 어썸 -->
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div id="container">

        <!-- 상단바 -->
        <div id="chatTop">
            <div id="chatLogo">
                <img src="resources/images/brLogo_user.png" style="height: 50px; margin-right:450px;">               
            </div>
        </div>
       <br>

        <!-- 채팅 프로필 -->
        <div id="chatProfile"> 
            <table>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th width="70"><h2>최사원</h2></th>
                    <th width="100">개발팀 사원</th>
                    <th>sunhee@brEnter.com</th>
                </tr>
            </table>                 
        </div> <br><hr><br>

        <!-- 채팅창 메뉴 버튼 -->
        <!-- 클릭 시 아이콘 색 변경 rgb(155, 89, 182) -->
        <div id="chatMenu">
        	<a style="margin-left:150px; color:black" class="fas fa-solid fa-address-book fa-2x" href="chatMain.ch"></a>
        	<a style="margin-left:150px; color:rgb(155, 89, 182)" class="fas fa-comments fa-2x" href="chatList.ch"></a>
        </div><br><br>

        <!-- 채팅 목록 -->
        <div id="chatListTable">
            <table class="chatList">
           		<!-- 
                채팅 목록 없을 시 
                <h3 align="center">채팅 목록이 비어있습니다.</h3> 
                -->
            	<tbody>
            		<tr>
	                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
	                    <th width="70"><h2>이사원</h2></th>
	                    <th width="200">채팅 내용 3입니다.</th>
	                    <th>오후 12:44</th>
               		</tr>
                	<tr>
	                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
	                    <th><h2>김사원</h2></th>
	                    <th>채팅 내용 2입니다.</th>
	                    <th>오후 12:44</th>
               		</tr>
               		<tr>
	                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
	                    <th><h2>박사원</h2></th>
	                    <th>채팅 내용 1입니다.</th>
	                    <th>오후 12:44</th>
               		</tr>	
            	</tbody>
            </table>
        </div>
    </div>
	
	<!-- 클릭 시 새로운 창이 뜨도록 구현할 것 -->
	<script>
    	$(function() {
            $(".chatList>tbody>tr>th").click(function() {
            	location.href = "chatRoom.ch";
                console.log("채팅방 클릭");
            })
        })
    </script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- <script src="/socket.io/socket.io.js"></script> -->

</body>
</html>