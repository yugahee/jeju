<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
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
				<li><a class="active" href="<%= request.getContextPath() %>/admin/resvMg">예약 관리</a></li>
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
			<c:if test="${ !empty param.searchCondition && !empty param.searchCondition2 && !empty param.searchValue && !empty param.startDate && !empty param.endDate }">
				<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchCondition2=${ param.searchCondition2 }&searchValue=${ param.searchValue }&startDate=${param.startDate}&endDate=${param.endDate}"/>
			</c:if>
			<div class="content">
				<div class="listSearch">
					<div class="listTit">예약 관리</div>
					<form method="get" action="${ contextPath }/admin/resvMg">
	                    <!-- <div class="calendar">
	                        <p class="ctit">기간 검색</p>
	                        <div class="inp_text">
	                            <input type="date" name="startDate" > ~ <input type="date" name="endDate">
	                        </div>
	                    </div> -->
						<div class="selectbox">
							<button class="title" type="button" title="예약상태">
								<c:if test="${ param.searchCondition == null }">전체</c:if>
								<c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>
							</button>
							<ul class="selList" style="max-height: 0px; display: none;">
								<li>
									<input type="radio" value="전체" class="option" id="select_res0" name="searchCondition" <c:if test="${ param.searchCondition == '전체' }">checked="checked"</c:if>>
									<label for="select_res0">전체</label>
								</li>
								<li>
									<input type="radio" value="예약신청" class="option" id="select_res1" name="searchCondition" <c:if test="${ param.searchCondition == '예약신청' }">checked="checked"</c:if>>
									<label for="select_res1">예약신청</label>
								</li>
								<li>
									<input type="radio" value="결제대기" class="option" id="select_res2" name="searchCondition" <c:if test="${ param.searchCondition == '결제대기' }">checked="checked"</c:if>>
									<label for="select_res2">결제대기</label>
								</li>
								<li>
									<input type="radio" value="예약완료" class="option" id="select_res1" name="searchCondition" <c:if test="${ param.searchCondition == '예약완료' }">checked="checked"</c:if>>
									<label for="select_res1">예약완료</label>
								</li>
								<li>
									<input type="radio" value="예약취소" class="option" id="select_res3" name="searchCondition" <c:if test="${ param.searchCondition == '예약취소' }">checked="checked"</c:if>>
									<label for="select_res3">예약취소</label>
								</li>
								<li>
									<input type="radio" value="숙박완료" class="option" id="select_res4" name="searchCondition" <c:if test="${ param.searchCondition == '숙박완료' }">checked="checked"</c:if>>
									<label for="select_res4">숙박완료</label>
								</li>								
							</ul>
						</div>
						<div class="selectbox">
							<button class="title" type="button" title="검색 조건">검색 조건</button>
							<ul class="selList" style="max-height: 0px; display: none;">														
								<li>
									<input type="radio" value="예약번호" class="option" id="select_search_op1" name="searchCondition2" <c:if test="${ param.searchCondition2 == '예약번호' }">checked="checked"</c:if>>
									<label for="select_search_op1">예약번호</label>
								</li>								
								<li>
									<input type="radio" value="호스트ID" class="option" id="select_search_op3" name="searchCondition2" <c:if test="${ param.searchCondition2 == '호스트ID' }">checked="checked"</c:if>>
									<label for="select_search_op3">호스트 ID</label>
								</li>
								<li>
									<input type="radio" value="게스트ID" class="option" id="select_search_op4" name="searchCondition2" <c:if test="${ param.searchCondition2 == '게스트ID' }">checked="checked"</c:if>>
									<label for="select_search_op4">게스트 ID</label>
								</li>
							</ul>
						</div>					
						<div class="inp_text search">
							<input type="text" name="searchValue" id="searchValue" placeholder="검색어를 입력하세요">
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
				<div class="tblType3 noBorT noBorB boardList">
					<table summary="예약 테이블">
						<caption>예약 테이블</caption>
						<colgroup>
							<col width="8%">
							<col width="*">
							<col width="10%">
							<col width="12%">
							<col width="6%">
							<col width="10%">
							<col width="12%">
							<col width="12%">
							<col width="9%">
						</colgroup>
						<thead>
							<tr>
								<th>예약번호</th>								
								<th>숙소명</th>
								<th>호스트ID</th>
								<th>예약 상태</th>
								<th>인원</th>
								<th>게스트ID</th>
								<th>게스트<br>전화번호</th>
								<th>결제시간</th>
								<th>결제금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reserve" items="${ reserveList }" varStatus="status">
							<tr onclick="showLayer('reservPop'); selectReserve(${ reserve.room_reserve })">
								<td>${ reserve.room_reserve }</td>								
								<td>${ reserve.room_info.roomName }</td>
								<td>${ reserve.room_info.userId }</td>
								<td>${ reserve.reserve_state }</td>
								<td>${ reserve.reserve_num }</td>
								<td>${ reserve.guest }</td>
								<td>${ reserve.pone }</td>
								<td>
									<c:choose>
										<c:when test="${ reserve.payment_info.payDate != null}">
											<fmt:formatDate value="${ reserve.payment_info.payDate }" type="both" pattern="yyyy.MM.dd HH:mm:ss"/>											
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${ reserve.payment_info.price != 0}">
											<fmt:formatNumber value="${ reserve.payment_info.price }" groupingUsed="true" />											
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>				
						</tbody>
					</table>
				</div>
				<div class="paging">
					<span class="first">
						<a href="${contextPath}/admin/resvMg?page=1${searchParam}">
							<span class="blind">첫페이지</span>
						</a>
					</span>
					<span class="prev">
						<c:choose>
						<c:when test="${pi.page > 1 }">				
						<a href="${contextPath }/admin/resvMg?page=${pi.page -1}${searchParam}">
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
						<a href="${contextPath}/admin/resvMg?page=${ p }${searchParam}">${ p }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<span class="next">
						<c:choose>
						<c:when test="${ pi.page < pi.maxPage }">				
						<a href="${contextPath }/admin/resvMg?page=${pi.page + 1}${searchParam}">
						<span class="blind">다음페이지</span></a>
						</c:when>
						<c:otherwise>						
						<a href="#none">
						<span class="blind">다음페이지</span></a>
						</c:otherwise>
						</c:choose>
					</span>
					<span class="last">
						<a href="${contextPath }/admin/resvMg?page=${pi.maxPage }${searchParam}">
							<span class="blind">마지막페이지</span>
						</a>
					</span>
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
	
	<!-- 팝업 -->
	<div id="reservPop" class="layerPop">
		<div class="layerTit">
			<h4>예약 변경</h4>
			<button class="btn_closeLayer" onclick="hideLayer('reservPop');"><span class="blind">레이어팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="tblType2 noBorder">
				<table>
					<caption></caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:*;">
					</colgroup>
					<tbody>
						<tr>
							<th>예약번호</th>
							<td>123456</td>
						</tr>
						<tr>
							<th>숙소명</th>
							<td>제주라도 넘어갈까 제주라도 넘어갈까</td>
						</tr>
						<tr>
							<th>게스트ID</th>
							<td>user03</td>
						</tr>
						<tr>
							<th>결제 금액</th>
							<td>250,000</td>
						</tr>
						<tr>
							<th>결제 시간</th>
							<td>2021.10.15 08:10:10</td>
						</tr>
						<tr>
							<th>예약 상태</th>
							<td>
								<div class="selectbox">
									<button class="title" type="button" title="상태">상태</button>
									<ul class="selList">
										<li>
											<!-- 셀렉트바 초기 선택 표기 -->
											<input type="radio" value="예약신청" class="option" id="sel1_1" name="select1" checked="checked" />
											<label for="sel1_1">예약신청</label>
										</li>
										<li>
											<input type="radio" value="결제대기" class="option" id="sel1_2" name="select1" />
											<label for="sel1_2">결제대기</label>
										</li>
										<li>
											<input type="radio" value="예약취소" class="option" id="sel1_3" name="select1" />
											<label for="sel1_3">예약취소</label>
										</li>
                                        <!--  -->
										<li>
											<input type="radio" value="예약완료" class="option" id="sel1_4" name="select1" />
											<label for="sel1_4">예약완료</label>
										</li>
										<li>
											<input type="radio" value="숙박완료" class="option" id="sel1_5" name="select1" />
											<label for="sel1_5">숙박완료</label>
										</li>
									</ul>
								</div>
							</td>
						</tr>
						<tr class="price_back" style="display: none;">
							<th>환불금액</th>
                            <td>350,000</td>
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
<script>
	function selectReserve(reserveNo){
		$.ajax({
			url : "${contextPath}/admin/reserveDetail",
			data : {reserveNo : reserveNo},
			dataType : "json",
			type : "post",
			success : function(reserve){					
				
			},
			error : function(e){
				console.log(e);
			}
		});
	}
</script>