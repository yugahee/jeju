<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="../html/mypage.html">내 정보</a></li>
                        <li><a href="#">포인트</a></li>
                        <li><a href="../html/delete.html" class="active">회원 탈퇴</a></li>
                    </ul>
                </nav>
                <div class="sub mypage">
                    <h2>회원 탈퇴</h2>
                    <ul>
                        <li>• 현재 사용 중이신 계정 정보의 복구는 불가합니다.</li>
                        <br>
                        <li>• 작성된 글과 댓글은 삭제되지 않습니다.</li>
                        <br>
                        <li>• 수집된 개인 정보는 탈퇴 후 3년간 유지 후 파기됩니다.</li>
                        <br>
                        <li>• 탈퇴하시는 이유를 골라주세요</li>
                        <span class="inp_radio">
                            <input type="radio" name="radio" id="radio1_1">
                            <label for="radio1_1">더 이상 사용할 의사가 없어서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" name="radio" id="radio1_2">
                            <label for="radio1_2">안전 또는 사생활 보호에 관한 우려가 있어서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" name="radio" id="radio1_3">
                            <label for="radio1_3">다른 사이트가 더 좋아서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" name="radio" id="radio1_4">
                            <label for="radio1_4">이용이 불편하고 장애가 많아서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" name="radio" id="radio1_5">
                            <label for="radio1_5">기타</label>
                        </span>
                    </ul>
                    <div class="delBtn">
                        <span class="inp_check">
                            <input type="checkbox" name="chk1" id="chk1_1">
                            <label for="chk1_1">상기 내용을 확인하였으며 동의합니다.</label>
                        </span>
                        <div class="btn_wrap">
                            <button class="btn btnType2 btnSizeM disabled" id="delBtn" disabled 
                            onclick="showLayerAlert('그동안 제주라도 이용할까를 이용해주셔서 <br> 감사합니다.');"><span>탈퇴하기</span></button>
                        </div>
                        <div id="layer_alert" class="layerPop layerConfirm">
                            <div class="layerBody">
                                <div class="btn_wrap">
                                    <a href="#" class="btn btnType2 btnSizeM"><span>확인</span></a>
                                    <a href="#" class="btn btnType2 btnSizeM" onclick="hideLayer('layer_alert');return false;"><span>취소</span></a>
                                </div>
                            </div>
                        </div>
                    </div>     
                </div>
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>