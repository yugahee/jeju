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
			<button class="btn_closeLayer" onclick="hideLayer('findId');"><span class="blind">팝업 닫기</span></button>
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

			<span id="result"></span>
			
			<div class="btn_wrap">
				<button class="btn btnType2 btnSizeM" onclick="findResult()"><span>아이디 찾기</span></button>
				<button class="btn btnType2 btnSizeM" onclick="hideLayer('findId');return false;"><span>닫기</span></button>
			</div>
		</div>
	</div>

	<div id="findPwd" class="layerPop findPwd">
		<div class="layerTit">
			<h4>비밀번호 재설정</h4>
			<button class="btn_closeLayer" onclick="hideLayer('findPwd');"><span class="blind">팝업 닫기</span></button>
		</div>
		<div class="layerBody">
			<div class="cardinfo">
				<p>가입 시 등록한 아이디와 이메일을 입력해주세요.</p>
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
							<th>아이디</th>
							<td>
								<div class="inp_text inp_cell"><input type="text" name="pwd_id" id="pwd_id" required /></div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<div class="inp_text inp_cell"><input type="email" name="pwd_mail" id="pwd_mail" required /></div>
								<a href="#" class="btn btnType1 btnSizeS" id="mail_btn"><span>인증 메일 전송</span></a>
							</td>
						</tr>
						<tr>
							<th>인증 번호 입력</th>
							<td>
								<div class="inp_text inp_cell"><input type="email" name="mail_num" id="mail_num" required /></div>
								<a href="#" class="btn btnType1 btnSizeS" id="mail_btn"><span>인증 확인</span></a>
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
								<p class="error" id="error" name="error"></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<button type="submit" class="btn btnType2 btnSizeM" onclick="newPwd()"><span>완료</span></button>
				<button class="btn btnType2 btnSizeM" onclick="hideLayer('findPwd');return false;"><span>닫기</span></button>
			</div>
		</div>
	</div>
