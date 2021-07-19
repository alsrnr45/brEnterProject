<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- 부트스트랩 탬플릿 (로그인)-->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<style>
	         /*입력칸 포커스효과*/
	         .form-control:focus{
	             box-shadow: 0 0 0 0.25rem rgba(234, 152, 236, 0.25)!important;
	         }
	         /*체크박스 포커스효과*/
	         .form-check-input:focus {
	             border-color: #9b59b6;
	             outline: 0;
	             box-shadow: 0 0 0 0.25rem rgba(234, 152, 236, 0.25)!important;
	         }
	         /*체크박스 체크효과*/
	         .form-check-input:checked {
	             background-color: #9b59b6;
	             border-color: #9b59b6;
	         }
	         /*imp*/
	         .mt-5 {
			  	margin-top: 20px !important;
			}
			.btnLogin{
				width: 100%; 
				background-color:#9b59b6; 
				border-inline-color: none; 
				border: none transparent;
			}
			.btnLogin:hover{
				background-color: #cf9ae4;
			}
	
   	</style>
</head>
<body class="bg-primary" style=" background-color: #f6f6f9 !important;"> <!--배경색-->
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="BRlogo" style="text-align: center; margin-top: 50px;">
                                <img src="resources/images/brLogo-Login.png" >
                            </div>
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                
                                <div class="card-body">
                                
                                <!-- LOGIN 요청 -->
                                    <form action="brEnter.main" method="post" style="margin: 30px;">
                                        <div class="form-floating mb-3" style="margin-top: 30px;">
                                            <input class="form-control" id="userId" type="text" name="id" placeholder="@brent.com" style="border: none; border-bottom: 1px solid #ddd; border-radius:0px !important; " />
                                            <label for="userId" >ID</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPassword" type="password" name="pwd" placeholder="Password"  style="border: none; border-bottom: 1px solid #ddd; border-radius:0px !important "/>
                                            <label for="inputPassword">Password</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0" style="align-items: flex-start;">
                                            <button type="submit" class="btn btn-primary btnLogin">로그인</button>
                                        </div> 
                                        <div class="form-check mb-3" style="margin-top: 30px;">
                                            <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                            <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0" style="float: right;">
                                            <a class="small" href="password.html">Forgot Account?</a>
                                        </div> 
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small">처음이신가요?     <a href="register.html">회원가입</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; BR Corp.</div> 
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>