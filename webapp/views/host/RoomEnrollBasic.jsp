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
					<a href="#" class="roommenu">
						<span class="menu-left">기본설정</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
					</a>
					<a href="#" class="roommenu">
						<span class="menu-left">위치/사진/동영상</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
					</a>
					<a href="#" class="roommenu">
						<span class="menu-left">예약/요금 설정</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
					</a>
                </nav>
				<br>
                <a href="#" class="roommenu_cal">
					<span class="menu-left-cal"><img src="${ contextPath }/resources/images/common/ico_cal.png"></span>
					<span class="menu-right-cal">달력관리</span>
				</a>
				<br>
				<div class="btn_wrap">
					<a href="#" class="btn btnType1 btnSizeS roomregistbtn"><span>숙소등록</span></a>   
				</div>	
                </div>

				<!-- 등록 내용 화면 -->
				<div class="roomenroll_basic">
					<!-- ** 기본설정 1 ** -->
					<form method="post" action="${ contextPath }/host/roomenrollbasic" name="roomeenrollbasic"> 
						<div class="roomenroll_title_main">
							<h2>설명</h2><span>숙소를 소개해주세요.</span>
						</div>
						<div class="roomenroll_content">
							<div class="roomenroll_title_sub">
								<p>호스트님만의 특별한 이름과 소개글로 꾸며주세요.</p>
							</div>
							<br>
							<div class="roomenroll_title_sub">
								<p>숙소 이름</p><span>※ 숙소 이름에는 특수문자를 사용하실 수 없습니다.</span>
							</div>

							<div class="inp_text roomenroll_inp">
								<input type="text" name="roomname" id="roomname" required>
							</div>
							<!-- 유효성 검사 후 에러 발생시 input태그 밑에 나타남-->
							<p class="" id="nameresult"></p>

							<div class="roomenroll_title">
								<p>숙소 제목</p><span>※ 숙소의 특징이 잘 나타날 수 있게 표현해주세요. ex)아름다운 제주바다가 눈 앞에</span>
							</div>
							<div class="inp_text roomenroll_inp">
								<input type="text" name="roomtitle" id="roomtitle" required>
							</div>
							<div class="roomenroll_title">
								<p>숙소 소개</p>
							</div>
							<div class="textbox roomenroll_introduce">
								<textarea name="roomdes" placeholder="숙소를 소개하는 내용을 작성해주세요."></textarea>
							</div>
						</div>
						<!-- ** 기본설정 2 ** -->
						<div class="roomenroll_title_main main2">
							<h2>기본설정</h2><span>숙소의 기본정보를 등록하세요.</span>
						</div>
						<div class="roomenroll_content">
							<div class="roomenroll_title_sub">
								<p>침실 및 침대</p>
							</div>
							<div class="roomenroll_content_opt">
								<div class="roomenroll_content_list">
									<div class="roomenroll_title">
										<p>방 수</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="0" class="option" id="roomcnt0" name="room" />
												<label for="roomcnt0">0</label>
											</li>
											<li>
												<input type="radio" value="1" class="option" id="roomcnt1" name="room" />
												<label for="roomcnt1">1</label>
											</li>
											<li>
												<input type="radio" value="2" class="option" id="roomcnt2" name="room" />
												<label for="roomcnt2">2</label>
											</li>
											<li>
												<input type="radio" value="3" class="option" id="roomcnt3" name="room">
												<label for="roomcnt3">3</label>
											</li>
											<li>
												<input type="radio" value="4" class="option" id="roomcnt4" name="room">
												<label for="roomcnt4">4</label>
											</li>
											<li>
												<input type="radio" value="5" class="option" id="roomcnt5" name="room">
												<label for="roomcnt5">5</label>
											</li>
											<li>
												<input type="radio" value="6" class="option" id="roomcnt6" name="room">
												<label for="roomcnt6">6</label>
											</li>
											<li>
												<input type="radio" value="7" class="option" id="roomcnt7" name="room">
												<label for="roomcnt7">7</label>
											</li>
											<li>
												<input type="radio" value="8" class="option" id="roomcnt8" name="room">
												<label for="roomcnt8">8</label>
											</li>
											<li>
												<input type="radio" value="9" class="option" id="roomcnt9" name="room">
												<label for="roomcnt9">9</label>
											</li>
											<li>
												<input type="radio" value="10" class="option" id="roomcnt10" name="room">
												<label for="roomcnt10">10</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="roomenroll_content_list">
									<div class="roomenroll_title">
										<p>침대 수</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="0" class="option" id="bedcnt0" name="bed" />
												<label for="bedcnt0">0</label>
											</li>
											<li>
												<input type="radio" value="1" class="option" id="bedcnt1" name="bed" />
												<label for="bedcnt1">1</label>
											</li>
											<li>
												<input type="radio" value="2" class="option" id="bedcnt2" name="bed" />
												<label for="bedcnt2">2</label>
											</li>
											<li>
												<input type="radio" value="3" class="option" id="bedcnt3" name="bed">
												<label for="bedcnt3">3</label>
											</li>
											<li>
												<input type="radio" value="4" class="option" id="bedcnt4" name="bed">
												<label for="bedcnt4">4</label>
											</li>
											<li>
												<input type="radio" value="5" class="option" id="bedcnt5" name="bed">
												<label for="bedcnt5">5</label>
											</li>
											<li>
												<input type="radio" value="6" class="option" id="bedcnt6" name="bed">
												<label for="bedcnt6">6</label>
											</li>
											<li>
												<input type="radio" value="7" class="option" id="bedcnt7" name="bed">
												<label for="bedcnt7">7</label>
											</li>
											<li>
												<input type="radio" value="8" class="option" id="bedcnt8" name="bed">
												<label for="bedcnt8">8</label>
											</li>
											<li>
												<input type="radio" value="9" class="option" id="bedcnt9" name="bed">
												<label for="bedcnt9">9</label>
											</li>
											<li>
												<input type="radio" value="10" class="option" id="bedcnt10" name="bed">
												<label for="bedcnt10">10</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="roomenroll_content_list">
									<div class="roomenroll_title">
										<p>욕실 수</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="0" class="option" id="bathroomcnt0" name="bath" />
												<label for="bathroomcnt0">0</label>
											</li>
											<li>
												<input type="radio" value="1" class="option" id="bathroomcnt1" name="bath" />
												<label for="bathroomcnt1">1</label>
											</li>
											<li>
												<input type="radio" value="2" class="option" id="bathroomcnt2" name="bath" />
												<label for="bathroomcnt2">2</label>
											</li>
											<li>
												<input type="radio" value="3" class="option" id="bathroomcnt3" name="bath">
												<label for="bathroomcnt3">3</label>
											</li>
											<li>
												<input type="radio" value="4" class="option" id="bathroomcnt4" name="bath">
												<label for="bathroomcnt4">4</label>
											</li>
											<li>
												<input type="radio" value="5" class="option" id="bathroomcnt5" name="bath">
												<label for="bathroomcnt5">5</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<br>
							<div class="roomenroll_title_sub">
								<p>집/건물</p>
							</div>
							<div class="roomenroll_content_opt">
								<div class="roomenroll_content_list">
									<div class="roomenroll_title">
										<p>숙소종류</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="원룸" class="option" id="roomtype1" name="roomtype" />
												<label for="roomtype1">원룸</label>
											</li>
											<li>
												<input type="radio" value="투룸" class="option" id="roomtype2" name="roomtype" />
												<label for="roomtype2">투룸</label>
											</li>
											<li>
												<input type="radio" value="쓰리룸이상" class="option" id="roomtype3" name="roomtype" />
												<label for="roomtype3">쓰리룸 이상</label>
											</li>
											<li>
												<input type="radio" value="복층" class="option" id="roomtype4" name="roomtype">
												<label for="roomtype4">복층</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="roomenroll_content_list">
									<div class="roomenroll_title">
										<p>건물유형</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="원룸" class="option" id="buildingtype1" name="buildingtype" />
												<label for="buildingtype1">원룸</label>
											</li>
											<li>
												<input type="radio" value="빌라" class="option" id="buildingtype2" name="buildingtype" />
												<label for="buildingtype2">빌라</label>
											</li>
											<li>
												<input type="radio" value="펜션" class="option" id="buildingtype3" name="buildingtype" />
												<label for="buildingtype3">펜션</label>
											</li>
											<li>
												<input type="radio" value="오피스텔" class="option" id="buildingtype4" name="buildingtype">
												<label for="buildingtype4">오피스텔</label>
											</li>
											<li>
												<input type="radio" value="단독주택" class="option" id="buildingtype5" name="buildingtype">
												<label for="buildingtype5">단독주택</label>
											</li>
											<li>
												<input type="radio" value="쉐어하우스" class="option" id="buildingtype6" name="buildingtype">
												<label for="buildingtype6">쉐어하우스</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="roomenroll_content_list">
									<div class="roomenroll_title">
										<p>건물평수</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="모름" class="option" id="roomsize1" name="roomsize" />
												<label for="roomsize1">모름</label>
											</li>
											<li>
												<input type="radio" value="5평" class="option" id="roomsize2" name="roomsize" />
												<label for="roomsize2">5평</label>
											</li>
											<li>
												<input type="radio" value="5~10평" class="option" id="roomsize3" name="roomsize" />
												<label for="roomsize3">5~10평</label>
											</li>
											<li>
												<input type="radio" value="10~15평" class="option" id="roomsize4" name="roomsize">
												<label for="roomsize4">10~15평</label>
											</li>
											<li>
												<input type="radio" value="15~20평" class="option" id="roomsize5" name="roomsize">
												<label for="roomsize5">15~20평</label>
											</li>
											<li>
												<input type="radio" value="20~25평" class="option" id="roomsize6" name="roomsize">
												<label for="roomsize6">20~25평</label>
											</li>
											<li>
												<input type="radio" value="25~30평" class="option" id="roomsize7" name="roomsize">
												<label for="roomsize7">25~30평</label>
											</li>
											<li>
												<input type="radio" value="30~40평" class="option" id="roomsize8" name="roomsize">
												<label for="roomsize8">30~40평</label>
											</li>
											<li>
												<input type="radio" value="40~50평" class="option" id="roomsize9" name="roomsize">
												<label for="roomsize9">40~50평</label>
											</li>
											<li>
												<input type="radio" value="50평 초과" class="option" id="roomsize10" name="roomsize">
												<label for="roomsize10">50평 초과</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<br>
						<!-- ** 기본설정 3 ** -->
						<div class="roomenroll_title_main main2">
							<h2>입/퇴실시간</h2><span>입/퇴실시간을 설정하세요.</span>
						</div>
						<div class="roomenroll_content">
							<div class="roomenroll_content_opt">
								<div class="roomenroll_content_list">
									<div class="roomenroll_starttime">
										<p>입실 시간</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="09:00" class="option" id="starttime1" name="starttime" />
												<label for="starttime1">09:00</label>
											</li>
											<li>
												<input type="radio" value="10:00" class="option" id="starttime2" name="starttime" />
												<label for="starttime2">10:00</label>
											</li>
											<li>
												<input type="radio" value="11:00" class="option" id="starttime3" name="starttime" />
												<label for="starttime3">11:00</label>
											</li>
											<li>
												<input type="radio" value="12:00" class="option" id="starttime4" name="starttime">
												<label for="starttime4">12:00</label>
											</li>
											<li>
												<input type="radio" value="13:00" class="option" id="starttime5" name="starttime">
												<label for="starttime5">13:00</label>
											</li>
											<li>
												<input type="radio" value="14:00" class="option" id="starttime6" name="starttime">
												<label for="starttime6">14:00</label>
											</li>
											<li>
												<input type="radio" value="15:00" class="option" id="starttime7" name="starttime">
												<label for="starttime7">15:00</label>
											</li>
											<li>
												<input type="radio" value="16:00" class="option" id="starttime8" name="starttime">
												<label for="starttime8">16:00</label>
											</li>
											<li>
												<input type="radio" value="17:00" class="option" id="starttime9" name="starttime">
												<label for="starttime9">17:00</label>
											</li>
											<li>
												<input type="radio" value="18:00" class="option" id="starttime10" name="starttime">
												<label for="starttime10">18:00</label>
											</li>
											<li>
												<input type="radio" value="19:00" class="option" id="starttime11" name="starttime">
												<label for="starttime11">19:00</label>
											</li>
											<li>
												<input type="radio" value="20:00" class="option" id="starttime12" name="starttime">
												<label for="starttime12">20:00</label>
											</li>
											<li>
												<input type="radio" value="21:00" class="option" id="starttime13" name="starttime">
												<label for="starttime13">21:00</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="roomenroll_content_list">
									<div class="roomenroll_endtime">
										<p>퇴실 시간</p>
									</div>
									<div class="selectbox roomenroll_sel">
										<button class="title" type="button" title="검색옵션 선택">선택</button>
										<ul class="selList">
											<li>
												<input type="radio" value="09:00" class="option" id="endtime1" name="endtime" />
												<label for="endtime1">09:00</label>
											</li>
											<li>
												<input type="radio" value="10:00" class="option" id="endtime2" name="endtime" />
												<label for="endtime2">10:00</label>
											</li>
											<li>
												<input type="radio" value="11:00" class="option" id="endtime3" name="endtime" />
												<label for="endtime3">11:00</label>
											</li>
											<li>
												<input type="radio" value="12:00" class="option" id="endtime4" name="endtime">
												<label for="endtime4">12:00</label>
											</li>
											<li>
												<input type="radio" value="13:00" class="option" id="endtime5" name="endtime">
												<label for="endtime5">13:00</label>
											</li>
											<li>
												<input type="radio" value="14:00" class="option" id="endtime6" name="endtime">
												<label for="endtime6">14:00</label>
											</li>
											<li>
												<input type="radio" value="15:00" class="option" id="endtime7" name="endtime">
												<label for="endtime7">15:00</label>
											</li>
											<li>
												<input type="radio" value="16:00" class="option" id="endtime8" name="endtime">
												<label for="endtime8">16:00</label>
											</li>
											<li>
												<input type="radio" value="17:00" class="option" id="endtime9" name="endtime">
												<label for="endtime9">17:00</label>
											</li>
											<li>
												<input type="radio" value="18:00" class="option" id="endtime10" name="endtime">
												<label for="endtime10">18:00</label>
											</li>
											<li>
												<input type="radio" value="19:00" class="option" id="endtime11" name="endtime">
												<label for="endtime11">19:00</label>
											</li>
											<li>
												<input type="radio" value="20:00" class="option" id="endtime12" name="endtime">
												<label for="endtime12">20:00</label>
											</li>
											<li>
												<input type="radio" value="21:00" class="option" id="endtime13" name="endtime">
												<label for="endtime13">21:00</label>
											</li>
										</ul>
									</div>
								</div>	
							</div>
						</div>
						<!-- ** 기본설정 4 ** -->
						<div class="roomenroll_title_main main2">
							<h2>편의시설</h2><span>이용시 참고할 수 있는 편의시설을 등록해주세요.</span>
						</div>
						<div class="roomenroll_content">
							<div class="roomenroll_title_sub">
								<p>숙소에서 사용할 수 있는 편의시설들을 체크하세요.</p>
							</div>
							<br>
							<!-- 편의시설 체크박스 -->
							<div class="roomenroll_checkbox_wrap">
								<div class="roomenroll_checkbox">
									<h3>기본시설</h3>
									<ul>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac1" value="TV">
												<label for="fac1">TV</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac2" value="에어컨">
												<label for="fac2">에어컨</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac3" value="와이파이">
												<label for="fac3">와이파이</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac4" value="전기포트">
												<label for="fac4">전기포트</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac5" value="전자렌지">
												<label for="fac5">전자렌지</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac6" value="밥솥">
												<label for="fac6">밥솥</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac7" value="수건">
												<label for="fac7">수건</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac8" value="식기">
												<label for="fac8">식기</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac9" value="다리미">
												<label for="fac9">다리미</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac10" value="헤어드라이기">
												<label for="fac10">헤어드라이기</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac11" value="냉장고">
												<label for="fac11">냉장고</label>
											</span>
										</li>
									</ul>
								</div>
								<div class="roomenroll_checkbox">
									<h3>추가시설</h3>
									<ul>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac12" value="욕조">
												<label for="fac12">욕조</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac13" value="세탁기">
												<label for="fac13">세탁기</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac14" value="건조기">
												<label for="fac14">건조기</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac15" value="무료주차">
												<label for="fac15">무료주차</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac16" value="위생용품">
												<label for="fac16">위생용품</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac17" value="바비큐">
												<label for="fac17">바비큐</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac18" value="테라스">
												<label for="fac18">테라스</label>
											</span>
										</li>
									</ul>
								</div>
								<div class="roomenroll_checkbox">
									<h3>특별시설</h3>
									<ul>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac19" value="가족/어린이 환영">
												<label for="fac19">가족/어린이 환영</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac20" value="반려동물 입실가능">
												<label for="fac20">반려동물 입실가능</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac21" value="반려동물 입실금지">
												<label for="fac21">반려동물 입실금지</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac22" value="휠체어 사용가능">
												<label for="fac22">휠체어 사용가능</label>
											</span>
										</li>
									</ul>
								</div>
								<div class="roomenroll_checkbox">
									<h3>안전시설</h3>
									<ul>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac23" value="화재감지기">
												<label for="fac23">화재감지기</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac24" value="구급상자">
												<label for="fac24">구급상자</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac25" value="소화기">
												<label for="fac25">소화기</label>
											</span>
										</li>
										<li>
											<span class="inp_check">
												<input type="checkbox" name="roomfac" id="fac26" value="실내흡연 불가능">
												<label for="fac26">실내흡연 불가능</label>
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="btn_wrap roomregistbtn2">
							<a href="#" class="btn btnType1 btnSizeS" type="button" onclick="submit();"><span>다음</span></a>   
						</div>	
					</form>
                </div>
			</div>
		</div>
		<script>
		// 숙소이름 input에 특수문자 입력하는 경우 error 메세지 띄우기
		document.forms.roomeenrollbasic.oninput = function(){
			let regExp = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
			let roomname = document.getElementById("roomname").value;
			let divinp = document.querySelector(".roomenroll_inp");
			let nameresult = document.getElementById("nameresult");
									
			if(!regExp.test(roomname)){
				divinp.classList.add('inp_error');
				nameresult.classList.add('error');
				nameresult.innerHTML = '숙소 이름에는 특수문자를 사용하실 수 없습니다'
	
			} else{
				divinp.classList.remove('inp_error');
				nameresult.classList.remove('error');
				nameresult.innerHTML = '';
			}

		};
		
		// 제출하기
		function submit(){
			document.forms.roomeenrollbasic.submit();
		}
		</script>
		
<%@include file="/views/common/footer.jsp" %>



