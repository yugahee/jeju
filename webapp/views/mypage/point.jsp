<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
	<div class="container">
		<nav class="sub_menu">
             <ul>
                 <li><a href="#">내정보</a></li>
                 <li><a href="${ contextPath }/mypage/point" class="active">포인트</a></li>
                 <li><a href="#">회원탈퇴</a></li>
             </ul>
         </nav>
         <div class="sub point">
             <h2>포인트</h2>
             <div class="total_point_box">
                 <p class="title"><img src="../resources/images/ygh/wallet.png" />총포인트</p>
                 <p class="total">10,000p</p>
             </div>
             <div class="point_history_box">
                 <h4>포인트 이력</h4>
                 <ul class="poin_history">
                     <li>
                         <div class="textArea">
                             <p>숙소예약</p>
                             <p>2021.01.01 20:00</p>
                         </div>
                         <p class="use_point">1,000p</p>
                     </li>
                     <li>
                         <div class="textArea">
                             <p>숙소예약</p>
                             <p>2021.01.01 20:00</p>
                         </div>
                         <p class="use_point">1,000p</p>
                     </li>
                     <li>
                         <div class="textArea">
                             <p>숙소예약</p>
                             <p>2021.01.01 20:00</p>
                         </div>
                         <p class="use_point">1,000p</p>
                     </li>
                 </ul>
             </div>
         </div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp" %>