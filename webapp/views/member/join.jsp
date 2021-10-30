<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
 <div class="main">
            <div class="memberJoin">
                <div class="selectMem">
                    <div class="gest" id="gest">
                        <input type="radio" id = "ra_gest" name="userType" value="gest" onclick="gest()">
                        <label for="ra_gest" class="gestGray" id="gestGray"></label>
                        <span id="memberG">게스트</span>
                    </div>
                    <div class="host" id="host">
                        <input type="radio" id = "ra_host" name="userType" value="host" onclick="host()">
                        <label for="ra_host" class="hostGray" id="hostGray"></label>
                        <span id="memberH">호스트</span>
                    </div>
                </div>
                <tbody class="joinForm">
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
                                <input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력하세요" required/>
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
                    <button  type="submit" class="btn btnType1 btnSizeL" onclick="join()"><span>가입</span></button>
                </div>
			</div>
		</div>               
<!-- footer -->
<%@ include file="/views/common/footer.jsp" %>