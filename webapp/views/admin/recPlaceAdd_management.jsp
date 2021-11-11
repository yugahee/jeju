<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
    
</head>
<body>	
<% if(session.getAttribute("message") != null) { %>
<script>
	alert('<%= session.getAttribute("message")  %>');
</script>
<% 
	session.removeAttribute("message");
} %>
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
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>
			<div class="content">
				<div class="recPlaceArea">
					<div class="con">
						<div class="listTit">추천장소 정보 추가</div>
						<div class="tblType2 noBorder">
						<form name="submitData" method="post" action="${contextPath}/admin/recPlace_add" enctype="multipart/form-data">
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
										<td>자동생성</td>
										<th>노출여부</th>
										<td>
											<div class="selectbox">
												<button class="title" type="button" title="선택">선택</button>
												<ul class="selList">
													<li>
														<input type="radio" value="Y" class="option" id="sel1_1" name="select1">
														<label for="sel1_1">노출</label>
													</li>
													<li>
														<input type="radio" value="N" class="option" id="sel1_2" name="select1">
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
												<ul class="selList">
													<li>
														<input type="radio" value="1" class="option" id="sel2_1" name="select2">
														<label for="sel2_1">동부</label>
													</li>
													<li>
														<input type="radio" value="2" class="option" id="sel2_2" name="select2">
														<label for="sel2_2">서부</label>
													</li>
													<li>
														<input type="radio" value="3" class="option" id="sel2_3" name="select2">
														<label for="sel2_3">남부</label>
													</li>
													<li>
														<input type="radio" value="4" class="option" id="sel2_4" name="select2">
														<label for="sel2_4">북부</label>
													</li>
												</ul>
											</div>
										</td>
										<th>분류</th>
										<td>
											<div class="selectbox">
												<button class="title" type="button" title="선택">선택</button>
												<ul class="selList">
													<li>
														<input type="radio" value="1" class="option" id="sel3_1" name="select3">
														<label for="sel3_1">관광지</label>
													</li>
													<li>
														<input type="radio" value="2" class="option" id="sel3_2" name="select3">
														<label for="sel3_2">식당</label>
													</li>
													<li>
														<input type="radio" value="3" class="option" id="sel3_3" name="select3">
														<label for="sel3_3">카페</label>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th>장소명</th>
										<td>
											<div class="inp_text">
												<input type="text" name="recoName">
											</div>
										</td>
										<th>위치</th>
										<td>
											<div class="inp_text">
												<input type="text" name="recoAddress">
											</div>
										</td>
									</tr>
									<tr style="height: 150px;">
										<th>이미지</th>
										<td>
											<div class="inp_text">
												<input type="file" name="uploadName" accept="image/*" onchange="loadFile(event)">
											</div>
											<script>
												$("#output").hide();
												var loadFile = function(event) {
													var reader = new FileReader();
													reader.onload = function(){
														$("#output").show();
														var output = document.getElementById('output');
														output.src = reader.result;
													};
													reader.readAsDataURL(event.target.files[0]);
												};
											</script>
										</td>
										<td colspan="2">
											<img id="output" src="">
										</td>
									</tr>
									<tr>
										<th>네이버맵 URL</th>
										<td>
											<div class="inp_text">
												<input type="text" name="naverMap">
											</div>
										</td>
										<th>카카오맵 URL</th>
										<td>
											<div class="inp_text">
												<input type="text" name="kakaoMap">
											</div>
										</td>
									</tr>
									<tr>
										<th>지도 api 주소</th>
										<td>
											<div class="inp_text">
												<input class="readOnly" readonly type="text" value="준비중">
											</div>
										</td>
										<th>키워드</th>
										<td>
											<div class="inp_text">
												<input type="text" name="recoKeyword">
											</div>
										</td>
									</tr>
									<tr>
										<th>정보</th>
										<td colspan="3">
			                                <div class="textbox">
			                                    <textarea name="recoExpl" class="chatArea" placeholder="내용"></textarea>
			                                    <span class="charCnt"><em class="update">0</em>/200</span>
			                                </div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
						</div>
					</div>
					<div class="btn_wrap al_c">
						<a href="#none" onclick="return submit();" class="btn btnType1 btnSizeS"><span>저장</span></a>
						<a href="${contextPath}/admin/recPlaceMg" class="btn btnType2 btnSizeS"><span>취소</span></a>
					</div>
				</div>
			</div>
			<!-- //contet -->
		</div>
	</div>
	
	<script>
	// textarea 글자 수
	let content = document.querySelector(".chatArea");
    let area1 = document.querySelector(".update ");
    let val = content.value.length;
    area1.innerHTML = val;
   	if(val > 200){
   		area1.style.color = 'red';
   	}else{
   		area1.style.color = '#222';
   	}
    content.onkeyup = function(){
        let val = content.value.length;
        area1.innerHTML = val;
       	if(val > 200){
       		area1.style.color = 'red';
       	}else{
       		area1.style.color = '#222';
       	}
    };
    function submit(){
    	let val = content.value.length;
    	if($('input[name="uploadName"]').val() == ''){
       		alert('이미지는 꼭 넣어야 됩니다😵');
       		return false;
    	}
       	if(val > 200){
       		alert('글자수 확인! 200자가 넘은 글자는 삭제됩니다😵');
       		let a = content.value.substr(0,200);
       		content.value = a;
       		area1.innerHTML = 200;
       		area1.style.color = '#222';
       		content.focus();
       		return false;
       	}else{
       		document.submitData.submit();
       	}
    }
	</script>
</body>
</html>