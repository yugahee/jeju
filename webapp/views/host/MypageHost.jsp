<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="${ contextPath }/mypage/modify">내정보</a></li>
                        <li><a href="${ contextPath }/delete">회원탈퇴</a></li>
                    </ul>
                </nav>
                <div class="host_mypage">
                    <div class="hostprofile_wrap">
                        <img src="${ contextPath }/resources/images/usericon.png">
                        <h3 style="font-size: 1.4em;">${ loginUser.user_id }</h3>
                        <span>호스트</span>
                    </div>
					<div class="tabType1 al_c hostmainsub">
						<ul>
							<li class="on reviewli"><a>게스트 후기</a></li>
							<li class="roomli"><a>숙소</a></li>
						</ul>
					</div>
					<div class="hostpagetab roomtab">
						<c:choose>
							<c:when test="${ !empty roomList }">
							<!-- 숙소 리스트 있는 경우 -->
							<ul class="roomli_box">
							<c:forEach var="room" items="${ roomList }">
							<li class="main_roomlist">     <!-- 방 사진 클릭시 해당 숙소의 상세페이지로 이동하도록!! -->
								<a href="#"><img src="${contextPath}${room.fileList.get(0).filePath}${room.fileList.get(0).changeName}"></a><br>
								<h3>${ room.roomName }</h3>
							</li>
							</c:forEach>
							</ul> 
							</c:when>
							<c:otherwise>
							<!-- 숙소 리스트 없는 경우 -->
							<div class="noData">
								<p>등록된 숙소가 없습니다.</p>
								<a href="${ contextPath }/host/roomenrollbasic" class="subtxt"><u>숙소를 간편하게 바로 등록해보세요!</u></a>
							</div> 
							</c:otherwise>
						</c:choose>
						
						<!-- 페이징 -->
<%-- 						<div class="paging">   
							<span class="first"><a href="${ contextPath }/host/mypage?page=1"><span class="blind">첫페이지</span></a></span>
							<c:choose>
								<c:when test="${ pi.page > 1 }">
								<span class="prev"><a href="${ contextPath }/host/mypage?page=${ pi.page - 1}"><span class="blind">이전페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ p eq pi.page }">  <!-- 현재 페이지일 경우 -->
								<span class="current">${ p }</span>	
								</c:when>
								<c:otherwise>
								<a href="${ contextPath }/host/mypage?page=${ p }">${ p }</a>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
								<span class="next"><a href="${ contextPath }/host/mypage?page=${ pi.page + 1 }"><span class="blind">다음페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
								</c:otherwise>
							</c:choose>
							
							<span class="last"><a href="${ contextPath }/host/mypage?page=${ pi.maxPage }"><span class="blind">마지막페이지</span></a></span>
							
						</div>  --%>
					</div>
					<!-- 게스트 후기 탭 클릭 시 -->
					<div class="hostpagetab reviewtab">
						<div class="tblType1 reviewtab_wrap">
							<table class="reviewtbl">
								<colgroup>
									<col style="width:8%">
									<col style="width:12%">
									<col style="width:50%">
									<col style="width:12%">
									<col style="width:18%">
								</colgroup>
								<thead>
									<tr>
										<th style="font-size: 1.2em;">No</th>
										<th style="font-size: 1.2em;">숙소이름</th>
										<th style="font-size: 1.2em;">후기내용</th>
										<th style="font-size: 1.2em;">후기작성일</th>
										<th style="font-size: 1.2em;">작성자</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${ !empty reviewList }">
									<c:set var="no" value="${ (reviewPi.page - 1) * reviewPi.boardLimit }" />
									<c:forEach var="review" items="${ reviewList }">	
									<tr>
										<td><div class="review_no">${ no = no + 1 }</div></td>
										<td><div class="review_roomname">${ review.roomName }</div></td>
										<!-- 리뷰 내용은 글자 50개 까지 노출 -->
										<td><a href="#"><div class="review_content">${ review.review }</div></a></td>
										<td><div class="review_date">${ review.reviewDate }</div></td>
										<td><div class="review_writer">${ review.userId }</div></td>
									</tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
									<!-- 등록 된 후기 없을 경우 -->
									<tr>
										<td colspan="5">
											<div class="noData">
												<p>등록된 후기가 없습니다.</p>
											</div> 				
										</td>
									</tr>					
									</c:otherwise>
								</c:choose>	
								</tbody>
							</table>
						</div>
						
						<!-- 페이징 -->
						<div class="paging">
							<span class="first"><a href="${ contextPath }/host/mypage?page=1"><span class="blind">첫페이지</span></a></span>
							<c:choose>
								<c:when test="${ reviewPi.page > 1 }">
								<span class="prev"><a href="${ contextPath }/host/mypage?page=${ reviewPi.page - 1 }"><span class="blind">이전페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
								</c:otherwise>
							</c:choose>	
							
							<c:forEach var="r" begin="${ reviewPi.startPage }" end="${ reviewPi.endPage }">
							<c:choose>
								<c:when test="${ r eq reviewPi.page }">  <!-- 현재 페이지일 경우 -->
								<span class="current">${ r }</span>
								</c:when>
								<c:otherwise>
								<a href="${ contextPath }/host/mypage?page=${ r }">${ r }</a>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${ reviewPi.page < reviewPi.maxPage }">
								<span class="next"><a href="${ contextPath }/host/mypage?page=${ reviewPi.page + 1 }"><span class="blind">다음페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
								</c:otherwise>
							</c:choose>
							
							<span class="last"><a href="${ contextPath }/host/mypage?page=${ reviewPi.maxPage }"><span class="blind">마지막페이지</span></a></span>
						</div>

					</div>
                </div>
			</div>
		</div>
<script>
	// 탭 변경하기 이벤트
    let roomli = document.querySelector(".roomli");
    let reviewli = document.querySelector(".reviewli");
    let roomtab = document.querySelector(".roomtab");
    let reviewtab = document.querySelector(".reviewtab");

    roomli.onclick = editStart;
    reviewli.onclick = editStart;

    function editStart(){
        if(this == roomli){
            reviewtab.replaceWith(roomtab);
            reviewtab.style.display = "none"
            roomtab.style.display = "block"
            
            roomli.classList.toggle("on");
            reviewli.classList.toggle("on");
        } else{
            roomtab.replaceWith(reviewtab);
            roomtab.style.display = "none";
            reviewtab.style.display = "block";
            roomli.classList.toggle("on");
            reviewli.classList.toggle("on");
        }
    }
    
    // 리뷰 내용 글자수가 30자 초과하면 뒷 내용 생략하기
    let reviewcont = document.querySelectorAll(".review_content");
	for(let i = 0; i < reviewcont.length; i++){

		if(reviewcont[i].textContent.length > 30){
			let reviewchange = reviewcont[i].textContent.substring(0, 30) + "..."; 
			reviewcont[i].textContent = reviewchange;
		}
	}
	
</script>

<%@include file="/views/common/footer.jsp" %>




