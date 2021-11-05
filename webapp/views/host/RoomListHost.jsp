<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>    
<div class="side_layout">
			<div class="container">
				<!-- 목록 화면 -->
				<div class="roomlist">
						<div class="roomenroll_title_main">
							<h2>숙소목록</h2><span>RoomList</span>
						</div>
						<div class="roomlist_statuslist">
							<ul class="roomlist_ul">
								<li>승인대기</li>
								<li>승인반려</li>
								<li>등록완료</li>
							</ul>
						</div>
						<br>
						<div class="roomlist_sub">
							<%-- <form method="get" action="${ contextPath }/host/roomlist">  --%>
							<div class="selectbox roomlist_sel">
								<button class="title" type="button" title="검색옵션 선택">검색옵션</button>
								<ul class="selList">
									<li>
										<input type="radio" value="roomname" class="option" id="searchCondition1" name="searchCondition" />
										<label for="searchCondition1">숙소이름</label>
									</li>
									<li>
										<input type="radio" value="roomstatus" class="option" id="searchCondition2" name="searchCondition" />
										<label for="searchCondition2">등록상태</label>
									</li>
								</ul>
							</div>
							<div class="listTotal roomlist_search">
								<!-- <p class="totalCnt">총 1건</p> -->
								<div class="sortArea">
									<div class="inp_text search">
										<input type="text" name="searchValue" id="searchValue" placeholder="검색어를 입력하세요">
										<button class="btn_sch">검색</button>
									</div>
								</div>
							</div>
							<!-- </form> -->
						</div>
						<div class="roomlist_content">
							<div class="tblType3 noBorT noBorB boardList">
								<table summary="숙소목록">
									<colgroup>
										<col style="width:9.2%">
										<col style="width:20%">
										<col style="width:9.2%">
										<col style="width:12.8%">
										<col style="width:12.8%">
										<col style="width:30%">
									</colgroup>
									<thead>
										<tr>
											<th style="font-size: 1.2em;">No</th>
											<th style="font-size: 1.2em;">방사진</th>
											<th style="font-size: 1.2em;">상태</th>
											<th style="font-size: 1.2em;">숙소이름</th>
											<th style="font-size: 1.2em;">숙소생성일</th>
											<th style="font-size: 1.2em;">관리</th>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${ !empty roomList }">
											<c:set var="no" value="${ (pi.page - 1) * pi.boardLimit }" />
											<c:forEach var="room" items="${ roomList }">													
												<tr>
													<td>${ no = no + 1 }</td>    <!-- 방 사진 클릭시 해당 숙소의 상세페이지로 이동하도록!! -->
													<td class="al_l"><a href="#">  
													<img src="${contextPath}${room.fileList.get(0).filePath}${room.fileList.get(0).changeName}" class="roomlist_img">
													</a></td>
													<td><span class="roomlist_status" 
													<c:if test="${ room.enrollStatus eq '승인대기' }">style="color:#ff8b33"</c:if> 
													<c:if test="${ room.enrollStatus eq '승인반려' }">style="color:#d10000"</c:if>
													<c:if test="${ room.enrollStatus eq '등록완료' }">style="color:#0e7539"</c:if>>
													${ room.enrollStatus }</span></td>
													<td>${ room.roomName }</td>  
													<td><fmt:formatDate value="${ room.createDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
													<td>
														<div class="roomlist_btn">
														<div class="btn_wrap"><a href="#" class="btn btnType1 btnSizeS"><span>달력관리</span></a></div>
														<div class="btn_wrap"><button class="btn btnType2 btnSizeS" onclick="updateRoomView(${ room.roomNo });"><span>수정</span></button></div>
														<div class="btn_wrap"><button class="btn btnType3 btnSizeS" onclick="deleteRoom(${ room.roomNo });"><span>삭제</span></button></div>
														</div>
													</td>
												</tr>
												
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">
													<div class="noData">
														<p>등록된 숙소가 없습니다.</p>
													</div>
	
												</td>
											</tr>	
										</c:otherwise>
									</c:choose>	
									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="paging">   <!-- ${ contextPath }/board/list?page=1${ searchParam } 검색조건도 추가하기 href 속성에!! -->
							<span class="first"><a href="${ contextPath }/host/roomlist?page=1"><span class="blind">첫페이지</span></a></span>
							<c:choose>
								<c:when test="${ pi.page > 1 }">
								<span class="prev"><a href="${ contextPath }/host/roomlist?page=${ pi.page - 1}"><span class="blind">이전페이지</span></a></span>
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
								<a href="${ contextPath }/host/roomlist?page=${ p }">${ p }</a>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
								<span class="next"><a href="${ contextPath }/host/roomlist?page=${ pi.page + 1 }"><span class="blind">다음페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
								</c:otherwise>
							</c:choose>
							
							<span class="last"><a href="${ contextPath }/host/roomlist?page=${ pi.maxPage }"><span class="blind">마지막페이지</span></a></span>
							
						</div>
                    
                    <div class="roomlist_btn addroombtn">
						<div class="btn_wrap"><a href="${ contextPath }/host/roomenrollbasic" class="btn btnType1 btnSizeS"><span>+ 새로운 숙소 등록</span></a></div>
					</div>
                </div>
			</div>
		</div>
		
		<script>
			function updateRoomView(roomno){
				location.href='${contextPath}/host/roomUpdateView?roomno=' + roomno;
			}
			
			function deleteRoom(roomno){
				if(confirm("해당 숙소를 삭제하시겠습니까?")){
					location.href='${contextPath}/host/roomDelete?roomno=' + roomno;
				}
			}
		
		</script>
<%@include file="/views/common/footer.jsp" %>