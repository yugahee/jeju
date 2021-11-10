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
								<a href="${ contextPath }/room/reserve/detail?roomNo=${ room.roomNo }">
								<img src="${contextPath}${room.fileList.get(0).filePath}${room.fileList.get(0).changeName}"></a><br>
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
										<td><a href="#"><div class="review_content" onclick="showLayer('reviewdetail'); showdetail(${ review.reviewNo });">${ review.review }
										</div></a></td>
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
		<!-- 레이어 팝업  -->
        <div id="reviewdetail" class="layerPop">
            <div class="layerTit">
                <h4>Review</h4>
                <button class="btn_closeLayer" onclick="hideLayer('reviewdetail');"><span class="blind">레이어팝업 닫기</span></button>
            </div>
            <div class="layerBody">
				<br>
				<div class="tblType2 noBorder">
					<table>
						<colgroup>
							<col style="width:20%;">
							<!-- <col style="width:*;"> -->
						</colgroup>
						<tbody>
							<tr>
								<th>숙소 이름</th>
								<td id="roomname"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td id="writer"></td>
							</tr>
							<tr>
								<th>작성일</th>
								<td id="reviewdate"></td>
							</tr>
							<tr>
								<th>별점</th>
								<td>
									<div class="rating_star_large">
										<div class="pointArea">
											<!-- 별 선택시마다 point: 20/40/60/80/100 , style: 20%/40%/60%/80%/100% 로 변경됨 -->
											<span class="pointBg" point="80" style="left: 80%;"></span>
											<span class="starPoint p2">
												<button disabled="disabled">1점 선택</button>
												<button disabled="disabled">2점 선택</button>
												<button disabled="disabled">3점 선택</button>
												<button disabled="disabled">4점 선택</button>
												<button disabled="disabled">5점 선택</button>
											</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<div class="textbox">
										<textarea class="readOnly" readonly id="content">
										</textarea>
									</div>

								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="btn_wrap">
					<button class="btn btnType2 btnSizeM" onclick="hideLayer('reviewdetail');return false;"><span>닫기</span></button>
				</div>                         
            </div>  <!-- 성수기 추가 레이어 내용 부분 끝 -->
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
	
	// 리뷰클릭시 팝업창으로 상세정보 보이기
	function showdetail(reviewNo){
		// console.log(reviewNo);
		// roomname , writer , reviewdate , content
		/* <별 선택시마다 point: 20/40/60/80/100 , style: 20%/40%/60%/80%/100% 로 변경됨 
			<span class="pointBg" point="80" style="left: 80%;"></span> */
		$.ajax({
			url : "${contextPath}/host/reviewDetail",
			data : { reviewNo : reviewNo },
			dataType : "json",
			type : "get",
			success : function(review){
				document.getElementById('roomname').innerHTML = review.roomName;
				document.getElementById('writer').innerHTML = review.userId;
				document.getElementById('reviewdate').innerHTML = review.reviewDate;
				document.getElementById('content').innerHTML = review.review;
				
				switch(review.starPoint){
				case 1 :
					document.querySelector('.pointBg').setAttribute('point', '20');
					document.querySelector('.pointBg').setAttribute('style', 'left: 20%');
					break;
				case 2 :
					document.querySelector('.pointBg').setAttribute('point', '40');
					document.querySelector('.pointBg').setAttribute('style', 'left: 40%');
					break;
				case 3 :
					document.querySelector('.pointBg').setAttribute('point', '60');
					document.querySelector('.pointBg').setAttribute('style', 'left: 60%');
					break;
				case 4 :
					document.querySelector('.pointBg').setAttribute('point', '80');
					document.querySelector('.pointBg').setAttribute('style', 'left: 80%');
					break;
				case 5 :
					document.querySelector('.pointBg').setAttribute('point', '100');
					document.querySelector('.pointBg').setAttribute('style', 'left: 100%');
					break;
				}
				
			},
			error : function(e){
				console.log(e);
			}
		});
	}
</script>

<%@include file="/views/common/footer.jsp" %>




