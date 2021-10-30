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
				<li><a class="active" href="<%= request.getContextPath() %>/admin/roomsMg">숙소 관리</a></li>
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
				<div class="listSearch">
					<div class="listTit">숙소 관리</div>
					<div class="selectbox">
						<button class="title" type="button" title="상태">상태</button>
						<ul class="selList" style="max-height: 0px; display: none;">
							<li>
								<input type="radio" value="" class="option" id="select_user0" name="select_user">
								<label for="select_user0">전체</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user1" name="select_user">
								<label for="select_user1">미완성</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user2" name="select_user">
								<label for="select_user2">대기</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user3" name="select_user">
								<label for="select_user3">반려</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user4" name="select_user">
								<label for="select_user4">등록</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button" title="검색 조건">검색 조건</button>
						<ul class="selList" style="max-height: 0px; display: none;">
							<li>
								<input type="radio" value="" class="option" id="select_search_op1" name="select_search_op">
								<label for="select_search_op1">아이디</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op2" name="select_search_op">
								<label for="select_search_op1">이름</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op3" name="select_search_op">
								<label for="select_search_op3">숙소명</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op4" name="select_search_op">
								<label for="select_search_op4">키워드</label>
							</li>
						</ul>
					</div>					
					<div class="inp_text search">
						<input type="text" name="" id="" placeholder="검색어를 입력하세요">
						<a href="#" class="btn_sch">검색</a>
					</div>
				</div>
				<div class="listTotal">
					<div class="sortArea">
						<p class="totalCnt">총 32,000건</p>
						<div class="selectbox">
							<button class="title" type="button" title="목록 선택">목록 10개</button>
							<ul class="selList" style="max-height: 0px; display: none;">
								<li>
									<input type="radio" value="" class="option" id="sel1_1" name="select1" checked="checked">
									<label for="sel1_1">목록 10개</label>
								</li>
								<li>
									<input type="radio" value="" class="option" id="sel1_2" name="select1">
									<label for="sel1_2">목록 20개</label>
								</li>
								<li>
									<input type="radio" value="" class="option" id="sel1_3" name="select1">
									<label for="sel1_3">전체보기</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="tblType3 noBorT noBorB boardList">
					<table summary="숙소 테이블">
						<caption>숙소 테이블</caption>
						<colgroup>
							<col width="8%">
							<col width="10%">
							<col width="8%">
							<col width="*">
							<col width="8%">
							<col width="8%">
							<col width="10%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>호스트 ID</th>
								<th>이름</th>
								<th>숙소명</th>
								<th>상태</th>
								<th>평점</th>
								<th>승인완료</th>
								<th>인증완료</th>
							</tr>
						</thead>
						<tbody>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
							<tr onclick="showLayer('roomsPop')">
								<td>190</td>
								<td>hosthost</td>
								<td>호스트맨</td>
								<td>어서와요 제주의 방 어서와요 제주의 방</td>
								<td>등록</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="paging">
					<span class="first"><a href="#"><span class="blind">첫페이지</span></a></span>
					<span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
					<a href="#">1</a>
					<span class="current">2</span>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
					<span class="last"><a href="#"><span class="blind">마지막페이지</span></a></span>
				</div>
			</div>
			<!-- //contet -->
		</div>
	</div>
	
	<!-- 팝업 -->
	<div id="roomsPop" class="layerPop">
		<div class="layerTit">
			<h4>숙소 관리</h4>
			<button class="btn_closeLayer" onclick="hideLayer('roomsPop');"><span class="blind">레이어팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="tblType2 noBorder">
				<table>
					<caption></caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>숙소명</th>
							<td>어서와요 제주의 방 어서와요 제주의 방</td>
						</tr>
						<tr>
							<th>호스트 ID</th>
							<td>hosthost</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>호스트맨</td>
						</tr>
						<tr>
							<th>숙소 정보</th>
							<td>숙소종류 숙소시설 가격 기준인원 최대인원 입실시간 퇴실시간 승인날짜 상태 호스트 방 개수 침대 수 욕실 수 건물유형 건물평수 최소숙박일수 최대숙박일수</td>
						</tr>
						<tr>
							<th>입금 정보</th>
							<td>입금자명 은행명 계좌번호</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<div class="selectbox">
									<button class="title" type="button" title="상태">상태</button>
									<ul class="selList">
										<li>
											<input type="radio" value="" class="option" id="sel1_1" name="select1" checked="checked" />
											<label for="sel1_1">미완성</label>
										</li>
										<li>
											<input type="radio" value="" class="option" id="sel1_2" name="select1" />
											<label for="sel1_2">대기</label>
										</li>
										<li>
											<input type="radio" value="" class="option" id="sel1_3" name="select1" />
											<label for="sel1_3">반려/중지</label>
										</li>
										<li>
											<input type="radio" value="" class="option" id="sel1_4" name="select1" />
											<label for="sel1_4">등록</label>
										</li>
									</ul>
								</div>
							</td>
						</tr>
						<!-- 반려/중지 선택 시 -->
						<tr>
							<th>반려/중지<br>이유</th>
							<td>
                                <div class="textbox">
                                    <textarea class="chatArea">안녕하세요. 해당 숙소는 반려되었습니다. 사유는 다음과 같습니다.</textarea>
                                    <span class="charCnt"><em class="update">0</em>/200</span>
                                </div>
                            </td>
						</tr>
					</tbody>
				</table>
			</div>			
			<div class="btn_wrap">
                <a href="#" class="btn btnType1 btnSizeM"><span>적용</span></a>
				<a href="#none" class="btn btnType2 btnSizeM" onclick="hideLayer('roomsPop');"><span>취소</span></a>
            </div>
		</div> 
	</div>
	
    <script>
    	let content = document.querySelector(".chatArea");
        content.onkeyup = function(){
            let area1 = document.querySelector(".update ");
            let val = content.value.length;
            console.log(val);
            area1.innerHTML = val;
        };
    </script>
</body>
</html>