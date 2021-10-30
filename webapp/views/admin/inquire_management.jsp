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
                        <li><a href="<%= request.getContextPath() %>/admin/password">비밀번호 관리</a></li>
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>		
			<div class="content">
				<div class="listSearch">
					<div class="listTit">문의 관리</div>
                    <div class="calendar">
                        <p class="ctit">기간 검색</p>
                        <div class="inp_text">
                            <input type="date"> ~ <input type="date">
                        </div>
                    </div>
					<div class="selectbox">
						<button class="title" type="button" title="문의구분">문의구분</button>
						<ul class="selList" style="max-height: 0px; display: none;">
							<li>
								<input type="radio" value="" class="option" id="select_res0" name="select_user">
								<label for="select_res0">전체</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_res1" name="select_user">
								<label for="select_res1">예약</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_res2" name="select_user">
								<label for="select_res2">결제</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_res3" name="select_user">
								<label for="select_res3">인증</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_res4" name="select_user">
								<label for="select_res4">신고</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_res5" name="select_user">
								<label for="select_res5">기타</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button" title="검색 조건">검색 조건</button>
						<ul class="selList" style="max-height: 0px; display: none;">
                            <li>
								<input type="radio" value="" class="option" id="select_search_op1" name="select_search_op">
								<label for="select_search_op1">ID</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op2" name="select_search_op">
								<label for="select_search_op2">이름</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op3" name="select_search_op">
								<label for="select_search_op3">내용</label>
							</li>
						</ul>
					</div>
					<div class="selectbox">
						<button class="title" type="button" title="답변 상태">답변 상태</button>
						<ul class="selList" style="max-height: 0px; display: none;">
                            <li>
								<input type="radio" value="" class="option" id="select_search_op1" name="select_search_op">
								<label for="select_search_op1">전체</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op2" name="select_search_op">
								<label for="select_search_op2">답변 완료</label>
							</li>
							<li>
								<input type="radio" value="" class="option" id="select_search_op3" name="select_search_op">
								<label for="select_search_op3">미답변</label>
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
					<table summary="추천장소 후기 테이블">
						<caption>추천장소 후기 테이블</caption>
						<colgroup>
							<col width="8%">
							<col width="8%">
							<col width="15%">
							<col width="*">
							<col width="10%">
							<col width="8%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>구분</th>
								<th>제목</th>
								<th>내용</th>
								<th>ID</th>
								<th>작성자</th>
								<th>문의시간</th>
								<th>상태</th>
								<th>답변시간</th>
							</tr>
						</thead>
						<tbody>
							<tr onclick="showLayer('inquirePop')">
								<td>57873</td>
								<td>예약</td>
								<td>문의드립니다 문의드려요</td>
								<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
								<td>useruser01</td>
								<td>네글자인</td>
								<td>2021.10.15<br>08:10:10</td>
								<td>답변 완료</td>
								<td>2021.10.15<br>08:10:10</td>
							</tr>
							<tr onclick="showLayer('inquirePop')">
								<td>23623</td>
								<td>예약</td>
								<td>문의드립니다 문의드려요</td>
								<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
								<td>useruser01</td>
								<td>네글자인</td>
								<td>2021.10.15<br>08:10:10</td>
								<td>답변 완료</td>
								<td>2021.10.15<br>08:10:10</td>
							</tr>
							<tr onclick="showLayer('inquirePop')">
								<td>124125</td>
								<td>예약</td>
								<td>문의드립니다 문의드려요</td>
								<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
								<td>useruser01</td>
								<td>네글자인</td>
								<td>2021.10.15<br>08:10:10</td>
								<td>답변 완료</td>
								<td>2021.10.15<br>08:10:10</td>
							</tr>
							<tr onclick="showLayer('inquirePop')">
								<td>12512</td>
								<td>결제</td>
								<td>문의드립니다 문의드려요</td>
								<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
								<td>useruser01</td>
								<td>네글자인</td>
								<td>2021.10.15<br>08:10:10</td>
								<td>미답변</td>
								<td>-</td>
							</tr>
							<tr onclick="showLayer('inquirePop')">
								<td>56423</td>
								<td>예약</td>
								<td>문의드립니다 문의드려요</td>
								<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
								<td>useruser01</td>
								<td>네글자인</td>
								<td>2021.10.15<br>08:10:10</td>
								<td>미답변</td>
								<td>-</td>
							</tr>
							<tr onclick="showLayer('inquirePop')">
								<td>436346</td>
								<td>예약</td>
								<td>문의드립니다 문의드려요</td>
								<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
								<td>useruser01</td>
								<td>네글자인</td>
								<td>2021.10.15<br>08:10:10</td>
								<td>미답변</td>
								<td>-</td>
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
	<div id="inquirePop" class="layerPop">
		<div class="layerTit">
			<h4>문의 내용</h4>
			<button class="btn_closeLayer" onclick="hideLayer('inquirePop');"><span class="blind">레이어팝업 닫기</span></button>
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
							<td>124125</td>
						</tr>
						<tr>
							<th>구분</th>
							<td>예약</td>
						</tr>
                        <!-- 신고일 시 -->
						<tr>
							<th>신고유형</th>
							<td>???</td>
						</tr>
						<tr>
							<th>피신고자</th>
							<td>sdfdssdf</td>
						</tr>
						<tr>
							<th>ID</th>
							<td>useruser01</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>문의드립니다 문의드려요</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요문의내용은 다음과 같습니다. 안녕하세요 문의내용은 다음과 같습니다. 안녕하세요</td>
						</tr>
						<tr>
							<th>답변란</th>
							<td>
                                <div class="textbox">
                                    <textarea>안녕하세요. 고갱님 문의 답변드립니다.</textarea>
                                    <span class="charCnt"><em>0</em>/200</span>
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