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
							<p>제목</p>
							<div class="rating_star">
								<span class="starPoint p5">5</span>
							</div>
							<p>(3.2/5)</p>
						</div>
						<div class="reco_address">주소</div>
						<div class="exp">설명</div>
					</div>

					<div class="reco_map"><!-- 맵부분 시작 -->
						<div class="map_api">지도 api</div>
						<div class="map_url">
							<button class="btn btnType1 btnSizeM"><span>네이버맵 연결</span></button>
							<button class="btn btnType1 btnSizeM"><span>카카오맵 연결</span></button>
						</div>
					</div><!-- 맵부분 끝 -->

					<div class="detail_review"><!-- 한줄평 시작 -->
						<p>회원 리뷰</p>
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