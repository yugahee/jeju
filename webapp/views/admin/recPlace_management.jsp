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
				<div class="listSearch">
					<div class="listTit">추천장소 관리</div>
					<div class="selectbox">
						<button class="title" type="button" title="분류">분류</button>
						<ul class="selList" style="max-height: 0px; display: none;">
							<li>
								<input type="radio" value="" class="option" id="select_user0" name="select_user">
								<label for="select_user0">전체</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user1" name="select_user">
								<label for="select_user1">식당</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user2" name="select_user">
								<label for="select_user2">카페</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_user3" name="select_user">
								<label for="select_user3">관광</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button" title="검색 조건">검색 조건</button>
						<ul class="selList" style="max-height: 0px; display: none;">
							<li>
								<input type="radio" value="" class="option" id="select_search_op1" name="select_search_op">
								<label for="select_search_op1">장소명</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op2" name="select_search_op">
								<label for="select_search_op1">키워드</label>
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
				<div class="tblType3 noBorT noBorB boardList recPlace">
					<table summary="추천장소 테이블">
						<caption>추천장소 테이블</caption>
						<colgroup>
							<col width="8%">
							<col width="8%">
							<col width="15%">
							<col width="*">
							<col width="8%">
							<col width="8%">
							<col width="10%">
							<col width="8%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>분류</th>
								<th>장소명</th>
								<th>키워드</th>
								<th>추천</th>
								<th>평점</th>
								<th>등록일</th>
								<th>노출여부</th>
								<th>
                                    <span class="inp_check allChk">
                                        <input type="checkbox" name="chk1" id="chk1_1">
                                        <label for="chk1_1"></label>
                                    </span>
                                </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="${contextPath }/admin/recPlace_mod">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
							<tr>
								<td>190</td>
								<td>식당</td>
								<td><a class="active" href="recPlace_modify_management.html">식당이름이요</a></td>
								<td>#맛집 #분위기 #가성비 #갓성비</td>
								<td>45</td>
								<td>4.6</td>
								<td>2021.10.15</td>
								<td>Y</td>
								<td>
                                    <span class="inp_check">
                                        <input type="checkbox" name="chk1" id="chk1_2">
                                        <label for="chk1_2"></label>
                                    </span>
                                </td>
							</tr>
						</tbody>
					</table>
				</div>
                <div class="btn_wrap recPlace">
                    <a href="${contextPath }/admin/recPlace_add" class="btn btnType1 btnSizeS"><span>추가</span></a>
                    <a href="#" class="btn btnType2 btnSizeS"><span>삭제</span></a>
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
	
</body>
</html>