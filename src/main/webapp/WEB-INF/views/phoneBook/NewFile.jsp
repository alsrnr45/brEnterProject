<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
              <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">주소록 추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="modal-body-content">
                                <div class="content">
                                    <div class="content-org-tree">
                                        <ul>
                                            <li>
                                                <a href="#" class="open"><i class="fas fa-plus-square"></i>br엔터</a>
                                                <ul>
                                                <li><a href="#" class="open"><i class="fas fa-plus-square"></i>기획팀</a></li>
                                                
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="content-list">
                                        <div class="search-wrap">
                                        	<div class="dataTable-search">
                                        		<input class="dataTable-input" placeholder="이름/이메일 검색" type="text">
                                        	</div>
                                        </div>
                                        <div class="scroll-wrap">
	                                        <div class="card-body">
					                            <table id="datatablesSimple" class="mailList">
					                                <thead>
					                                    <tr>
					                                        <th>이름</th>
					                                        <th>부서</th>
					                                        <th>직급</th>
					                                        <th>이메일</th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                   	<tr>
					                                        <td>실제이름</td>
					                                        <td>실제부서</td>
					                                        <td>실제직급</td>
					                                        <td>실제이메일</td>
					                                   	</tr>
					                                </tbody>
					                            </table> 
                                    		</div>
                                    	</div>
                                	</div>
	                                <div class="move-tab">
	                                    <span class="btn btn-primary">추가 &gt</span><br><br>
	                                    <span class="btn btn-primary">&lt 제외</span>
	                                </div>
                                <div class="new-list">
                                </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>