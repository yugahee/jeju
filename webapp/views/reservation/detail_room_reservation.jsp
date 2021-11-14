<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="host.model.vo.Rooms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link type="text/css" rel="stylesheet" href="../resources/css/common.css">
<link type="text/css" rel="stylesheet" href="../resources/css/contents.css">    
<!-- 더보기 클릭 시 jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<!-- swiper  -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<style>
	.btn_wrap {
		text-align: center;
	}
	
	#imgRooms{
	    display: block;
    	margin: 0px auto;
	}	
</style>
  <% Rooms room = (Rooms)request.getAttribute("room"); %> 
 
<%@ include file="/views/common/header.jsp" %>		
		
		<div class="lodging_detail">
				<div class="RoomImageouter">
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
									<img src="${ contextPath }${ file.filePath }${ file.changeName }" class="lodging1" id="imgRooms">
								</div>
							</c:forEach>
						</div>
						
						<!-- If we need navigation buttons -->
						<div class="swiper-button-prev nextButton"></div>
						<div class="swiper-button-next nextButton"></div>					
					</div>
				
				</div>
			<div id="roomContainer" class="container">
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
						<c:forTokens var="fac" items="${ room.roomFac }" delims=",">
						<c:set var="basic">TV, 에어컨, 와이파이, 전기포트, 전자렌지, 밥솥, 수건, 식기, 다리미, 헤어드라이기, 냉장고</c:set>
						<c:if test="${ fn:contains(basic, fac) }"><li>${ fac }</li></c:if>						
						</c:forTokens>
						</ul>	
						
						<span class="minititle_text">추가 시설</span>
						<ul class="text_group">
						<c:forTokens var="fac" items="${room.roomFac}" delims=",">
						<c:set var="add">욕조, 세탁기, 건조기, 무료주차 , 위생용품 , 바비큐, 테라스</c:set>
						<c:if test="${ fn:contains(add,fac) }"><li>${ fac }</li></c:if>
						</c:forTokens>
						</ul>	
						
						<span class="minititle_text">특별 시설</span>
						<ul class="text_group">
						<c:forTokens var="fac" items="${room.roomFac}" delims=",">
						<c:set var="special">가족/어린이 환영,반려동물 입실가능, 반려동물 입실금지, 휠체어 사용가능</c:set>
						<c:if test="${ fn:contains(special,fac) }"><li>${ fac }</li></c:if>
						</c:forTokens>
						</ul>
						
						<span class="minititle_text">안전 시설</span>
						<ul class="text_group">
						<c:forTokens var="fac" items="${room.roomFac}" delims=",">
						<c:set var="safety">화재감재기, 구급상자, 실내흡연 불가능, 소화기</c:set>
						<c:if test="${ fn:contains(safety,fac) }"><li>${ fac }</li></c:if>
						</c:forTokens>
						</ul>
						
						<button type="button" class="moreBtn2" >숙소 시설 더 보기</button>
				   </div>
				   
				   <!-- 지도 API -->
				   <input type="hidden" id="address" value="${ room.address }">
				   <input type="hidden" id="roomname" value="${ room.roomName }">
					<div class="title_text">
						<span>숙소 위치</span>
					</div>
					<div class="room_reserv_map" id="map"></div>
					
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
						<div class="hostName">
							<h3>${room.userName}</h3>
						</div>
						<div>
							<button class="btn btnType1 btnSizeL" type="button" onclick="showLayer('writingMessage');"><span>호스트에게 연락하기</span></button>
						</div>
					</div>

					<div class="roomReview">
						<%-- <img src="${contextPath}/resources/images/star.png" width="20px" height="20px">
						<span class="text3">후기 91개</span> --%>
					</div>
					<div class="review roomReview">
						<img src="${contextPath}/resources/images/star.png" width="20px" height="20px">
						<span class="text3">후기 ${reviewPi.listCount}개</span>
					</div>
				<!-- <div class="reviewFlexBox"> -->
					<div class="reviewBox">
						<ul class="reviewSort">
							<c:forEach var="roomReview" items="${ roomReviewList }">
								<li>
									<div class="userBox">
										<img src="${contextPath}/resources/images/user.png">
										<p>
											<span class="userSize">${ roomReview.userName }</span>
											<span class="reviewDate">${ roomReview.reviewDate }</span>
										</p>
										<div>
											<img src="${contextPath}/resources/images/별.png">
										</div>
									</div>
									<p class="reviewContent" id="Greview1">
										${ roomReview.review }
									</p>
								</li>
							</c:forEach>
						</ul>												
					</div>
				<!-- </div> -->
					<!-- 페이징 -->
						<div class="paging pagingMargin">
							<span class="first"><a href="${ contextPath }/room/reserve/detail?roomNo=${roomNo}&page=1"><span class="blind">첫페이지</span></a></span>
							<c:choose>
								<c:when test="${ reviewPi.page > 1 }">
								<span class="prev"><a href="${ contextPath }/room/reserve/detail?roomNo=${roomNo}&page=${ reviewPi.page - 1 }"><span class="blind">이전페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
								</c:otherwise>
							</c:choose>	
							
							<c:forEach var="r" begin="${ reviewPi.startPage }" end="${ reviewPi.endPage }">
							<c:choose>
								<c:when test="${ r eq reviewPi.page }">  <!-- 현재 페이지일 경우 -->
								<span class="current">${ r }</span>
								</c:when>
								<c:otherwise>
								<a href="${ contextPath }/room/reserve/detail?roomNo=${roomNo}&page=${ r }">${ r }</a>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${ reviewPi.page < reviewPi.maxPage }">
								<span class="next"><a href="${ contextPath }/room/reserve/detail?roomNo=${roomNo}&page=${ reviewPi.page + 1 }"><span class="blind">다음페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
								</c:otherwise>
							</c:choose>
							
							<span class="last"><a href="${ contextPath }/room/reserve/detail?roomNo=${roomNo}&page=${ reviewPi.maxPage }"><span class="blind">마지막페이지</span></a></span>
						</div>
					
			</div>	
			<div class="box">
		    	<form name="reserveinfo" method="get">
				    <input type="hidden" name="roomNo" value="${roomNo}">
				    <%-- <input type="hidden" name="roomName" value="${room.roomName}"> --%>
				    <input type="hidden" name="user_type" value="${loginUser.user_type}">
					<div class="boxChild1">
						<div class="item">
							<label id="labelCheck">체크인</label>
							<div class="inp_text inp_margin1">
								<input class="" type="date" name="start_date" id="checkIn" />
							</div>
						</div>
						<div class="item">
							<label id="labelCheckOut">체크아웃</label>
							<div class="inp_text inp_margin2">
								<input type="date" name="end_date" id="checkOut" />
							</div>
						</div> 
					</div>
					<div class="item">
						<span>인원</span>
						<div class="inp_qty inp_margin3 ">
							<button type="button" onclick="qtyDown(this)" title="인원감소">
								<img src="${contextPath}/resources/images/common/qty_down.gif" alt="인원감소">
							</button>
							<input type="text" title="인원수" name="reserve_num" value="1">
							<button type="button" onclick="qtyUp(this)" title="인원증가">
								<img src="${contextPath}/resources/images/common/qty_up.gif" alt="인워증가">
							</button>
						</div>
					</div>
				</form>
				<div class="boxChild3">
					<div id="won1">예상결제금액:</div>
					<div id="won2">${room.price}</div>
				</div>  
				<a href="#" id="xx" class="btn btnType1 btnSizeL reserve_request" onclick="showLayer('reserveApply');" ><span>예약 신청</span></a>
			</div>
				
		</div>
		
		<!-- 예약 신청 레이어 부분 -->
   		   <div id="reserveApply" class="layerPop">
                <div class="layerTit">
                    <button class="btn_closeLayer" onclick="hideLayer('reserveApply');"><span class="blind">레이어팝업 닫기</span></button>
                </div>
                <div class="checkCss">
                <img src="${contextPath}/resources/images/host/error_icon.png" width="100px" height="100px">
                </div>
                <div class="layerBody reserveApply">
                   	 예약 신청 하시겠습니까?
                </div>  
                <div class="okAndNo">
              		<a class="btn btnType1 btnSizeS" type="button" 
           			 onclick="reserveChk(${room.roomNo});"><span>확인</span></a>
           			 <a href="#" class="btn btnType2 btnSizeS" type="button" 
           			 onclick="reserveCancell();"><span>취소</span></a>
                </div>
            </div>
            
           	<div class="hiddenlayerpop">
                	<a href="#" class="btn btnType1 btnSizeS" type="button" onclick = "hideLayer('reserveApply');"></a>
          	</div>
  
 
    <script>
    // 예상금액 
    $("#checkOut").change(function(){
    	var startDate = new Date($("#checkIn").val());
        var endDate = new Date($("#checkOut").val());
        
        var sDate = startDate.getDate();
        var eDate = endDate.getDate();
        
        var result;
        let price = $("#won2").text();
        if(sDate < eDate) {
        	result = (eDate - sDate) * price;
        }else{
        	result = (sDate - eDate) * price;
        }
        
        
        $("#won2").text(result);
    });
    </script>      
          
  	<!-- 지도 api(kakao map) 적용시키기  : appkey 입력 후 스크립트 작성 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7289567e1bdecd9a73b71af51976bb56&libraries=services"></script>
	<script>
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표. (위도, 경도)
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
						
			// 주소 값 지도에 넣기			
			var address = document.getElementById('address').value; 
			var roomName = document.getElementById('roomname').value; 
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			       /* var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ roomName +'</div>'
			        });
			        infowindow.open(map, marker); */
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			
	</script>

          
    <!-- 예약 신청 취소 시 동작 -->  
    <script>
    function reserveCancell(){
        const ch = document.querySelector(".hiddenlayerpop").firstElementChild;
        ch.click();    // 레이아웃 닫기
        
        /* const reserveCheck = document.querySelector('#reserveCheck');
        reserveCheck.click();  */

    }  
 	</script>
	
	    <!-- 예약 신청 확인 시 동작 -->  
	<script>
		 function reserveChk(roomNo){			
			 if( '${loginUser.user_type}' != '게스트') {
					alert("로그인 후 예약신청 바랍니다.")
		    	 	location.href="${contextPath}/login";
		    	 	return;
			 }
			 
			// 예약날자 비교 
			 $.ajax({
				url : "${contextPath}/reserve/dateCheck",
				data : {roomNo : roomNo,
						startDate : $("#checkIn").val(),
						endDate : $("#checkOut").val()},
				/* dataType : "json", */
				type : "post",
				success : function(result){					
					if(result == "success"){
						const ch = document.querySelector(".hiddenlayerpop").firstElementChild;
					     ch.click();    // 레이아웃 닫기
						
						 alert("예약 신청이 완료되었습니다.");
					     
					     // 예약 정보 인서트 
						 document.forms.reserveinfo.action="${contextPath}/reservation/insert";
					     document.forms.reserveinfo.submit();
					}else{
						const ch = document.querySelector(".hiddenlayerpop").firstElementChild;
					    ch.click();    // 레이아웃 닫기
						
						alert("예약이 가득차 예약이 불가능합니다ㅠㅠ");
					}
				},
				error : function(e){
					console.log(e);
				}
			});
		 }
		 
   	</script>


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


    <!-- 메신저 글쓰기 팝업 화면 -->
    <div id="writingMessage" class="layerPop writingMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button type="button" class="btn_closeLayer" onclick="hideLayer('writingMessage');"><span class="blind">팝업 닫기</span></button>
        </div>
        <div class="layerBody">
        <form action="${ contextPath }/messenger/insert/host" method="post">
        <input type="hidden" value="${ room.userId }" name="to_user">
            <br>
            <div class="tblType2 noBorder">
                <table>
                    <colgroup>
                        <col style="width:20%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>보낸 사람</th>
                            <td>
                                ${ loginUser.user_id }
                            </td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="selectbox">
                                    <button class="title" type="button" title="카테고리 선택" id="selectCate" disabled >카테고리를 선택하세요 </button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="문의" class="option category" id="sel1_1" name="category" checked="checked"/>
                                            <label for="sel1_1">1. 문의</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="신고" class="option category" id="sel1_2" name="category" />
                                            <label for="sel1_2">2. 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea placeholder="내용을 입력해 주세요" name="msg_content" id="Mcontent"></textarea>
                                    <span class="charCnt"><em>0</em>/200</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap" id="msg_btnWrap">
                <button type="submit" class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>보내기</span></button>
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('writingMessage');return false;"><span>닫기</span></button>
            </div>
        </form>
        </div>
    </div>
    
    
<script>

	// 글자수 체크
	$('#Mcontent').on('keyup', function() {
	    $('.charCnt').text(+$(this).val().length+"/200");
	    
	      if($(this).val().length > 200) {
	          $(this).val($(this).val().substring(0, 200));
	          $('.charCnt').text("200/200");
	      }
	});	

</script>    
