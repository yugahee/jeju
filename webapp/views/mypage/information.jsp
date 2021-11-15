<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/common/header.jsp" %>
		<div class="side_layout">
			<div class="container mypage">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="${ contextPath }/mypage/modify" class="active">내 정보</a></li>
                        <c:if test="${ loginUser.user_type eq '게스트' }">
                        <li><a href="${ contextPath }/mypage/point">포인트</a></li>
                        </c:if>
                        <li><a href="${ contextPath }/delete">회원 탈퇴</a></li>
                    </ul>
                </nav>
                <div class="sub">
                    <div class="outer">
                        <div class="userImg">
                            <div class="userPro">
                                <img  id="userImg" src="${ contextPath }/resources/images/usericon.png"> 
                            </div>
                        </div>
                        <form action="${ contextPath }/mypage/modify" method="post" onsubmit="return join();">
                        <span id="report">※ 누적 신고 횟수 : ${ loginUser.report_count }</span>
                        <tbody class="inforForm">
                            <tr>
                                <th>이름</th>
                                <td>
                                    <div class="inp_text">
                                        <input type="text" name="userName" id="userName" value="${ loginUser.user_name }" required/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <div class="inp_text" id="usermail">
                                        <input type="email" name="userMail"  id="userMail" value="${ loginUser.email }" readonly/>
                                        <div class="btnEmail">
                                            <a href="${ contextPath }/mypage/mailChange" class="btn btnType1 btnSizeS"><span>이메일 재설정</span></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    <div class="inp_text inp_cell">
                                        <input type="tel" name="userTel" id="userTel" value="${ loginUser.phone }" required/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <div class="inp_text">
                                        <input type="text" name="userId" id="userId" value="${ loginUser.user_id }" readonly/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <div class="inp_text">
                                        <input type="password" name="userPass" id="userPass" placeholder="비밀번호 변경을 원하시면 비밀번호 재설정 버튼을 눌러주세요" readonly/>
                                        <div class="btnTel">
                                            <button type="button" class="btn btnType1 btnSizeS" onclick="showLayer('findPwd');"><span class="find_pwd">비밀번호 재설정</span></button> 
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <div class="saveBtn">
                            <button class="btn btnType1 btnSizeL" id="save"><span>저장하기</span></button>
                        </div>
                        </form>
                    </div>
                </div>  
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>
   
    <!-- 팝업 화면 -->
	<div id="findPwd" class="layerPop findPwd">
		<div class="layerTit">
			<h4>비밀번호 재설정</h4>
			<button type="button" class="btn_closeLayer" onclick="hideLayer('findPwd');"><span class="blind">팝업 닫기</span></button>
		</div>
		<div class="layerBody">
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
								<div class="inp_text inp_cell"><input type="text" name="pwd_id" id="pwd_id" readonly value="${ loginUser.user_id }" /></div>
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

<!-- 비밀번호 재설정에서 메일 인증 부분 ajax로 처리 -->	
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
