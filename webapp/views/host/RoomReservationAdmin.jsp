<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="../resources/css/common.css">
<link type="text/css" rel="stylesheet" href="../resources/css/contents.css">  
<%@ include file="/views/common/header.jsp" %>
<div class="host_reservation">
   <div class="container">
       <h2>예약관리</h2>
       <div class="sec sec01">
           <div class="total_box">
               <ul>
                   <li>
                       <p style="color:#024137">${reserveRequestCount}</p>
                       <p>예약신청</p>
                   </li>
                   <li>
                       <p style="color:#ff8b33">${paymentWaitCount}</p>
                       <p>결제대기</p>
                   </li>
                   <li>
                       <p style="color:#999">${reserveCancleCount}</p>
                       <p>예약취소</p>
                   </li>
                   <li>
                       <p style="color:red">${reserveCompletion}</p>
                       <p>예약완료</p>
                   </li>
                   <li>
                       <p style="color:pink">${lodgeCompletion}</p>
                       <p>숙박완료</p>
                   </li>
               </ul>
           </div>                    
       </div><!-- sec01 END -->
       <div class="sec sec02">
           <div class="search_box">
               <form>
                   <div class="selectbox">
                       <button class="title" type="button" title="검색옵션 선택">검색옵션 선택</button>
                       <ul class="selList">
                           <li>
                               <input type="radio" value="guestName" class="option" id="sel1_1" name="searchCondition" 
                               <c:if test="${param.searchCondition == 'guestName' }">selected="selected"</c:if> />
                               <label for="sel1_1">게스트명</label>
                           </li>
                           <li>
                               <input type="radio" value="roomName" class="option" id="sel1_2" name="searchCondition" 
                               <c:if test="${param.searchCondition == 'roomName' }">selected="selected"</c:if> />
                               <label for="sel1_2">숙소명</label>
                           </li>
                           <li>
                               <input type="radio" value="reserveNum" class="option" id="sel1_3" name="searchCondition" 
                               <c:if test="${param.searchCondition == 'reserveNum' }">selected="selected"</c:if> />
                               <label for="sel1_3">예약번호</label>
                           </li>                            
                       </ul>                                
                   </div>
                   <div class="inp_text search">
                       <input type="text" name="searchValue" id="" placeholder="검색어를 입력하세요" value="${ param.searchValue }">
                       <button class="btn_sch">검색</button> <!-- <a href="#" class="btn_sch">검색</a> -->
                   </div>
               </form>
           </div>
       </div>
       <div class="sec sec03">
           <div class="tblType3 noBorT noBorB boardList">
           	  
	               <table summary="이벤트 후기 목록">
	                   <caption>이벤트 후기 목록</caption>
	                   <colgroup>
	                       <col style="width:9.2%">
	                       <col style="width:*">
	                       <col style="width:13.8%">
	                       <col style="width:14.8%">
	                       <col style="width:13.2%">
	                   </colgroup>
	                  <c:choose>
	                  <c:when test="${!empty reserveInfo }">
		                   <thead>
		                       <tr>
		                           <th>NO</th>
		                           <th>상태</th>
		                           <th>예약번호</th>
		                           <th>날짜</th>
		                           <th>숙소이름</th>
		                           <th>게스트</th>
		                           <th>인원</th>
		                           <th>관리</th>
		                       </tr>
		                   </thead>
		                   <c:forEach var="reserveInfo" items="${reserveInfo}">
		                   <tbody>
		                       <tr>
		                           <td>1</td>
		                           <td>${reserveInfo.reserve_state}</td>
		                           <td>${reserveInfo.room_reserve}</td>
		                           <td> &nbsp; 체크인 : ${reserveInfo.start_date} 
		                         	 <br>&nbsp;&nbsp;&nbsp;체크아웃 : ${reserveInfo.end_date}</td>
		                           <td>${reserveInfo.room_info.roomName}</td>
		                           <td>${reserveInfo.person_reserve}</td>
		                           <td>${reserveInfo.reserve_num}</td>
		                           <c:choose>
		                           	   <c:when test="${reserveInfo.reserve_state eq '예약신청'}">
	                          				 <td> &nbsp; <a href="#" id="btnAccept" class="btn btnType1 btnSizeS btn_size" onclick="btnAccept(${reserveInfo.room_reserve})">
	                          				 			 <span>수락</span></a> <br> 
			                          					 <a href="#" id="btnRefuse" class="btn btnType2 btnSizeS" onclick="btnRefuse(${reserveInfo.room_reserve})">
			                          					 <span>거절</span></a>
	                          				 </td> 
		                       	   	   </c:when>
		                       	   	   <c:when test="${reserveInfo.reserve_state eq '숙박완료'}">
	                          				 <td> <a href="#" class="btn btnType2 btnSizeS"><span>게스트 신고하기</span></a> </td> 
		                       	   	   </c:when>
		                       	   </c:choose>
		                       </tr>
		                   </tbody>
			               </c:forEach> 
			            </c:when>
			            <c:otherwise>
							  <div class="noData">
				                <p>조회된 예약이 없습니다.</p>
				              </div>
			            </c:otherwise>
		              </c:choose>
	              </table>
           </div>
       </div>
   </div>
</div>
 
 <!--   예약신청, 결제대기, 예약취소, 예약완료, 숙박완료 -->
 
 <form name="payWaitUpdateOrReserveCancleForm" method="post"> 
 	<input type="hidden" id="room_reserve" name="reserve_no" >
 </form>
 
 
 <!-- 예약 신청 수락 버튼 클릭 시  -->
<script>
	function btnAccept(room_reserve) {
		// 수락 버튼 없애기
		let btnAccept = document.getElementById("btnAccept");
		btnAccept.remove();
		
		// 거절 버튼 없애기 
		let btnRefuse = document.getElementById("btnRefuse");
		btnRefuse.remove();
		
		let roomReserve = room_reserve;
		document.querySelector('#room_reserve').value = roomReserve;
		
		if(confirm('예약신청을 수락하시겠습니까?')) {
			document.forms.payWaitUpdateOrReserveCancleForm.action = "${contextPath}/payment/waiting"
			document.forms.payWaitUpdateOrReserveCancleForm.submit();
		}
		
	}

</script>

 <!-- 예약 신청 거절 버튼 클릭 시  -->
<script>
	function btnRefuse(room_reserve) {
		// 수락 버튼 없애기
		let btnAccept = document.getElementById("btnAccept");
		btnAccept.remove();
		
		// 거절 버튼 없애기 
		let btnRefuse = document.getElementById("btnRefuse");
		btnRefuse.remove();
		
		let roomReserve = room_reserve;
		document.querySelector('#room_reserve').value = roomReserve;
		
		if(confirm('예약신청을 거절하시겠습니까?')) {
			document.forms.payWaitUpdateOrReserveCancleForm.action = "${contextPath}/reservation/cancle";
			document.forms.payWaitUpdateOrReserveCancleForm.submit();
		}
		
	}

</script>

<%@ include file="/views/common/footer.jsp" %>