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
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.png">
    <script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/resources/js/common.js"></script>    
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.mCustomScrollbar.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/ui.js"></script>
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/contents.css">
    <script type="text/javascript" src="${contextPath}/resources/js/contents.js"></script>
    
<%-- session에 담긴 message 있을 경우 alert 하는 script --%>
<% if(session.getAttribute("message") != null) {%>
<script>
	alert('<%= session.getAttribute("message") %>');
</script>
<% 
		session.removeAttribute("message");  //계속 alert 뜨는거 방지하기 위해 한번 띄우면 지우기
	} 
%>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>

	<div id="wrap">
		<header id="header">
			<div class="inner">					
				<div class="logo">
					<a href="${ contextPath }">
						<img src="${contextPath}/resources/images/logo.png" alt="" />
					</a>
				</div>
				<div class="menuList">
					<ul>
						<li>
							<a href="#">숙소예약</a>
						</li>
						<li>
							<a href="#">추천장소</a>
						</li>
						<li>
							<a href="${ contextPath }/reservation/checkView">예약조회</a>
						</li>						
					</ul>
				</div>
				<!-- 로그인 했을 때 -->
				<div class="userArea nologin">
					<a href="#" class="btn btnType2 btnSizeS"><span>로그인</span></a>
					<a href="#" class="btn btnType1 btnSizeS"><span>회원가입</span></a>
				</div>
				<div class="userArea" style="display: none">										
                    <img src="${contextPath}/resources/images/usericon.png" onclick="userCon()"/>                   
                    <!-- 회원일 때 -->
                    <ul class="userCon" id="guestUserCon" style="display: none">
                        <li><a href="#">로그아웃</a></li>
						<li><a href="#">마이페이지</a></li>
						<li><a href="#">메신저</a></li>
						<li><a href="#">신고게시판</a></li>
                    </ul>
                    <!-- 호스트일 때-->
                    <ul class="userCon" id="hostUserCon" style="display: none">
                        <li><a href="#">로그아웃</a></li>
						<li><a href="${ contextPath }/host/mypage">마이페이지</a></li>
						<li><a href="#">메신저</a></li>
						<li><a href="#">신고게시판</a></li>
                    </ul>
                    <!-- 관리자일 떄 -->
                    <ul class="userCon" id="adminUserCon" style="display: none">
                        <li><a href="#">계정 관리</a></li>
                        <li><a href="#">비밀번호 관리</a></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
				</div>
			</div>
		</header>