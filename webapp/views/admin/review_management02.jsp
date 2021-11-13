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
					<a class="active" href="#none">후기 관리</a>
					<ul class="subMenu">
						<li><a href="<%= request.getContextPath() %>/admin/revwMg01">숙소 후기 관리</a></li>
						<li><a class="active" href="<%= request.getContextPath() %>/admin/revwMg02">추천장소 후기 관리</a></li>
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
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>
			<c:if test="${ !empty param.searchCondition && !empty param.searchCondition2 }">
				<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchCondition2=${ param.searchCondition2 }&searchValue=${ param.searchValue }"/>
			</c:if>	
			<div class="content">
				<div class="listSearch">
					<div class="listTit">추천장소 후기 관리</div>
					<form method="get" action="${contextPath}/admin/revwMg02">
						<div class="selectbox">
							<button class="title" type="button">
								<c:if test="${ param.searchCondition == null }">카테고리</c:if>
								<c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>								
							</button>
							<input class="inputVal" type="hidden" name="searchCondition" value="<c:if test="${ param.searchCondition == null }">전체</c:if><c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>">
							<ul class="selList" id="searchCondition">
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
								<c:if test="${ param.searchCondition2 == null }">검색조건</c:if>
								<c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>
							</button>
							<input class="inputVal" type="hidden" name="searchCondition2" value="<c:if test="${ param.searchCondition2 == null }">장소명</c:if><c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>">
							<ul class="selList" id="searchCondition2">
								<li>
									<input class="option" type="radio" id="sel_type2_1" <c:if test="${ param.searchCondition2 == '장소명' }">checked="checked"</c:if>>
									<label for="sel_type2_1">장소명</label>
								</li>
								<li>
									<input class="option" type="radio" id="sel_type2_2" <c:if test="${ param.searchCondition2 == 'ID' }">checked="checked"</c:if>>
									<label for="sel_type2_2">ID</label>
								</li>
							</ul>
						</div>
						<div class="inp_text search">
							<input type="text" name="searchValue" value="${ param.searchValue }" placeholder="검색어를 입력하세요">
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
					<table summary="추천장소 후기 테이블">
						<caption>추천장소 후기 테이블</caption>
						<colgroup>
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="15%">
							<col width="*">
							<col width="8%">
							<col width="6%">
							<col width="10%">
							<col width="6%">
						</colgroup>
						<thead>
							<tr>
								<th>리뷰번호</th>
								<th>분류</th>
								<th>지역</th>
								<th>장소명</th>
								<th>내용</th>
								<th>작성자</th>
								<th>별점</th>
								<th>작성시간</th>
								<th>상태</th><!-- 상태값 컬럼 추가해야 됨 -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rReview" items="${ RRList }">
							<tr onclick="showLayer('recRvPop'); rDetail(${rReview.recoReviewNo});">
								<td style="display:none;"><input type="hidden" value="${rReview.recoReviewNo}"></td>
								<td>${rReview.recoReviewNo}</td>
								<td>
									<c:if test="${rReview.rCate == 1}">관광지</c:if>
									<c:if test="${rReview.rCate == 2}">식당</c:if>
									<c:if test="${rReview.rCate == 3}">카페</c:if>
								</td>
								<td>
									<c:if test="${rReview.rArea == 1}">동부</c:if>
									<c:if test="${rReview.rArea == 2}">서부</c:if>
									<c:if test="${rReview.rArea == 3}">남부</c:if>
									<c:if test="${rReview.rArea == 4}">북부</c:if>
								</td>
								<td>${rReview.rName}</td>
								<td>${rReview.sComment}</td>
								<td>${rReview.userId}</td>
								<td>${rReview.score}</td>
								<td>
									<fmt:formatDate value="${rReview.writeTime}" type="both" pattern="yyyy.MM.dd"/>
										<br>
									<fmt:formatDate value="${rReview.writeTime}" type="both" pattern="HH:mm:ss"/>
								</td>
								<td>${rReview.publicYn}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="paging">
					<span class="first">
						<a href="${contextPath}/admin/revwMg02?page=1${searchParam}">
							<span class="blind">첫페이지</span>
						</a>
					</span>
					<span class="prev">
						<c:choose>
						<c:when test="${pi.page > 1 }">				
						<a href="${contextPath }/admin/revwMg02?page=${pi.page -1}${searchParam}">
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
						<a href="${contextPath}/admin/revwMg02?page=${ p }${searchParam}">${ p }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<span class="next">
						<c:choose>
						<c:when test="${ pi.page < pi.maxPage }">				
						<a href="${contextPath }/admin/revwMg02?page=${pi.page + 1}${searchParam}">
						<span class="blind">다음페이지</span></a>
						</c:when>
						<c:otherwise>						
						<a href="#none">
						<span class="blind">다음페이지</span></a>
						</c:otherwise>
						</c:choose>
					</span>
					<span class="last">
						<a href="${contextPath }/admin/revwMg02?page=${pi.maxPage }${searchParam}">
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
	<div id="recRvPop" class="layerPop">
		<div class="layerTit">
			<h4>후기 상태 변경</h4>
			<button class="btn_closeLayer" onclick="hideLayer('recRvPop');"><span class="blind">레이어팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="tblType2 noBorder">
				<table>
					<caption></caption>
					<colgroup>
						<col width="20%;">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>후기번호</th>
							<td id="rNo">123456</td>
						</tr>
						<tr>
							<th>ID</th>
							<td id="rUserid">useruser01</td>
						</tr>
						<tr>
							<th>별점</th>
							<td>
                                <div class="rating_star" id="rStar">
                                    <span class="starPoint p5">5</span>
                                </div>
                            </td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
                                <div class="textbox">
                                    <textarea id="rComment" class="readOnly" readonly>정말 강추합니다! 다음번 여행에도 갈 계획을 가지고 있어요 사실 뻥입니다</textarea>
                                </div>
                            </td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<div id="rStatus" class="selectbox">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>			
			<div class="btn_wrap">
                <a href="javascript:void(0);" onclick="stateUpdate(); hideLayer('recRvPop');" class="btn btnType1 btnSizeM"><span>적용</span></a>
				<a href="javascript:void(0);" onclick="hideLayer('recRvPop');" class="btn btnType2 btnSizeM"><span>취소</span></a>
            </div>
		</div> 
	</div>
	<script>
		function rDetail(rno){
			$.ajax({
				url : "${contextPath}/admin/RRDetail",
				data : {rno : rno},
				dataType : "json",
				type : "post",
				success : function(result){
					document.getElementById("rNo").innerText = result.recoReviewNo;
					document.getElementById("rUserid").innerText = result.userId;
					document.getElementById("rComment").innerText = result.sComment;
					// 별점
					let starHtml = "";					
					if(result.score == 1){
						starHtml = '<span class="starPoint p1">1</span>';
					}else if(result.score == 2){
						starHtml = '<span class="starPoint p2">2</span>';
					}else if(result.score == 3){
						starHtml = '<span class="starPoint p3">3</span>';
					}else if(result.score == 4){
						starHtml = '<span class="starPoint p4">4</span>';
					}else{
						starHtml = '<span class="starPoint p5">5</span>';
					}					
					document.getElementById("rStar").innerHTML = starHtml;

					//상태
					let stateHtml = "";					
					if(result.publicYn == "Y"){
						stateHtml = '<button class="title" type="button" title="상태" id="rState">노출</button>'
							+ '<ul class="selList">'
							+ '<li><input type="radio" value="Y" class="option" id="sel1_1" name="reviewState" checked="checked" /><label for="sel1_1">노출</label></li>'
							+ '<li><input type="radio" value="N" class="option" id="sel1_2" name="reviewState" /><label for="sel1_2">비노출</label></li>'						
							+ '</ul>';
					}else{
						stateHtml = '<button class="title" type="button" title="상태" id="rState">비노출</button>'
							+ '<ul class="selList">'
							+ '<li><input type="radio" value="Y" class="option" id="sel1_1" name="reviewState" /><label for="sel1_1">노출</label></li>'
							+ '<li><input type="radio" value="N" class="option" id="sel1_2" name="reviewState" checked="checked" /><label for="sel1_2">비노출</label></li>'						
							+ '</ul>';
					}					
					document.getElementById("rStatus").innerHTML = stateHtml;					
				},
				error : function(e){
					console.log(e);
				}
			});		
		}
		
		function stateUpdate(){
			$.ajax({
				url : "${contextPath}/admin/RRUpdate",
				data : {rno : $("#rNo").text(),
						rstate : $("input[name='reviewState']:checked").val()
				},
				dataType : "json",
				type : "post",
				success : function(result){	
					if(result == "success"){
						alert("성공적으로 적용되었습니다.");
						location.reload();
					}else{
						alert("업데이트가 되지 않았습니다");
					}
				},
				error : function(e){
					console.log(e);
				}
			});
		}
		
	</script>
</body>
</html>