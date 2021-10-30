<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="../html/mypage.html" class="active">내 정보</a></li>
                        <li><a href="#">포인트</a></li>
                        <li><a href="../html/delete.html">회원 탈퇴</a></li>
                    </ul>
                </nav>
                <div class="sub mypage">
                    <div class="outer">
                        <tbody class="inforForm">
                            <tr>
                                <th>현재 이메일</th>
                                <td>
                                    <div class="inp_text inp_cell">
                                        <input type="email" name="userEmail" id="userEmail" value=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>변경 할 이메일</th>
                                <td>
                                    <div class="inp_text inp_cell" id="userMail">
                                        <input type="email" name="newNmail" id="userNmail" value=""/>
                                        <div class="btnEmail">
                                            <a href="#" class="btn btnType1 btnSizeS"><span>인증 메일 보내기</span></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>인증 번호</th>
                                <td>
                                    <div class="inp_text inp_cell">
                                        <input type="text" name="mailConfirm" id="mailConfirm" value=""/>
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