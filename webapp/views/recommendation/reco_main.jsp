<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div class="banner"><!--배너-->
		<a href="${ contextPath }/mbti/mainView"><img src="${ contextPath }/resources/images/ch/banner.jpg"></a>
	</div><!--배너 끝-->
	
	<div class="main">
		<div class="container">
			<div class="sub_upper">
				<form method="get" name="search" action="${ contextPath }/reco/select/category"><!-- form start -->
				<div class="reco_select">		<!-- 셀렉트박스 및 키워드 -->
					<div class='input_box'>
						<div class="selectbox">
							<button class="title" type="button" title="구역 선택" id="btn1">구역을 선택하세요.</button>
							<ul class="selList">
								<li><input type="radio" value="1" class="option" id="east"
									name="recoArea" <c:if test="${ param.recoArea == '1' }">checked="checked"</c:if>> <label for="east">동부</label></li>
								<li><input type="radio" value="2" class="option" id="west"
									name="recoArea" <c:if test="${ param.recoArea == '2' }">checked="checked"</c:if>> <label for="west">서부</label></li>
								<li><input type="radio" value="3" class="option" id="south"
									name="recoArea" <c:if test="${ param.recoArea == '3' }">checked="checked"</c:if>> <label for="south">남부</label></li>
								<li><input type="radio" value="4" class="option" id="north"
									name="recoArea" <c:if test="${ param.recoArea == '4' }">checked="checked"</c:if>> <label for="north">북부</label></li>
							</ul>
						</div>
	
						<div class="selectbox">
							<button class="title" type="button" title="카테고리 선택" id="btn2">카테고리를 선택하세요.</button>
								<%-- <c:if test="${ param.category == null }">카테고리</c:if> --%>
							
							<ul class="selList">
								<li><input type="radio" value="1" class="option" id="tour"
									name="recoCategory" <c:if test="${ param.recoCategory == '1' }">checked="checked"</c:if>>
									<label for="tour">관광지</label></li>
								<li><input type="radio" value="2" class="option" id="restaurant"
									name="recoCategory" <c:if test="${ param.recoCategory == '2' }">checked="checked"</c:if>>
									<label for="restaurant">식당</label></li>
								<li><input type="radio" value="3" class="option" id="cafe"
									name="recoCategory" <c:if test="${ param.recoCategory == '3' }">checked="checked"</c:if>>
									<label for="cafe">카페</label></li>
							</ul>
						</div>
					</div>
	
					<div class='input_box'>
						<div class="sortArea">
							<div class="inp_text search inp_text2">
								<input type="text" name="recoKeyword" id="" placeholder="키워드를 입력하세요" value="${ param.recoKeyword }">
								<button type="submit" class="btn_sch">검색</button>
							</div>
						</div>
					</div>
				</div>
				<div class="list_box">
					<div class="reco_radio">
						<span class="inp_radio <c:if test="${ param.radio1 == null || param.radio1 == '1' }">checked</c:if>"> <input type="radio" name="radio1"
							id="radio1_1" value="1" onclick="submit();"
							<c:if test="${ param.radio1 == '1' }">checked="checked"</c:if>>
							<label for="radio1_1">최신순</label>
						</span>
						<span class="inp_radio <c:if test="${ param.radio1 == '2' }">checked</c:if>"> <input type="radio" name="radio1"
							id="radio1_2" value="2" onclick="submit();"
							<c:if test="${ param.radio1 == '2' }">checked="checked"</c:if>>
							<label for="radio1_2">선호도순</label>
						</span>
						<span class="inp_radio <c:if test="${ param.radio1 == '3' }">checked</c:if>"> <input type="radio" name="radio1"
							id="radio1_3" value="3" onclick="submit();"
							<c:if test="${ param.radio1 == '3' }">checked="checked"</c:if>>
							<label for="radio1_3">별점순</label>
						</span>
					</div>
				</div>
				</form><!-- form end -->
			</div><!-- sub_upper END -->

					<!-- 리스트 출력 영역 시작 -->
					<div class="reco_list">
					<%-- <c:forEach begin="1" end="4"> --%>
					<c:forEach var="reco" items="${ recoList }">
						<div class="reco_item">
							<div class="imageArea" style="background-image: url(${ contextPath }${ reco.recoImage }${ reco.imageName });"	
									onclick="detailView(${ reco.recoNo })">
							</div>
							
							<div class="item_info">
									<a href="#" onclick="detailView(${ reco.recoNo })">		<!-- href는 주소값을 넣어줘야 함. 함수식은 작동 안됨 -->
										<p class="item_title">
										<c:set var="area" value="${ reco.recoArea }" />
										<c:choose>
											<c:when test="${ area eq 1 }">[동부]</c:when>
											<c:when test="${ area eq 2 }">[서부]</c:when>
											<c:when test="${ area eq 3 }">[남부]</c:when>
											<c:when test="${ area eq 4 }">[북부]</c:when>
										</c:choose>
										${ reco.recoName }</p>
									</a>
									<div class="star_average">				<!-- 별점 부분 -->
										<div class="rating_star">
										<c:set var="star" value="${ reco.intScore }" />
										<c:set var="avg" value="${ reco.avgScore }" />
										<c:choose>
											<c:when test="${ star eq 5 }">
												<span class="starPoint p5">5</span>
												<p>  ${ avg } / 5</p>									
											</c:when>
											
											<c:when test="${ star eq 4 }">
												<span class="starPoint p4">4</span>
												<p>${ avg } / 5</p>							
											</c:when>
											
											<c:when test="${ star eq 3 }">
												<span class="starPoint p3">3</span>
												<p>${ avg } / 5</p>						
											</c:when>
											
											<c:when test="${ star eq 2 }">
												<span class="starPoint p2">2</span>	
												<p>${ avg } / 5</p>								
											</c:when>
											
											<c:when test="${ star eq 1 }">
												<span class="starPoint p1">1</span>
												<p>${ avg } / 5</p>					
											</c:when>
											
											<c:when test="${ star eq 0 }">
												<span class="starPoint p0">0</span>
												<p>${ avg } / 5</p>									
											</c:when>
										</c:choose>
										</div>
									</div>
									<p class="adress">${ reco.recoAddress }</p>
									<div class="reco_review">
										<a href="#" class="btn btnType1 btnSizeS" onclick="reviewDetail(${reco.recoNo}); showLayer('reviewPop')">
											<c:if test="${ !empty loginUser }">
											<span class="arr-right" onclick="rNos(${reco.recoNo});">리뷰쓰기</span>
											</c:if>
											<c:if test="${ empty loginUser }">
											<span class="arr-right" onclick="loginPlz();">리뷰쓰기</span>
											</c:if>
										</a>
										<a href="#">
											<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
										</a>
										<p class="count">200</p>
									</div>
								</div>
							
						</div>
					</c:forEach>

					
					<div class="item_info"><!-- href는 주소값을 넣어줘야 함. 함수식은 작동 안됨 -->
						<a href="#" onclick="detailView(${ reco.recoNo })">		
							<p class="item_title">
								<c:set var="area" value="${ reco.recoArea }" />
								<c:choose>
									<c:when test="${ area eq 1 }">[동부]</c:when>
									<c:when test="${ area eq 2 }">[서부]</c:when>
									<c:when test="${ area eq 3 }">[남부]</c:when>
									<c:when test="${ area eq 4 }">[북부]</c:when>
								</c:choose>
								${ reco.recoName }
							</p>
						</a>
						<div class="star_average">				<!-- 별점 부분 -->
							<div class="rating_star">
							<c:set var="star" value="${ reco.intScore }" />
							<c:set var="avg" value="${ reco.avgScore }" />
							<c:choose>
								<c:when test="${ star eq 5 }">
									<span class="starPoint p5">5</span>
									<p>  ${ avg } / 5</p>									
								</c:when>
								
								<c:when test="${ star eq 4 }">
									<span class="starPoint p4">4</span>
									<p>${ avg } / 5</p>							
								</c:when>
								
								<c:when test="${ star eq 3 }">
									<span class="starPoint p3">3</span>
									<p>${ avg } / 5</p>						
								</c:when>
								
								<c:when test="${ star eq 2 }">
									<span class="starPoint p2">2</span>	
									<p>${ avg } / 5</p>								
								</c:when>
								
								<c:when test="${ star eq 1 }">
									<span class="starPoint p1">1</span>
									<p>${ avg } / 5</p>					
								</c:when>
								
								<c:when test="${ star eq 0 }">
									<span class="starPoint p0">0</span>
									<p>${ avg } / 5</p>									
								</c:when>
							</c:choose>
							</div>
						</div>
						<p class="adress">${ reco.recoAddress }</p>
						<div class="reco_review">
							<a href="#" class="btn btnType1 btnSizeS" onclick="reviewDetail(${reco.recoNo}); showLayer('layerPop1')">
								<span class="arr-right">리뷰쓰기</span>
							</a>
							<a href="#">
								<img class="heart" src="${ contextPath }/resources/images/ch/heart_empty.png" />
							</a>
							<p class="count">200</p>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- 리스트 끝 -->
			</div>
			<!-- list_box END -->
		</div>
	</div>
<%@ include file="/views/common/footer.jsp" %>

<div id="reviewPop" class="layerPop">		<!-- 레이어 시작 -->
	<form action="${ contextPath }/reco/insertReview" method="get">
		<div class="layerTit">
			<button type="reset" class="btn_closeLayer" id="recoClose" onclick="hideLayer('reviewPop');"><span class="blind">레이어팝업 닫기</span></button>
			<h4>리뷰 등록</h4>
			
		</div>
		<div class="layerBody">
		<div class="hiddenDiv"></div>
			
			<input type="hidden" name="starScore" id="starScore" value="5" />
			<h2 id="recoH2"></h2>
			<h4>별점을 등록해주세요</h4>


		<div class="rating_star_large" id="moveStar">		<!-- 별점 시작 -->
			<div class="pointArea">
				<span class="pointBg">이 장소는 <em>3</em>점입니다.</span>
				<span class="starPoint p4">
					<button type="button" onclick="starBtn(1)">1점 선택</button>
                   	<button type="button" onclick="starBtn(2)">2점 선택</button>
                   	<button type="button" onclick="starBtn(3)">3점 선택</button>
                   	<button type="button" onclick="starBtn(4)">4점 선택</button>
                   	<button type="button" onclick="starBtn(5)">5점 선택</button>
				</span>
			</div>
		</div>		<!-- 별점 끝 -->
		<div>
			<input type="text" placeholder="50자 내로 입력해주세요" style="width:400px;height:50px;" name="comment">
			<input type="submit">
		</div>
	</div>
</div>		<!-- 레이어 끝 -->
<script>
function rNos(rno){
let html = '<input type="hidden" value="'+rno+'" name="rNo">';
$(".hiddenDiv").html(html);
}

function loginPlz(){
	if(confirm("로그인 후 이용 가능한 서비스입니다. 로그인 하시겠습니까?")){
		location.href ="${contextPath}/login";
	}
}
</script>

<script>
/* 함수 정의 */
function detailView(rno) {
location.href='${ contextPath }/reco/detailView?rno=' + rno;
}

/* submit 함수 */
 function submit() {
	document.search.submit();
}

/* handleClick 함수 */
 
 function starBtn(num){
		let score = num;
		document.getElementById("starScore").value = score;
}

/* 지역, 카테고리 버튼 내부 html 변경 */
function changeBtnName() {
	const area = '${ param.recoArea }';
	const category = '${ param.recoCategory }';
	
	if(area && category){
		console.log('검색 후');
		console.log(area);
		console.log(category);
		
		let recoArea = '';
		let recoCategory = '';
		
		if(area == '1') {
			recoArea = '동부';
		} else if(area == '2') {
			recoArea = '서부';
		} else if(area == '3') {
			recoArea = '남부';
		} else if(area == '4') {
			recoArea = '북부';
		} else {
			recoArea = '구역을 선택하세요.'
		}
		
		if(category == '1') {
			recoCategory = '관광지';
		} else if(category == '2') {
			recoCategory = '식당';
		} else if(category == '3') {
			recoCategory = '카페';
		} else {
			recoCategory = '구역을 선택하세요.'
		}
		
		// 출력용
		console.log(recoArea);
		console.log(recoCategory);
		
		document.getElementById("btn1").innerHTML = recoArea;
		document.getElementById("btn2").innerHTML = recoCategory;
	}
	
}

function reviewDetail(recoNo){
	$.ajax({
		url : "${ contextPath }/reco/recoSelect",
		type : "get",
		dataType : "json",
		data : { rNo : recoNo },
		success : function(data) {
			console.log(data);
			if(data == "success") {
				location.reload();
			}
		},
		error : function(e) {
			console.log(e);
		}
	});
}
</script>