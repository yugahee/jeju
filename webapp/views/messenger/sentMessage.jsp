<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/views/common/header.jsp" %>
		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="${ contextPath }/received/messenger">받은 메시지</a></li>
                        <li><a href="${ contextPath }/messenger/list" class="active">보낸 메시지</a></li>
                    </ul>
                </nav>
                <div class="sub messengerList">
                    <h2>보낸 메시지</h2>
                    <div class="tblType3 noBorT noBorB boardList">
                        <table summary="보낸 메시지 목록">
                            <caption>보낸 메시지 목록</caption>
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
                                    <th>받는 회원</th>
                                    <th>작성일</th>
                                    <th>읽음여부</th>
                                    <th>수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="msg" items="${ messengerList }">
                            <c:if test="${ msg.from_user eq loginUser.user_id }">
                                <tr><!-- <tr onclick="detailView(${msg.msg_no})"> -->
                                    <td>${ msg.msg_no }</td>
                                    <td class="al_l"><button class="message" onclick="showLayer('callMessage');"><span class="opt_cate">[${ msg.msg_cate }] </span>${ msg.msg_content }</button></td>
                                    <td>${ msg.to_user }</td>
                                    <td><fmt:formatDate value="${ msg.msg_date }" type="both" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                    <td>${ msg.chk_status }</td>
                                    <c:choose>
                                    <c:when test="${ msg.chk_status eq 'N'}">
                                    <td>
                                        <button type="button" class="btn btnType1 btnSizeS" id="modify" onclick="showLayer('modifyMessage');"><span>수정</span></button>
                                        <button type="button" class="btn btnType2 btnSizeS" id="delete"><span>삭제</span></button>
                                    </td>
                                    </c:when>
                                    <c:when test="${ msg.chk_status eq 'Y'}">
                                    <td>
                                    	<button type="button" class="btn btnType1 btnSizeS disabled" id="btn_modify" disabled><span>수정</span></button>
                                        <button type="button" class="btn btnType2 btnSizeS disabled" id="btn_delete" disabled><span>삭제</span></button>
                                    </td>
                                    </c:when>
                                    </c:choose>
                                </tr>
                            </c:if>
                            </c:forEach>
                               <!--  <tr>
                                    <td>1</td>
                                    <td class="al_l"><a href="#"><span class="opt_cate">[신고]</span>잠수타는 호스트 신고합니다.</a></td>
                                    <td>관리자</td>
                                    <td>2021.10.08</td>
                                    <td>Y</td>
                                    <td>
                                        <button class="btn btnType1 btnSizeS disabled" id="btn_modify" disabled><span>수정</span></button>
                                        <button class="btn btnType2 btnSizeS disabled" id="btn_delete" disabled><span>삭제</span></button>
                                    </td>
                                </tr> -->
                            </tbody>
                        </table>
                    </div>
                    <div class="paging">
                    <!-- 첫 번째 페이지로 -->
                        <span class="first"><a href="${ contextPath }/messenger/list?page=1"></a></span>
                        <span class="prev">
                        	<c:choose>
							<%-- 조건 : 현재 페이지가 1페이지가 아니라면--%>
							<c:when test="${ pi.page > 1 }">
							<%-- 현재 페이지 -1 페이지로 이동되게  --%>
							<a href="${ contextPath }/messenger/list?page=${ pi.page - 1}"></a>
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
							<a href="${ contextPath }/messenger/list?page=${ p }">${ p }</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
                     
                        <span class="next">
						<!-- 다음 페이지로  -->
							<c:choose>
							<%-- 조건 : 현재 페이지가 마지막 페이지가 아니라면--%>
							<c:when test="${ pi.page < pi.maxPage }">
							<%-- 현재 페이지 +1 페이지로 이동되게  --%>
							<a href="${ contextPath }/messenger/list?page=${ pi.page + 1}"></a>
							</c:when>
							<%-- 현재 페이지가 마지막 페이지인 경우 = 페이지 이동 안되게 --%>
							<c:otherwise>
							<a href="#"></a>
							</c:otherwise>
							</c:choose>  
                        </span>
                        <!-- 마지막 페이지로 -->
                        <span class="last"><a href="${ contextPath }/messenger/list?page=${ pi.maxPage }"></a></span>
                    </div>
                </div>
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>
<!-- 보낸 메시지 팝업 화면: 기본적으로 내용 변경 불가하게 모두 disable,readonly 처리 -->
    <div id="callMessage" class="layerPop calldMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button type="button" class="btn_closeLayer" onclick="hideLayer('callMessage');"><span class="blind">팝업 닫기</span></button>
        </div>
        <div class="layerBody">
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
                                <div class="selectbox disabled">
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
                                </div>
                            </td>
                        </tr>                     
                        
                        <tr id="report_id">
                            <th>피신고인</th>
                            <td>
                            <c:choose>
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
                            </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea class="readOnly" name="call_context" readonly>
                                        ${ message.msg_content }
                                    </textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap">
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('callMessage');return false;"><span>닫기</span></button>
            </div>
        </div>
    </div>


    <!-- 보낸 메시지 수정 팝업 화면-->
    <div id="modifyMessage" class="layerPop modifyMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button type="button" class="btn_closeLayer" onclick="hideLayer('modifyMessage');"><span class="blind">팝업 닫기</span></button>
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
            <div class="btn_wrap">
                <button class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>수정하기</span></button>
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('modifyMessage');return false;"><span>닫기</span></button>
            </div>
            </form>
        </div>
    </div>

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
            <div class="btn_wrap">
                <button class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>보내기</span></button>
                <button type="button" class="btn btnType2 btnSizeM" onclick="hideLayer('writingMessage');return false;"><span>닫기</span></button>
            </div>
            </form>
        </div>
    </div>
    
    
    
    
    
<script>
	/* function detailView(msg_no){
			ocation.href='${contextPath}/messenger/detail?msg_no=' + msg_no;
	} */
</script>
		