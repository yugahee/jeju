<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

	<div class="main">  <!-- 메인 시작 -->
			<div class="container">
				<div class="detail_upper">
					<div class="prev_page"> <!-- back 버튼 -->
						<a href="${ contextPath }/reco/mainView" class="btn btnType2 btnSizeM"><span class="arr-left">&lt;&lt; &nbsp;이전으로</span></a>
					</div>
					
					<div class="like"><!-- 하트 -->
						<a href="#">
							<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
						</a>
						<p class="count">200</p>
					</div>
				</div><!-- detail_upper end -->

				<div class="banner"><!--배너-->
					<a href="${ contextPath }/mbti/mainView"><img src="${ contextPath }/resources/images/ch/banner.jpg"></a>
				</div><!--배너 끝-->
				
				<div class="detail_content">
					<div class="detail_exp"><!-- 소개 부분 -->
						<div class="imageArea" style="background-image: url(${ contextPath }/resources/images/ch/item.jpg);">
						</div>
						<div class="star_average">
							<p>${ reco.recoName }</p>
							<div class="rating_star">
								<span class="starPoint p5">5</span>
							</div>
							<p>(3.2/5)</p>
						</div>
						<div class="reco_address">${ reco.recoAddress }</div>
						<div class="exp">${ reco.recoExpl }</div>
					</div>

					<div class="reco_map"><!-- 맵부분 시작 -->
						<div class="map_api" id="recoMap">지도 api</div>
						<div class="map_url">
							<button class="btn btnType1 btnSizeM" onclick='location.href="${ reco.naverMap }"'><span>네이버맵 연결</span></button>
							<button class="btn btnType1 btnSizeM" onclick='location.href="${ reco.kakaoMap }"'><span>카카오맵 연결</span></button>
						</div>
					</div><!-- 맵부분 끝 -->

					<!-- 한줄평 리스트 시작 -->
					<div class="detail_review">
						<p>회원 리뷰</p>
						
					<c:forEach var="review" items="${ reco.reviewList }">
						<div class="detail_comment">
							<p>${ review.userId }</p>
							<div class="rating_star">
								<span class="starPoint p5">5</span>
							</div>
							<p>${ review.sComment }</p>
							<p>${ review.writeTime }</p>
							<div class="change_button">
								<a href="#" class="btnTypeIcon btn_modify">수정</a>
								<a href="#" class="btnTypeIcon btn_delete">삭제</a>
							</div>
						</div>
					</c:forEach>

						<div class="detail_comment">
							<p>id</p>
							<div class="rating_star">
								<span class="starPoint p5">5</span>
							</div>
							<p>comment</p>
							<p>202x.xx.xx hh:mm:ss</p>
							<div class="change_button">
								<a href="#" class="btnTypeIcon btn_modify">수정</a>
								<a href="#" class="btnTypeIcon btn_delete">삭제</a>
							</div>
						</div>
					</div><!-- 한줄평 끝 -->
				</div><!-- detail_content end -->
			</div>
		</div><!-- 메인 끝 -->
		
<%@ include file="/views/common/footer.jsp" %>

<!-- 지도 api 설정 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7289567e1bdecd9a73b71af51976bb56"></script>
<script>
	var mapContainer = document.getElementById('recoMap');		// 지도를 표시할 div
	var mapOptions = {		// 지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.5000496081595, 126.46078090711264),	// 지도의 중심 좌표
			level: 3		// 지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(mapContainer, mapOptions);	// 지도 생성 및 객체 리턴
	
	var markerPosition = new kakao.maps.LatLng(33.5000496081595, 126.46078090711264);	// 마커 표시 위치 지정
	
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});		// 마커 생성
	
	marker.setMap(map);		// 마커가 지도 위에 표시되도록 설정
	
	// marker.setMap(null);		마커 제거 원할 시 실행
</script>