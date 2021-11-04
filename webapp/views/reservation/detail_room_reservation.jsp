<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="host.model.vo.Rooms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link type="text/css" rel="stylesheet" href="../resources/css/common.css">
<link type="text/css" rel="stylesheet" href="../resources/css/contents.css">    
<!-- 더보기 클릭 시 jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<!-- swiper  -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<%--  <% Room room = (Room)request.getAttribute("room"); %> 
 --%>
<%@ include file="/views/common/header.jsp" %>		
		
		<div class="lodging_detail">
			<div class="container">
				<!-- Slider main container -->
					<div class="room_title">
						${room.roomName}
					</div>
					<div class="swiper">
						<!-- Additional required wrapper -->
						<div class="swiper-wrapper">
							<!-- Slides -->
							<c:forEach items="${ room.fileList }" var="file">
								<div class="swiper-slide">
									<img src=${ contextPath }${ file.filePath }${ file.changeName }" class="lodging1">
								</div>
							</c:forEach>
						</div>
						
						<!-- If we need navigation buttons -->
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>					
					</div>
					<script>
						const swiper = new Swiper('.swiper', {
							navigation: {
								nextEl: ".swiper-button-next",
								prevEl: ".swiper-button-prev",
								},
						});

					</script>	
					<!--숙소 소개 글씨-->
					<div class="title_text">
						<span>숙소 소개</span>
					</div>
					<!-- 동영상 -->
					<div class="videoWrap"> 
						<div class="content"> 
							<iframe width="956" height="538" src="https://www.youtube.com/embed/bzS-w6D3nGc" 
							title="YouTube video player" frameborder="0"
							 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div> 
					</div>
					<!-- 숙소소개 설명 -->
					
					<div class="moreSee1">					
					<pre class="room_content">
	${room.roomDes}	
	▶ 이용인원 안내 ◀
	- 기본인원 : <span>${room.minPeople}인</span>
	- 최대인원 : <span>${room.maxPeople}인</span>
	
	▶ 숙박 일수 안내 ◀
	- 최소 숙박 일수 : <span>${room.minStay}</span>박 
	- 최대 숙박 일수 : <span>${room.maxStay}</span>박
	
	▶ 숙박 요금 안내 ◀
	- 숙박 금액(1박 기준) :  <span>${room.price}</span>원
	- 추가 인원 금액 :  <span>${room.extraCost}</span>원
	
	★ [입/퇴실 시간 준수 안내]★
	- 입실 PM <span>${room.startTime}</span> / 퇴실 AM <span>${room.endTime}</span>
	★ 해당 숙소는 주기적인 방역을 실시하고 있으나 제주 지역적 특성 상 벌레가 나올 수 있는 점 양해 부탁드리겠습니다.
	★ 문의사항은 제주라도 넘어갈까  메시지 통해 남겨주시길 부탁드립니다.
					</pre>
					<button type="button" class="moreBtn1">숙소 소개 더 보기</button>
					</div>
					
					
		<%-- 	 	<%
					String[] address;
					if( room.getRoomFac() != null) {
						address = room.getRoomFac().split("\\|"); // 3개짜리 배열로 잘라짐
					} else {
						address = new String[] {"", "", ""};
					}
				%>  --%>
					
					
					<!--숙소 시설 글씨-->
					<div class="title_text">
						<span>숙소 시설</span>
					</div>

					<div class="moreSee2">
						<span class="minititle_text">기본</span>
						<ul class="text_group">
							<li>숙소종류 : ${room.roomType} </li> <li>건물유형 : ${room.buildingType} </li> <li>건물평수 :${room.roomSize}</li> 
							<li>방수 : ${room.room} </li> <li>침대수 : ${room.bed} </li>  <li>욕실수 : ${room.bath} </li>
						</ul>
						<span class="minititle_text">기본 시설</span>
						<ul class="text_group">
							<li>TV </li> <li>에어컨</li> <li>와이파이</li> 
							<li>전기포트</li> <li>전기포트</li>  <li>전자렌지</li>
							<li>밥솥 </li> <li>수건</li> <li>식기</li> 
							<li>다리미</li> <li>헤어드라이기</li>  <li>냉장고</li>
						</ul>	
						<span class="minititle_text">추가 시설</span>
						<ul class="text_group">
							<li>욕조 </li> <li>세탁기</li> <li>건조기</li> 
							<li>무료주차</li> <li>위생용품</li>  <li>바비큐</li>
							<li>테라스 </li> 
						</ul>	
						<span class="minititle_text">특별 시설</span>
						<ul class="text_group">
							<li>가족/어린이 환영 </li> <li>반려동물 입실가능</li> <li>반려동물 입실금지</li> 
							<li>휠체어 사용가능</li>  
						</ul>
						<span class="minititle_text">안전 시설</span>
						<ul class="text_group">
							<li>화재감지기 </li> <li>구급상자</li> <li>실내흡연 불가능</li> 
							<li>소화기</li>
						</ul>
						<button type="button" class="moreBtn2" >숙소 시설 더 보기</button>
				   </div>
					
				   <div class="title_text">
				 	<span>환불 정책</span>
				   </div>

					<pre>

- 제주라도넘어갈까맨션은 게스트님, 호스트님 간의 안전한 거래를 위해 중재자 역할을 합니다.

- 환불 요청 접수 기준은 당사의 운영시간 내 ‘환불 요청'이 접수된 시간, ‘1:1 채팅상담’에 기록된 시간, ‘환불신청’이 접수된 시간 기준으로 합니다.

- 예약 변경 및 취소를 원하실 경우, 제주라도넘어갈까맨션의 서비스 이용료를 제외한 호스트님의 개별 숙소 환불 정책을 우선 적용합니다.

- 위약금 발생 시 호스트님과 게스트님 간 합의가 있더라도 제주라도넘어갈까맨션의 위약금(총 숙박료의 10%)이 발생합니다.

- 호스트님과 게스트님의 원만한 합의를 우선으로 하며, 합의가 이루어지지 않을 경우 제주라도넘어갈까맨션의 환불 규정에 따릅니다.
   단, 호스트님 귀책사유로 발생된 모든 환불 건에 대해서 위약금을 지불하셔야 할 수 있습니다.

- 결제 24시간 이후부터 입실 180일 전인 경우 계약금 100% 환불이 가능합니다.
					</pre>
					<div class="hostBox">
						<div class="profileSort">
							<div class="profile">

							</div>
						</div>
						<div class="hostName">
							<h3>호스트 알리님</h3>
						</div>
						<div>
							<button class="btn btnType1 btnSizeL"><span>호스트에게 연락하기</span></button>
						</div>
					</div>

					<div class="roomReview">
						<img src="${contextPath}/resources/images/star.png" width="20px" height="20px">
						<span class="text3">후기 91개</span>
					</div>

					<div class="review roomReview">
						<img src="${contextPath}/resources/images/star.png" width="20px" height="20px">
						<span class="text3">4.47 후기 30개</span>
					</div>
					<div class="reviewBox">
						<ul class="reviewSort">
							<li>
								<div class="userBox">
									<img src="${contextPath}/resources/images/user.png">
									<p>
										<span class="userSize">이상*</span>
										<span class="reviewDate">2021-01-01</span>
									</p>
									<div>
										<img src="${contextPath}/resources/images/별.png">
									</div>
								</div>
								<p class="reviewContent" id="Greview1">
									운치있는 단지에 있는 숙소라 그런지 
									분위기도 좋고 프라이빗했어요~  
									복층이라 2층이 좀 더울 것 같았는데  
									에어컨이 다 구비되어 있어서 시원했어요 
									침대도 푹신해서 잘 때 너무 편안했어요 
									만족합니다 ㅎㅎ
								</p>
							</li>
							<li>
								<div class="userBox">
									<img src="${contextPath}/resources/images/user.png">
									<p>
										<span class="userSize">이상*</span>
										<span class="reviewDate">2021-01-01</span>
									</p>
									<div>
										<img src="${contextPath}/resources/images/별.png">
									</div>
								</div>
								<p class="reviewContent" id="Greview2">
									운치있는 단지에 있는 숙소라 그런지 
									분위기도 좋고 프라이빗했어요~  
									복층이라 2층이 좀 더울 것 같았는데  
									에어컨이 다 구비되어 있어서 시원했어요 
									침대도 푹신해서 잘 때 너무 편안했어요 
									만족합니다 ㅎㅎ
								</p>
							</li>
						</ul>												
					</div>
					<!--페이징-->
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
			<div class="box">
				<div class="boxChild1">
					<div class="item">
						<label id="labelCheck">체크인</label>
						<div class="inp_text inp_margin1">
							<input class="" type="date" name="checkIn" id="checkIn" />
						</div>
					</div>
					<div class="item">
						<label id="labelCheckOut">체크아웃</label>
						<div class="inp_text inp_margin2">
							<input type="date" name="checkOut" id="checkOut" />
						</div>
					</div> 
				</div>
				<div class="item">
					<span>인원</span>
					<div class="inp_qty inp_margin3 ">
						<button type="button" onclick="qtyDown(this)" title="인원감소">
							<img src="${contextPath}/resources/images/common/qty_down.gif" alt="인원감소">
						</button>
						<input type="text" title="인원수" value="1">
						<button type="button" onclick="qtyUp(this)" title="인원증가">
							<img src="${contextPath}/resources/images/common/qty_up.gif" alt="인워증가">
						</button>
					</div>
				</div>
				<div class="boxChild3">
					<div id="won1">예상결제금액:</div>
					<div id="won2">20000</div>
				</div>
				<a href="#" class="btn btnType1 btnSizeL reserve_request"><span>예약 신청</span></a>
			</div>
		</div>

<script>
var isOn = false;
$('.moreBtn1').click(function(){
  if(!isOn){
    $('.moreSee1').css('height','auto');  
    $('.moreBtn1').css({'position':'unset'},{'box-shadow':'unset'});
    isOn = true;
  }else{
    $('.moreSee1').css('height','130px'); 
    $('.moreBtn1').css({'position':'absolute'},{'box-shadow':'0px -40px 40px white'});
    isOn = false;
  }
  
})

$('.moreBtn2').click(function(){
  if(!isOn){
    $('.moreSee2').css('height','auto');  
    $('.moreBtn2').css({'position':'unset'},{'box-shadow':'unset'});
    isOn = true;
  }else{
    $('.moreSee2').css('height','130px'); 
    $('.moreBtn2').css({'position':'absolute'},{'box-shadow':'0px -40px 40px white'});
    isOn = false;
  }
  
})

</script>

		
<%@ include file="/views/common/footer.jsp" %>