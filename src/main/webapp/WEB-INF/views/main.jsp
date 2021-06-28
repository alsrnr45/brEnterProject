<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>
</head>
<body>


	<jsp:include page="member/login.jsp"/>

	
	<%-- 
	
	* 첫화면: 로그인
	<jsp:include page="member/login.jsp"/>
	<jsp:include page="common/userMain.jsp"/> -->로그인 후 넘어갈 수 있게끔!
	<jsp:include page="common/adminMain.jsp"/>
	--%>
	
</body>
</html>