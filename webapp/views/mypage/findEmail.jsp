<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/common/header.jsp" %>

		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="${ contextPath }/mypage/modify" class="active">내 정보</a></li>
                        <c:if test="${ loginUser.user_type eq '게스트' }">
                        <li><a href="${ contextPath }/mypage/point">포인트</a></li>
                        </c:if>
                        <li><a href="${ contextPath }/delete">회원 탈퇴</a></li>
                    </ul>
                </nav>
                <div class="sub mypage">
                    <div class="outer">
                     <form action="${ contextPath }/mypage/mail/modify" method="post">
                        <tbody class="inforForm">
                            <tr>
                                <th>현재 이메일</th>
                                <td>
                                    <div class="inp_text inp_cell">
                                        <input type="email" name="userEmail" id="userEmail" value="${ loginUser.email }" readonly/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>변경 할 이메일</th>
                                <td>
                                    <div class="inp_text inp_cell" id="userNMail">
                                        <input type="email" name="newUmail" id="userNmail" required/>
                                        <div class="btnEmail">
                                            <button type="button" class="btn btnType1 btnSizeS" id="sendEmail"><span>인증 메일 전송</span></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>인증 코드</th>
                                <td>
                                    <div class="inp_text inp_cell" id="mailConfirm">
                                        <input type="text" name="numberConfirm" id="numberConfirm" required/>
                                        <div class="btnNumber">
                                            <button type="button" class="btn btnType1 btnSizeS" id="numberChk"><span>인증 코드 확인</span></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <div class="saveBtn">
                            <button class="btn btnType1 btnSizeL disabled" disabled id="save"><span>저장하기</span></button>
                        </div>
                        </form>
                    </div>
                </div>
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>
<script>

	// 인증 메일 전송 버튼 ajax
	$("#sendEmail").on('click',function(){
		var newMail = $("[name=newUmail]");
		
		// 새로 등록할 이메일도 기존 가입 시 적은 이메일 정규식과 같게 적용
		var regExp = (/^[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*@[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*\.[a-zA-Z]{2,3}$/i);				
		
		if(!newMail || newMail.val().match(regExp) == null){
			alert("올바른 이메일 형식이 아닙니다.");
			newMail.focus();
		} else {
			$.ajax({
				url : "${contextPath}/mypage/mailChange",
				type : "post",
				data : { newMail : newMail.val() },
				success : function(result){
						if(result == "success"){
						alert("인증 메일을 발송하였습니다. 인증 코드를 입력해주세요. ");						
					} else {
						alert("인증 메일 발송에 실패했습니다. 다시 한 번 시도해주세요.");
					}
				},
				error : function(e){
					console.log(e);
				}
			});		
		}	
	});
	
		
	// 인증 코드 확인 버튼 ajax
	$("#numberChk").click(function(){
		var numChk = $("[name=numberConfirm]");
		
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
						$("#save").removeAttr("disabled");
						// 클래스명에서 disabled도 지워짐
						document.getElementById("save").className = "btn btnType1 btnSizeL";
					} else {
						$("#save").attr("disabled", true);
						document.getElementById("save").className = "btn btnType1 btnSizeL disabled";
					}	
				},
				error : function (e){
					console.log(e);
				
				}
			});
	});
</script>