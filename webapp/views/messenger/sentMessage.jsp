<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
		<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="#">받은 메시지</a></li>
                        <li><a href="#" class="active">보낸 메시지</a></li>
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
                            <button onclick="showLayer('writingMessage');" class="btn btnType1 btnSizeM" id="write">
                            <span>관리자에게 보내기</span></button>
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
                                <tr>
                                    <td>2</td>
                                    <td class="al_l"><button class="message" onclick="showLayer('callMessage');"><span class="opt_cate">[문의]</span>그린하우스 201호 반려동물..</button></td>
                                    <td>host01</td>
                                    <td>2021.10.15</td>
                                    <td>N</td>
                                    <td>
                                        <button class="btn btnType1 btnSizeS" id="modify" onclick="showLayer('modifyMessage');"><span>수정</span></button>
                                        <button class="btn btnType2 btnSizeS" id="delete"><span>삭제</span></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td class="al_l"><a href="#"><span class="opt_cate">[신고]</span>잠수타는 호스트 신고합니다.</a></td>
                                    <td>관리자</td>
                                    <td>2021.10.08</td>
                                    <td>Y</td>
                                    <td>
                                        <button class="btn btnType1 btnSizeS disabled" id="btn_modify" disabled><span>수정</span></button>
                                        <button class="btn btnType2 btnSizeS disabled" id="btn_delete" disabled><span>삭제</span></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="paging">
                        <span class="first"><a href="#"><span class="blind">첫페이지</span></a></span>
                        <span class="prev"><a href="#"><span class="blind">이전페이지</span></a></span>
                        <span class="current">1</span>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <span class="next"><a href="#"><span class="blind">다음페이지</span></a></span>
                        <span class="last"><a href="#"><span class="blind">마지막페이지</span></a></span>
                    </div>
                </div>
			</div>
		</div>
<%@ include file="/views/common/footer.jsp" %>
<!-- 보낸 메시지 팝업 화면: 기본적으로 내용 변경 불가하게 모두 disable,readonly 처리 -->
    <div id="callMessage" class="layerPop calldMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button class="btn_closeLayer" onclick="hideLayer('callMessage');"><span class="blind">팝업 닫기</span></button>
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
                                userId
                            </td>
                        </tr>
                        <!-- 메시지 보낼 때 선택했던 값으로 checked -->
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="selectbox disabled">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_1" name="select1" checked="checked"/>
                                            <label for="sel2_1">1. 문의</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_2" name="select1" />
                                            <label for="sel2_2">2. 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        
                        <tr id="report_type">
                            <th>신고유형</th>
                            <td>
                                <div class="selectbox disabled">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_1" name="select1" />
                                            <label for="sel2_1">01. 게스트 신고</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_2" name="select1" />
                                            <label for="sel2_2">02. 호스트 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        
                        <tr id="report_id">
                            <th>피신고인</th>
                            <td>
                                <div class="inp_text inp_cell">
                                    <input type="text" name="userId" id="userId" class="readOnly"  placeholder="신고하실 회원의 아이디를 입력하세요." readonly />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea class="readOnly" readonly>
                                        그린하우스 201호 반려동물 동반 가능한가요? 마당이 넓어서 같이 뛰어다니며 놀고싶어서요
                                    </textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap">
                <button class="btn btnType2 btnSizeM" onclick="hideLayer('callMessage');return false;"><span>닫기</span></button>
            </div>
        </div>
    </div>


    <!-- 보낸 메시지 수정 팝업 화면-->
    <div id="modifyMessage" class="layerPop modifyMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button class="btn_closeLayer" onclick="hideLayer('modifyMessage');"><span class="blind">팝업 닫기</span></button>
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
                                userId
                            </td>
                        </tr>
                        <!-- 메시지 보낼 때 선택했던 값으로 checked -->
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="selectbox">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="" class="option" id="sel1_1" name="select1" checked="checked"/>
                                            <label for="sel1_1">1. 문의</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_2" name="select1" />
                                            <label for="sel1_2">2. 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        
                        <!-- 문의로 보냈었던 내용이라 disabled가 default-->
                        <tr id="report_type">
                            <th>신고유형</th>
                            <td>
                                <div class="selectbox disabled">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_1" name="select1" />
                                            <label for="sel2_1">01. 게스트 신고</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="" class="option" id="sel2_2" name="select1" />
                                            <label for="sel2_2">02. 호스트 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        
                         <!-- 문의로 보냈었던 내용이라 disabled가 default-->
                        <tr id="report_id">
                            <th>피신고인</th>
                            <td>
                                <div class="inp_text inp_cell">
                                    <input type="text" name="userId" id="userId" class="readOnly"  placeholder="신고하실 회원의 아이디를 입력하세요." readonly />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea>
                                        그린하우스 201호 반려동물 동반 가능한가요? 마당이 넓어서 같이 뛰어다니며 놀고싶어서요
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
                <button class="btn btnType2 btnSizeM" onclick="hideLayer('modifyMessage');return false;"><span>닫기</span></button>
            </div>
        </div>
    </div>

    <!-- 메신저 글쓰기 팝업 화면 -->
    <div id="writingMessage" class="layerPop writingMessage">
        <div class="layerTit">
            <h4>messenger</h4>
            <button class="btn_closeLayer" onclick="hideLayer('writingMessage');"><span class="blind">팝업 닫기</span></button>
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
                                userId
                            </td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="selectbox">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="" class="option" id="sel1_1" name="select1" />
                                            <label for="sel1_1">1. 문의</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="" class="option" id="sel1_2" name="select1" />
                                            <label for="sel1_2">2. 신고</label>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <!-- 카테고리에서 2.신고를 선택한 경우에만 보이게-->
                        <tr id="report_type">
                            <th>신고유형</th>
                            <td>
                                <div class="selectbox">
                                    <button class="title" type="button" title="카테고리 선택">카테고리를 선택하세요</button>
                                    <ul class="selList">
                                        <li>
                                            <input type="radio" value="" class="option" id="sel1_1" name="select1" />
                                            <label for="sel1_1">01. 게스트 신고</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="" class="option" id="sel1_2" name="select1" />
                                            <label for="sel1_2">02. 호스트 신고</label>
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
                                    <input type="text" name="userId" id="userId" placeholder="신고하실 회원의 아이디를 입력하세요." />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <div class="textbox">
                                    <textarea placeholder="내용을 입력해 주세요"></textarea>
                                    <span class="charCnt"><em>0</em>/200</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap">
                <button class="btn btnType1 btnSizeM" name="btn_messenger" id="btn_messenger"><span>보내기</span></button>
                <button class="btn btnType2 btnSizeM" onclick="hideLayer('writingMessage');return false;"><span>닫기</span></button>
            </div>
        </div>
    </div>