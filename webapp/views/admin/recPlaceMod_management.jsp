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
				<li><a class="active" href="<%= request.getContextPath() %>/admin/recPlaceMg">추천장소 관리</a></li>
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
				<div class="recPlaceArea">
					<div class="con">
						<div class="listTit">추천장소 정보 수정</div>
						<div class="tblType2 noBorder">
							<table>
								<caption></caption>
								<colgroup>
									<col width="10%">
									<col width="35%">
									<col width="10%">
									<col width="35%">
								</colgroup>
								<tbody>
									<tr>
										<th>번호</th>
										<td>101</td>
										<th>노출여부</th>
										<td>
											<div class="selectbox">
												<button class="title" type="button" title="선택">선택</button>
												<ul class="selList" style="max-height: 0px; display: none;">
													<li>
														<input type="radio" value="" class="option" id="sel1_1" name="select1" checked="checked">
														<label for="sel1_1">노출</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_2" name="select1">
														<label for="sel1_2">비노출</label>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th>지역</th>
										<td>
											<div class="selectbox">
												<button class="title" type="button" title="선택">선택</button>
												<ul class="selList" style="max-height: 0px; display: none;">
													<li>
														<input type="radio" value="" class="option" id="sel1_1" name="select1">
														<label for="sel1_1">동부</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_2" name="select1">
														<label for="sel1_2">서부</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_3" name="select1">
														<label for="sel1_3">남부</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_4" name="select1">
														<label for="sel1_4">북부</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_2" name="select1">
														<label for="sel1_2">중부</label>
													</li>
												</ul>
											</div>
										</td>
										<th>분류</th>
										<td>
											<div class="selectbox">
												<button class="title" type="button" title="선택">선택</button>
												<ul class="selList" style="max-height: 0px; display: none;">
													<li>
														<input type="radio" value="" class="option" id="sel1_1" name="select1">
														<label for="sel1_1">식당</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_2" name="select1">
														<label for="sel1_2">카페</label>
													</li>
													<li>
														<input type="radio" value="" class="option" id="sel1_2" name="select1">
														<label for="sel1_2">관광</label>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th>장소명</th>
										<td>
											<div class="inp_text">
												<input type="text">
											</div>
										</td>
										<th>위치</th>
										<td>
											<div class="inp_text">
												<input type="text">
											</div>
										</td>
									</tr>
									<tr style="height: 150px;">
										<th>이미지</th>
										<td>
											<div class="inp_text">
												<input type="file" accept="image/*" onchange="loadFile(event)">
											</div>
											<script>
												var loadFile = function(event) {
												  var reader = new FileReader();
												  reader.onload = function(){
													var output = document.getElementById('output');
													output.src = reader.result;
												  };
												  reader.readAsDataURL(event.target.files[0]);
												};
											  </script>
										</td>
										<td colspan="2">
											<img id="output"/>
										</td>
									</tr>
									<tr>
										<th>네이버맵 URL</th>
										<td>
											<div class="inp_text">
												<input type="text">
											</div>
										</td>
										<th>카카오맵 URL</th>
										<td>
											<div class="inp_text">
												<input type="text">
											</div>
										</td>
									</tr>
									<tr>
										<th>지도 api 주소</th>
										<td>
											<div class="inp_text">
												<input type="text">
											</div>
										</td>
										<th>키워드</th>
										<td>
											<div class="inp_text">
												<input type="text">
											</div>
										</td>
									</tr>
									<tr>
										<th>정보</th>
										<td colspan="3">
											<div class="textbox">
												<textarea placeholder="내용"></textarea>
												<span class="charCnt"><em>0</em>/200</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="btn_wrap al_c">
						<a href="#" class="btn btnType1 btnSizeS"><span>추가</span></a>
						<a href="recPlace_management.html" class="btn btnType2 btnSizeS"><span>취소</span></a>
					</div>
				</div>
			</div>
			<!-- //contet -->
		</div>
	</div>
	
</body>
</html>