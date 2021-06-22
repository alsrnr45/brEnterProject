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
        height: 600px;
        border: 1px solid lightgray;
        background: white;
    }
    #chatView {
        height: 85%;
        overflow-y: scroll;
    }
    #chatTop{
        color:rgb(155, 89, 182);
        text-align : center;
        font-size:15px;
    }
    #chatForm {
        height: 100%;
        border-top: 1px solid gray;
    }
    #msg {
        width: 82%;
        height: 75px;
        margin-top:5px;
        border-style:hidden;
    }
    #send {
        width: 15%;
        height: 80px;
        border-radius: 10px;
        border-color: rgb(207, 154, 228);
        background: rgb(207, 154, 228);
        color: white;
    }
    .msgLine {
        margin: 15px;
    }
    .msgBox {
        border: 1px solid rgb(245, 238, 248);
        background: rgb(245, 238, 248);
        padding: 2px 5px;
        border-radius: 10px;
    }
    
</style>
</head>
<body>
	 <div id="container">
        <div id="chatView">
            <div id="chatTop">

                <img src="resources/images/brLogo_user.png"" style="height: 40px; margin-right:450px;">
                
                <div id="chatDate">
                     <hr><b>2021년 6월 16일 수요일</b><hr>
                </div>
               
            </div>
        </div>
        <form id="chatForm" onsubmit="return false">
            <input type="text" id="msg" placeholder="메시지를 입력해주세요.">
            <input type="submit" id="send" value="Enter">
        </form>
    </div>
    
    <!-- 상대방 말풍선 rgb(224, 224, 224) / 본인 말풍선 rgb(245, 238, 248) -->
	
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 
    <script src="/socket.io/socket.io.js"></script>
    
    <script>
        var socket = io();
        
        var chatView = document.getElementById('chatView');
        var chatForm = document.getElementById('chatForm');
 
        chatForm.addEventListener('submit', function() {
            var msg = $('#msg');
 
            if (msg.val() == '') {
                return;
 
            } else {
                socket.emit('SEND', msg.val());
 
                var msgLine = $('<div class="msgLine">');
                var msgBox = $('<div class="msgBox">');
 
                msgBox.append(msg.val());
                msgBox.css('display', 'inline-block');

                msgLine.css('text-align', 'right');
                msgLine.append(msgBox);
 
                $('#chatView').append(msgLine);

                msg.val('');
                chatView.scrollTop = chatView.scrollHeight;
            }
        });  
        
        socket.on('SEND', function(msg) {
            var msgLine = $('<div class="msgLine">');
            var msgBox = $('<div class="msgBox">');
                    
            msgBox.append(msg);
            msgBox.css('display', 'inline-block');
    
            msgLine.append(msgBox);
            $('#chatView').append(msgLine);
    
            chatView.scrollTop = chatView.scrollHeight;
        });
    </script> -->
	   
</body>
</html>