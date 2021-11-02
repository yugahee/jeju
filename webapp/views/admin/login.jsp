<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
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
	<div id="adLogin">
		<div class="adLogCon">
			<div class="adTtl">
				<img src="${contextPath}/resources/images/logo.png" alt="logo">
				<p class="title">관리자 페이지</p>
			</div>
			<div class="inputArea">
				<form name="adloginForm" id="loginForm" method="post" action="<%= request.getContextPath() %>/admin/login">
					<div class="inp_text">
						<input type="text" name="userId" id="userId" maxlength="20" required="required" placeholder="아이디" />
					</div>
					<div class="inp_text">
						<input type="password" name="adUserPwd" maxlength="20" autocomplete="off" required="required" placeholder="password" />
					</div>
					<div class="inp_check">
						<input type="checkbox" name="remember" id="remember">
						<label for="remember">아이디 저장</label>
					</div>
					<div class="btn_wrap al_c">
						<button class="btn btnType1 btnSizeL" type="submit" value="로그인"><span>로그인</span></button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>