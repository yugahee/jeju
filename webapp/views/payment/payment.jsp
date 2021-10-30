<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="payment">
	<from method="post">   
		<div class="container">          
			<h2>결제</h2>
			<div class="sec sec01">                
				<h4>숙박 정보</h4>
				<div class="rooms_info">
					<p class="room_name">숙소명</p>
					<p>주소 : 서울특별시 강남구 테헤란로 10길 9 그랑프리 빌딩</p>
					<p>숙박인원 : 4명</p>
				</div>
				<div class="check_date">
					<div class="chkdate_box">
						<p>체크인</p>
						<p class="date">2021.01.01(월)</p>
					</div>
					<div class="chkdate_box">
						<p>체크인</p>
						<p class="date">2021.01.02(화)</p>
					</div>
				</div>
			</div><!--sec01 END-->
			<div class="sec sec02">
				<h4>예약자 정보</h4>
				<div class="tblType2 noBorder">
					<table>
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>예약자 이름</th>
								<td>
									<div class="inp_text">
										<input type="text" name="reserUserName" id="reserUserName" placeholder="예약자 성함을 입력해주세요">
									</div>
								</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td>
									<div class="inp_text">
										<input type="text" name="reserphone" id="reserphone" placeholder="'-' 없이 입력해주세요">
									</div>
								</td>
							</tr>								
						</tbody>
					</table>
				</div>						
			</div><!-- sec02 ENDs-->
			<div class="sec sec03">
				<h4>포인트 및 결제 정보</h4>
				<div class="tblType2 noBorder">
					<table>
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>예약금액</th>
								<td>60,000원</td>
							</tr>
							<tr>
								<th>포인트 사용</th>
								<td>
									<span class="inp_check">
										<input type="checkbox" name="pointChk" id="pointChk">
										<label for="pointChk">포인트사용</label>
									</span>
								</td>
							</tr>
							<tr class="point_using" style="display: none">
								<th></th>
								<td>
									<div class="using_box">
										<p>포인트 사용 가능 금액 : <b>1,000p</b></p>
										<p>※ 100p 이상 사용 가능</p>
										<div class="poin_input">
											<div class="inp_text">
												<input type="text" name="usePoint" id="usePoint" placeholder="사용 포인트 입력"/>
											</div>		
											<a href="#" class="btn btnType1 btnSizeM"><span>사용</span></a>										
										</div>
									</div>
								</td>
							</tr>	
							<tr class="borderT total">
								<th>총 결제금액</th>
								<td>60,000원</td>
							</tr>
						</tbody>
					</table>
				</div>						
			</div><!-- sec03 ENDs-->
			<div class="sec sec04">
				<h4>이용약관</h4>
				<div class="all_chk">
					<span class="inp_check allChk">
						<input type="checkbox" name="agreeChk" id="allChk">
						<label for="allChk">전체 동의합니다.</label>
					</span>
				</div>
				<ul class="agree_box">
					<li>
						<span class="inp_check">
							<input type="checkbox" name="agreeChk" id="agreeChk1">
							<label for="agreeChk1">숙소이용 및 취소 / 환불규정 동의 (필수)</label>
						</span>
					</li>
					<li>
						<span class="inp_check">
							<input type="checkbox" name="agreeChk" id="agreeChk2">
							<label for="agreeChk2">개인정보 수집 및 이용동의 (필수)</label>
						</span>
					</li>
					<li>
						<span class="inp_check">
							<input type="checkbox" name="agreeChk" id="agreeChk3">
							<label for="agreeChk3">개인정보 제3자 제공 동의 (필수)</label>
						</span>
					</li>
				</ul>
			</div><!-- sec04 ENDs-->
			<button type="button" class="btn btnType1 btnSizeL payment_submit" onclick="location.href='payment_result.html'"><span>결제하기</span></button>
		</div>
	</from>
</div>
<%@include file="/views/common/footer.jsp" %>