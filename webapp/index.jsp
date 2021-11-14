<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="main">
	<div class="sec01">
	    <div class="container">
	        <div class="simple_search">
	            <form name="simpleRoomSearch" action="${contextPatn}/jeju/room/reservation" method="get">
	            	<div class="inp_box">
	                    <label>위치선택</label>
	                    <div class="selectbox">
	                        <button class="title" type="button" title="위치옵션 선택">위치</button>
	                        <ul class="selList">
	                            <li>
	                                <input type="radio" value="동부" class="option" id="east" name="location" />
	                                <label for="sel1_1">동부</label>
	                            </li>
	                            <li>
	                                <input type="radio" value="서부" class="option" id="west" name="location" />
	                                <label for="sel1_2">서부</label>
	                            </li>
	                            <li>
	                                <input type="radio" value="북부" class="option" id="north" name="location" />
	                                <label for="sel1_3">북부</label>
	                            </li>
	                            <li>
	                                <input type="radio" value="남부" class="option" id="south" name="location">
	                                <label for="sel1_4">남부</label>
	                            </li>
	                            <li>
	                                <input type="radio" value="중부" class="option" id="center" name="location">
	                                <label for="sel1_4">중부</label>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="inp_text">
	                    <label>체크인</label>
	                    <input type="date" name="checkIn" id="checkIn" placeholder="체크인"/>
	                </div>
	                <div class="inp_text">
	                    <label>체크아웃</label>
	                    <input type="date" name="checkOut" id="checkOut" placeholder="체크아웃"/>
	                </div>
	                <button type="submit" class="btn btnType1 btnSizeL"><span>검색</span></button>
	            </form>
	        </div>
	    </div>
	</div><!--sec01 END-->
	<div class="sec02">
	    <div class="container">
	        <h2>추천숙소</h2>
	        <ul class="recommend_list">	        	
	        </ul>
	    </div>
	</div>
</div> 
<%@include file="/views/common/footer.jsp" %>
<script>
	$(window).load(function(){
		$.ajax({
			url : "${contextPath}/ramdomRoom",
			dataType : "json",
			type : "get",
			success : function(rooms){				
				var html = '';
				$.each(rooms, function(i){
					html = '<li><a href="${contextPath}/room/reserve/detail?roomNo='+ rooms[i].roomNo +'">'
						 + '<div class="item_img" style="background-image : url(${contextPath}'+ rooms[i].fileList[0].filePath + rooms[i].fileList[0].changeName +')"></div>'
						 + '<div class="item_info">'
						 + '<p class="item_name"><span class="item_location">'+ rooms[i].location +'</span> '+ rooms[i].roomName +'</p>'
						 + '<p class="item_title">'+ rooms[i].roomTitle +'</p>'
						 + '</div></a></li>';
						 
					$(".recommend_list").append(html);
				});
				
			},
			error : function(e){
				console.log(e);
			}
		});
		
	});
	
	
	function simpleSearch(){
		
	}
</script>