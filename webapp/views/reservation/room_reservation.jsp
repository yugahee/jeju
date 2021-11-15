<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link type="text/css" rel="stylesheet" href="../resources/css/common.css">
<link type="text/css" rel="stylesheet" href="../resources/css/contents.css">    
<%@ include file="/views/common/header.jsp" %>  
<c:if test="${ !empty param.checkIn && !empty param.checkOut && !empty param.mainLocation }">
	<c:set var="searchParam" value="&checkIn=${ param.checkIn }&checkOut=${ param.checkOut }&mainLocation=${ param.mainLocation }"/>
</c:if>	  
		<div class="lodging_reserve">
			<div class="container">
				<!-- <h2>타이틀</h2> -->
				<!-- 여기서부터 내용 -->
					<form action="${ contextPath }/room/reservation" method="get">
						<div class="searchArea">
							<div class="flex">
								<div class="search_box">
									<img src="${contextPath}/resources/images/location.png" width="25px" height="25px">
									<label id="jejudo">제주도</label>
								</div>
								<div class="search_box">
									<label id="labelCheck">체크인</label>
									<div class="inp_text">
										<input type="date" name="checkIn" id="checkIn" />
									</div>
								</div>
								<div class="search_box">
									<label id="labelCheckOut">체크아웃</label>
									<div class="inp_text">
										<input type="date" name="checkOut" id="checkOut" />
									</div>
								</div>
								<%-- <div class="inp_qty">
									<button type="button" onclick="qtyDown(this)" title="인원감소">
										<img src="${contextPath}/resources/images/common/qty_down.gif" alt="인원감소">
									</button>
									<input type="number" name="inwonsu" title="인원수" value="1">
									<button type="button" onclick="qtyUp(this)" title="인원증가">
										<img src="${contextPath}/resources/images/common/qty_up.gif" alt="인원증가">
									</button>
								</div> --%>
						   </div>
						   <div class="search_btn">
								<button href="#" class="btn btnType1 btnSizeM"><span>검색</span></button>							   
								<button type="button" onclick="showLayer('filterSearch');" class="btn btnType2 btnSizeM"><span>조건검색</span></button>					   
						   </div>
						   
						</div>
					</form>
						<!--여기 아래부터 숙소 사진과 옆에 숙소명+숙소제목...-->
					<c:choose>
					<c:when test="${!empty roomList}">
						<c:forEach var="room" items="${ roomList }">
						<%-- <c:if test=></c:if> --%>
						<div class="lodging_lineup" onclick="detailReservation(${room.roomNo})">
							<div class="child1">
								<img src="${contextPath}${room.fileList.get(0).filePath}
								${room.fileList.get(0).changeName}">
							</div>
							<div class="child2">
								<br>
								<span class="text1" >[${ room.location }] ${ room.roomName }</span> 
								<span class="text2">${ room.roomTitle }</span> <br> <br> <br> 
								<div class="roomReview">
									<img src="${contextPath}/resources/images/star.png" width="20px" height="20px">
									<span class="text3" id="reviewStar">${ room.star }</span>
									<span class="text3" id="reviewCount">${room.reviewCount }</span>
								</div>
								<div class="roomPrice">
									<span>${room.price}/박</span>
								</div>
							</div>
						</div> 	
						</c:forEach>
					</c:when>	
					<c:otherwise>
						<div class="noData">
			                <p>해당 정보가 없습니다</p>
			                <p class="subtxt">새롭게 다시 검색해주세요</p>
			            </div>
					</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
	<!--레이어 팝업 설정-->
	<div id="filterSearch" class="layerPop">
		<div class="layerTit layerTitle">
			<h4>조건 선택</h4>
			<button class="btn_closeLayer" onclick="hideLayer('filterSearch');"><span class="blind">레이어팝업 닫기</span></button>
		</div>
		<div class="layerBody">
		 <form action="${contextPath}/room/reservation" method="get">	
			<div class="locationSrot locationMargin1">
				<div class="layerdiv">
					지역
				</div>  
				<span class="inp_check">
					<input type="checkbox" name="location" id="chk1_1" value="동부">
					<label for="chk1_1">동부</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="location" id="chk1_2" value="서부">
					<label for="chk1_1">서부</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="location" id="chk1_3" value="중부">
					<label for="chk1_1">중부</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="location" id="chk1_4" value="남부">
					<label for="chk1_1">남부</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="location" id="chk1_5" value="북부">
					<label for="chk1_1">북부</label>
				</span>
			</div>
			<div class="locationSrot locationMargin1">
				<div class="layerdiv">
					숙소종류
				</div>  
				<span class="inp_check">
					<input type="checkbox" name="room_type" id="chk1_6" value="원룸">
					<label for="chk1_1">원룸</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="room_type" id="chk1_7" value="투룸">
					<label for="chk1_1">투룸</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="room_type" id="chk1_8" value="복층">
					<label for="chk1_1">복층</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="room_type" id="chk1_9" value="쓰리룸이상">
					<label for="chk1_1">쓰리룸이상</label>
				</span>
			</div>
			<div class="locationSrot locationMargin1">
				<div class="layerdiv">
					건물유형
				</div>  
				<span class="inp_check">
					<input type="checkbox" name="building_type" id="chk1_10" value="원룸">
					<label for="chk1_1">원룸</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="building_type" id="chk1_11" value="빌라" >
					<label for="chk1_1">빌라</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="building_type" id="chk1_12" value="펜션">
					<label for="chk1_1">펜션</label>
				</span>
			</div>
			<div class="locationSrot locationMargin2">
				<span class="inp_check">
					<input type="checkbox" name="building_type" id="chk1_13" value="단독주택">
					<label for="chk1_1">단독주택</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="building_type" id="chk1_14"  value="오피스텔">
					<label for="chk1_1">오피스텔</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="building_type" id="chk1_15" value="쉐어하우스">
					<label for="chk1_1">쉐어하우스</label>
				</span>
			</div>
			<div class="locationSrot locationMargin1">
				<div class="layerdiv">
					특별시설
				</div>  
				<span class="inp_check">
					<input type="checkbox" name="specialFac" id="chk1_16" value="반려동물 입실가능">
					<label for="chk1_1">반려동물 입실가능</label>
				</span>
				<span class="inp_check">
					<input type="checkbox" name="specialFac" id="chk1_17" value="휠체어 사용가능">
					<label for="chk1_1">휠체어 사용가능</label>
				</span>
			</div>
			<div class="btn_wrap btnMargin">
                <button class="btn btnType1 btnSizeM"><span>적용</span></button>
                <a href="#" class="btn btnType2 btnSizeM"><span>취소</span></a>
            </div>
          </form>
		</div>  
	</div>
	
<%--   	<form name="reservationForm" method="post" action="${contextPath}/room/reserve/detail">
		<c:forEach var="room" items="${roomList}">
		<input type="hidden" name="roomNo" value="${room.roomNo}">
		</c:forEach>
	</form> --%>
	
	<script>
	function detailReservation(roomNo) {
		location.href='${contextPath}/room/reserve/detail?roomNo=' + roomNo;
		/* document.forms.reservationForm.submit(); */
	}
	</script>  
	

	<!--슬라이드 바-->
	<script>
		/* 숙소 가격 */
		var slider = document.getElementById("myRange");
		var output = document.getElementById("slideBoxValue");
		output.innerHTML = slider.value;
		
		slider.oninput = function() {
			output.innerHTML = this.value;
		}
	</script>


	
<%@ include file="/views/common/footer.jsp" %>