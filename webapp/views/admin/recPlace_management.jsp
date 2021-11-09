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
			<c:if test="${ !empty param.searchCondition && !empty param.searchCondition2 }">
				<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchCondition2=${ param.searchCondition2 }&searchValue=${ param.searchValue }"/>
			</c:if>
			<div class="content">
				<div class="listSearch">
					<div class="listTit">추천장소 관리</div>
					<form method="get" action="${ contextPath }/admin/recPlaceMg">
					<div class="selectbox">
						<button class="title" type="button">
							<c:if test="${ param.searchCondition == null }">전체</c:if>
							<c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>								
						</button>
						<input class="inputVal" type="hidden" name="searchCondition" value="<c:if test="${ param.searchCondition == null }">전체</c:if><c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>">
						<ul class="selList" id="searchCondition" style="max-height: 0px; display: none;">
							<li>
								<input class="option" type="radio" id="sel_type1_1" <c:if test="${ param.searchCondition == '전체' }">checked="checked"</c:if>>
								<label for="sel_type1_1">전체</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_2" <c:if test="${ param.searchCondition == '관광지' }">checked="checked"</c:if>>
								<label for="sel_type1_2">관광지</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_3" <c:if test="${ param.searchCondition == '식당' }">checked="checked"</c:if>>
								<label for="sel_type1_3">식당</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_4" <c:if test="${ param.searchCondition == '카페' }">checked="checked"</c:if>>
								<label for="sel_type1_4">카페</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button">
							<c:if test="${ param.searchCondition2 == null }">장소명</c:if>
							<c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>
						</button>
						<input class="inputVal" type="hidden" name="searchCondition2" value="<c:if test="${ param.searchCondition2 == null }">장소명</c:if><c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>">
						<ul class="selList" id="searchCondition2" style="max-height: 0px; display: none;">
							<li>
								<input class="option" type="radio" id="sel_type2_1" <c:if test="${ param.searchCondition2 == '장소명' }">checked="checked"</c:if>>
								<label for="sel_type2_1">장소명</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type2_2" <c:if test="${ param.searchCondition2 == '키워드' }">checked="checked"</c:if>>
								<label for="sel_type2_2">키워드</label>
							</li>
						</ul>
					</div>
					<div class="inp_text search">
						<input type="text" name="searchValue" value="${ param.searchValue }" placeholder="값을 입력하세요">
						<button type="submit" class="btn_sch">검색</button>
					</div>
				</form>
				</div>
				<div class="listTotal">
					<div class="sortArea">
						<p class="totalCnt">총 ${listCount} 개</p>
					</div>
				</div>
				<c:choose>
				<c:when test="${listCount != 0 }">
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
				</c:when>
				<c:otherwise>
				<div class="noData">
	                <p>해당 정보가 없습니다</p>
	                <p class="subtxt">새로운 검색어를 입력해주세요</p>
	            </div>
				</c:otherwise>
				</c:choose>
			</div>
			<!-- //contet -->
		</div>
	</div>
	
</body>
</html>