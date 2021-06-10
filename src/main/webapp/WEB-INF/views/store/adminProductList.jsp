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
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(255, 227, 14); 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(255, 227, 14); 
	    box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(255,235,152);}
	
	/* 페이징바 스타일 */
	.dataTable-pagination a {color:black;}
	.dataTable-pagination a:hover, 
	.dataTable-pagination a:focus {background: rgb(250, 246, 222); border-color: #dee2e6; color:black;}
	.dataTable-pagination a:active {box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);}
	.page-item.active .page-link, .page-item.active .dataTable-pagination a, .dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link, .dataTable-pagination li.active a {
	    z-index: 3; color: black; background-color: rgb(255,235,152); border-color: #dee2e6;}
	.dataTable-pagination .active a, .dataTable-pagination .active a:focus, .dataTable-pagination .active a:hover {
	    background-color: rgb(255, 232, 141);
	    box-shadow: none;}
	    
	/* 스타일 */
	h1{margin-bottom:20px;}
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
            <main>
                <div class="container-fluid px-4">
                    
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품관리</h1>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-store me-1"></i>
                               	 상품조회
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="productList">
                                    <thead >
                                        <tr>
                                            <th>상품번호</th>
                                            <th>카테고리</th>
                                            <th>상품명</th>
                                            <th>판매가</th>
                                            <th>직원할인가</th>
                                            <th>진열여부</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>128</td>
                                            <td>Album</td>
                                            <td>상품128</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>127</td>
                                            <td>Cherring</td>
                                            <td>상품127</td>
                                            <td>50,000</td>
                                            <td>40,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>126</td>
                                            <td>Photo</td>
                                            <td>상품126</td>
                                            <td>30,000</td>
                                            <td>27,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>125</td>
                                            <td>Cherring</td>
                                            <td>상품125</td>
                                            <td>10,000</td>
                                            <td>8,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>124</td>
                                            <td>Photo</td>
                                            <td>상품124</td>
                                            <td>15,000</td>
                                            <td>12,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>123</td>
                                            <td>Cherring</td>
                                            <td>삼품123</td>
                                            <td>30,000</td>
                                            <td>27,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>122</td>
                                            <td>Photo</td>
                                            <td>상품122</td>
                                            <td>40,000</td>
                                            <td>32,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>121</td>
                                            <td>Cherring</td>
                                            <td>상품121</td>
                                            <td>50,000</td>
                                            <td>40,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>120</td>
                                            <td>Photo</td>
                                            <td>상품120</td>
                                            <td>15,000</td>
                                            <td>12,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>119</td>
                                            <td>Photo</td>
                                            <td>상품119</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>118</td>
                                            <td>Album</td>
                                            <td>상품118</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>117</td>
                                            <td>Photo</td>
                                            <td>상품117</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>116</td>
                                            <td>Fashion</td>
                                            <td>상품116</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>115</td>
                                            <td>Cherring</td>
                                            <td>상품115</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>114</td>
                                            <td>Stationery</td>
                                            <td>상품114</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>113</td>
                                            <td>Photo</td>
                                            <td>상품113</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>112</td>
                                            <td>Album</td>
                                            <td>상품112</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>111</td>
                                            <td>Cherring</td>
                                            <td>상품111</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>110</td>
                                            <td>Fashion</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>109</td>
                                            <td>Album</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>108</td>
                                            <td>Photo</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>107</td>
                                            <td>Fashion</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>106</td>
                                            <td>Album</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>105</td>
                                            <td>Stationery</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>104</td>
                                            <td>Photo</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>103</td>
                                            <td>Album</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>102</td>
                                            <td>Stationery</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                        <tr>
                                            <td>101</td>
                                            <td>Cherring</td>
                                            <td>상품110</td>
                                            <td>20,000</td>
                                            <td>18,000</td>
                                            <td>Y</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main> 
        </div>
    </div>
    
    <script>
        $(function() {
            $(".productList>tbody>tr").click(function() {
            	location.href ="productDetail.admin";		<%--?bno=" + $(this).children(".bno").text();--%>
                console.log("상품클릭");
            })
        })
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>


