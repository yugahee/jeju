<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="mainLogin">
	<div class="outer">
	<form class="loginForm" action="${ contextPath }/login" method="post">
		<div class="loginArea">아이디</div>
        <div class="input_area"><input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요" required/></div><br>
        <div class="loginArea">비밀번호</div>
        <div class="input_area"><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요" required /></div><br>
		<button type="submit" class="btn btnType1 btnSizeL" id="btnLogin"><span>로그인</span></button>
		<div class="find">
			<button onclick="showLayer('findId');" type="button"><span class="find_id"> 아이디 찾기 / </span></button>
			<button onclick="showLayer('findPwd');" type="button"><span class="find_pwd">비밀번호 찾기</span></button> 
		</div>
		<button type="button" class="btn btnType1 btnSizeL" id="btnJoin" onclick="location.href='${contextPath}/join'"><span>회원가입</span></button>
	</form>
	</div>
</div>

<!-- footer -->
<%@ include file="/views/common/footer.jsp" %>

<!-- 팝업 -->
<div id="findId" class="layerPop findId">
		<div class="layerTit">
			<h4>아이디 찾기</h4>
			<button type="button" class="btn_closeLayer" onclick="hideLayer('findId');"><span class="blind">팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="cardinfo">
				<p>가입 시 등록한 이름과 이메일을 입력해주세요.</p>
			</div>
			
			<div class="tblType2 noBorder">
				<table>
					<caption></caption>
					<colgroup>
                        <col width="30%">
                        <col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<div class="inp_text inp_cell"><input type="text" name="id_name" id="id_name" required /></div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<div class="inp_text inp_cell"><input type="email" name="id_mail" id="id_mail" required /></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<span id="result1"></span><span id="result"></span><span id="result3"></span>
			
			<div class="btn_wrap">
				<button id="findBtn" class="btn btnType2 btnSizeM"><span>아이디 찾기</span></button>
				<button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('findId');return false;"><span>닫기</span></button>
			</div>
			
		</div>
	</div>

<!-- 아이디 찾기 비동기 처리 -->
<script>
	$("#findBtn").on('click', function(){
		var userName = $("[name=id_name]");
		var userMail = $("[name=id_mail]");
		
		$.ajax({
			url : "${ contextPath }/findId",
			type : "post",
			data : { userName : userName.val(), userMail : userMail.val() },
			success : function(userId){
				if(userId != "fail"){
					// 아이디 찾아와 span에 넣기
					$("#result1").text("회원님의 아이디는 ");
					$("#result").text(userId);
					$("#result3").text(" 입니다.");
					
				} else {			
					alert("존재하지 않는 회원입니다.");
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	});
</script>


	<div id="findPwd" class="layerPop findPwd">
		<div class="layerTit">
			<h4>비밀번호 재설정</h4>
			<button type="button" class="btn_closeLayer" onclick="hideLayer('findPwd');"><span class="blind">팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="cardinfo">
				<p>가입 시 등록한 아이디와 이메일을 입력해주세요.</p>
			</div>
			<form action="${ contextPath }/pwdModify" method="post"  onsubmit="return checkPwd();">
			<div class="tblType2 noBorder">
				<table>
					<caption></caption>
					<colgroup>
                        <col width="30%">
                        <col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<div class="inp_text inp_cell"><input type="text" name="pwd_id" id="pwd_id" required /></div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<div class="inp_text inp_cell"><input type="email" name="pwd_mail" id="pwd_mail" required /></div>
								<button type="button" class="btn btnType1 btnSizeS" id="mail_btn"><span>인증 메일 전송</span></button>
							</td>
						</tr>
						<tr>
							<th>인증 코드 입력</th>
							<td>
								<div class="inp_text inp_cell"><input type="text" name="mail_num" id="mail_num" required /></div>
								<button type="button" class="btn btnType1 btnSizeS" id="chk_btn"><span>인증 코드 확인</span></button>
							</td>
						</tr>
						<tr>
							<th>새로운 비밀번호</th>
							<td>
								<div class="inp_text inp_cell"><input type="password" name="newPwd1" id="newPwd1" required /></div>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<div class="inp_text inp_cell"><input type="password" name="newPwd2" id="newPwd2" required /></div>
								<p class="error" id="error"></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap" id="pwdM_btn">
				<button type="submit" class="btn btnType2 btnSizeM disabled" id="modify" disabled><span>완료</span></button>
				<button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('findPwd');return false;"><span>닫기</span></button>
			</div>
			</form>
		</div>
	</div>
	

<!-- 비밀번호 재설정에서 메일 인증 부분 비동기 처리 -->	
<script>

	// 인증 메일 전송 버튼 ajax
	$("#mail_btn").on('click',function(){
		var newMail = $("[name=pwd_mail]");
	
		$.ajax({
			url : "${contextPath}/modify/mailSent",
			type : "post",
			data : { newMail : newMail.val() },
			success : function(result){
					if(result == "success"){
					alert("인증 메일을 발송하였습니다. 인증 코드를 입력해주세요.");						
				} else {
					alert("인증 메일 발송에 실패했습니다. 다시 한 번 시도해주세요.");
				}
			},
			error : function(e){
				console.log(e);
			}
		});			
	});
	
		
	// 인증 코드 확인 버튼 ajax
	$("#chk_btn").click(function(){
		var numChk = $("[name=mail_num]");
		
		// 최종 저장 submit버튼이 가능하게 하기 위한 확인용 변수
		var mailConfirm = false;
		
			$.ajax({
				url : "${contextPath}/mypage/checkNumber",
				type : "post",
				data : { numChk : numChk.val() },
				success : function(result){
					if(result != "fail"){
						alert("인증 코드 확인에 성공했습니다.");
						mailConfirm = true;
					} else {
						alert("인증 코드 확인에 실패했습니다.");
						mailConfirm = false;
						numChk.focus();
					}
					
					// 메일 인증 확인이 완료된 경우  저장하기 disabled 속성을 없애고
					if(mailConfirm){
						$("#modify").removeAttr("disabled");
						// 클래스명에서 disabled도 지워짐
						document.getElementById("modify").className = "btn btnType2 btnSizeM";
					} else {
						$("#modify").attr("disabled", true);
						document.getElementById("modify").className = "btn btnType2 btnSizeM disabled";
					}	
				},
				error : function (e){
					console.log(e);
				
				}
			});
	});
</script>

<!-- 새로운 비밀번호 + 비밀번호 확인 일치 확인 함수 -->
<script>
	function checkPwd(){
	const newPwd1 = document.getElementById('newPwd1');
	const newPwd2 = document.getElementById('newPwd2');

	/*하나라도 공란으로 입력 시 alert후 submit 하지 않음*/
	if(newPwd1.value == "" || newPwd2.value == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}

	/* 비밀번호와 비밀번호 확인의 값이 다를 시 alert 후 submit 하지 않음 */
	if(newPwd1.value != newPwd2.value){
		document.getElementById("error").innerHTML = "비밀번호와 비밀번호 확인이 다릅니다."
		//alert("비밀번호와 비밀번호 확인이 다릅니다.");
		return false;
	}
	return true;
		}
</script>
