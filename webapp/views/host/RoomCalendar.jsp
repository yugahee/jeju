<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
			<div class="container">
				<div class="room_calendar">
					<div class="room_calendar_info">
						<p>※ 달력관리 페이지에서는 <b style="color: #0e7539; font-size: 1.2em;">'예약완료'</b> 상태인 숙소의 이름과 예약자명, 
						예약인원수를 한 눈에 확인하실 수 있습니다.</p>
					</div>
					<br>
					<!-- 달력 내용 화면 -->
					<div id='calendar'>
				
	                </div> 
                </div>  
       		</div>
</div>

	<script>
	
		// FullCalendar script (기본!!)
	     document.addEventListener('DOMContentLoaded', function() {
	       var calendarEl = document.getElementById('calendar');
	       var calendar = new FullCalendar.Calendar(calendarEl, {
	         initialView: 'dayGridMonth'
	       });
	       calendar.render();
	     });
		
		// ** ajax로 db값 넘겨받기
		$.ajax({
			url : "${ contextPath }/host/calendar",
			dataType : "json",
			type : "post",
			success : function(reserveList){
				// console.log(reserveList);
				var list = reserveList;
				// map메소드 : 배열 내의 모든 요소 각각에 대하여 주어진 함수 호출한 결과 모아 새로운 배열 반환
				var events = list.map(function(item){
					 var enddate = new Date(item.end_date);
					 enddate.setDate(enddate.getDate());

					 // enddate = toStringByFormatting(new Date(enddate));
					 // console.log(enddate);  // 2021-11-08
					 // enddate.setDate(enddate.getDate() + 1);   => 종료일 -1 로 달력에 표시되길래 +1했더니 하루 더 늘어남..뭐임.. 
					 
					/*  function toStringByFormatting(date){
						 const year = date.getFullYear();
						 const month = date.getMonth() + 1;
						 const day = date.getDate();
						 
						 return [year, month, day].join('-');
					 } */

					return{  // 제목, 일정시작시간, 일정종료시간
						title : item.room_info.roomName + '-' + item.person_reserve + '(' + item.reserve_num + '명)',
						start : item.start_date,
						end : item.end_date
						
					} //end : item.end_date
					 // end date가 달력에 표시될 때는 하루 이전으로 표시됨. 해당 마지막날짜 표시해주려고 end:enddate로 바꾸면 시간이 표시됨..
				});
				
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					events : events,   // 이벤트 : 일정등록
/* 					eventTimeFormat : {
						hour: '2-digit',
						minute: '2-digit',
						hour12: false
					}  */
				});
				
				calendar.render();
			}
		});
		
	
	</script>
<%@include file="/views/common/footer.jsp" %>