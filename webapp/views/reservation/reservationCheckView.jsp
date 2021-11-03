<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>
<div class="reservation">
	<div class="container">
		<h2>예약조회</h2>
		<div class="reser_list">
			<c:forEach var="reserve" items="${ reservationList }">
			<div class="reser_item">
				<div class="item_img" style="background-image : url('${contextPath}${reserve.room_info.fileList[0].filePath}${reserve.room_info.fileList[0].changeName}')"></div>
				<div class="reser_info">
					<p class="reser_num">예약번호 : <fmt:formatNumber value="${ reserve.room_reserve }" pattern="0000000000" maxIntegerDigits="10" /></p>
					<p class="item_name">${ reserve.room_info.roomName }</p>
					<p>주소 : ${ reserve.room_info.address }</p>
					<p>예약날짜 : <fmt:formatDate value="${ reserve.start_date }" type="both" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ reserve.end_date }" type="both" pattern="yyyy.MM.dd"/></p>
					<p>예약자명 : ${ reserve.person_reserve }</p>
					<p>숙박인원 : ${ reserve.reserve_num }명</p>
					<div class="btn_wrap">	
						<c:choose>	
							<c:when test="${ reserve.reserve_state eq '예약신청' }">
								<p>호스트에게 예약신청 승인요청중 입니다.</p>
								<a href="#" class="btn btnType2 btnSizeS"><span>예약취소</span></a>
							</c:when>	
							<c:when test="${ reserve.reserve_state eq '결제대기' }">				
								<a href="${contextPath}/payment" class="btn btnType1 btnSizeS"><span>결제하기</span></a>
								<a href="#" class="btn btnType2 btnSizeS"><span>예약취소</span></a>
							</c:when>
							<c:when test="${ reserve.reserve_state eq '예약완료' }">				
								<p>예약이 완료 되었습니다.</p>
								<a href="#" class="btn btnType2 btnSizeS"><span>예약취소</span></a>
							</c:when>
							<c:otherwise test="${ reserve.reserve_state eq '숙박완료' }">				
								<a href="#" class="btn btnType1 btnSizeS"><span>리뷰쓰기</span></a>
								<a href="#" class="btn btnType2 btnSizeS"><span>신고하기</span></a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			</c:forEach>			
		</div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp" %>