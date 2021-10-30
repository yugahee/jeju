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
					<a href="#none" class="active">회원 관리</a>
					<ul class="subMenu">
						<li><a href="<%= request.getContextPath() %>/admin/userMg01">회원 관리</a></li>
						<li><a class="active" href="<%= request.getContextPath() %>/admin/userMg02">블랙리스트 관리</a></li>
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
				<div class="listSearch">
					<div class="listTit">블랙리스트 관리</div>
					<div class="selectbox">
						<button class="title" type="button" title="회원분류">전체</button>
						<ul class="selList" style="max-height: 0px; display: none;">
							<li>
								<input type="radio" value="" class="option" id="select_user0" name="select_user">
								<label for="select_user0">전체</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user1" name="select_user">
								<label for="select_user1">호스트</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user2" name="select_user">
								<label for="select_user2">게스트</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button" title="검색 조건">아이디</button>
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
								<label for="select_search_op3">이메일</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op4" name="select_search_op">
								<label for="select_search_op4">전화번호</label>
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
					<table summary="회원 테이블">
						<caption>회원 테이블</caption>
						<colgroup>
							<col width="4%">
							<col width="10%">
							<col width="8%">
							<col width="*">
							<col width="12%">
							<col width="6%">
							<col width="7%">
							<col width="9%">
							<col width="9%">
							<col width="5%">
							<col width="5%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>포인트</th>
								<th>회원분류</th>
								<th>가입일</th>
								<th>최종접속일</th>
								<th>신고</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr onclick="showLayer('blackUserPop')">
								<td>1</td>
								<td>user1</td>
								<td>안나현</td>
								<td>email1@gmail.com</td>
								<td>010-4123-6554</td>
								<td>0</td>
								<td>호스트</td>
								<td>2021.10.15</td>
								<td>2021.10.15</td>
								<td>5</td>
								<td>정상</td>
							</tr>
							<tr onclick="showLayer('blackUserPop')">
								<td>2</td>
								<td>user2</td>
								<td>류상훈</td>
								<td>email2@gmail.com</td>
								<td>010-4143-2554</td>
								<td>1000</td>
								<td>게스트</td>
								<td>2021.10.13</td>
								<td>2021.10.16</td>
								<td>5</td>
								<td>블랙</td>
							</tr>
							<tr onclick="showLayer('blackUserPop')">
								<td>3</td>
								<td>user3</td>
								<td>유가희</td>
								<td>email3@gmail.com</td>
								<td>010-5543-1554</td>
								<td>5000</td>
								<td>게스트</td>
								<td>2020.10.13</td>
								<td>2020.10.20</td>
								<td>5</td>
								<td>휴면</td>
							</tr>
							<tr onclick="showLayer('blackUserPop')">
								<td>4</td>
								<td>user4</td>
								<td>이지희</td>
								<td>email4@gmail.com</td>
								<td>010-9243-2854</td>
								<td>0</td>
								<td>호스트</td>
								<td>2021.09.12</td>
								<td>2021.10.28</td>
								<td>5</td>
								<td>정상</td>
							</tr>
							<tr onclick="showLayer('blackUserPop')">
								<td>5</td>
								<td>user5</td>
								<td>이효은</td>
								<td>email5@gmail.com</td>
								<td>010-3581-1513</td>
								<td>0</td>
								<td>게스트</td>
								<td>2021.08.22</td>
								<td>2021.10.30</td>
								<td>5</td>
								<td>정상</td>
							</tr>
							<tr onclick="showLayer('blackUserPop')">
								<td>6</td>
								<td>user6</td>
								<td>정온화</td>
								<td>email6@gmail.com</td>
								<td>010-8151-5148</td>
								<td>0</td>
								<td>게스트</td>
								<td>2021.08.31</td>
								<td>2021.10.18</td>
								<td>5</td>
								<td>정상</td>
							</tr>
							<tr onclick="showLayer('blackUserPop')">
								<td>7</td>
								<td>helloeveryone</td>
								<td>네글자인</td>
								<td>emailaddress7@gmail.com</td>
								<td>010-9999-8888</td>
								<td>0</td>
								<td>게스트</td>
								<td>2021.08.31</td>
								<td>2021.10.18</td>
								<td>5</td>
								<td>탈퇴</td>
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
	<div id="blackUserPop" class="layerPop">
		<div class="layerTit">
			<h4>신고 내역</h4>
			<button class="btn_closeLayer" onclick="hideLayer('blackUserPop');"><span class="blind">레이어팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="total">신고횟수 <span>5</span>회</div>
			<div class="tblType2 noBorder">
				<table>
					<colgroup>
						<col style="width:20%;">
						<col style="width:*;">
					</colgroup>
					<tbody>
						<tr>
							<th>신고자</th>
							<td>us*****</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>시간을 안지켜요</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>잠을 하루종일 자는지 체크아웃 시간을 지키지 않고 방을 너무 더럽게 썼어요. 애완동물 불가 숙소인데 사방에 온통 개털이 날리고 심각하네요.</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>신고자</th>
							<td>us*****</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>시간을 안지켜요</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>잠을 하루종일 자는지 체크아웃 시간을 지키지 않고 방을 너무 더럽게 썼어요. 애완동물 불가 숙소인데 사방에 온통 개털이 날리고 심각하네요.</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>신고자</th>
							<td>us*****</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>시간을 안지켜요</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>잠을 하루종일 자는지 체크아웃 시간을 지키지 않고 방을 너무 더럽게 썼어요. 애완동물 불가 숙소인데 사방에 온통 개털이 날리고 심각하네요.</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>신고자</th>
							<td>us*****</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>시간을 안지켜요</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>잠을 하루종일 자는지 체크아웃 시간을 지키지 않고 방을 너무 더럽게 썼어요. 애완동물 불가 숙소인데 사방에 온통 개털이 날리고 심각하네요.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tblType2 noBorder">
				<table>
					<caption></caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:*;">
					</colgroup>
					<tbody>
						<tr>
							<th>신고횟수</th>
							<td>
								<div class="inp_qty">
									<button type="button" onclick="qtyDown(this)" title="수량감소">
										<img src="../resources/images/common/qty_down.gif" alt="수량감소">
									</button>
									<input type="text" title="선택품목갯수" value="5">
									<button type="button" onclick="qtyUp(this)" title="수량추가">
										<img src="../resources/images/common/qty_up.gif" alt="수량추가">
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<div class="selectbox">
									<button class="title" type="button" title="상태">상태</button>
									<ul class="selList">
										<li>
											<!-- 셀렉트바 초기 선택 표기 -->
											<input type="radio" value="" class="option" id="sel1_1" name="select1" checked="checked" />
											<label for="sel1_1">정상</label>
										</li>
										<li>
											<input type="radio" value="" class="option" id="sel1_2" name="select1" />
											<label for="sel1_2">휴면</label>
										</li>
										<li>
											<input type="radio" value="" class="option" id="sel1_3" name="select1" />
											<label for="sel1_3">탈퇴</label>
										</li>
										<li>
											<input type="radio" value="" class="option" id="sel1_4" name="select1" />
											<label for="sel1_4">블랙</label>
										</li>
									</ul>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
                <a href="#" class="btn btnType1 btnSizeM"><span>적용</span></a>
				<a href="#" class="btn btnType2 btnSizeM"><span>취소</span></a>
            </div>
		</div> 
	</div>
</body>
</html>