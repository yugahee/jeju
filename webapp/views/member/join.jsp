<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
.checkId{
	float : right;
	margin-top: 5px;
}
</style>
 <div class="main">
            <div class="memberJoin">
                <form action="${ contextPath }/join" method="post">
                <div class="selectMem">
                    <div class="gest" id="gest">
                        <input type="radio" id = "ra_gest" value="gest">
                        <label for="ra_gest" class="gestGray" id="gestGray"></label>
                        <span id="memberG">게스트</span>
                    </div>
                    <div class="host" id="host">
                        <input type="radio" id = "ra_host" value="host">
                        <label for="ra_host" class="hostGray" id="hostGray"></label>
                        <span id="memberH">호스트</span>
                    </div>
                </div>
                <tbody class="joinForm">
                	<tr>
                        <th>카테고리</th><br>
                           <td>
                               <div class="selectbox">
                                   <button class="title" type="button" title="카테고리 선택" >카테고리를 선택하세요</button>
                                   <ul class="selList">
                                       <li>
                                           <input type="radio" value="gest" class="option" id="sel2_1" name="userType" onclick="selectType();"/>
                                           <label for="sel2_1">1. 게스트</label>
                                       </li>
                                       <li>
                                           <input type="radio" value="host" class="option" id="sel2_2" name="userType" onclick="selectType();"/>
                                           <label for="sel2_2">2. 호스트</label>
                                       </li>
                                   </ul>
                               </div>
                            </td>
                    </tr><br><br>
                    <tr>
                        <th>이름</th>
                        <td>
                            <div class="inp_text inp_cell">
                                <input type="text" name="userName" id="userName" placeholder="한글로 2~15자 이내" required/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <div class="inp_text inp_cell">
                                <input type="email" name="userMail" id="userMail" placeholder="이메일을 입력하세요" required/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <div class="inp_text inp_cell">
                                <input type="tel" name="userTel" id="userTel" placeholder="-제외 숫자만 입력하세요" required/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <div class="inp_text inp_cell">
                                <input type="text" name="userId" id="userId" placeholder="영문, 숫자로 5~20자 이내" required/>
                                <div class="checkId">
                                <button type="button" class="btn btnType1 btnSizeS" id="chkId"><span>중복 확인</span></button> 
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <div class="inp_text inp_cell">
                                <input type="password" name="userPwd" id="userPwd"
                                placeholder="영문 대소문자, 숫자, 특수문자 포함 30자 이내" required/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                            <div class="inp_text inp_cell">
                                <input type="password" name="userPwd2" id="userPwd2" placeholder="비밀번호 확인" required/>
                                <p class="error" id="error" name="error"></p>
                            </div>
                        </td>
                    </tr>
                </tbody>
                <div class="joinBtn">
                    <button  type="submit" id="joinBtn" class="btn btnType1 btnSizeL disabled" onclick="join()" disabled><span>가입</span></button>
                </div>
                </form>
			</div>
		</div>               
<!-- footer -->
<%@ include file="/views/common/footer.jsp" %>

<script>
	$("#chkId").on('click', function(){
		var userId = $("[name=userId]");
		// 최종 가입 submit버튼이 가능하게 하기 위한 확인용 변수
		var idUse = false;
		
		if(!userId || userId.val().length < 5) {
			alert("아이디는 영문과 숫자로 5~20자 이내만 허용됩니다.");
			userId.focus();
		} else {
			$.ajax({
				url : "${contextPath}/checkId",
				data : { userId : userId.val() },
				success : function(thisId){
					if(thisId != "fail"){
						if(confirm("사용 가능한 아이디입니다. 해당 아이디로 사용하시려면 확인을 눌러주세요.")){
							userId.attr('readonly', true);
							idUse = true;
						} else {
							// confirm에서 취소 누른 경우
							userId.attr('readonly', false);
							userId.focus();
							idUse = false;
						}
					} else {
						alert("사용할 수 없는 아이디입니다.");
						userId.focus();
					}
					
					if(idUse){
						$("#joinBtn").removeAttr("disabled");
						// 클래스명에서 disabled도 지워져야 함
					} else {
						$("#joinBtn").attr("disabled", true);
					}
					
				},
				error : function (e){
					console.log(e);
					// 오류 페이지로 이동
					<% request.setAttribute("message", "아이디 중복 확인 처리에 실패하였습니다."); %>
					<% request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response); %>
				}
			});
		}
	});
</script>
