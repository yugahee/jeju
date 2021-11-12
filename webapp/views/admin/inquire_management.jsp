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
				<li><a class="active" href="<%= request.getContextPath() %>/admin/inquireMg">문의 관리</a></li>
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
			<c:if test="${ !empty param.searchCondition && !empty param.searchCondition2 && !empty param.startDate && !empty param.endDate}">
				<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchCondition2=${ param.searchCondition2 }&searchValue=${ param.searchValue }&startDate=${ param.startDate }&endDate=${ param.endDate }"/>
			</c:if>
			<div class="content">
				<div class="listSearch">
					<div class="listTit">문의 관리</div>
					<form method="get" action="${ contextPath }/admin/inquireMg">
                    <div class="calendar">
                        <p class="ctit">기간 검색</p>
                        <div class="inp_text">
                            <input type="date" name="startDate"
                            value="<c:if test="${ param.startDate == null }"></c:if><c:if test="${ param.startDate != null }">${param.startDate}</c:if>">
                             ~ 
                             <input type="date" name="endDate"
                            value="<c:if test="${ param.endDate == null }"></c:if><c:if test="${ param.endDate != null }">${param.endDate}</c:if>">
                        </div>
                    </div>
					<div class="selectbox">
						<button class="title" type="button">
							<c:if test="${ param.searchCondition == null }">문의유형</c:if>
							<c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>								
						</button>
						<input class="inputVal" type="hidden" name="searchCondition" value="<c:if test="${ param.searchCondition == null }">전체</c:if><c:if test="${ param.searchCondition != null }">${param.searchCondition}</c:if>">
						<ul class="selList" id="searchCondition">
							<li>
								<input class="option" type="radio" id="sel_type1_1" <c:if test="${ param.searchCondition == '전체' }">checked="checked"</c:if>>
								<label for="sel_type1_1">전체</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_2" <c:if test="${ param.searchCondition == '문의' }">checked="checked"</c:if>>
								<label for="sel_type1_2">문의</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type1_3" <c:if test="${ param.searchCondition == '신고' }">checked="checked"</c:if>>
								<label for="sel_type1_3">신고</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button">
							<c:if test="${ param.searchCondition2 == null }">답변상태</c:if>
							<c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>
						</button>
						<input class="inputVal" type="hidden" name="searchCondition2" value="<c:if test="${ param.searchCondition2 == null }">전체</c:if><c:if test="${ param.searchCondition2 != null }">${param.searchCondition2}</c:if>">
						<ul class="selList" id="searchCondition2">
							<li>
								<input class="option" type="radio" id="sel_type2_1" <c:if test="${ param.searchCondition2 == '전체' }">checked="checked"</c:if>>
								<label for="sel_type2_1">전체</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type2_2" <c:if test="${ param.searchCondition2 == '미답변' }">checked="checked"</c:if>>
								<label for="sel_type2_2">미답변</label>
							</li>
							<li>
								<input class="option" type="radio" id="sel_type2_3" <c:if test="${ param.searchCondition2 == '답변완료' }">checked="checked"</c:if>>
								<label for="sel_type2_3">답변완료</label>
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
				<c:choose>
				<c:when test="${listCount != 0 }">
				<div class="tblType3 noBorT noBorB boardList">
					<table summary="추천장소 후기 테이블">
						<caption>추천장소 후기 테이블</caption>
						<colgroup>
							<col width="10%">
							<col width="8%">
							<col width="*">
							<col width="10%">
							<col width="10%">
							<col width="8%">
							<col width="8%">
							<col width="10%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<th>메시지 번호</th>
								<th>카테고리</th>
								<th>내용</th>
								<th>작성자</th>
								<th>작성시간</th>
								<th>읽음여부</th>
								<th>답변여부</th>
								<th>답변시간</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="msg" items="${msgList}">
							<tr onclick="showLayer('inquirePop'); msgdata(this);">
								<td style="display:none;"><input type="hidden" value="${msg.msg_no}"></td>
								<td>${msg.msg_no}</td>
								<td>${msg.msg_cate}</td>
								<td>${msg.msg_content}</td>
								<td>${msg.from_user}</td>
								<td>
									<fmt:formatDate value="${msg.msg_date}" type="both" pattern="yyyy.MM.dd"/>
									<br>
									<fmt:formatDate value="${msg.msg_date}" type="both" pattern="HH:mm:ss"/>
								</td>
								<td>${msg.chk_status}</td>
								<td>${msg.reply_status}</td>
								<td>
									<!-- 값이 없을 경우 '-' 표시 -->
									<c:choose>
										<c:when test="${null ne msg.reply_date}">
											<fmt:formatDate value="${msg.reply_date}" type="both" pattern="yyyy.MM.dd"/>
											<br>
											<fmt:formatDate value="${msg.reply_date}" type="both" pattern="HH:mm:ss"/>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td>${msg.msg_status}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="paging">
					<span class="first">
						<a href="${contextPath}/admin/inquireMg?page=1${searchParam}">
							<span class="blind">첫페이지</span>
						</a>
					</span>
					<span class="prev">
						<c:choose>
						<c:when test="${pi.page > 1 }">				
						<a href="${contextPath }/admin/inquireMg?page=${pi.page -1}${searchParam}">
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
						<a href="${contextPath}/admin/inquireMg?page=${ p }${searchParam}">${ p }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<span class="next">
						<c:choose>
						<c:when test="${ pi.page < pi.maxPage }">				
						<a href="${contextPath }/admin/inquireMg?page=${pi.page + 1}${searchParam}">
						<span class="blind">다음페이지</span></a>
						</c:when>
						<c:otherwise>						
						<a href="#none">
						<span class="blind">다음페이지</span></a>
						</c:otherwise>
						</c:choose>
					</span>
					<span class="last">
						<a href="${contextPath}/admin/inquireMg?page=${pi.maxPage }${searchParam}">
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
	<div id="inquirePop" class="layerPop">
		<div class="layerTit">
			<h4>문의 내용</h4>
			<button class="btn_closeLayer" onclick="hideLayer('inquirePop');location.reload();"><span class="blind">레이어팝업 닫기</span></button>
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
							<th>NO</th>
							<td id="mno"></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td id="mcata"></td>
						</tr>
						<tr class="mreport">
							<th>피신고인</th>
							<td id="mreport"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td id="mfrom"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td id="mcontent"></td>
						</tr>
						<tr class="chatTr">
							<th>답변란</th>
							<td>
                                <div class="textbox">
                                    <textarea class="chatArea" placeholder="답변을 해주세요🤔"></textarea>
                                    <span class="charCnt"><em class="update">0</em>/200</span>
                                </div>
                            </td>
						</tr>
					</tbody>
				</table>
			</div>			
			<div class="btn_wrap">
                <a href="javascript:void(0)" class="btn btnType1 btnSizeM" onclick="commitData();"><span>적용</span></a>
				<a href="javascript:void(0)" class="btn btnType2 btnSizeM" onclick="hideLayer('inquirePop');location.reload();"><span>취소</span></a>
            </div>
		</div> 
	</div>
	<script>
	// textarea 글자 수
	let content = document.querySelector(".chatArea");
    content.onkeyup = function(){
        let area1 = document.querySelector(".update ");
        let val = content.value.length;
        area1.innerHTML = val;
       	if(val > 200){
       		area1.style.color = 'red';
       	}else{
       		area1.style.color = '#222';
       	}
    };
    
    let firstcVal = '';
	function msgdata(elem){		
		let msgNo = $(elem).find('input').val();	
		$.ajax({
			url : "${contextPath}/admin/msgDetail",
			data : {msgNo : msgNo},
			dataType : "json",
			type : "get",
			success : function(msg){
				$('.mreport').hide();
				if(msg){	
					$("#mno").text(msg.msg_no);
					$("#mcata").text(msg.msg_cate);
					$("#mfrom").text(msg.from_user);
					$("#mcontent").text(msg.msg_content);
					if(msg.report_user != null){	// 신고일 경우
						$('.mreport').show();
						$("#mreport").text(msg.report_user);
					}
					if(msg.reply_content != null){	// 답변을 달았을 경우
						$('.chatArea').val(msg.reply_content);
						$(".chatArea").addClass('readOnly');
						$('.chatArea').attr('readonly', true);
					}else{
						$(".chatArea").val('');	
						$(".chatArea").removeClass('readOnly');
						$('.chatArea').attr('readonly', false);
					}
					let area1 = document.querySelector(".update");
			        let val = content.value.length;
			        area1.innerHTML = val;
			        
			        firstcVal = $('.chatArea').val();
				}else{
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	function commitData(){
		let mVal = $('#mno').text();
		let cVal = $('.chatArea ').val();
		if(cVal.length <= 200){					
			$.ajax({
				url : "${contextPath}/admin/msgDetailModify",
				data : {mVal : mVal, firstcVal : firstcVal, cVal : cVal},
				//dataType : "json",
				type : "post",
				success : function(msg){	
					if(firstcVal == cVal){
						alert('수정 사항이 없습니다.');
					}else{
						alert('상태 수정 완료');
					}
					location.reload();
				},
				error : function(e){
					alert('상태 수정 실패');
				}
			});
		}else{
			alert('글자 수를 확인해주세요😂');
			$('.chatArea ').focus();
		}
	}
	$("input[type='date']").change(function(){
		let startDate = $("input[name='startDate']").val();
		let endDate = $("input[name='endDate']").val();
		let change1;
		let change2;
		let arr1 = startDate.split('-');
		let arr2 = endDate.split('-');
		if(startDate != '' && endDate != ''){
			// 날짜 값 비교 
			if(arr1[0] > arr2[0]){
				change1 = endDate;
				change2 = startDate;
			}else if(arr1[1] > arr2[1]){
				change1 = endDate;
				change2 = startDate;
			}else if(arr1[2] > arr2[2]){
				change1 = endDate;
				change2 = startDate;
			}else{
				change1 = startDate;
				change2 = endDate;
			}
			/* console.log("처음 : " + change1);
			console.log("마지막 : " + change2); */
			
			$("input[name='startDate']").val(change1);
			$("input[name='endDate']").val(change2);
		}
	});
	</script>
</body>
</html>