<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
		<div class="side_layout">
			<div class="container mypage">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="../html/mypage.html" class="active">내 정보</a></li>
                        <li><a href="#">포인트</a></li>
                        <li><a href="../html/delete.html">회원 탈퇴</a></li>
                    </ul>
                </nav>
                <div class="sub">
                    <div class="outer">
                        <div class="userImg">
                            <div class="userPro">
                                <img  id="userImg" src="${ contextPath }/resources/images/usericon.png"> 
                            </div>
                        </div>
                        <span id="report">※ 누적 신고 횟수 : 0</span>
                        <tbody class="inforForm">
                            <tr>
                                <th>이름</th>
                                <td>
                                    <div class="inp_text">
                                        <input type="text" name="userName" id="userName" value=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <div class="inp_text" id="usermail">
                                        <input type="email" name="userMail"  id="userMail" value=""/>
                                        <div class="btnEmail">
                                            <a href="../html/findEmail.html" class="btn btnType1 btnSizeS"><span>이메일 재설정</span></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    <div class="inp_text inp_cell">
                                        <input type="tel" name="userTel" id="userTel" value=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <div class="inp_text">
                                        <input type="text" name="userId" id="userId" value=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <div class="inp_text">
                                        <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"/>
                                        <div class="btnTel">
                                            <button class="btn btnType1 btnSizeS" onclick="showLayer('findPwd');"><span class="find_pwd">비밀번호 재설정</span></button> 
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <div class="saveBtn">
                            <button class="btn btnType1 btnSizeL" id="save"><span>저장하기</span></button>
                        </div>
                    </div>
                </div>  
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>
    <!-- 팝업 화면 -->
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