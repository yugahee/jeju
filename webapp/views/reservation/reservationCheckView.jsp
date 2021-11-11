<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>
<div class="reservation">
	<div class="container">
		<h2>예약조회</h2>		
		<c:choose>
			<c:when test="${ !empty reservationList }">
				<div class="reser_list">
					<c:forEach var="reserve" items="${ reservationList }">
						<div class="reser_item">
							<div class="item_img" style="background-image : url('${contextPath}${reserve.room_info.fileList[0].filePath}${reserve.room_info.fileList[0].changeName}')"></div>
							<div class="reser_info">
								<p class="reser_num">
									예약번호 : <fmt:formatNumber value="${ reserve.room_reserve }" pattern="0000000000" maxIntegerDigits="10" /><br>
									예약상태 : ${ reserve.reserve_state }
								</p>
								<p class="item_name">${ reserve.room_info.roomName }</p>
								<p>주소 : ${ reserve.room_info.address }</p>
								<p>예약날짜 : <fmt:formatDate value="${ reserve.start_date }" type="both" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ reserve.end_date }" type="both" pattern="yyyy.MM.dd"/></p>
								<p>숙박인원 : ${ reserve.reserve_num }명</p>
								<div class="btn_wrap">	
									<c:choose>	
										<c:when test="${ reserve.reserve_state eq '예약신청' }">
											<a href="#" class="btn btnType2 btnSizeS" onclick="reserveCancle(${ reserve.room_reserve })"><span>예약취소</span></a>
										</c:when>	
										<c:when test="${ reserve.reserve_state eq '결제대기' }">				
											<a href="${contextPath}/payment?reserv=${ reserve.room_reserve }" class="btn btnType1 btnSizeS"><span>결제하기</span></a>
											<a href="#" class="btn btnType2 btnSizeS" onclick="reserveCancle(${ reserve.room_reserve })"><span>예약취소</span></a>
										</c:when>
										<c:when test="${ reserve.reserve_state eq '예약완료' }">				
											<a href="#" class="btn btnType2 btnSizeS" onclick="reserveCancle(${ reserve.room_reserve })"><span>예약취소</span></a>
										</c:when>
										<c:when test="${ reserve.reserve_state eq '숙박완료' }">
											<a href="${contextPath}/roomReview?roomNo=${reserve.room_info.roomNo}&reserveNo=${reserve.room_reserve}" class="btn btnType1 btnSizeS"><span>리뷰쓰기</span></a>
											<a href="${contextPath}/messenger/list/sent?reportType=신고&reportUser=${reserve.room_info.userId}" class="btn btnType2 btnSizeS"><span>신고하기</span></a>
										</c:when>
										<c:otherwise>				
											<a href="${contextPath}/roomReview/update?reserveNo=${reserve.room_reserve}" class="btn btnType1 btnSizeS"><span>리뷰수정</span></a>											
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
            </c:when>
            <c:otherwise>	            
				<div class="noData">
	                <p>예약하신 내역이 없습니다.</p>
	                <p class="subtxt">제주라도넘어갈까에서 좋은 숙소를 예약해보세요!</p>
	            </div>
            </c:otherwise>
       </c:choose>								
	</div>
</div>
<c:if test="${ !empty reservationList }">
	<form name="reserveCancleFrom" method="post">
		<input type="hidden" name="reserve_no" id="reserve_no" />
	</form>		
</c:if>
<script>
	function reserveCancle(reserve_no){
		let reserveNo = reserve_no;		
		document.getElementById("reserve_no").value = reserveNo;
		
		if(confirm("예약을 정말 취소하시겠습니까?")){
			document.forms.reserveCancleFrom.action = "${contextPath}/reservation/cancle";
			document.forms.reserveCancleFrom.submit();
		}
	}
</script>
<%@ include file="/views/common/footer.jsp" %>
