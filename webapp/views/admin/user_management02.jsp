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
					<a class="active" href="#none">회원 관리</a>
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
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>
			<div class="content">
				<div class="listSearch">
					<div class="listTit">블랙리스트 관리</div>
					<form method="get" action="${ contextPath }/admin/userMg02">
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
									<input class="option" type="radio" id="sel_type1_2" <c:if test="${ param.searchCondition == '호스트' }">checked="checked"</c:if>>
									<label for="sel_type1_2">호스트</label>
								</li>
								<li>
									<input class="option" type="radio" id="sel_type1_3" <c:if test="${ param.searchCondition == '게스트' }">checked="checked"</c:if>>
									<label for="sel_type1_3">게스트</label>
								</li>
							</ul>
						</div>
						<div class="selectbox">
							<button class="title" type="button">
								<c:if test="${ param.searchCondition2 == null }">아이디</c:if>
								<c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>
							</button>
							<input class="inputVal" type="hidden" name="searchCondition2" value="<c:if test="${ param.searchCondition2 == null }">아이디</c:if><c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>">
							<ul class="selList" id="searchCondition2" style="max-height: 0px; display: none;">
								<li>
									<input class="option" type="radio" id="sel_type2_1" <c:if test="${ param.searchCondition2 == '아이디' }">checked="checked"</c:if>>
									<label for="sel_type2_1">아이디</label>
								</li>
								<li>
									<input class="option" type="radio" id="sel_type2_2" <c:if test="${ param.searchCondition2 == '이름' }">checked="checked"</c:if>>
									<label for="sel_type2_2">이름</label>
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
							<c:forEach var="Member" items="${ MemberList }" varStatus="status">
							<tr onclick="showLayer('blackUserPop'); userdata(this);">
								<td style="display:none;"><input type="hidden" value="${Member.user_id}"></td>
								<td>${ status.count }</td>
								<td>${ Member.user_id }</td>
								<td>${ Member.user_name }</td>
								<td>${ Member.email }</td>
								<td>${ Member.phone }</td>
								<td>${ Member.point }</td>
								<td>${ Member.user_type }</td>
								<td><fmt:formatDate value="${ Member.enroll_date }" type="both" pattern="yyyy.MM.dd" /></td>
								<td><fmt:formatDate value="${ Member.modify_date }" type="both" pattern="yyyy.MM.dd" /></td>
								<td style="color:red;">${ Member.report_count }</td>
								<td>${ Member.status }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="paging">
					<span class="first">
						<a href="${contextPath}/admin/userMg02?page=1${searchParam}">
							<span class="blind">첫페이지</span>
						</a>
					</span>
					<span class="prev">
						<c:choose>
						<c:when test="${pi.page > 1 }">				
						<a href="${contextPath }/admin/userMg02?page=${pi.page -1}${searchParam}">
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
						<a href="${contextPath}/admin/userMg02?page=${ p }${searchParam}">${ p }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<span class="next">
						<c:choose>
						<c:when test="${ pi.page < pi.maxPage }">				
						<a href="${contextPath }/admin/userMg02?page=${pi.page + 1}${searchParam}">
						<span class="blind">다음페이지</span></a>
						</c:when>
						<c:otherwise>						
						<a href="#none">
						<span class="blind">다음페이지</span></a>
						</c:otherwise>
						</c:choose>
					</span>
					<span class="last">
						<a href="${contextPath }/admin/userMg02?page=${pi.maxPage }${searchParam}">
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
	<div id="blackUserPop" class="layerPop" style="min-height:600px;">
		<div class="layerTit">
			<h4>신고 내역</h4>
			<button class="btn_closeLayer" onclick="hideLayer('blackUserPop');"><span class="blind">레이어팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="total">신고횟수 <span class="reportCount">5</span>회</div>
			<div class="tblType2 noBorder">
				<table>
					<colgroup>
						<col style="width:20%;">
						<col style="width:*;">
					</colgroup>
					<tbody class="reportList">						
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
						<tr style="display:none;">
							<th>아이디</th>
							<td id="rid"></td>
						</tr>
						<tr>
							<th>신고횟수</th>
							<td>
								<div class="inp_qty">
									<button type="button" onclick="qtyDown(this)" title="수량감소">
										<img src="${contextPath}/resources/images/common/qty_down.gif" alt="수량감소">
									</button>
									<input type="text" name="reportCount" value="5">
									<button type="button" onclick="qtyUp(this)" title="수량추가">
										<img src="${contextPath}/resources/images/common/qty_up.gif" alt="수량추가">
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<div id="mstatus" class="selectbox">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
                <a href="javaScript:void(0);" class="btn btnType1 btnSizeM" onclick="commitData();hideLayer('blackUserPop');"><span>적용</span></a>
				<a href="javaScript:void(0);" class="btn btnType2 btnSizeM" onclick="hideLayer('blackUserPop');"><span>취소</span></a>
            </div>
		</div> 
	</div>
	
	<script>
	function userdata(elem){		
		let userId = $(elem).find('input').val();	
		console.log(userId);
		$.ajax({
			url : "${contextPath}/admin/blackDetail",
			data : {input : userId},
			dataType : "json",
			type : "get",
			success : function(user){	
				console.log(user.msgList);
				var html = '';		
				var report = '';
				if(user){
					$(".reportCount").text(user.member.report_count);
					$("input[name='reportCount']").val(user.member.report_count);
					if(user.member.status == 'Y'){										
						html = '<button class="title" type="button" title="상태">Y</button>'
							+ '<input class="statusVal inputVal" type="hidden" name="statusVal" value="Y">'
							+ '<ul class="selList"><li><input type="radio" value="Y" class="option" id="sel1_1" name="select1" checked="checked" /><label for="sel1_1">Y</label></li>'
							+ '<li><input type="radio" value="N" class="option" id="sel1_2" name="select1"/><label for="sel1_2">N</label></li></ul>';
					}else{
						html = '<button class="title" type="button" title="상태">N</button>'
							+ '<input class="statusVal inputVal" type="hidden" name="statusVal" value="N">'
							+ '<ul class="selList"><li><input type="radio" value="Y" class="option" id="sel1_1" name="select1" /><label for="sel1_1">Y</label></li>'
							+ '<li><input type="radio" value="N" class="option" id="sel1_2" name="select1" checked="checked"/><label for="sel1_2">N</label></li></ul>';
					}
					if(user.msgList.length > 0){
						for(var i=0; i < user.msgList.length; i++){
							report+= '<tr><th>신고자</th><td>'+user.msgList[i].from_user+'</td></tr>';
							report+= '<tr><th>날짜</th><td>'+user.msgList[i].msg_date.split(',')[1]+'년 '+user.msgList[i].msg_date.split(',')[0]+'일</td></tr>';
							report+= '<tr><th>내용</th><td>'+user.msgList[i].msg_content+'</td></tr>';
						}
					}
					$("#rid").html(userId);
					$("#mstatus").html(html);
					$(".reportList").html(report);
				}else{
					alert('존재하지 않는 회원번호입니다!');
				}			
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	function commitData(){
		let statusVal = $('.statusVal').val();
		let idVal = $('#rid').text();
		let rcount = $("input[name='reportCount']").val();
		$.ajax({
			url : "${contextPath}/admin/blackDetailModify",
			data : {statusVal : statusVal, idVal : idVal, rcount : rcount},
			//dataType : "json",
			type : "post",
			success : function(member){	
				alert('정보 수정 완료');
				location.reload();
			},
			error : function(e){
				alert('정보 수정 실패');
			}
		});
	}
	</script>
</body>
</html>