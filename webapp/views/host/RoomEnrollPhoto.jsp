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
						<span class="menu-right"><img src="../resources/images/host/complete_check.png"></span>
					</a>
					<a class="roommenu">
						<span class="menu-left" style="color:#ff8b33">위치/사진/동영상</span>
						<span class="menu-right"><img src="../resources/images/host/incomplete_check.png"></span>
					</a>
					<a class="roommenu">
						<span class="menu-left">예약/요금 설정</span>
						<span class="menu-right"><img src="../resources/images/host/incomplete_check.png"></span>
					</a>
                </nav>
				<br>
                <a href="#" class="roommenu_cal">
					<span class="menu-left-cal"><img src="../resources/images/common/ico_cal.png"></span>
					<span class="menu-right-cal">달력관리</span>
				</a>
<!-- 				<br>
				<div class="btn_wrap">
					<a href="#" class="btn btnType1 btnSizeS roomregistbtn"><span>숙소등록</span></a>   
				</div>	 -->
                </div>

				<!---------------------------- 등록 내용 화면 ------------------------------------------------>
				<div class="roomenroll_basic">
					<!-- ** 위치설정 ** -->
					<form method="post" action="${ contextPath }/host/roomenrollphoto" enctype="multipart/form-data">
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
								<input type="text" name="address" placeholder="상세주소를 입력하세요." required>
							</div>
                            <!-- 지도 api !!! -->
							<div class="roomenroll_map">
                                <h1>지도 API자리</h1>
                            </div>
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
								<div class="roomenroll_photobtn" onclick="uploadimg();">
									<img src="../resources/images/common/ico_addFile_on.png">
									<span>사진올리기</span>	
								</div>
								<input type="file" class="roomphoto_upload">
								<p>사진이동 &nbsp;|</p>
								<div class="roomphotobtn_prev arrmovebtn"><img src="../resources/images/common/arr_selectT.png"></div>
								<div class="roomphotobtn_next arrmovebtn"><img src="../resources/images/common/arr_selectB.png"></div>		 
								<p>* 첫번째 사진은 숙소의 메인사진으로 사용됩니다.</p>
							</div>
							<br>	
                            <div class="roomenroll_photo_wrap">
								<!-- 업로드 된 이미지 추가되는 부분 (아래 이미지는 임시용) -->
								<img src="../resources/images/temp/imgfile_temp01.jpg">
	
                            </div>
                        </div>	
						<div class="btn_wrap roomregistbtn2">
							<button class="btn btnType1 btnSizeS"><span>다음</span></button>   
						</div>	
					</form>
                </div>
			</div>
		</div>
<%@include file="/views/common/footer.jsp" %>