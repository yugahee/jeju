<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>    
<div class="side_layout">
			<div class="container">
				<!-- 목록 화면 -->
				<div class="roomlist">
					<form method="" action="">
						<div class="roomenroll_title_main">
							<h2>숙소목록</h2><span>RoomList</span>
						</div>
						<div class="roomlist_statuslist">
							<ul class="roomlist_ul">
								<li>미완성</li>
								<li>승인대기</li>
								<li>승인반려</li>
								<li>등록완료</li>
							</ul>
						</div>
						<br>
						<div class="roomlist_sub">
							<div class="selectbox roomlist_sel">
								<button class="title" type="button" title="검색옵션 선택">검색옵션</button>
								<ul class="selList">
									<li>
										<input type="radio" value="" class="option" id="sel1_1" name="select1" />
										<label for="sel1_1">숙소이름</label>
									</li>
								</ul>
							</div>
							<div class="listTotal roomlist_search">
								<!-- <p class="totalCnt">총 1건</p> -->
								<div class="sortArea">
									<div class="inp_text search">
										<input type="text" name="" id="" placeholder="검색어를 입력하세요">
										<a href="#" class="btn_sch">검색</a>
									</div>
								</div>
							</div>
						</div>
						<div class="roomlist_content">
							<div class="tblType3 noBorT noBorB boardList">
								<table summary="숙소목록">
									<colgroup>
										<col style="width:9.2%">
										<col style="width:20%">
										<col style="width:9.2%">
										<col style="width:12.8%">
										<col style="width:12.8%">
										<col style="width:30%">
									</colgroup>
									<thead>
										<tr>
											<th>NO</th>
											<th>방사진</th>
											<th>상태</th>
											<th>숙소이름</th>
											<th>숙소생성일</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="al_l"><a href="#"><img src="../resources/images/host/house.png" class="roomlist_img"></a></td>
											<td><span class="roomlist_status">등록완료</span></td>
											<td>바다내음 제주집</td>
											<td>2021.10.20 15:30</td>
											<td>
												<div class="roomlist_btn">
												<div class="btn_wrap"><a href="#" class="btn btnType1 btnSizeS"><span>달력관리</span></a></div>
												<div class="btn_wrap"><a href="#" class="btn btnType2 btnSizeS"><span>수정</span></a></div>
												<div class="btn_wrap"><a href="#" class="btn btnType3 btnSizeS"><span>삭제</span></a></div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="paging">
							<span class="first"><a href="#"><span class="blind">첫페이지</span></a></span>
							<span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
							<span class="current">1</span>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
							<span class="last"><a href="#"><span class="blind">마지막페이지</span></a></span>
						</div>
                    </form>
                    <div class="roomlist_btn addroombtn">
						<div class="btn_wrap"><a href="#" class="btn btnType1 btnSizeS"><span>+ 새로운 숙소 등록</span></a></div>
					</div>
                </div>
			</div>
		</div>
<%@include file="/views/common/footer.jsp" %>