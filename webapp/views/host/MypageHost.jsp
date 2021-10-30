<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="side_layout">
			<div class="container">
				<nav class="sub_menu">
                    <ul>
                        <li><a href="#">내정보</a></li>
                        <li><a href="#">1:1 문의</a></li>
                        <li><a href="#">회원탈퇴</a></li>
                    </ul>
                </nav>
                <div class="host_mypage">
                    <div class="hostprofile_wrap">
                        <img src="../resources/images/usericon.png">
                        <h3> 호스트 아이디 </h3>
                        <span>호스트</span>
                    </div>
					<div class="tabType1 al_c hostmainsub">
						<ul>
							<li class="on roomli"><a>숙소</a></li>
							<li class="reviewli"><a>게스트 후기</a></li>
						</ul>
					</div>
					<div class="hostpagetab roomtab">
						<!-- 숙소 리스트 있는 경우 -->
						<!-- <ul>
							<li class="main_roomlist">
								<a href="#"><img src="../resources/images/host/house.png"></a><br>
								<h3>푸른바다 제주펜션</h3>
							</li>
							<li class="main_roomlist">
								<a href="#"><img src="../resources/images/host/house.png"></a><br>
								<h3>협재바다 늘푸른가옥</h3>
							</li>	
						</ul> -->
						
						<!-- 숙소 리스트 없는 경우 -->
						<div class="noData">
							<p>등록된 숙소가 없습니다.</p>
							<a href="${ contextPath }/host/roomenrollbasic" class="subtxt"><u>숙소를 간편하게 바로 등록해보세요!</u></a>
						</div> 
					</div>
					<!-- 게스트 후기 탭 클릭 시 -->
					<div class="hostpagetab reviewtab">
						<div class="tblType1 reviewtab_wrap">
							<table class="reviewtbl">
								<colgroup>
									<col style="width:50px">
									<col style="width:500px">
									<col style="width:100px">
								</colgroup>
								<tbody>
									<tr>
										<td><div class="review_no">1</div></td>
										<!-- 리뷰 내용은 글자 50개 까지 노출 -->
										<td><a href="#"><div class="review_content">사장님이 너무 친절하시고 숙소도 깔끔해요</div></a></td>
										<td><div class="review_writer">jejulove</div></td>
									</tr>
									<tr>
										<td><div class="review_no">2</div></td>
										<td><a href="#"><div class="review_content">제주바다가 창문으로 바로 보여요. 노을이 너무 예뻐요. 인생샷 건졌습니다.
										</div></a></td>
										<td><div class="review_writer">jejugood</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 등록 된 후기 없을 경우 -->
						<!-- <div class="noData">
							<p>등록된 후기가 없습니다.</p>
						</div> -->
						
						<!-- 페이징 -->
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
		</div>
<script>
	// 탭 변경하기 이벤트
    let roomli = document.querySelector(".roomli");
    let reviewli = document.querySelector(".reviewli");
    let roomtab = document.querySelector(".roomtab");
    let reviewtab = document.querySelector(".reviewtab");

    roomli.onclick = editStart;
    reviewli.onclick = editStart;

    function editStart(){
        if(this == roomli){
            reviewtab.replaceWith(roomtab);
            reviewtab.style.display = "none"
            roomtab.style.display = "block"
            
            roomli.classList.toggle("on");
            reviewli.classList.toggle("on");
        } else{
            roomtab.replaceWith(reviewtab);
            roomtab.style.display = "none";
            reviewtab.style.display = "block";
            roomli.classList.toggle("on");
            reviewli.classList.toggle("on");
        }
    }
    
    // 리뷰 내용 글자수가 30자 초과하면 뒷 내용 생략하기
    let reviewcont = document.querySelectorAll(".review_content");
	for(let i = 0; i < reviewcont.length; i++){

		if(reviewcont[i].textContent.length > 30){
			let reviewchange = reviewcont[i].textContent.substring(0, 30) + "..."; 
			reviewcont[i].textContent = reviewchange;
		}
	}
	
</script>

<%@include file="/views/common/footer.jsp" %>




