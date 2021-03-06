<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
			<div class="container">
				<!-- 서브 메뉴 바 -->
				<div class="container_roomenroll">
				<p>숙소설정</p>
				<br>
				<nav class="sub_menu_roomenroll">
					<a class="roommenu">
						<span class="menu-left">기본설정</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
					</a>
					<a class="roommenu">
						<span class="menu-left">예약/요금 설정</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
					</a>					
					<a class="roommenu">
						<span class="menu-left" style="color:#ff8b33">위치/사진/동영상</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
					</a>
                </nav>
				<br>

                </div>

				<!---------------------------- 등록 내용 화면 ------------------------------------------------>
				<div class="roomenroll_basic">
					<!-- ** 위치설정 ** -->
					<form method="post" action="${ contextPath }/host/roomenrollfin" enctype="multipart/form-data">
					<input type="hidden" name="roomname" value="${ rooms.roomName }">
					<input type="hidden" name="roomtitle" value="${ rooms.roomTitle }">
					<input type="hidden" name="roomdes" value="${ rooms.roomDes }">
					<input type="hidden" name="room" value="${ rooms.room }">
					<input type="hidden" name="bed" value="${ rooms.bed }">
					<input type="hidden" name="bath" value="${ rooms.bath }">
					<input type="hidden" name="roomtype" value="${ rooms.roomType }">
					<input type="hidden" name="buildingtype" value="${ rooms.buildingType }">
					<input type="hidden" name="roomsize" value="${ rooms.roomSize }">
					<input type="hidden" name="starttime" value="${ rooms.startTime }">
					<input type="hidden" name="endtime" value="${ rooms.endTime }">
					<input type="hidden" name="roomfac" value="${ rooms.roomFac }">
					<input type="hidden" name="minstay" value="${ rooms.minStay }">
					<input type="hidden" name="maxstay" value="${ rooms.maxStay }">
					<input type="hidden" name="minpeople" value="${ rooms.minPeople }">
					<input type="hidden" name="maxpeople" value="${ rooms.maxPeople }">
					<input type="hidden" name="price" value="${ rooms.price }">
					<input type="hidden" name="extracost" value="${ rooms.extraCost }">
					<input type="hidden" name="peakstart" value="${ rooms.peak.peakStart }">
					<input type="hidden" name="peakend" value="${ rooms.peak.peakEnd }">
					<input type="hidden" name="peakprice" value="${ rooms.peak.peakPrice }">
					
						<div class="roomenroll_title_main">
							<h2>위치</h2><span>숙소의 위치를 설정하세요.</span>
						</div>
						<div class="roomenroll_content">
							<div class="roomenroll_title_sub">
								<p>숙소 지역</p>
							</div>
							<br>
                            <div class="selectbox roomenroll_opt">
                                <button class="title" type="button" title="검색옵션 선택">지역</button>
                                <ul class="selList">
                                    <li>
                                        <input type="radio" value="동부" class="option" id="location1" name="location" required>
                                        <label for="location1">동부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="서부" class="option" id="location2" name="location">
                                        <label for="location2">서부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="중부" class="option" id="location3" name="location">
                                        <label for="location3">중부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="남부" class="option" id="location4" name="location">
                                        <label for="location4">남부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="북부" class="option" id="location5" name="location">
                                        <label for="location5">북부</label>
                                    </li>
                                </ul>
                            </div>
                            <br>
							<div class="inp_text roomenroll_inp roomenroll_opt">
								<input type="text" name="address" placeholder="상세주소를 입력하세요." id="address" required>
							</div>
							<div class="btn_wrap roomenroll_content_opt ">
                      		    <button class="btn btnType1 btnSizeS" type="button" onclick="showMap();"><span>주소 검색</span></button>   
                   			</div>
                            <!-- ************* 지도 api !!! ******************************-->
							<div class="roomenroll_map" id="map"></div>
							
						</div>	
                        <div class="roomenroll_title_main main2">
                            <h2>사진&동영상</h2><span>숙소의 사진과 동영상을 등록하세요.</span>
                        </div>
                        <div class="roomenroll_content">
                            <div class="roomenroll_title">
                                <p>유튜브 주소</p><span>※ 숙소 내부 동영상을 올리시면 예약율이 오릅니다.</span>
                            </div>
                            <br>
                            <div class="inp_text roomenroll_inp roomenroll_opt">
                                <input type="text" name="roomlink" id="roomlink" placeholder="동영상 링크주소를 입력하세요.">
                            </div>
                            <br>
							<div class="roomenroll_photo">
								<p>사진선택 &nbsp;|</p>
								<div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>메인사진 올리기</span>	
                                </div>
                                <p>* 첫번째 사진은 숙소의 메인사진으로 사용됩니다.</p>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 -->
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진1 올리기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 -->
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진2 올리기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 -->
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진3 올리기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분  -->
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진4 올리기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 -->
                            </div>
                            
                            <input type="file" class="roomphoto_upload" name="mainimg" accept="image/jpg,image/jpeg,image/png" required>
                            <input type="file" class="roomphoto_upload" name="subimg1" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg2" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg3" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg4" accept="image/jpg,image/jpeg,image/png" >
                            
                        </div>	
						<div class="btn_wrap roomregistbtn2">
							<button class="btn btnType1 btnSizeS"><span>등록하기</span></button>   
						</div>	
					</form>
                </div>
			</div>
</div>
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
			
			
			// 주소 검색 버튼 클릭시
			function showMap(){
				var address = document.getElementById('address').value; 
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
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">내 숙소</div>'
				        });
				        infowindow.open(map, marker);
	
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
			}
			
		</script>
	
		<script>
	        // 사진올리기 버튼클릭
			document.querySelectorAll(".roomenroll_photobtn").forEach(item => item.addEventListener('click', fileUploadOpen));
	        // input type="file" 열기
	        document.querySelectorAll(".roomphoto_upload").forEach(item => item.addEventListener('change', preview));
	
			function fileUploadOpen(){
				let index = Array.from(document.querySelectorAll(".roomenroll_photobtn")).indexOf(this);
	            document.querySelectorAll(".roomphoto_upload")[index].click(); 
			}
	
			function preview(){
	             if (this.files && this.files[0]) {
	                let index = Array.from(document.querySelectorAll(".roomphoto_upload")).indexOf(this); 
	                let reader = new FileReader();
	                reader.readAsDataURL(this.files[0]);
	                reader.onload = function () {       // div 안에 불러온 파일 추가
	                    document.querySelectorAll(".roomenroll_photo_wrap")[index].innerHTML = "<img src=" + reader.result + ">";
	                }
	            }
	        }
	
		</script>
		
		
<%@include file="/views/common/footer.jsp" %>

