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
                            <!-- <button type="button" onclick="showLayer('writingMessage');" class="btn btnType1 btnSizeM" id="write"><span>관리자에게 보내기</span></button> -->
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>내용</th>
                                    <th>보낸 회원</th>
                                    <th>받은 날짜</th>
                                    <c:if test="${ loginUser.user_type eq '호스트' }">
                                    <th>답장여부</th>
                                    </c:if>
                                    <th style="width: 90px;">읽음여부</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="msg" items="${ messengerList }">             
                                <tr onclick="showLayer('callMessage'); msgDetail(this);">
                                	<td style="display:none;"><input type="hidden" value="${ msg.msg_no }"></td>
                                	<%-- <td style="display:none;"><input type="hidden" value="${ msg.from_user }"></td> --%>
                                    <td>${ msg.msg_no }</td>
                                    <td class="al_l"><button class="message" id="conMsg"><span class="opt_cate">[${ msg.msg_cate }] </span>${ msg.msg_content }</button></td>
                                    <td>${ msg.from_user }</td>
                                    <c:choose>
                                    <c:when test="${!empty msg.reply_date}"><td><fmt:formatDate value="${ msg.reply_date }" type="both" pattern="yyyy.MM.dd HH:mm:ss"/></td></c:when>
                                    <c:otherwise><td><fmt:formatDate value="${ msg.modify_date }" type="both" pattern="yyyy.MM.dd HH:mm:ss"/></td></c:otherwise>
                                    </c:choose>
                                    <c:if test="${ loginUser.user_type eq '호스트' }"><td>${ msg.reply_status }</td></c:if>
                                    <td>${ msg.chk_status }</td>                                 
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
        
       
                    <div class="paging">
                    <!-- 첫 번째 페이지로 -->
                        <span class="first"><a href="${ contextPath }/messenger/list/received?page=1"></a></span>
                        <span class="prev">
                        	<c:choose>
							<%-- 조건 : 현재 페이지가 1페이지가 아니라면--%>
							<c:when test="${ pi.page > 1 }">
							<%-- 현재 페이지 -1 페이지로 이동되게  --%>
							<a href="${ contextPath }/messenger/list/received?page=${ pi.page - 1}"></a>
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
							<a href="${ contextPath }/messenger/list/received?page=${ p }">${ p }</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
                     
                        <span class="next">
						<!-- 다음 페이지로  -->
							<c:choose>
							<%-- 조건 : 현재 페이지가 마지막 페이지가 아니라면--%>
							<c:when test="${ pi.page < pi.maxPage }">
							<%-- 현재 페이지 +1 페이지로 이동되게  --%>
							<a href="${ contextPath }/messenger/list/received?page=${ pi.page + 1}"></a>
							</c:when>
							<%-- 현재 페이지가 마지막 페이지인 경우 = 페이지 이동 안되게 --%>
							<c:otherwise>
							<a href="#"></a>
							</c:otherwise>
							</c:choose>  
                        </span>
                        <!-- 마지막 페이지로 -->
                        <span class="last"><a href="${ contextPath }/messenger/list/received?page=${ pi.maxPage }"></a></span>
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
						<td id="from_Id"></td>
					</tr>
					<!-- 메시지 보낼 때 선택했던 값으로 checked -->
					<tr>
						<th>카테고리</th>
						<td id="call_cate">
						</td>
					</tr>

					<tr id="report_id">
						<th>피신고인</th>
						<td id="call_reportId">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td id="call_content">
						</td>
					</tr>
					<tr>
						<th>Re.</th>
						<td id="reply_con">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_wrap" id="rBtn">
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
						var Rcontent = '';
						var btn = '';
						var mno = '';
						var from = '';

						if (msg) {
							mno = msg.msg_no;
							from = msg.from_user;
							
							// 받은 메시지가 내가 보낸 메시지의 답변인 경우: 상세 메시지를 읽을 수만 있게 , 읽음 여부 Y
							//or 게스트가 보낸 문의 메시지인 경우(해당 유저가 호스트일 때) : 답장 할 수 있게, 읽음 여부 Y
							if(msg.reply_content != null){
								
								$("#from_Id").html(msg.from_user);
								
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
											+ '<input type="text" name="report_Id" id="report_Id" value="' + msg.report_user + '" /></div>';
								}
								$("#call_reportId").html(report);

						
								content = '<div class="textbox"><textarea class="readOnly" name="re_content" id="re_content" readonly>' + msg.msg_content + '</textarea></div></td></tr>';
								$("#call_content").html(content);
								
								Rcontent = '<div class="textbox"><textarea class="readOnly" name="reply_context" readonly>' + msg.reply_content + '</textarea></div>';
								$("#reply_con").html(Rcontent);
								
								btn = '<button type="button" class="btn btnType2 btnSizeS" onclick="hideLayer(\'callMessage\');return false;"><span>닫기</span></button>';
								$("#rBtn").html(btn);
	
									
							} else {
								
								$("#from_Id").html(msg.from_user);
								
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

								
								content = '<div class="textbox"><textarea class="readOnly" name="re_content" id="re_content" readonly>' + msg.msg_content + '</textarea></div></td></tr>';
								$("#call_content").html(content);
								
								Rcontent = '<div class="textbox"><textarea name="reply_context" id="reply_context"></textarea></div>';
								$("#reply_con").html(Rcontent);
																
								btn = '<button type="button" class="btn btnType1 btnSizeS" id="btn_reply" onclick="msgReply('+ mno +', '+ from +');hideLayer(\'callMessage\');"><span>답장</span></button>'
										+ '<button type="button" class="btn btnType2 btnSizeS" onclick="hideLayer(\'callMessage\');return false;"><span>닫기</span></button>';
								$("#rBtn").html(btn);
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
	
	
	
	// 메시지 답장
	function msgReply(mno, from){
		let msg_no = mno;
		let from_user = from;
		let Rcontent = $("reply_context").val();
		
		$.ajax({
			url : "${contextPath}/messenger/reply",
			data : { Rcontent : Rcontent, msg_no : msg_no, from_user : from_user },
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


 <%--    <!-- 메신저 답장 팝업 화면 -->
    <div id="ReplyMessage" class="layerPop ReplyMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button type="button" class="btn_closeLayer" onclick="hideLayer('ReplyMessage');"><span class="blind">팝업 닫기</span></button>
        </div>
        <div class="layerBody">
        <form action="${ contextPath }/messenger/reply" method="post">
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
                                    <textarea placeholder="내용을 입력해 주세요" name="msg_content">${ messenger.msg_no }</textarea>
                                    <span class="charCnt"><em>0</em>/200</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap" id="msg_btnWrap">
                <button class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>보내기</span></button>
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('ReplyMessage');return false;"><span>닫기</span></button>
            </div>
            </form>
        </div>
    </div>
     --%>
