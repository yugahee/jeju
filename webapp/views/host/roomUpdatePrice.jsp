<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
		<div class="container">
			<!-- 서브 메뉴 바 -->
			<div class="container_roomenroll">
			<p>숙소설정</p>
			<br>
			<nav class="sub_menu_roomenroll">
				<a href="${ contextPath }/host/roomUpdateView?roomno=${ room.roomNo }" class="roommenu">
					<span class="menu-left left2">기본설정</span>
					<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
				</a>
				<a href="${ contextPath }/host/roomUpdate1?roomno=${ room.roomNo }" class="roommenu">
					<span class="menu-left left2">예약/요금 설정</span>
					<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
				</a>					
				<a href="${ contextPath }/host/roomUpdate2?roomno=${ room.roomNo }" class="roommenu">
					<span class="menu-left left2">위치/사진/동영상</span>
					<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
				</a>
	        </nav>
			<br>
	        <a href="#" class="roommenu_cal">
				<span class="menu-left-cal"><img src="${ contextPath }/resources/images/common/ico_cal.png"></span>
				<span class="menu-right-cal">달력관리</span>
			</a>
			<br> 

	        </div>
	
			<!-- 등록 내용 화면 -->
			<div class="roomenroll_basic">
				<!-- ** 요금설정 ** -->
				<form method="post" action="${ contextPath }/host/roomUpdate2">
				<input type="hidden" name="roomno" value="${ room.roomNo }"> 	
				<!-- 수정 전의  성수기 값 넘기기 (비교하기 위해서) -->
				<input type="hidden" name="originpeakstart" value="${ room.peak.peakStart }">
				<input type="hidden" name="originpeakend" value="${ room.peak.peakEnd }">
				<input type="hidden" name="originpeakprice" value="${ room.peak.peakPrice }">
										
					<div class="roomenroll_title_main">
						<h2>요금설정</h2><span>숙박요금을 설정하세요.</span>
					</div>
					<div class="roomenroll_content">
						<div class="roomenroll_title_sub2">
							<p>※ 게스트가 예약할 수 있는 숙박 일수를 등록해주세요</p>
						</div>
	                    <div class="room_wrap">
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_title_sub">
									<p>최소 숙박 일수</p>
								</div>
	            	            <div class="inp_text roomenroll_inp2">
	        	    	            <input type="text" name="minstay" id="minstay" value="${ room.minStay }" required>
	                            </div>박
	                           	<!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="minstayresult">test</p> 
	                        </div>
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_title_sub">
									<p>최대 숙박 일수</p>
								</div>
	                            <div class="inp_text roomenroll_inp2">
	                                <input type="text" name="maxstay" id="maxstay" value="${ room.maxStay }" required>
	                            </div>박
	                            <!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="maxstayresult">test</p>                            
	                        </div>
	                    </div>
	                    <div class="roomenroll_title_sub2">
							<p>※ 숙박 인원 수에 따른 요금 정보를 등록해주세요.</p>
						</div>
	                    <div class="room_wrap">
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_staydate">
									<p>기본 숙박 인원</p>
								</div>
	                            <div class="selectbox roomenroll_opt">
	                                <button class="title" type="button" title="검색옵션 선택">선택</button>
	                                <ul class="selList">
	                                    <li>
	                                        <input type="radio" value="1" class="option" id="minpeople1" name="minpeople" 
	                                        <c:if test="${ room.minPeople == 1 }">checked="checked"</c:if> required>
	                                        <label for="minpeople1">1</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="2" class="option" id="minpeople2" name="minpeople"
	                                        <c:if test="${ room.minPeople == 2 }">checked="checked"</c:if>>
	                                        <label for="minpeople2">2</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="3" class="option" id="minpeople3" name="minpeople"
	                                        <c:if test="${ room.minPeople == 3 }">checked="checked"</c:if>>
	                                        <label for="minpeople3">3</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="4" class="option" id="minpeople4" name="minpeople"
	                                        <c:if test="${ room.minPeople == 4 }">checked="checked"</c:if>>
	                                        <label for="minpeople4">4</label>
	                                     </li>
	                                     <li>
	                                     	<input type="radio" value="5" class="option" id="minpeople5" name="minpeople"
	                                     	<c:if test="${ room.minPeople == 5 }">checked="checked"</c:if>>
	                                        <label for="minpeople5">5</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="6" class="option" id="minpeople6" name="minpeople"
	                                        <c:if test="${ room.minPeople == 6 }">checked="checked"</c:if>>
	                                        <label for="minpeople6">6</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="7" class="option" id="minpeople7" name="minpeople"
	                                        <c:if test="${ room.minPeople == 7 }">checked="checked"</c:if>>
	                                        <label for="minpeople7">7</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="8" class="option" id="minpeople8" name="minpeople"
	                                        <c:if test="${ room.minPeople == 8 }">checked="checked"</c:if>>
	                                        <label for="minpeople8">8</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="9" class="option" id="minpeople9" name="minpeople"
	                                        <c:if test="${ room.minPeople == 9 }">checked="checked"</c:if>>
	                                        <label for="minpeople9">9</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="10" class="option" id="minpeople10" name="minpeople"
	                                        <c:if test="${ room.minPeople == 10 }">checked="checked"</c:if>>
	                                        <label for="minpeople10">10</label>
	                                     </li>
	                                </ul>
	                            </div>
	                        </div>
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_staydate">
									<p>최대 숙박 인원</p>
								</div>
	                            <div class="selectbox roomenroll_opt">
	                                <button class="title" type="button" title="검색옵션 선택">선택</button>
	                                <ul class="selList">
	                                	<li>
	                                    	<input type="radio" value="1" class="option" id="maxpeople1" name="maxpeople"
	                                    	<c:if test="${ room.maxPeople == 1 }">checked="checked"</c:if> required>
	                                        <label for="maxpeople1">1</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="2" class="option" id="maxpeople2" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 2 }">checked="checked"</c:if>>
	                                        <label for="maxpeople2">2</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="3" class="option" id="maxpeople3" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 3 }">checked="checked"</c:if>>
	                                        <label for="maxpeople3">3</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="4" class="option" id="maxpeople4" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 4 }">checked="checked"</c:if>>
	                                        <label for="maxpeople4">4</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="5" class="option" id="maxpeople5" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 5 }">checked="checked"</c:if>>
	                                        <label for="maxpeople5">5</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="6" class="option" id="maxpeople6" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 6 }">checked="checked"</c:if>>
	                                        <label for="maxpeople6">6</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="7" class="option" id="maxpeople7" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 7 }">checked="checked"</c:if>>
	                                        <label for="maxpeople7">7</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="8" class="option" id="maxpeople8" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 8 }">checked="checked"</c:if>>
	                                        <label for="maxpeople8">8</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="9" class="option" id="maxpeople9" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 9 }">checked="checked"</c:if>>
	                                        <label for="maxpeople9">9</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="10" class="option" id="maxpeople10" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 10 }">checked="checked"</c:if>>
	                                        <label for="maxpeople10">10</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="11" class="option" id="maxpeople11" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 11 }">checked="checked"</c:if>>
	                                        <label for="maxpeople11">11</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="12" class="option" id="maxpeople12" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 12 }">checked="checked"</c:if>>
	                                        <label for="maxpeople12">12</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="13" class="option" id="maxpeople13" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 13 }">checked="checked"</c:if>>
	                                        <label for="maxpeople13">13</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="14" class="option" id="maxpeople14" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 14 }">checked="checked"</c:if>>
	                                        <label for="maxpeople14">14</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="15" class="option" id="maxpeople15" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 15 }">checked="checked"</c:if>>
	                                        <label for="maxpeople15">15</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="16" class="option" id="maxpeople16" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 16 }">checked="checked"</c:if>>
	                                        <label for="maxpeople16">16</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="17" class="option" id="maxpeople17" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 17 }">checked="checked"</c:if>>
	                                        <label for="maxpeople17">17</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="18" class="option" id="maxpeople18" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 18 }">checked="checked"</c:if>>
	                                        <label for="maxpeople18">18</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="19" class="option" id="maxpeople19" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 19 }">checked="checked"</c:if>>
	                                        <label for="maxpeople19">19</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="20" class="option" id="maxpeople20" name="maxpeople"
	                                        <c:if test="${ room.maxPeople == 20 }">checked="checked"</c:if>>
	                                        <label for="maxpeople20">20</label>
	                                      </li>
	                                </ul>
	                            </div>
	                    	</div>
	                    </div>
	                    <div class="room_wrap">
	                    	<div class="roomenrool_wrap">
	                        	<div class="roomenroll_title_sub">
									<p>숙박 금액(1박 기준)</p>
								</div>
	                            <div class="inp_text roomenroll_inp2">
	                                <input type="text" name="price" id="price" value="${ room.price }" required>
	                            </div>원 
	                           	<!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="priceresult">test</p>       
	                        </div>
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_title_sub">
									<p>추가 인원 금액</p>
								</div>
	                            <div class="inp_text roomenroll_inp2">
	                                <input type="text" name="extracost" id="extracost" value="${ room.extraCost }" required>
	                            </div>원
	                            <!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="extracost">test</p>                                    
	                        </div>
	                    </div>
	                    <!-- ** 성수기 버튼 추가 ** -->
	                    <div class="btn_wrap roomregistbtn2">
	                    	<a href="#" class="btn btnType1 btnSizeS" type="button" onclick="showLayer('peakSeason');"><span>성수기 기간 수정</span></a>   
	                    </div>
	                    <br>
	                    <div class="peaktb_add" <c:if test="${ !empty room.peak }">style="display:block;"</c:if>>
	                    	<table class="roomenroll_peak">
	                        	<tr class="peaktb" height="50px">
	                            	<th>성수기 기간</th>
	                                <th colspan="2">숙박 금액(1박 기준)</th>
	                            </tr>
	                            <tr class="peaktb" height="50px">
	                                <td class="td_align"><button type="button" class="peaktb_btn" onclick="deletepeak();">-</button>&nbsp;&nbsp;
	                              	  <span class="peakstartday">${ room.peak.peakStart }</span>&nbsp;&nbsp; ~ &nbsp;&nbsp;
	                              	  <span class="peakendday">${ room.peak.peakEnd }</span></td>
	                                <td class="td_align2">${ room.peak.peakPrice }</td>
	                                <td class="td_align3">&nbsp;원</td>
	                            </tr>                                
	                        </table>
	                    </div>
	                </div>    
	                <br>
					<div class="btn_wrap roomregistbtn2"> 
						<button class="btn btnType1 btnSizeS" id="submitbtn"><span>저장</span></button>   
					</div>	
					
	      			<!-- 레이어 팝업 roomenrollbtn.	  showLayer('레이어 아이디명') / hideLayer('레이어 아이디명')
	          	 	.layerTit : 제목 부분 / .layerBody : 본문 컨텐츠 부분-->
	        		<div id="peakSeason" class="layerPop">
	            		<div class="layerTit">
	                		<h4>성수기 설정</h4>
	                		<button class="btn_closeLayer" onclick="hideLayer('peakSeason');"><span class="blind">레이어팝업 닫기</span></button>
	            		</div>
	            		<div class="layerBody">
	                		<div class="roomenroll_content_opt">
	                    		<div class="roomenroll_content_list">
	                        		<div class="roomenroll_peakopt">
	                            		<p>시작일</p>
	                        		</div>
	                        		<input type="date" id="peakstart" name="peakstart" class="peakdate" 
	                        		<c:if test="${ !empty room.peak.peakStart }">value="${ room.peak.peakStart }"</c:if>>
	                    		</div>
	                    		<div class="roomenroll_content_list">
	                        		<div class="roomenroll_peakopt">
	                          	  		<p>종료일</p>
	                        		</div>
	                        		<input type="date" id="peakend" name="peakend"  class="peakdate"
	                        		<c:if test="${ !empty room.peak.peakEnd }">value="${ room.peak.peakEnd }"</c:if>>
	                    		</div>
	                		</div>
	  						<div class="roomenroll_content_opt2">
	                    		<div class="roomenroll_content_list pkalign">
	                        		<div class="roomenroll_peakopt">
	                            		<p>숙박 금액(1박 기준)</p>
	                       			 </div>
	                       			 <div class="inp_text roomenroll_inp2 roomenroll_opt">
	                            		<input type="text" name="peakprice" id="peakprice"
	                            		<c:if test="${ !empty room.peak.peakPrice }">value="${ room.peak.peakPrice }"</c:if>>
	                       			 </div>
	                      		 	  원
	                   			 </div>
	                		</div>
	               			<div class="btn_wrap roomenroll_content_opt ">
	                    		<a href="#" class="btn btnType1 btnSizeS" type="button" 
	                   			 onclick="addPeakSeason();"><span>추가</span></a>   
	                		</div>	
	                		<!-- 숨겨진 div -->
	                		<div class="btn_wrap roomenroll_content_opt hiddenlayerpop">
	                    		<a href="#" class="btn btnType1 btnSizeS" type="button" onclick = "hideLayer('peakSeason');"></a>
	                		</div>
	            		</div>  <!-- 성수기 추가 레이어 내용 부분 끝 -->
	        		</div>	 
				</form>		 
	        </div>
		</div>
	</div>

    <script>
    
	    const peaktb = document.querySelector(".peaktb_add");  // 성수기 테이블 div
	    function addPeakSeason(){
	        peaktb.style.display = "block";
	
	        // 성수기 날짜, 가격 입력값으로 화면에 출력하기
	        document.querySelector(".peakstartday").innerHTML = document.querySelector("#peakstart").value;
	        document.querySelector(".peakendday").innerHTML = document.querySelector("#peakend").value;
	        document.querySelector(".td_align2").innerHTML = document.querySelector("#peakprice").value;
	
	        const ch = document.querySelector(".hiddenlayerpop").firstElementChild;
	        ch.click();    // 레이아웃 닫기
	    }   
	    
	 	// 성수기 삭제버튼 클릭시
	    function deletepeak(){
	       document.querySelector(".peakstartday").innerHTML = "";
	       document.querySelector(".peakendday").innerHTML = "";
	       document.querySelector(".td_align2").innerHTML = "";
	
	       document.querySelector("#peakstart").value = "";
	       document.querySelector("#peakend").value = "";
	       document.querySelector("#peakprice").value = "";
	
	       peaktb.style.display = "none";
	    }

        
    </script>

<%@include file="/views/common/footer.jsp" %>