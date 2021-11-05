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
                   <button>1점 선택</button>
                   <button>2점 선택</button>
                   <button>3점 선택</button>
                   <button>4점 선택</button>
                   <button>5점 선택</button>
               </span>
           </div>
       </div>
       <form>                    
           <div class="textbox">
               <textarea name="room_review" id="room_review" placeholder="숙소 후기 내용을 입력해 주세요"></textarea>
               <span class="charCnt"><em>0</em>/200</span>
           </div>
           <div class="btnWrap"><button href="#" class="btn btnType1 btnSizeL"><span>작성완료</span></button></div>
       </form>
   	</div>
</div>
<%@ include file="/views/common/footer.jsp" %>