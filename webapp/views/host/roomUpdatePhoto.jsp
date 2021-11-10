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
					<a href="${ contextPath }/host/roomUpdateView?roomno=${ rooms.roomNo }" class="roommenu">
						<span class="menu-left left2">기본설정</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
					</a>
					<a href="${ contextPath }/host/roomUpdate1?roomno=${ rooms.roomNo }" class="roommenu">
						<span class="menu-left left2">예약/요금 설정</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/incomplete_check.png"></span>
					</a>					
					<a href="${ contextPath }/host/roomUpdate2?roomno=${ rooms.roomNo }" class="roommenu">
						<span class="menu-left left2">위치/사진/동영상</span>
						<span class="menu-right"><img src="${ contextPath }/resources/images/host/complete_check.png"></span>
					</a>
                </nav>
				<br>
                <a href="${ contextPath }/host/calendar" class="roommenu_cal">
					<span class="menu-left-cal"><img src="${ contextPath }/resources/images/common/ico_cal.png"></span>
					<span class="menu-right-cal">달력관리</span>
				</a>
				<br> 
                </div>

				<!---------------------------- 등록 내용 화면 ------------------------------------------------>
				<div class="roomenroll_basic">
					<!-- ** 위치설정 ** -->
					<form method="post" action="${ contextPath }/host/roomUpdate3" name="photoupdate" enctype="multipart/form-data">
					<input type="hidden" name="roomno" value="${ rooms.roomNo }">
					<c:forEach items="${ rooms.fileList }" var="photo">   <!-- 변경되기 전의 파일들 넘기기(변경된건지 추가된건지 비교하기 위해서) -->
					<input type="hidden" name="changeName" value="${ photo.changeName }">   <!-- 파일 개수만큼 input태그 생성 -->
					</c:forEach>
					
						<div class="roomenroll_title_main">
							<h2>위치</h2><span>숙소의 위치를 설정하세요.</span>
						</div>
						<div class="roomenroll_content">
							<div class="roomenroll_title_sub">
								<p>숙소 지역</p>
							</div>
							<br>
                            <div class="selectbox roomenroll_opt">
                                <button class="title" type="button" title="검색옵션 선택">지역</button>
                                <ul class="selList">
                                    <li>
                                        <input type="radio" value="동부" class="option" id="location1" name="location" 
                                        <c:if test="${ rooms.location == '동부' }">checked="checked"</c:if> required>
                                        <label for="location1">동부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="서부" class="option" id="location2" name="location"
                                        <c:if test="${ rooms.location == '서부' }">checked="checked"</c:if>>
                                        <label for="location2">서부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="중부" class="option" id="location3" name="location"
                                        <c:if test="${ rooms.location == '중부' }">checked="checked"</c:if>>
                                        <label for="location3">중부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="남부" class="option" id="location4" name="location"
                                        <c:if test="${ rooms.location == '남부' }">checked="checked"</c:if>>
                                        <label for="location4">남부</label>
                                    </li>
                                    <li>
                                        <input type="radio" value="북부" class="option" id="location5" name="location"
                                        <c:if test="${ rooms.location == '북부' }">checked="checked"</c:if>>
                                        <label for="location5">북부</label>
                                    </li>
                                </ul>
                            </div>
                            <br>
							<div class="inp_text roomenroll_inp roomenroll_opt">
								<input type="text" name="address" placeholder="상세주소를 입력하세요."
								value="${ rooms.address }" required>
							</div>

						</div>	
                        <div class="roomenroll_title_main main2">
                            <h2>사진&동영상</h2><span>숙소의 사진과 동영상을 등록하세요.</span>
                        </div>
                        <div class="roomenroll_content">
                            <div class="roomenroll_title">
                                <p>유튜브 주소</p><span>※ 숙소 내부 동영상을 올리시면 예약율이 오릅니다.</span>
                            </div>
                            <br>
                            <div class="inp_text roomenroll_inp roomenroll_opt">
                                <input type="text" name="roomlink" id="roomlink" placeholder="동영상 링크주소를 입력하세요."
                                <c:if test="${ !empty rooms.roomLink }">value="${ rooms.roomLink }"</c:if>>
                            </div>
                            <br>
							<div class="roomenroll_photo">
								<p>사진선택 &nbsp;|</p>
								<div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>메인사진 수정하기</span>	
                                </div>
                                <p>* 첫번째 사진은 숙소의 메인사진으로 사용됩니다.</p>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 : 메인사진은 필수항목 이었으므로! -->
                                <img src="${ contextPath }${ rooms.fileList.get(0).filePath }${ rooms.fileList.get(0).changeName }">
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진1 수정하기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 : 서브사진은 있을수도 있고 없을 수도 있음 -->
                                <c:if test="${ rooms.fileList.size() > 1 }">
								<img src="${ contextPath }${ rooms.fileList.get(1).filePath }${ rooms.fileList.get(1).changeName }">
								</c:if>
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진2 수정하기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 -->
                                <c:if test="${ rooms.fileList.size() > 2 }">
								<img src="${ contextPath }${ rooms.fileList.get(2).filePath }${ rooms.fileList.get(2).changeName }">
								</c:if>                             
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진3 수정하기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분  -->
                            	<c:if test="${ rooms.fileList.size() > 3 }">
								<img src="${ contextPath }${ rooms.fileList.get(3).filePath }${ rooms.fileList.get(3).changeName }">
								</c:if>                                
                            </div>
                            <br>
                            <div class="roomenroll_photo">
                                <p>사진선택 &nbsp;|</p>
                                <div class="roomenroll_photobtn">
                                    <img src="${ contextPath }/resources/images/common/ico_addFile_on.png">
                                    <span>서브사진4 수정하기</span>	
                                </div>
                            </div>
                            <div class="roomenroll_photo_wrap">
                                <!-- 업로드 된 이미지 추가되는 부분 -->
                            	<c:if test="${ rooms.fileList.size() > 4 }">
								<img src="${ contextPath }${ rooms.fileList.get(4).filePath }${ rooms.fileList.get(4).changeName }">
								</c:if>                                
                            </div>
                            
                            <input type="file" class="roomphoto_upload" name="mainimg" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg1" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg2" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg3" accept="image/jpg,image/jpeg,image/png" >
                            <input type="file" class="roomphoto_upload" name="subimg4" accept="image/jpg,image/jpeg,image/png" >
                            
                        </div>	
						<div class="btn_wrap roomregistbtn2">
							<button class="btn btnType1 btnSizeS"><span>저장</span></button>   
						</div>	
					</form>
                </div>
			</div>
		
</div>	
		<script>
	        /* 사진올리기 버튼클릭 */
			document.querySelectorAll(".roomenroll_photobtn").forEach(item => item.addEventListener('click', fileUploadOpen));
	        /* input type="file" 열기 */
	        document.querySelectorAll(".roomphoto_upload").forEach(item => item.addEventListener('change', preview));
	
			function fileUploadOpen(){
				let index = Array.from(document.querySelectorAll(".roomenroll_photobtn")).indexOf(this);
	            document.querySelectorAll(".roomphoto_upload")[index].click(); 
			}
	
			function preview(){
	             if (this.files && this.files[0]) {
	                let index = Array.from(document.querySelectorAll(".roomphoto_upload")).indexOf(this); 
	                let reader = new FileReader();
	                reader.readAsDataURL(this.files[0]);
	                reader.onload = function () {       // div 안에 불러온 파일 추가
	                    document.querySelectorAll(".roomenroll_photo_wrap")[index].innerHTML = "<img src=" + reader.result + ">";
	                }
	            }
	        }
			
			
			/* function photoupdate_submit(f){
				return true;
			} */
			
		</script>
		
<%@include file="/views/common/footer.jsp" %>

