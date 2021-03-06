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
						<form method="get" action="${ contextPath }/host/roomlist">  
						<div class="roomlist_sub">
							<div class="selectbox roomlist_sel">
								<button class="title" type="button" title="검색옵션 선택">검색옵션</button>
								<ul class="selList">
									<li>
										<input type="radio" value="roomname" class="option" id="searchCondition1" name="searchCondition"
										<c:if test="${param.searchCondition == 'roomname' }">selected="selected" checked="checked"</c:if> />
										<label for="searchCondition1">숙소이름</label>
									</li>
									<li>
										<input type="radio" value="roomstatus" class="option" id="searchCondition2" name="searchCondition"
										<c:if test="${param.searchCondition == 'roomstatus' }">selected="selected" checked="checked"</c:if> />
										<label for="searchCondition2">등록상태</label>
									</li>
								</ul>
							</div>
							<div class="listTotal roomlist_search">
								<div class="sortArea">
									<div class="inp_text search">
										<input type="text" name="searchValue" id="searchValue" 
										value="${ param.searchValue }" placeholder="검색어를 입력하세요">
										<button class="btn_sch">검색</button>
									</div>
								</div>
								<c:if test="${ !empty param.searchCondition && !empty param.searchValue }">
								<p class="totalCnt">총 ${ pi.listCount }건</p> 
								</c:if>
							</div>
						</div>
						</form>
						<div class="roomlist_content">
							<div class="tblType3 noBorT noBorB boardList">
								<table summary="숙소목록">
									<colgroup>
										<col style="width:9.2%">
										<col style="width:26%">
										<col style="width:9.2%">
										<col style="width:12.8%">
										<col style="width:12.8%">
										<col style="width:24%">
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
													<td class="al_l">
													<c:choose>
													<c:when test="${ room.enrollStatus eq '등록완료' }">
													<a href="${ contextPath }/room/reserve/detail?roomNo=${ room.roomNo }">  
													<img src="${contextPath}${room.fileList.get(0).filePath}${room.fileList.get(0).changeName}" class="roomlist_img">
													</a>
													</c:when>
													<c:otherwise>
													<a href="#" onclick="alert('\'등록완료\' 상태인 경우에만 상세 예약페이지로 이동이 가능합니다.');">  
													<img src="${contextPath}${room.fileList.get(0).filePath}${room.fileList.get(0).changeName}" class="roomlist_img">
													</a>
													</c:otherwise>
													</c:choose>
													</td>
													<td><span class="roomlist_status" 
													<c:if test="${ room.enrollStatus eq '승인대기' }">style="color:#ff8b33"</c:if> 
													<c:if test="${ room.enrollStatus eq '승인반려' }">style="color:#d10000"</c:if>
													<c:if test="${ room.enrollStatus eq '등록완료' }">style="color:#0e7539"</c:if>>
													${ room.enrollStatus }</span></td>
													<td>${ room.roomName }</td>  
													<td><fmt:formatDate value="${ room.createDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
													<td>
														<div class="roomlist_btn">
														<c:choose>
															<c:when test="${ room.enrollStatus eq '승인반려' }">
															<div class="btn_wrap"><button class="btn btnType2 btnSizeS" onclick="showLayer('returnreason'); showdetail(${ room.roomNo });"><span>반려사유</span></button></div>
															<div class="btn_wrap"><button class="btn btnType3 btnSizeS" onclick="deleteRoom(${ room.roomNo });"><span>삭제</span></button></div>		
															</c:when>
															<c:otherwise>
															<div class="btn_wrap"><button class="btn btnType2 btnSizeS" onclick="updateRoomView(${ room.roomNo });"><span>수정</span></button></div>
															<div class="btn_wrap"><button class="btn btnType3 btnSizeS" onclick="deleteRoom(${ room.roomNo });"><span>삭제</span></button></div>															
															</c:otherwise>
														</c:choose>
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
						<!-- 검색한 경우  변수 선언 (url 문자열에는 공백없도록!!)-->
						<c:if test="${ !empty param.searchCondition && !empty param.searchValue }">
							<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchValue=${ param.searchValue }"/>
						</c:if>
						<!-- 페이징 -->
						<div class="paging">   <!-- ${ contextPath }/board/list?page=1${ searchParam } 검색조건도 추가하기 href 속성에!! -->
							<span class="first"><a href="${ contextPath }/host/roomlist?page=1${ searchParam }"><span class="blind">첫페이지</span></a></span>
							<c:choose>
								<c:when test="${ pi.page > 1 }">
								<span class="prev"><a href="${ contextPath }/host/roomlist?page=${ pi.page - 1}${ searchParam }"><span class="blind">이전페이지</span></a></span>
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
								<a href="${ contextPath }/host/roomlist?page=${ p }${ searchParam }">${ p }</a>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
								<span class="next"><a href="${ contextPath }/host/roomlist?page=${ pi.page + 1 }${ searchParam }"><span class="blind">다음페이지</span></a></span>
								</c:when>
								<c:otherwise>
								<span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
								</c:otherwise>
							</c:choose>
							
							<span class="last"><a href="${ contextPath }/host/roomlist?page=${ pi.maxPage }${ searchParam }"><span class="blind">마지막페이지</span></a></span>
							
						</div>
                    
                    <div class="roomlist_btn addroombtn">
						<div class="btn_wrap"><a href="${ contextPath }/host/roomenrollbasic" class="btn btnType1 btnSizeS"><span>+ 새로운 숙소 등록</span></a></div>
						<div class="btn_wrap"><a href="${ contextPath }/host/calendar" class="btn btnType1 btnSizeS"><span>달력관리</span></a></div>
					</div>
					 <div class="roomlist_btn addroombtn">
					</div>
                </div>
			</div>
		</div>
		
		<!-- 레이어 팝업 returnreason showLayer('레이어 아이디명') / hideLayer('레이어 아이디명') .layerTit : 제목 부분 / .layerBody : 본문 컨텐츠 부분-->
        <div id="returnreason" class="layerPop">
            <div class="layerTit">
                <h4>승인반려</h4>
                <button class="btn_closeLayer" onclick="hideLayer('returnreason');"><span class="blind">레이어팝업 닫기</span></button>
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
								<th>작성자</th>
								<td>관리자</td>
							<tr>
							<tr>
								<th>숙소이름</th>
								<td id="roomname"></td>
							<tr>
								<th>내용</th>
								<td>
									<div class="textbox">
										<textarea class="readOnly" id="content" readonly>
										</textarea>
									</div>

								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="btn_wrap">
					<button class="btn btnType2 btnSizeM" onclick="hideLayer('returnreason');return false;"><span>닫기</span></button>
				</div>                         
            </div>  <!-- 레이어 내용 부분 끝 -->
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
			
			// 반려사유 버튼 클릭시(반려 사유 내용 팝업에 내용작성)
			function showdetail(roomno){
				$.ajax({
					url : "${contextPath}/host/returnDetail",
					data : { roomno : roomno },
					dataType : "json",
					type : "get",
					success : function(room){
						document.getElementById('roomname').innerHTML = room.roomName;
						document.getElementById('content').innerHTML = room.returnReason;
					},
					error : function(e){
						console.log(e);
					}
				});
			}
		
		</script>
<%@include file="/views/common/footer.jsp" %>