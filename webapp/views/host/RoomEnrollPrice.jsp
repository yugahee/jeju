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
				<a class="roommenu">
					<span class="menu-left">기본설정</span>
					<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
				</a>
				<a class="roommenu">
					<span class="menu-left" style="color:#ff8b33">예약/요금 설정</span>
					<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
				</a>					
				<a class="roommenu">
					<span class="menu-left">위치/사진/동영상</span>
					<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
				</a>
	        </nav>
			<br>

	        </div>
	
			<!-- 등록 내용 화면 -->
			<div class="roomenroll_basic">
				<!-- ** 요금설정 ** -->
				<form method="post" action="${ contextPath }/host/roomenrollbasic2">
					<input type="hidden" name="roomname" value="${ rooms.roomName }">
					<input type="hidden" name="roomtitle" value="${ rooms.roomTitle }">
					<input type="hidden" name="roomdes" value="${ rooms.roomDes }">
					<input type="hidden" name="room" value="${ rooms.room }">
					<input type="hidden" name="bed" value="${ rooms.bed }">
					<input type="hidden" name="bath" value="${ rooms.bath }">
					<input type="hidden" name="roomtype" value="${ rooms.roomType }">
					<input type="hidden" name="buildingtype" value="${ rooms.buildingType }">
					<input type="hidden" name="roomsize" value="${ rooms.roomSize }">
					<input type="hidden" name="starttime" value="${ rooms.startTime }">
					<input type="hidden" name="endtime" value="${ rooms.endTime }">
					<input type="hidden" name="roomfac" value="${ rooms.roomFac }">
											
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
	        	    	            <input type="text" name="minstay" id="minstay" required>
	                            </div>박
	                            <!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="minstayresult">test</p>
	                        </div>
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_title_sub">
									<p>최대 숙박 일수</p>
								</div>
	                            <div class="inp_text roomenroll_inp2 roomenroll_opt">
	                                <input type="text" name="maxstay" id="maxstay" required>
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
	                                        <input type="radio" value="1" class="option" id="minpeople1" name="minpeople" required>
	                                        <label for="minpeople1">1</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="2" class="option" id="minpeople2" name="minpeople">
	                                        <label for="minpeople2">2</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="3" class="option" id="minpeople3" name="minpeople">
	                                        <label for="minpeople3">3</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="4" class="option" id="minpeople4" name="minpeople">
	                                        <label for="minpeople4">4</label>
	                                     </li>
	                                     <li>
	                                     	<input type="radio" value="5" class="option" id="minpeople5" name="minpeople">
	                                        <label for="minpeople5">5</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="6" class="option" id="minpeople6" name="minpeople">
	                                        <label for="minpeople6">6</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="7" class="option" id="minpeople7" name="minpeople">
	                                        <label for="minpeople7">7</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="8" class="option" id="minpeople8" name="minpeople">
	                                        <label for="minpeople8">8</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="9" class="option" id="minpeople9" name="minpeople">
	                                        <label for="minpeople9">9</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="10" class="option" id="minpeople10" name="minpeople">
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
	                                    	<input type="radio" value="1" class="option" id="maxpeople1" name="maxpeople" required>
	                                        <label for="maxpeople1">1</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="2" class="option" id="maxpeople2" name="maxpeople">
	                                        <label for="maxpeople2">2</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="3" class="option" id="maxpeople3" name="maxpeople">
	                                        <label for="maxpeople3">3</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="4" class="option" id="maxpeople4" name="maxpeople">
	                                        <label for="maxpeople4">4</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="5" class="option" id="maxpeople5" name="maxpeople">
	                                        <label for="maxpeople5">5</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="6" class="option" id="maxpeople6" name="maxpeople">
	                                        <label for="maxpeople6">6</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="7" class="option" id="maxpeople7" name="maxpeople">
	                                        <label for="maxpeople7">7</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="8" class="option" id="maxpeople8" name="maxpeople">
	                                        <label for="maxpeople8">8</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="9" class="option" id="maxpeople9" name="maxpeople">
	                                        <label for="maxpeople9">9</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="10" class="option" id="maxpeople10" name="maxpeople">
	                                        <label for="maxpeople10">10</label>
	                                    </li>
	                                    <li>
	                                        <input type="radio" value="11" class="option" id="maxpeople11" name="maxpeople">
	                                        <label for="maxpeople11">11</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="12" class="option" id="maxpeople12" name="maxpeople">
	                                        <label for="maxpeople12">12</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="13" class="option" id="maxpeople13" name="maxpeople">
	                                        <label for="maxpeople13">13</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="14" class="option" id="maxpeople14" name="maxpeople">
	                                        <label for="maxpeople14">14</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="15" class="option" id="maxpeople15" name="maxpeople">
	                                        <label for="maxpeople15">15</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="16" class="option" id="maxpeople16" name="maxpeople">
	                                        <label for="maxpeople16">16</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="17" class="option" id="maxpeople17" name="maxpeople">
	                                        <label for="maxpeople17">17</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="18" class="option" id="maxpeople18" name="maxpeople">
	                                        <label for="maxpeople18">18</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="19" class="option" id="maxpeople19" name="maxpeople">
	                                        <label for="maxpeople19">19</label>
	                                     </li>
	                                     <li>
	                                        <input type="radio" value="20" class="option" id="maxpeople20" name="maxpeople">
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
	                                <input type="text" name="price" id="price" required>
	                            </div>원
	                           	<!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="priceresult">test</p>   
	                        </div>
	                        <div class="roomenrool_wrap">
	                            <div class="roomenroll_title_sub">
									<p>추가 인원 금액</p>
								</div>
	                            <div class="inp_text roomenroll_inp2">
	                                <input type="text" name="extracost" id="extracost" required>
	                            </div>원
	                            <!-- 유효성 검사 후 에러 발생 시 input태그 밑에 나타남 -->
	                            <p class="" id="extracost">test</p>                                     
	                        </div>
	                    </div>
	                    <!-- ** 성수기 버튼 추가 ** -->
	                    <div class="btn_wrap roomregistbtn2">
	                    	<a href="#" class="btn btnType1 btnSizeS" type="button" onclick="showLayer('peakSeason');"><span>+ 성수기 기간 추가</span></a>   
	                    </div>
	                    <br>
	                    <div class="peaktb_add">
	                    	<table class="roomenroll_peak">
	                        	<tr class="peaktb" height="50px">
	                            	<th>성수기 기간</th>
	                                <th colspan="2">숙박 금액(1박 기준)</th>
	                            </tr>
	                            <tr class="peaktb" height="50px">
	                                <td class="td_align"><button type="button" class="peaktb_btn" onclick="deletepeak();">-</button>&nbsp;&nbsp;
	                              	  <span class="peakstartday"></span>&nbsp;&nbsp; ~ &nbsp;&nbsp;<span class="peakendday"></span></td>
	                                <td class="td_align2"></td>
	                                <td class="td_align3">&nbsp;원</td>
	                            </tr>                                
	                        </table>
	                    </div>
	                </div>    
	                <br>
					<div class="btn_wrap roomregistbtn2"> 
						<button class="btn btnType1 btnSizeS" id="submitbtn"><span>다음</span></button>   
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
	                        		<input type="date" id="peakstart" name="peakstart" class="peakdate">
	                    		</div>
	                    		<div class="roomenroll_content_list">
	                        		<div class="roomenroll_peakopt">
	                          	  		<p>종료일</p>
	                        		</div>
	                        		<input type="date" id="peakend" name="peakend"  class="peakdate">
	                    		</div>
	                		</div>
	  						<div class="roomenroll_content_opt2">
	                    		<div class="roomenroll_content_list pkalign">
	                        		<div class="roomenroll_peakopt">
	                            		<p>숙박 금액(1박 기준)</p>
	                       			 </div>
	                       			 <div class="inp_text roomenroll_inp2 roomenroll_opt">
	                            		<input type="text" name="peakprice" id="peakprice">
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