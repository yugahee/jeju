<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
#chkReason{
	width : 60%;
}

#ect {
	visibility: hidden;
	display: flex;
}
</style>
		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="${ contextPath }/mypage/modify">내 정보</a></li>
                        <li><a href="${ contextPath }/mypage/point">포인트</a></li>
                        <li><a href="${ contextPath }/delete" class="active">회원 탈퇴</a></li>
                    </ul>
                </nav>
                <div class="sub mypage">
                <form action="${ contextPath }/delete" method="post">
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
                            <input type="radio" class="reason" name="radio" id="radio1_1" value="더 이상 사용할 의사가 없어서">
                            <label for="radio1_1">더 이상 사용할 의사가 없어서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" class="reason" name="radio" id="radio1_2" value="안전 또는 사생활 보호에 관한 우려가 있어서">
                            <label for="radio1_2">안전 또는 사생활 보호에 관한 우려가 있어서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" class="reason" name="radio" id="radio1_3" value="다른 사이트가 더 좋아서">
                            <label for="radio1_3">다른 사이트가 더 좋아서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" class="reason" name="radio" id="radio1_4" value="이용이 불편하고 장애가 많아서">
                            <label for="radio1_4">이용이 불편하고 장애가 많아서</label>
                        </span>
                        <span class="inp_radio">
                            <input type="radio" class="reason" name="radio" id="radio1_5" value="기타">
                            <label for="radio1_5">기타</label> 
                        </span>
                            <br>          
                            <div class="inp_text inp_cell" id="ect">
                            <input type="text" name="radioEct" id="chkReason" required/>
                            </div>
                    </ul>
                    <div class="delBtn">
                      <!--   <span class="inp_check" id="deleteChk">
                            <input type="checkbox" class="delChk" name="delChk">
                            <label for="chk1_1" id="del">상기 내용을 확인하였으며 동의합니다.</label>
                        </span> -->
                        <div class="btn_wrap">
                            <button type="button" class="btn btnType2 btnSizeM disabled" id="delBtn" 
                            onclick="showLayerAlert();" disabled><span>탈퇴하기</span></button>
                        </div>
                        <div id="layer_alert" class="layerPop layerConfirm">
                            <div class="layerBody">
                            <p class="txt">회원 탈퇴</p>
                            <p class="subtxt">지금까지 '제주라도 넘어갈까'를 이용해주셔서 감사합니다.</p>
                                <div class="btn_wrap">
                                    <button type="submit" class="btn btnType2 btnSizeM"><span>확인</span></button>
                                    <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('layer_alert'); return false;"><span>취소</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>     
                </div>
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>

<script>

	document.querySelectorAll(".reason").forEach(item => item.addEventListener('change', chkReason));
	function chkReason(){
		let index = Array.from(document.querySelectorAll(".reason")).indexOf(this);
		//let val = document.querySelectorAll(".reason")[index].value;
		
		// 라디오 버튼 선택하면 탈퇴하기 버튼 활성화
		if(index != null){
			$("#delBtn").removeAttr("disabled");
			document.getElementById("delBtn").className = "btn btnType2 btnSizeM";

			// 기타를 선택하면 입력 칸 나오게
			if(index == 4) {
				document.getElementById('ect').style.visibility = "visible";
				$("#chkReason").attr("required", true);
			} else {
				document.getElementById('ect').style.visibility = "hidden";
				$("#chkReason").removeAttr("required");
			}
		} else {
			$("#delBtn").attr("disabled", true);
			document.getElementById("delBtn").className = "btn btnType2 btnSizeM disabled";
		}
		
	}
	
	

</script>