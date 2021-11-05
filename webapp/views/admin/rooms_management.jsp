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
						<li><a href="<%= request.getContextPath() %>/admin/roomsMg">회원 관리</a></li>
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
			<c:if test="${ !empty param.searchCondition && !empty param.searchCondition2 }">
				<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchCondition2=${ param.searchCondition2 }&searchValue=${ param.searchValue }"/>
			</c:if>
			<div class="content">
				<div class="listSearch">
					<div class="listTit">숙소 관리</div>
					<form method="get" action="${ contextPath }/admin/roomsMg">
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
								<input class="option" type="radio" id="sel_type1_2" <c:if test="${ param.searchCondition == '승인대기' }">checked="checked"</c:if>>
								<label for="sel_type1_2">승인대기</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_3" <c:if test="${ param.searchCondition == '승인반려' }">checked="checked"</c:if>>
								<label for="sel_type1_3">승인반려</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_4" <c:if test="${ param.searchCondition == '등록완료' }">checked="checked"</c:if>>
								<label for="sel_type1_4">등록완료</label>
							</li>
						</ul>
					</div>
					<div class="inp_text search">
						<input type="text" name="searchValue" value="${ param.searchValue }" placeholder="아이디를 입력하세요">
						<button type="submit" class="btn_sch">검색</button>
					</div>
				</form>
				</div>
				<div class="listTotal">
					<div class="sortArea">
						<p class="totalCnt">총 ${listCount} 개</p>
					</div>
				</div>
				<div class="tblType3 noBorT noBorB boardList">
					<table summary="숙소 테이블">
						<caption>숙소 테이블</caption>
						<colgroup>
							<col width="8%">
							<col width="10%">
							<col width="*">
							<col width="8%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>호스트 ID</th>
								<th>숙소명</th>
								<th>평점</th>
								<th>생성날짜</th>
								<th>승인날짜</th>
								<th>승인상태</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="room" items="${ RoomList }">
							<tr onclick="showLayer('roomsPop'); userdata(this);">
								<td style="display:none;"><input type="hidden" value="${room.user_id}"></td>
								<td>${ room.roomNo }</td>
								<td>${ room.user_id }</td>
								<td>${ room.roomName }</td>
								<td>${ room.star }</td>
								<td><fmt:formatDate value="${ room.createDate }" type="both" pattern="yyyy.MM.dd" /></td>
								<td><fmt:formatDate value="${ room.enrollDate }" type="both" pattern="yyyy.MM.dd" /></td>
								<td>${ room.enrollStatus }</td>
								<td>${ room.status }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="paging">
					<span class="first">
						<a href="${contextPath}/admin/roomsMg?page=1${searchParam}">
							<span class="blind">첫페이지</span>
						</a>
					</span>
					<span class="prev">
						<c:choose>
						<c:when test="${pi.page > 1 }">				
						<a href="${contextPath }/admin/roomsMg?page=${pi.page -1}${searchParam}">
							<span class="blind">이전페이지</span>
						</a>
						</c:when>
						<c:otherwise>						
						<a href="#none">
							<span class="blind">이전페이지</span>
						</a>
						</c:otherwise>
						</c:choose>
					</span>
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">					
					<c:choose>
						<c:when test="${ p eq pi.page }">
						<span class="current">${ p }</span>
						</c:when>
						<c:otherwise>
						<a href="${contextPath}/admin/roomsMg?page=${ p }${searchParam}">${ p }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<span class="next">
						<c:choose>
						<c:when test="${ pi.page < pi.maxPage }">				
						<a href="${contextPath }/admin/roomsMg?page=${pi.page + 1}${searchParam}">
						<span class="blind">다음페이지</span></a>
						</c:when>
						<c:otherwise>						
						<a href="#none">
						<span class="blind">다음페이지</span></a>
						</c:otherwise>
						</c:choose>
					</span>
					<span class="last">
						<a href="${contextPath }/admin/roomsMg?page=${pi.maxPage }${searchParam}">
							<span class="blind">마지막페이지</span>
						</a>
					</span>
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