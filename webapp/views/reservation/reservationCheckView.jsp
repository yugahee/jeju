<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="reservation">
	<div class="container">
		<h2>예약조회</h2>
		<div class="reser_list">
			<div class="reser_item">
				<div class="item_img" style="background-image : url('../resources/images/ygh/item.jpg')"></div>
				<div class="reser_info">
					<p class="reser_num">예약번호 : 0000000</p>
					<p class="item_name">숙소명</p>
					<p>주소 : 서울시 강남구 테헤란로 10길 9 그랑프리 빌딩 4F</p>
					<p>예약날짜 : 2021.01.01 ~ 2021.01.02</p>
					<p>숙박인원 : 4명</p>
					<div class="btn_wrap">
						<a href="${contextPath}/payment" class="btn btnType1 btnSizeS"><span>결제하기</span></a>
						<a href="#" class="btn btnType2 btnSizeS"><span>예약취소</span></a>
					</div>
				</div>
			</div>
			<div class="reser_item">
				<div class="item_img" style="background-image : url('../resources/images/ygh/item.jpg')"></div>
				<div class="reser_info">
					<p class="reser_num">예약번호 : 0000000</p>
					<p class="item_name">숙소명</p>
					<p>주소 : 서울시 강남구 테헤란로 10길 9 그랑프리 빌딩 4F</p>
					<p>예약날짜 : 2021.01.01 ~ 2021.01.02</p>
					<p>숙박인원 : 4명</p>
					<div class="btn_wrap">
						<a href="${contextPath}/payment" class="btn btnType1 btnSizeS"><span>결제하기</span></a>
						<a href="#" class="btn btnType2 btnSizeS"><span>예약취소</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp" %>