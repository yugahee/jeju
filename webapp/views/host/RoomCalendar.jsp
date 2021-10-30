<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
			<div class="container">
				<!-- 서브 메뉴 바 -->
				<div class="container_roomenroll">
				<h3>숙소설정</h3>
				<br>
				<nav class="sub_menu_roomenroll">
					<a href="#" class="roommenu">
						<span class="menu-left">기본설정</span>
						<span class="menu-right"><img src="../resources/images/host/complete_check.png"></span>
					</a>
					<a href="#" class="roommenu">
						<span class="menu-left">위치/사진/동영상</span>
						<span class="menu-right"><img src="../resources/images/host/incomplete_check.png"></span>
					</a>
					<a href="#" class="roommenu">
						<span class="menu-left">예약/요금 설정</span>
						<span class="menu-right"><img src="../resources/images/host/incomplete_check.png"></span>
					</a>
                </nav>
				<br>
                <a href="#" class="roommenu_cal">
					<span class="menu-left-cal"><img src="../resources/images/common/ico_cal.png"></span>
					<span class="menu-right-cal">달력관리</span>
				</a>
				<br>
				<div class="btn_wrap">
					<a href="#" class="btn btnType1 btnSizeS roomregistbtn"><span>숙소등록</span></a>   
				</div>	
                </div>

				<!-- 등록 내용 화면 -->
				<div class="roomenroll_basic">
                    <form>
                        <table border="1" class="roomenroll_cal">
                            <tr height="50px">
                                <th>일</th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                                <th>토</th>
                            </tr>
                            <tr height="50px">
                                <td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
                            </tr>
							<tr class="cal_status">
                                <td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
                            </tr>
							<tr height="50px">
                                <td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
								<td>13</td>
								<td>14</td>
                            </tr>
							<tr class="cal_status">
                                <td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
                            </tr>
							<tr height="50px">
                                <td>15</td>
								<td>16</td>
								<td>17</td>
								<td>18</td>
								<td>19</td>
								<td>20</td>
								<td>21</td>
                            </tr>
							<tr class="cal_status">
                                <td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
                            </tr>
							<tr height="50px">
                                <td>22</td>
								<td>23</td>
								<td>24</td>
								<td>25</td>
								<td>26</td>
								<td>27</td>
								<td>28</td>
                            </tr>
							<tr class="cal_status">
                                <td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
                            </tr>
							<tr height="50px">
                                <td>29</td>
								<td>30</td>
								<td>31</td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
                            </tr>
							<tr class="cal_status">
                                <td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
								<td>예약가능</td>
                            </tr>

                        </table>
					</form>
                </div>
			</div>
		</div>

        <!-- 레이어 팝업 - 날짜 클릭 시 나타나는 팝업
        showLayer('레이어 아이디명') / hideLayer('레이어 아이디명')
        .layerTit : 제목 부분 / .layerBody : 본문 컨텐츠 부분-->
        <div id="peakSeason" class="layerPop">
            <div class="layerTit">
                <h4>성수기 설정</h4>
                <button class="btn_closeLayer" onclick="hideLayer('peakSeason');"><span class="blind">레이어팝업 닫기</span></button>
            </div>
            <div class="layerBody">
                
            </div>  <!-- 레이어 내용 부분 끝 -->
        </div>

<%@include file="/views/common/footer.jsp" %>