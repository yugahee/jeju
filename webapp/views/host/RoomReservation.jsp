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
                       <p style="color:#024137">1</p>
                       <p>예약신청</p>
                   </li>
                   <li>
                       <p style="color:#ff8b33">1</p>
                       <p>수락/결제대기</p>
                   </li>
                   <li>
                       <p style="color:#999">1</p>
                       <p>취소/만료/거절</p>
                   </li>
                   <li>
                       <p style="color:red">1</p>
                       <p>예약완료</p>
                   </li>
                   <li>
                       <p style="color:pink">1</p>
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
                               <input type="radio" value="" class="option" id="sel1_1" name="select1" />
                               <label for="sel1_1">게스트명</label>
                           </li>
                           <li>
                               <input type="radio" value="" class="option" id="sel1_2" name="select1" />
                               <label for="sel1_2">숙소명</label>
                           </li>
                           <li>
                               <input type="radio" value="" class="option" id="sel1_3" name="select1" />
                               <label for="sel1_3">예약번호</label>
                           </li>                            
                       </ul>                                
                   </div>
                   <div class="inp_text search">
                       <input type="text" name="" id="" placeholder="검색어를 입력하세요">
                       <a href="#" class="btn_sch">검색</a>
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
	                   <tbody>
	                   <c:forEach var="reserveInfo" items="${reserveInfo}">
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
                          				 			 <span id="accept">수락</span></a> <br> 
                          					 <a href="#" id="btnRomove" class="btn btnType2 btnSizeS" onclick=""><span>거절</span></a>
                          				 </td> 
	                       	   	   </c:when>
	                       	  
	                       	   </c:choose>
	                       </tr>
	                   </tbody>
		              </c:forEach> 
	              </table>
           </div>
       </div>
   </div>
</div>
 
 <!--   예약신청, 결제대기, 예약취소, 예약완료, 숙박완료 -->
 
 <form name="paymentWaiting" method="post"> 
 	<input id="room_reserve" name="reserve_no" type="hidden">
 </form>
 
 
<script>
	function btnAccept(room_reserve) {
		// 수락 버튼 없애기
		let acceiptBtn = document.getElementById("btnAccept");
		acceiptBtn.remove();
		
		// 거절 버튼 없애기 
		let btnRomove = document.getElementById("btnRomove");
		btnRomove.remove();
		
		let roomReserve = room_reserve;
		document.querySelector('#room_reserve').value = roomReserve;
		
		if(confirm('예약신청을 수락하시겠습니까?')) {
			document.forms.paymentWaiting.action = "${contextPath}/payment/waiting"
			document.forms.paymentWaiting.submit();
		}
		
	}


</script>




<%@ include file="/views/common/footer.jsp" %>