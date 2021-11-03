<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

	<div class="banner"><!--배너-->
		<a href="${ contextPath }/mbti/mainView"><img src="${ contextPath }/resources/images/ch/banner.jpg"></a>
	</div><!--배너 끝-->

	<div class="main">
		<div class="container">
			<div class="sub_upper">
				<div class="reco_select">
					<div class='input_box'>
						<div class="selectbox">
							<button class="title" type="button" title="구역 선택">구역을
								선택하세요.</button>
							<ul class="selList">
								<li><input type="radio" value="" class="option" id="east"
									name="east" /> <label for="sel1_1">동부</label></li>
								<li><input type="radio" value="" class="option" id="west"
									name="west" /> <label for="sel1_2">서부</label></li>
								<li><input type="radio" value="" class="option" id="south"
									name="south" /> <label for="sel1_3">남부</label></li>
								<li><input type="radio" value="" class="option" id="north"
									name="north"> <label for="sel1_4">북부</label></li>
							</ul>
						</div>
	
						<div class="selectbox">
							<button class="title" type="button" title="카테고리 선택">카테고리를
								선택하세요.</button>
							<ul class="selList">
								<li><input type="radio" value="" class="option" id="tour"
									name="tour" /> <label for="sel1_1">관광지</label></li>
								<li><input type="radio" value="" class="option"
									id="restaurant" name="restaurant" /> <label for="sel1_2">식당</label>
								</li>
								<li><input type="radio" value="" class="option" id="cafe"
									name="cafe" /> <label for="sel1_3">카페</label></li>
							</ul>
						</div>
						<div class="inp_text">
							<input class="submit" type="submit" name="" id="" value="확인" />
						</div>
					</div>
	
					<div class='input_box'>
							<!-- <div class="inp_text inp_text2">
								<input type="text" name="reco_keyword" id="reco_keyword" placeholder="키워드를 입력하세요" />
							</div>
							<div class="inp_text">
								<input class="submit" type="submit" name="" id="" value="확인" />
							</div> -->

							<div class="sortArea">
								<div class="inp_text search inp_text2">
									<input type="text" name="" id="" placeholder="키워드를 입력하세요">
									<a href="#" class="btn_sch">검색</a>
								</div>
							</div>
						</div>
					</div><!-- sub_upper END -->
	
				<div class="list_box">
					<div class="reco_radio">
						<span class="inp_radio checked"> <input type="radio"
							name="radio1" id="radio1_1" checked="checked"> <label
							for="radio1_1">별점순</label>
						</span> <span class="inp_radio"> <input type="radio" name="radio1"
							id="radio1_2"> <label for="radio1_2">선호도순</label>
						</span> <span class="inp_radio"> <input type="radio" name="radio1"
							id="radio1_3"> <label for="radio1_3">최신순</label>
						</span>
					</div>
	
					<!-- 리스트 시작 -->
					<div class="reco_list">
						<div class="reco_item">
								<div class="imageArea" style="background-image: url(${ contextPath }/resources/images/ch/item.jpg);"
									onclick="location.href='${ contextPath }/reco/detailView'">
								</div>
								<div class="item_info">
									<a href="../html/reco_detail.html">
										<p class="item_title">장소명</p>
									</a>
									<div class="star_average">
										<div class="rating_star">
											<span class="starPoint p5">5</span>
										</div>
										<p>(3.2/5)</p>
									</div>
									<p class="adress">주소</p>
									<div class="reco_review">
										<a href="#" class="btn btnType1 btnSizeS">
											<span class="arr-right">리뷰쓰기</span>
										</a>
										<a href="#">
											<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
										</a>
										<p class="count">200</p>
									</div>
								</div>
								
								<div id="layerPop1" class="layerPop">		<!-- 레이어 시작 -->
									<form>
										<div class="layerTit">
											<h4>리뷰 등록</h4>
											
											<button class="btn_closeLayer" onclick="hideLayer('layerPop1');"><span class="blind">레이어팝업 닫기</span></button>
										</div>
										<div class="layerBody">
											<h4>장소명</h4>
											<h4>별점을 등록해주세요</h4>
		
											<div class="rating_star_large">		<!-- 별점 시작 -->
												<div class="pointArea">
													<span class="pointBg">이 장소는 <em>5</em>점입니다.</span>
													<span class="starPoint p2">
														<button>1점 선택</button>
														<button>2점 선택</button>
														<button>3점 선택</button>
														<button>4점 선택</button>
														<button>5점 선택</button>
													</span>
												</div>
											</div>		<!-- 별점 끝 -->
											<div>
												<textarea width="10px;" height="10px;" style="resize: none;" name="content">
												</textarea>
												<input type="submit">
											</div>
										</div>
									</form>
								</div>		<!-- 레이어 끝 -->
								
							</div>
	
						<div class="reco_item">
								<div class="imageArea" style="background-image: url(${ contextPath }/resources/images/ch/item.jpg);"
									onclick="location.href='reco_detail.html'">
								</div>
								<div class="item_info">
									<a href="../html/reco_detail.html">
										<p class="item_title">장소명</p>
									</a>
									<div class="star_average">
										<div class="rating_star">
											<span class="starPoint p5">5</span>
										</div>
										<p>(3.2/5)</p>
									</div>
									<p class="adress">주소</p>
									<div class="reco_review">
										<a href="#" class="btn btnType1 btnSizeS">
											<span class="arr-right">리뷰쓰기</span>
										</a>
										<a href="#">
											<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
										</a>
										<p class="count">300</p>
									</div>
								</div>
							</div>
	
	
						<div class="reco_item">
								<div class="imageArea" style="background-image: url(${ contextPath }/resources/images/ch/item.jpg);"
									onclick="location.href='reco_detail.html'">
								</div>
								<div class="item_info">
									<a href="../html/reco_detail.html">
										<p class="item_title">장소명</p>
									</a>
									<div class="star_average">
										<div class="rating_star">
											<span class="starPoint p5">5</span>
										</div>
										<p>(3.2/5)</p>
									</div>
									<p class="adress">주소</p>
									<div class="reco_review">
										<a href="#" class="btn btnType1 btnSizeS">
											<span class="arr-right">리뷰쓰기</span>
										</a>
										<a href="#">
											<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
										</a>
										<p class="count">200</p>
									</div>
								</div>
							</div>
	
						<div class="reco_item">
								<div class="imageArea" style="background-image: url(${ contextPath }/resources/images/ch/item.jpg);"
									onclick="location.href='reco_detail.html'">
								</div>
								<div class="item_info">
									<a href="../html/reco_detail.html">
										<p class="item_title">장소명</p>
									</a>
									<div class="star_average">
										<div class="rating_star">
											<span class="starPoint p5">5</span>
										</div>
										<p>(3.2/5)</p>
									</div>
									<p class="adress">주소</p>
									<div class="reco_review">
										<a href="#" class="btn btnType1 btnSizeS">
											<span class="arr-right">리뷰쓰기</span>
										</a>
										<a href="#">
											<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
										</a>
										<p class="count">200</p>
									</div>
								</div>
							</div>
					</div>
					<!-- 리스트 끝 -->
				</div>
				<!-- list_box END -->
			</div>
		</div>
	</div>

<%@ include file="/views/common/footer.jsp" %>