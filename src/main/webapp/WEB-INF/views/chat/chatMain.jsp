<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>
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
    #chatAddress{
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
        	<a style="margin-left:150px; color:rgb(155, 89, 182)" class="fas fa-solid fa-address-book fa-2x" href="chatMain.ch"></a>
        	<a style="margin-left:150px; color:black" class="fas fa-comments fa-2x" href="chatList.ch"></a>
        </div><br><br>

        <!-- 채팅 주소록 -->
        <!-- 스크롤 넣어서 내릴 수 있도록 -->
        <div id="chatAddress">
            <table>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th width="70"><h2>이사원</h2></th>
                    <th width="120">개발팀 사원</th>
                    <th>lee@brEnter.com</th>
                </tr>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th><h2>김사원</h2></th>
                    <th>기획팀 사원</th>
                    <th>kim@brEnter.com</th>
                </tr>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th><h2>박사원</h2></th>
                    <th>마케팅팀 사원</th>
                    <th>park@brEnter.com</th>
                </tr>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th><h2>오사원</h2></th>
                    <th>매니지먼트팀 사원</th>
                    <th>oh@brEnter.com</th>
                </tr>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th><h2>한사원</h2></th>
                    <th>미디어팀 사원</th>
                    <th>han@brEnter.com</th>
                </tr>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th><h2>송사원</h2></th>
                    <th>인사팀 사원</th>
                    <th>song@brEnter.com</th>
                </tr>
                <tr>
                    <th><img src="resources/profileUpfiles/defaultProfile.jpg" style="height: 60px; margin-left:20px;"></th>
                    <th><h2>유사원</h2></th>
                    <th>총무회계팀 사원</th>
                    <th>you@brEnter.com</th>
                </tr>
            </table>
        </div>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- <script src="/socket.io/socket.io.js"></script> -->

</body>
</html>