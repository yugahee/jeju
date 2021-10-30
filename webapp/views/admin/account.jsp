<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>제주라도 넘어갈까</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no, address=no, email=no">
	<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.png">
    <script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/resources/js/common.js"></script>    
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.mCustomScrollbar.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/ui.js"></script>
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/admin.css">
    
    <script type="text/javascript" src="${contextPath}/resources/js/admin.js"></script>
    
</head>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<body>	
	<div id="wrap" class="wrap">
		<div class="lnb">
			<h1 class="logo">
				<a href="<%= request.getContextPath() %>/admin">
					<img src="${contextPath}/resources/images/logo.png" alt="logo">
				</a>
				
			</h1>
			<ul class="menuList">
				<li>
					<a href="#none">회원 관리</a>
					<ul class="subMenu">
						<li><a href="<%= request.getContextPath() %>/admin/userMg01">회원 관리</a></li>
						<li><a href="<%= request.getContextPath() %>/admin/userMg02">블랙리스트 관리</a></li>
					</ul>
				</li>
				<li><a href="<%= request.getContextPath() %>/admin/resvMg">예약 관리</a></li>
				<li>
					<a href="#none">후기 관리</a>
					<ul class="subMenu">
						<li><a href="<%= request.getContextPath() %>/admin/revwMg01">숙소 후기 관리</a></li>
						<li><a href="<%= request.getContextPath() %>/admin/revwMg02">추천장소 후기 관리</a></li>
					</ul>
				</li>
				<li><a href="<%= request.getContextPath() %>/admin/inquireMg">문의 관리</a></li>
				<li><a href="<%= request.getContextPath() %>/admin/roomsMg">숙소 관리</a></li>
				<li><a href="<%= request.getContextPath() %>/admin/recPlaceMg">추천장소 관리</a></li>
			</ul>
		</div>

		<div class="conte_wrap">
			<div class="gnb">
				<div class="userArea">										
                    <img src="${contextPath}/resources/images/usericon.png" onclick="userCon()"/>
                    <!-- 관리자일 떄 -->
                    <ul class="userCon" id="adminUserCon" style="display: none">
                        <li><a href="<%= request.getContextPath() %>/admin/account">계정 관리</a></li>
                        <li><a href="<%= request.getContextPath() %>/admin/password">비밀번호 관리</a></li>
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>
			<div class="content">
                <div class="adinfoForm">
                    <div class="listTit al_c">계정 관리</div>
                    <dl>
                        <dt>이름</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="" id="" value="관리자"/>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>이메일</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="" id="" class="readOnly" readonly value="admin@gmail.com" />
                            </div>
                            <a href="#" class="btn btnType1 btnSizeS"><span>재설정</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>아이디</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="" id="" class="readOnly" readonly value="admin" />
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>전화번호</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="" id="" value="010-9999-8888"/>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="password" name="" id="" class="readOnly" readonly value="password" />
                            </div>
                            <a href="#" class="btn btnType1 btnSizeS"><span>재설정</span></a>
                        </dd>
                    </dl>
                    <div class="btn_wrap al_c">
                        <a href="#" class="btn btnType1 btnSizeM"><span>저장</span></a>
                        <a href="#" class="btn btnType2 btnSizeM"><span>취소</span></a>
                    </div>
                </div>
			</div>
			<!-- //contet -->
		</div>
	</div>
</body>
</html>