<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="rooms_review">
<div class="container">
       <h2>숙소리뷰</h2>
       <p>숙소에서 편안한 하루 보내셨나요?</p>
       <p>숙소가 어떠셨는지 별점과 후기를 남겨주세요!</p>
       <div class="rating_star_large">
       <div class="pointArea">
               <span class="pointBg">이 제품은 <em>5</em>점입니다.</span>
               <span class="starPoint p2">
                   <button onclick="starBtn(1)">1점 선택</button>
                   <button onclick="starBtn(2)">2점 선택</button>
                   <button onclick="starBtn(3)">3점 선택</button>
                   <button onclick="starBtn(4)">4점 선택</button>
                   <button onclick="starBtn(5)">5점 선택</button>
               </span>
           </div>
       </div>
       <form method="post" name="reviewForm">        
       	   <input type="hidden" name="reserveNo" id="reserveNo" value="${reserveNo}" />
       	   <input type="hidden" name="roomNo" id="roomNo" value="${roomNo}" />            
           <input type="hidden" name="starScore" id="starScore" value="5" />
           <div class="textbox">
               <textarea class="chatArea" name="room_review" id="room_review" placeholder="숙소 후기 내용을 입력해 주세요"></textarea>
               <span class="charCnt"><em class="update">0</em>/200</span>
           </div>
           <div class="btnWrap"><button type="button" class="btn btnType1 btnSizeL" onclick="formChk()"><span>작성완료</span></button></div>
       </form>
   	</div>
</div>
<script>
	$(function(){
	  // textarea 글자 수
       let content = document.querySelector(".chatArea");
        content.onkeyup = function(){
            let area1 = document.querySelector(".update ");
            let val = content.value.length;
            area1.innerHTML = val;
              if(val > 200){
                 area1.style.color = 'red';
              }else{
                 area1.style.color = '#222';
              }
        };	
	});

	function starBtn(num){
		let score = num;
		document.getElementById("starScore").value = score;
	}
	
	function formChk(){
		let review = document.getElementById("room_review").value;		
		
		if(review == "" || review.length > 200){
			alert("리뷰는 1자 이상 200자 이하로 작성해주셔야 합니다.");
			return false;
		}else{
			formSubmit();			
		}
		
	}
	
	function formSubmit(){
		document.forms.reviewForm.action = "${contextPath}/roomReviewInsert";
		document.forms.reviewForm.submit();
	}
</script>
<%@ include file="/views/common/footer.jsp" %>