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
<article id="wrapper">
                <form method="post" action="${ contextPath }/socialing/update" enctype="multipart/form-data">
                
	                <input type="hidden" name="nNum" value="${ socialing.nNum }">
					<c:forEach items="${ socialing.photoList }" var="photo">
						<input type="hidden" name="changeName" value="${ photo.changeName }">
					</c:forEach>
                
                    <h1 id="w-main-title">어떤 활동을 하는 소셜링인가요?</h1>
                    <h4 id="w-sub-title">제목을 입력해 주세요 (최대 30자)</h4>
                    <input type="text" id="inputTitle" name="inputTitle" placeholder="연희동 카페투어 함께 가요!" 
                    value="${ socialing.nTitle }" required>
                    
                    <h2 id="w-sub-title2">설명</h2>
                    <h4 id="w-sub-title3">썸네일 이미지를 첨부해주세요</h4>
                    <div class="image_area">
                    <img src="${ contextPath }${ socialing.photoList.get(0).route }${ socialing.photoList.get(0).changeName }">
                    </div>
                    <button type="button" id="fileBtn">file</button><br>
                    <input type="file" name="thumbnail" accept="image/gif,image/jpeg,image/png" required>
                    <textarea id="content" name="content" placeholder="함께 이야기하고 싶은 주제나 꼭 알려주고 싶은 내용을 입력해 주세요"
                     required>${ socialing.nContent }</textarea>
                    <hr>
                    
                    <h1 id="w-main-title2">언제 어디서 만나나요?</h1>
                    <h4 id="w-sub-title4">날짜를 선택하세요</h4>
                    <input type="date" name="dateIn" 
                    value='<fmt:formatDate value="${ socialing.sdate }" type="date" pattern="yyyy-MM-dd"/>' required>
                    <h4 id="w-sub-title5">시간을 선택하세요</h4>
                    <input type="time" name="timeIn" value="${ socialing.stime }" required>
                    <h4 id="w-sub-title5">장소를 입력하세요</h4>
                    <input type="radio" id="offline" name="type" value="OFF" <c:if test='${ socialing.stype == "OFF" }'>checked</c:if>>
                    <label for="offline">오프라인</label>
                    <input type="radio" id="online" name="type" value="ON" <c:if test='${ socialing.stype == "ON" }'>checked</c:if>>
                    <label for="online">온라인</label><br>
                    
					<div class="placeArea1">
			            <input type="text" id="inputPlace" name="inputPlace" class="postcodify_address" 
			            placeholder="ex. 서울특별시 강남구 테헤란로 / Zoom" value='${ socialing.splace.split("\\|")[0] }' required>&nbsp;&nbsp;
		            <!-- 오프라인 선택 시 출력 / 온라인 선택 시 숨김 -->
		            <span class="placeArea2" <c:if test='${ socialing.stype == "ON" }'>style="display:none"</c:if>>
			            <button type="button" class="search" id="postcodify_search_button">검색</button><br>
			            <input type="text" id="inputPlace2" name="inputPlace" class="postcodify_details" 
			            placeholder="상세 주소를 입력해 주세요" value='${ socialing.splace.split("\\|")[1] }'><br>
		            </span>
					</div>
                    
                    <h4 id="w-sub-title5">인원 설정</h4>
                    <select id="min" name="min">
                        <option value="2" <c:if test="${ socialing.minMember == 2 }">selected</c:if>>2명</option>
                        <option value="3" <c:if test="${ socialing.minMember == 3 }">selected</c:if>>3명</option>
                        <option value="4" <c:if test="${ socialing.minMember == 4 }">selected</c:if>>4명</option>
                        <option value="5" <c:if test="${ socialing.minMember == 5 }">selected</c:if>>5명</option>
                        <option value="6" <c:if test="${ socialing.minMember == 6 }">selected</c:if>>6명</option>
                        <option value="7" <c:if test="${ socialing.minMember == 7 }">selected</c:if>>7명</option>
                        <option value="8" <c:if test="${ socialing.minMember == 8 }">selected</c:if>>8명</option>
                    </select>
                    <p id="wave">~</p>
                    <select id="max" name="max">
                        <option value="2" <c:if test="${ socialing.maxMember == 2 }">selected</c:if>>2명</option>
                        <option value="3" <c:if test="${ socialing.maxMember == 3 }">selected</c:if>>3명</option>
                        <option value="4" <c:if test="${ socialing.maxMember == 4 }">selected</c:if>>4명</option>
                        <option value="5" <c:if test="${ socialing.maxMember == 5 }">selected</c:if>>5명</option>
                        <option value="6" <c:if test="${ socialing.maxMember == 6 }">selected</c:if>>6명</option>
                        <option value="7" <c:if test="${ socialing.maxMember == 7 }">selected</c:if>>7명</option>
                        <option value="8" <c:if test="${ socialing.maxMember == 8 }">selected</c:if>>8명</option>
                    </select><br>
                    
                    <div class="center">
                        <button type="submit" id="w-submit2">소셜링 수정</button>
                    </div>
                </form>
            </article>
		</div> 
	</div>
	
	<script>
	function userdata(elem){		
		let userId = $(elem).find('input').val();	
		console.log(userId);
		$.ajax({
			url : "${contextPath}/admin/userDetail",
			data : {input : userId},
			dataType : "json",
			type : "get",
			success : function(user){			
				var html = '';		
				var report = '';
				if(user){
					$(".reportCount").text(user.report_count);
					$("input[name='reportCount']").val(user.report_count);
					if(user.status == 'Y'){										
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
					
					report+= '<tr><th>신고자</th><td>'+user.user_id+'</td></tr>';
					report+= '<tr><th>제목</th><td>시간을 안지켜요</td></tr>';
					report+= '<tr><th>내용</th><td>시간을 안지켜요</td></tr>';
					$("#mstatus").html(html);
					$(".reportList").append(report);
				}else{
					alert('존재하지 않는 회원번호입니다!');
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