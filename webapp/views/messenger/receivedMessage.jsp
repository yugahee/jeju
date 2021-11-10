<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>
<style>
	.btn_wrap {
		text-align: center;
	}
	
</style>
		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="${ contextPath }/messenger/list/received" class="active">받은 메시지</a></li>
                        <li><a href="${ contextPath }/messenger/list/sent">보낸 메시지</a></li>
                    </ul>
                </nav>
                <div class="sub messengerList">
                    <h2>받은 메시지</h2>
                    <div class="tblType3 noBorT noBorB boardList">
                        <table summary="받은 메시지 목록">
                            <caption>받은 메시지 목록</caption>
                            <colgroup>
                                <col style="width:9.2%">
                                <col style="width:*">
                                <col style="width:13.8%">
                                <col style="width:13.8%">
                                <col style="width:9.2%">
                            </colgroup>
                            <button type="button" onclick="showLayer('writingMessage');" class="btn btnType1 btnSizeM" id="write"><span>관리자에게 보내기</span></button>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>내용</th>
                                    <th>보낸 회원</th>
                                    <th>작성일</th>
                                    <th>읽음여부</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="msg" items="${ messengerList }">
                            <%-- <c:if test="${ msg.from_user eq loginUser.user_id }"> --%>
                                <tr onclick="showLayer('callMessage'); msgDetail(this);">
                                	<td style="display:none;"><input type="hidden" value="${ msg.msg_no }"></td>
                                    <td>${ msg.msg_no }</td>
                                    <td class="al_l"><button class="message" id="conMsg"><span class="opt_cate">[${ msg.msg_cate }] </span>${ msg.msg_content }</button></td>
                                    <td>${ msg.from_user }</td>
                                    <td><fmt:formatDate value="${ msg.modify_date }" type="both" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                    <td>${ msg.chk_status }</td>
                                   <%--  <c:choose>
                                    <c:when test="${ msg.chk_status eq 'N'}">
                                    <td>
                                        <button type="button" class="btn btnType1 btnSizeS" id="modify" onclick="showLayer('modifyMessage'); msgModify(this);"><span>수정</span></button>
                                        <button type="button" class="btn btnType2 btnSizeS" id="delete" onclick="showLayerAlert();"><span>삭제</span></button>
                                    </td>
                                    </c:when>
                                    <c:when test="${ msg.chk_status eq 'Y'}">
                                    <td>
                                    	<button type="button" class="btn btnType1 btnSizeS disabled" id="btn_modify" disabled><span>수정</span></button>
                                        <button type="button" class="btn btnType2 btnSizeS disabled" id="btn_delete" disabled><span>삭제</span></button>
                                    </td>
                                    </c:when>
                                    </c:choose> --%>
                                </tr>
                            <%-- </c:if> --%>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
        
       
                    <div class="paging">
                    <!-- 첫 번째 페이지로 -->
                        <span class="first"><a href="${ contextPath }/messenger/list/sent?page=1"></a></span>
                        <span class="prev">
                        	<c:choose>
							<%-- 조건 : 현재 페이지가 1페이지가 아니라면--%>
							<c:when test="${ pi.page > 1 }">
							<%-- 현재 페이지 -1 페이지로 이동되게  --%>
							<a href="${ contextPath }/messenger/list/sent?page=${ pi.page - 1}"></a>
							</c:when>
							<%-- 현재 페이지가 1페이지인 경우 = 페이지 이동 안되게 --%>
							<c:otherwise>
							<a href="#"></a>
							</c:otherwise>
							</c:choose>                   
                        </span>
						
						<!-- 최대 10개의 페이지 목록 -->
							<%-- 1~10페이징바가 한 세트로 보이도록 --%>
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
							<%-- 요청하는 페이지가 현재 페이징바 내부에 있다면 --%>
							<c:when test="${ p eq pi.page }">
							<%-- 페이징바 이동은 없고 선택된 페이지 눈에 띄게 하기 위해 디자인 들어간 클래스명 부여 --%>
							<a href="#" class="current">${ p }</a>
							</c:when>
							<c:otherwise>
							<%-- 요청하는 페이지가 현재 페이징 바와 다르다면 해당 페이지가 들어간 페이징바 보이게 --%>
							<a href="${ contextPath }/messenger/list/sent?page=${ p }">${ p }</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
                     
                        <span class="next">
						<!-- 다음 페이지로  -->
							<c:choose>
							<%-- 조건 : 현재 페이지가 마지막 페이지가 아니라면--%>
							<c:when test="${ pi.page < pi.maxPage }">
							<%-- 현재 페이지 +1 페이지로 이동되게  --%>
							<a href="${ contextPath }/messenger/list/sent?page=${ pi.page + 1}"></a>
							</c:when>
							<%-- 현재 페이지가 마지막 페이지인 경우 = 페이지 이동 안되게 --%>
							<c:otherwise>
							<a href="#"></a>
							</c:otherwise>
							</c:choose>  
                        </span>
                        <!-- 마지막 페이지로 -->
                        <span class="last"><a href="${ contextPath }/messenger/list/sent?page=${ pi.maxPage }"></a></span>
                    </div>
                </div>
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>
<!-- 보낸 메시지 팝업 화면: 기본적으로 내용 변경 불가하게 모두 disable,readonly 처리 -->
<div id="callMessage" class="layerPop calldMessage">
	<div class="layerTit">
		<h4>messenger</h4>
		<button type="button" class="btn_closeLayer"
			onclick="hideLayer('callMessage');">
			<span class="blind">팝업 닫기</span>
		</button>
	</div>
	<div class="layerBody">
		<br>
		<div class="tblType2 noBorder">
			<table>
				<colgroup>
					<col style="width: 20%;">
					<!-- <col style="width:*;"> -->
				</colgroup>
				<tbody>
					<!-- <input type="hidden" id="mno" value=""> -->
					<tr>
						<th>보낸 사람</th>
						<td>${ loginUser.user_id }</td>
					</tr>
					<!-- 메시지 보낼 때 선택했던 값으로 checked -->
					<tr>
						<th>카테고리</th>
						<td id="call_cate">
							<%-- <div class="selectbox disabled">
								<button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                    <c:choose>
                                    	<c:when test="${ message.msg_cate eq '문의'}">
                                        <li>
                                            <input type="radio" value="문의" class="option" id="sel2_1" name="call_cate" checked="checked"/>
                                            <label for="sel2_1">1. 문의</label>
                                        </li>
                                        </c:when>
                                    	<c:otherwise>
                                        <li>
                                            <input type="radio" value="신고" class="option" id="sel2_2" name="call_cate" checked="checked"/>
                                            <label for="sel2_2">2. 신고</label>
                                        </li>
                                        </c:otherwise>
                                    </c:choose>
                                    </ul>
							</div> --%>
						</td>
					</tr>

					<tr id="report_id">
						<th>피신고인</th>
						<td id="call_reportId">
							<%-- <c:choose>
                            <c:when test="${ message.msg_cate eq '문의'}">
                                <div class="inp_text inp_cell">
                                    <input type="text" name="userId" id="call_userId" class="readOnly"  placeholder="신고하실 회원의 아이디를 입력하세요." readonly />
                                </div>
                            </c:when>
                            <c:otherwise>
                            	<div class="inp_text inp_cell">
                                    <input type="text" name="userId" id="call_userId" class="readOnly" value="${ message.to_user }" readonly />
                                </div>
                            </c:otherwise>
                            </c:choose> --%>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td id="call_content">
							<%-- <div class="textbox">
                                    <textarea class="readOnly" name="call_context" readonly>
                                        ${ message.msg_content }
                                    </textarea>
                                </div> --%>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_wrap" id="modifyBtn">
			<!--  <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('callMessage');return false;"><span>닫기</span></button> -->
			<%--  <c:choose>
                 <c:when test="${ message.chk_status eq 'N'}">
                 	<button type="button" class="btn btnType1 btnSizeS" id="modify" onclick="showLayer('modifyMessage'); msgModify(this);"><span>수정</span></button>
                    <button type="button" class="btn btnType2 btnSizeS" id="delete" onclick="showLayerAlert();"><span>삭제</span></button>
    			 </c:when>
                 <c:when test="${ message.chk_status eq 'Y'}">
                    <button type="button" class="btn btnType1 btnSizeS disabled" id="btn_modify" disabled><span>수정</span></button>
                    <button type="button" class="btn btnType2 btnSizeS disabled" id="btn_delete" disabled><span>삭제</span></button>
                 </c:when>
                 </c:choose> --%>
		</div>
	</div>
</div>


<!-- 해당 메시지 상세 보기 & 상대방이 메시지를 읽지 않은 경우 수정 및 삭제 기능과 연결 -->
<script>
	function msgDetail(elem){
		let msgNo = $(elem).find('input').val();
		
		$.ajax({
			url : "${contextPath}/messenger/detail",
			data : { msgNo : msgNo },
			dataType : "json",
			type : "get",
			success : function(msg) {
						var category = '';
						var report = '';
						var content = '';
						var btn = '';
						var mno = '';

						if (msg) {
							mno = msg.msg_no;
							if(msg.chk_status == 'N'){
								
								if (msg.msg_cate == '문의') {
									category = '<div class="selectbox disabled"><button class="title" type="button" title="카테고리 선택">1. 문의</button>';
								} else {
									category = '<div class="selectbox disabled"><button class="title" type="button" title="카테고리 선택">2. 신고</button>';
								}
								$("#call_cate").html(category);
								
								if (msg.msg_cate == '문의') {
									report = '<div class="inp_text inp_cell">'
											+ '<input type="text" name="modify_Id" id="modify_Id" class="readOnly" placeholder="신고하실 회원의 아이디를 입력하세요." readOnly /></div>';
								} else {
									report = '<div class="inp_text inp_cell">'
											+ '<input type="text" name="modify_Id" id="modify_Id" value="' + msg.report_user + '" /></div>';
								}
								$("#call_reportId").html(report);

								content = '<div class="textbox"><textarea name="modify_content" id="modify_content">' + msg.msg_content + '</textarea></div>';
								$("#call_content").html(content);

								
								btn = '<button type="button" class="btn btnType1 btnSizeS" id="modify" onclick="msgModify('+ mno +');hideLayer(\'callMessage\');"><span>수정</span></button>'
										+ '<button type="button" class="btn btnType3 btnSizeS" id="delete" onclick="msgDelete('+ mno +');"><span>삭제</span></button>'
										+ '<button type="button" class="btn btnType2 btnSizeS" onclick="hideLayer(\'callMessage\');return false;"><span>닫기</span></button>';
								$("#modifyBtn").html(btn);
								
							} else {
								if (msg.msg_cate == '문의') {
									category = '<div class="selectbox disabled"><button class="title" type="button" title="카테고리 선택">1. 문의</button>';
								} else {
									category = '<div class="selectbox disabled"><button class="title" type="button" title="카테고리 선택">2. 신고</button>';
								}
								$("#call_cate").html(category);

								if (msg.msg_cate == '문의') {
									report = '<div class="inp_text inp_cell">'
											+ '<input type="text" name="userId" id="call_userId" class="readOnly" placeholder="신고하실 회원의 아이디를 입력하세요." readonly /></div>';
								} else {
									report = '<div class="inp_text inp_cell">'
											+ '<input type="text" name="userId" id="call_userId" class="readOnly" value="' + msg.report_user + '" readonly /></div>';
								}
								$("#call_reportId").html(report);

								
								content = '<div class="textbox"><textarea class="readOnly" name="call_context" readonly>' + msg.msg_content + '</textarea></div>';
								$("#call_content").html(content);
								
								
								btn = '<button type="button" class="btn btnType1 btnSizeS disabled" id="btn_modify" disabled><span>수정</span></button>'
										+ '<button type="button" class="btn btnType2 btnSizeS disabled" id="btn_delete" disabled><span>삭제</span></button>'
										+ '<button type="button" class="btn btnType2 btnSizeS" onclick="hideLayer(\'callMessage\');return false;"><span>닫기</span></button>';
								$("#modifyBtn").html(btn);
							}
						} else {
							alert('메시지 상세보기에 실패했습니다.');
						}
					},
			error : function(e) {
						console.log(e);
					}
		});
	}
	
	
	// 메시지 수정
	function msgModify(mno){
		let msg_no = mno;
		let NreportId = $("#modify_Id").val();
		let Ncontent = $("#modify_content").val();
		$.ajax({
			url : "${contextPath}/messenger/modify",
			data : { NreportId : NreportId, Ncontent : Ncontent, msg_no : msg_no },
			type : "post",
			success : function(msg){
				alert('메시지 수정이 완료되었습니다.');
				location.reload();
			},
			error : function(e){
				alert('메시지 수정에 실패하였습니다.');
			}
		});
	}
	
	
	// 메시지 삭제
	function msgDelete(mno){
		let msg_no = mno;
		if(confirm("해당 메시지를 삭제하시겠습니까?")){
			$.ajax({
				url : "${contextPath}/messenger/delete",
				data : { msg_no : msg_no },
				type : "post",
				success : function(msg){
					alert('메시지 삭제가 완료되었습니다.');
					location.reload();
				},
				error : function(e){
					alert('메세지 삭제에 실패하였습니다.');
				}
			});
		} else {
			return false;
		}
	}
	
</script>

<%-- 

    <!-- 보낸 메시지 수정 팝업 화면-->
    <div id="modifyMessage" class="layerPop modifyMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button type="button" class="btn_closeLayer" onclick="hideLayer('modifyMessage');hideLayer('callMessage');"><span class="blind">팝업 닫기</span></button>
        </div>
        <div class="layerBody">
        <form action="${ contextPath }/message/modify" method="post">
            <br>
            <div class="tblType2 noBorder">
                <table>
                    <colgroup>
                        <col style="width:20%;">
                        <!-- <col style="width:*;"> -->
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>보낸 사람</th>
                            <td>
                                ${ loginUser.user_id }
                            </td>
                        </tr>
                        <!-- 메시지 보낼 때 선택했던 값으로 checked -->
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="selectbox">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                       <c:choose>
                                    	<c:when test="${ message.msg_cate eq '문의'}">
                                        <li>
                                            <input type="radio" value="문의" class="option" id="sel2_1" name="modify_cate" checked="checked"/>
                                            <label for="sel2_1">1. 문의</label>
                                        </li>
                                        </c:when>
                                    	<c:otherwise>
                                        <li>
                                            <input type="radio" value="신고" class="option" id="sel2_2" name="modify_cate" checked="checked"/>
                                            <label for="sel2_2">2. 신고</label>
                                        </li>
                                        </c:otherwise>
                                    	</c:choose>
                                    </ul>
                                </div>
                            </td>
                        </tr>                     
                        
                         <!-- 문의로 보냈었던 내용이라 disabled가 default-->
                        <tr id="report_id">
                            <th>피신고인</th>
                            <td>
                            <c:choose>
                            <c:when test="${ message.msg_cate eq '문의'}">
                                <div class="inp_text inp_cell">
                                    <input type="text" name="userId" id="modify_toUser" class="readOnly"  placeholder="신고하실 회원의 아이디를 입력하세요." readonly />
                                </div>
                            </c:when>
                            <c:otherwise>
                            	<div class="inp_text inp_cell">
                                    <input type="text" name="userId" id="modify_toUser" class="readOnly" value="${ message.to_user }" />
                                </div>
                            </c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea id="modify_content">
                                        ${ message.msg_content }
                                    </textarea>
                                    <span class="charCnt"><em>0</em>/200</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap" id="msg_btnWrap">
                <button class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>수정하기</span></button>
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('modifyMessage');hideLayer('callMessage');return false;"><span>닫기</span></button>
            </div>
            </form>
        </div>
    </div> --%>


    <!-- 메신저 글쓰기 팝업 화면 -->
    <div id="writingMessage" class="layerPop writingMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button type="button" class="btn_closeLayer" onclick="hideLayer('writingMessage');"><span class="blind">팝업 닫기</span></button>
        </div>
        <div class="layerBody">
        <form action="${ contextPath }/messenger/write" method="post">
            <br>
            <div class="tblType2 noBorder">
                <table>
                    <colgroup>
                        <col style="width:20%;">
                        <!-- <col style="width:*;"> -->
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>보낸 사람</th>
                            <td>
                                ${ loginUser.user_id }
                            </td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="selectbox">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="문의" class="option" id="sel1_1" name="category" />
                                            <label for="sel1_1">1. 문의</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="신고" class="option" id="sel1_2" name="category" />
                                            <label for="sel1_2">2. 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                      
                        <!-- 카테고리에서 2.신고를 선택한 경우에만 보이게 -->
                        <tr id="report_id">
                            <th>피신고인</th>
                            <td>
                                <div class="inp_text inp_cell">
                                    <input type="text" name="toUser" id="userId" placeholder="신고하실 회원의 아이디를 입력하세요." />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea placeholder="내용을 입력해 주세요" name="msg_content"></textarea>
                                    <span class="charCnt"><em>0</em>/200</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap" id="msg_btnWrap">
                <button class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>보내기</span></button>
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('writingMessage');return false;"><span>닫기</span></button>
            </div>
            </form>
        </div>
    </div>
    
