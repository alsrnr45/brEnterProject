<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YB-CALENDER</title>
	<!--css연동 -->
	<link href="resources/css/ybCalender.css" rel="stylesheet" />
	
	<!-- js연동 -->
	<script src='resources/js/ybCalender.js'></script>
</head>
<body>
	<div class="calendar">
	<div class="header">
		<a data-action="prev-month" href="javascript:void(0)" title="Previous Month"><i></i></a>
		<div class="text" data-render="month-year"></div>
		<a data-action="next-month" href="javascript:void(0)" title="Next Month"><i></i></a>
	</div>
	<div class="months" data-flow="left">
		<div class="month month-a">
			<div class="render render-a"></div>
		</div>
		<div class="month month-b">
			<div class="render render-b"></div>
		</div>
	</div>
</div>
</body>
</html>