<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
	<div class="container">
		<nav class="sub_menu">
             <ul>
                 <li><a href="${ contextPath }/mypage/modify" class="active">내 정보</a></li>
                 <li><a href="${ contextPath }/mypage/point">포인트</a></li>
                 <li><a href="${ contextPath }/mypage/delete">회원 탈퇴</a></li>
             </ul>
         </nav>
         <div class="sub point">
             <h2>포인트</h2>
             <div class="total_point_box">
                 <p class="title"><img src="../resources/images/ygh/wallet.png" />총포인트</p>
                 <p class="total">${ totalPoint }p</p>
             </div>
             <div class="point_history_box">
                 <h4>포인트 이력</h4>
                 <ul class="poin_history">
                 	<c:forEach var="point" items="${ pointList }">
                     <li>
                         <div class="textArea">
                             <p>포인트 ${ point.pointDivi }</p>
                             <p><fmt:formatDate value="${point.pointDate}" type="both" pattern="yyyy.MM.dd HH:mm:ss"/></p>
                         </div>
                         <p class="use_point">
                         	<c:choose>
	                       		<c:when test="${ point.pointDivi.equals('적립') }">
	                        		${point.point}p
	                       		</c:when>
	                       		<c:otherwise>
	                       			- ${point.point}p
	                       		</c:otherwise>
                       		</c:choose>
                         </p>
                     </li>  
                     </c:forEach>                   
                 </ul>
             </div>
         </div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp" %>