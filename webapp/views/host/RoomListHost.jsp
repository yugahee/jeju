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
							<div class="selectbox roomlist_sel">
								<button class="title" type="button" title="검색옵션 선택">검색옵션</button>
								<ul class="selList">
									<li>
										<input type="radio" value="" class="option" id="sel1_1" name="select1" />
										<label for="sel1_1">숙소이름</label>
									</li>
								</ul>
							</div>
							<div class="listTotal roomlist_search">
								<!-- <p class="totalCnt">총 1건</p> -->
								<div class="sortArea">
									<div class="inp_text search">
										<input type="text" name="" id="" placeholder="검색어를 입력하세요">
										<a href="#" class="btn_sch">검색</a>
									</div>
								</div>
							</div>
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
											<th>NO</th>
											<th>방사진</th>
											<th>상태</th>
											<th>숙소이름</th>
											<th>숙소생성일</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${ !empty roomList }">
											<c:set var="no" value="0" />
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
						<div class="paging">
							<span class="first"><a href="#"><span class="blind">첫페이지</span></a></span>
							<span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
							<span class="current">1</span>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
							<span class="last"><a href="#"><span class="blind">마지막페이지</span></a></span>
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