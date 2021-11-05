<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>
<div class="payment">
	<from method="post" name="paymentFrom">   
		<div class="container">          
			<h2>결제</h2>
			<div class="sec sec01">                
				<h4>숙박 정보</h4>
				<div class="rooms_info">
					<p class="room_name">${ reserve.room_info.roomName }</p>
					<p>주소 : ${ reserve.room_info.address }</p>
					<p>숙박인원 : ${ reserve.reserve_num }명</p>
				</div>
				<div class="check_date">
					<div class="chkdate_box">
						<p>체크인</p>
						<p class="date"><fmt:formatDate value="${reserve.start_date}" type="both" pattern="yyyy.MM.dd(E)"/></p>
					</div>
					<div class="chkdate_box">
						<p>체크인</p>
						<p class="date"><fmt:formatDate value="${reserve.end_date}" type="both" pattern="yyyy.MM.dd(E)"/></p>
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
										<input type="text" name="reserUserName" id="reserUserName" placeholder="예약자 성함을 입력해주세요" required />
									</div>
								</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td>
									<div class="inp_text">
										<input type="text" name="reserphone" id="reserphone" placeholder="'-' 없이 입력해주세요" required />
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
								<td><fmt:formatNumber value="${ roomPrice }" groupingUsed="true" />원</td>
							</tr>
							<tr>
								<th>포인트 사용</th>
								<td>									
									<input type="checkbox" name="pointChk" id="pointChk">
									<label for="pointChk">포인트사용</label>									
								</td>
							</tr>
							<tr class="point_using" style="display: none">
								<th></th>
								<td>
									<div class="using_box">
										<p>포인트 사용 가능 금액 : <b id="useabled_point">${ useabledPoint }</b>p</p>
										<p>※ 100p 이상 사용 가능</p>
										<div class="poin_input">
											<div class="inp_text">
												<input type="text" name="usePoint" id="usePoint" placeholder="사용 포인트 입력"/>
											</div>		
											<button class="btn btnType1 btnSizeM" onclick="pointUsing(${ roomPrice })"><span>사용</span></button>										
										</div>
									</div>
								</td>
							</tr>	
							<tr class="borderT total">
								<th>총 결제금액</th>
								<td><span id="total_price">60000</span>원</td>								
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
			<button type="button" class="btn btnType1 btnSizeL payment_submit" onclick="formChk()"><span>결제하기</span></button>
		</div>
		<input type="hidden" name="originPrice" value="${ roomPrice }"/>
		<input type="hidden" name="totalPrice" id="totalPrice" value="${ roomPrice }"/>
		<input type="hidden" name="originPoint" value="${ useabledPoint }"/>
		<input type="hidden" name="usingPoint" id="usingPoint" value="0"/>
		<input type="hidden" name="roomNo" id="roomNo" value="${ reserve.room_info.roomNo }">
		<input type="hidden" name="reserveNo" id="reserveNo" value="${ reserve.room_reserve }">
	</from>
</div>
<script>	
	// 포인트 사용
	$(function(){
		$("#pointChk").change(function(e){
			let chk = $(this).prop("checked");
			if(chk == true){
				$(".point_using").show();				
			}else{
				$(".point_using").hide();
				let originPrice = $("input[name=originPrice]").val();
				$("input[name=totalPrice]").val(originPrice);
				$("#total_price").text(originPrice);
				$("#usingPoint").val("0");
			}
		});
	});
	
	function pointUsing(roomPrice){
		// 사용할 포인트 입력 받은 값
		let usingPoint = Number(document.getElementById("usePoint").value);
		// 원래 값
		let originPrice = roomPrice;
		// 사용할 수 있는 포인트
		let usabledPoint = Number(document.getElementById("useabled_point").innerText);		
		
		if( usingPoint > usabledPoint){
			alert("사용할 수 있는 포인트를 초과하였습니다.");
			$("#usePoint").focus();
		}else{
			let totalPrice = originPrice - usingPoint;		
			document.getElementById("total_price").innerText = totalPrice;
			document.getElementById("totalPrice").value = totalPrice;
			document.getElementById("usingPoint").value = usingPoint;
		}		
	}
	
	// 유효성 검사
	function formChk(){
		let regExp = new RegExp('pattern', 'gmi');
		regExp = /pattern/gmi;
		
		let agree1 = document.getElementById("agreeChk1");
		let agree2 = document.getElementById("agreeChk2");
		let agree3 = document.getElementById("agreeChk3");
				
		if(!check(/^[가-힣]{2,}$/, document.getElementById('reserUserName'), "이른은 한글로 2글자 이상 입력하세요")){
            return false;
        }else if(!check(/^01[01679]\d{8}$/, document.getElementById('reserphone'), "휴대폰번호가 제대로 입력되지 않았습니다.")){
            return false;
        }else if(!agree1.checked || !agree2.checked || !agree1.checked){
        	alert("이용약관은 모두 체크해주셔야 합니다.");
        	return false;
        }else{        	
        	requestPay();
        }
		
	}
	
	function check(regExp, input, msg){        
        if(regExp.test(input.value)){
        	// 정규표현식 만족 시 결제로 넘김
        	return true;        	
        }else{
	        // 정규 표현식 불만족할 경우
            alert(msg);
            input.value = '';
            input.focus();
            return false;
        }
    }
		
</script>

<!-- 결제 -->
<!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script>
	 var IMP = window.IMP; // 생략 가능
	 IMP.init("imp81058617"); // 예: imp00000000
 	
	 function requestPay() {
		 IMP.request_pay({
		 	pg : 'kakaopay',
		    pay_method : 'card', //생략 가능
		    merchant_uid: "order_no_60", // 상점에서 관리하는 주문 번호
		    name : '숙소 결제',
		    amount : 100,			    
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'			    
		}, function(rsp) {
			if ( rsp.success ) {
				$.ajax({
					url : "${contextPath}/payment/insert",
					data : {
						"reserveNo" : $("#reserveNo").val(),
						"roomNo" : $("#roomNo").val(),
						"totalPrice" : $("#totalPrice").val(),
						"usingPoint" : $("#usingPoint").val(),						
						"name" : $("#reserUserName").val(),
						"phone" : $("#reserphone").val()
					},
					dataType : "json",
					type : "post",
					success : function(pay){				
						alert("결제가 성공되었습니다.");
					},
					error : function(e){
						console.log(e);
					}
				});				
			}else{
		    	//결제 시작 페이지로 리디렉션되기 전에 오류가 난 경우
		        var msg = '오류로 인하여 결제가 시작되지 못하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		        alert(msg);
		    }
		});
	 }
 </script>
<%@include file="/views/common/footer.jsp" %>