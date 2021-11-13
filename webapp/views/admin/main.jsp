<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>제주라도 넘어갈까</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no, address=no, email=no">
	<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.png">
    <script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/resources/js/common.js"></script>    
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.mCustomScrollbar.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/ui.js"></script>
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/admin.css">
    
    <script type="text/javascript" src="${contextPath}/resources/js/admin.js"></script>
    
</head>
<body>	
<% if(session.getAttribute("message") != null) { %>
<script>
	alert('<%= session.getAttribute("message")  %>');
</script>
<% 
	session.removeAttribute("message");
} %>
	<div id="wrap" class="wrap">
		<div class="lnb">
			<h1 class="logo">
				<a href="<%= request.getContextPath() %>/admin">
					<img src="${contextPath}/resources/images/logo.png" alt="logo">
				</a>
				
			</h1>
			<ul class="menuList">
				<li>
					<a href="#none">회원 관리</a>
					<ul class="subMenu">
						<li><a href="<%= request.getContextPath() %>/admin/userMg01">회원 관리</a></li>
						<li><a href="<%= request.getContextPath() %>/admin/userMg02">블랙리스트 관리</a></li>
					</ul>
				</li>
				<li><a href="<%= request.getContextPath() %>/admin/resvMg">예약 관리</a></li>
				<li>
					<a href="#none">후기 관리</a>
					<ul class="subMenu">
						<li><a href="<%= request.getContextPath() %>/admin/revwMg01">숙소 후기 관리</a></li>
						<li><a href="<%= request.getContextPath() %>/admin/revwMg02">추천장소 후기 관리</a></li>
					</ul>
				</li>
				<li><a href="<%= request.getContextPath() %>/admin/inquireMg">문의 관리</a></li>
				<li><a href="<%= request.getContextPath() %>/admin/roomsMg">숙소 관리</a></li>
				<li><a href="<%= request.getContextPath() %>/admin/recPlaceMg">추천장소 관리</a></li>
			</ul>
		</div>

		<div class="conte_wrap">
			<div class="gnb">
				<div class="userArea">										
                    <img src="${contextPath}/resources/images/usericon.png" onclick="userCon()"/>
                    <!-- 관리자일 떄 -->
                    <ul class="userCon" id="adminUserCon" style="display: none">
                        <li><a href="<%= request.getContextPath() %>/admin/account">계정 관리</a></li>
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>
			<div class="content">
				<div id="score">꼬리잡기</div>
        		<div id="plus"></div>
			</div>
			<style>
				.board{
				    background-color: #eee;
				    width:500px;
				    margin:0 auto;
				}
				.board td{
				    height: 10px;
				    width: 10px;
				}
				#score{
				    height: 40px;
				    width: 500px;
				    font-size: 32px;
				    font-weight: bold;
				    text-align: center;
				    background-color: #eee;
				    margin:0 auto;
				}
				#plus{
				    height: 20px;
				    width: 500px;
				    font-size: 16px;
				    font-weight: bold;
				    text-align: center;
				    background-color: #eee;
				    margin:0 auto;
				}
			</style>
			<script>
				var y,x; // player
				var cy,cx; // coin
				var MY=20, MX=50; // field size
				var score;
				var keepMove;
				var direction; // 0 1 2 3 상 하 좌 우
				var speed;
				var snakeQueue = new Array();
				var snakeColor = "#ED5B5B",
				    tileColor = "#EEEEEE"
				    wallColor = "#2E2E2E",
				    coinColor = "#4476C6";
	
				init();
	
				// 키보드 입력 이벤트 처리
				document.onkeydown = keyDownEventHandler;
				function keyDownEventHandler(e){
				    if(e.keyCode==38 && direction!=1) direction = 0; // up
				    else if(e.keyCode==40 && direction!=0) direction = 1; // down
				    else if(e.keyCode==37 && direction!=3) direction = 2; // left
				    else if(e.keyCode==39 && direction!=2) direction = 3; // right
				}
	
				// 초기 설정
				function init(){
				    drawBoard();
				    drawWall();
				    y=parseInt(MY/2);
				    x=parseInt(MX/2);
				    setSnake(y,x);
				    setCoin();
				    score=0;
				    direction=-1;
				    speed=50;
				    keepMove = setInterval("move(direction)",speed);
				}
	
				// 보드판 표시
				function drawBoard(){
				    var boardTag = "<table class='board'>";
				    for(var i=0;i<MY;i++){
				        boardTag += "<tr>";
				        for(var j=0;j<MX;j++)
				            boardTag += "<td id=\""+String(i)+" "+String(j)+"\"></td>";
				        boardTag += "</tr>";
				    }
				    boardTag += "</table>"
				    document.write(boardTag);
				}
	
				// 벽 표시
				function drawWall(){
				    var wallCell = new Array();
				    for(var i=0;i<MY;i++) wallCell.push(new Array(i,0));
				    for(var i=0;i<MY;i++) wallCell.push(new Array(i,MX-1));
				    for(var i=0;i<MX;i++) wallCell.push(new Array(0,i));
				    for(var i=0;i<MX;i++) wallCell.push(new Array(MY-1,i));
				    for(var i=0;i<wallCell.length;i++){
				        var wy = wallCell[i][0];
				        var wx = wallCell[i][1];
				        document.getElementById(String(wy)+" "+String(wx)).style.background = wallColor;
				        document.getElementById(String(wy)+" "+String(wx)).style.borderRadius = "1.5px";
	
				    }
				}
	
				// 뱀 표시
				function setSnake(y,x){
				    snakeQueue.push(new Array(y,x));
				    document.getElementById(String(y)+" "+String(x)).style.background = snakeColor;
				}
				function removeSnake(){
				    var ty = snakeQueue[0][0];
				    var tx = snakeQueue[0][1];
				    snakeQueue.shift();
				    document.getElementById(String(ty)+" "+String(tx)).style.background = tileColor;
				}
	
				// 뱀 조작
				function move(direction){
				    switch(direction){
				        case 0: y-=1; break;
				        case 1: y+=1; break;
				        case 2: x-=1; break;
				        case 3: x+=1; break;
				        default: return;
				    }
				    if(isInvalidMove(y,x)) gameover();
				    setSnake(y,x);
				    meetCoin();
				    scoring();
				}
	
				// 점수 처리 및 표시
				function meetCoin(){
				    if(isCoin()){
				        score+=100*(snakeQueue.length-1);
				        setCoin();
				        showPlus();
				        document.getElementById(String(y)+" "+String(x)).style.borderRadius = "3px";
				    }
				    else{
				        removeSnake(y,x);
				        score+=snakeQueue.length;
				    }
				}
				function showPlus(){
				    var plusedScore=100*(snakeQueue.length-1);
				    document.getElementById("plus").innerHTML = "     +"+plusedScore;
				    setTimeout("document.getElementById(\"plus\").innerHTML=\"\"",500);
				}
	
				// 뱀 충돌 관련 함수
				function isInvalidMove(y,x){
				    return (y==0||y==MY-1||x==0||x==MX-1) || isCollapsed(y,x);
				}
				function isCollapsed(y,x){
				    if(isInQueue(y,x)) return true;
				    return false;
				}
				function isInQueue(y,x){
				    var p = new Array(y,x);
				    for(var i=0;i<snakeQueue.length;i++)
				        if(snakeQueue[i][0]==p[0] && snakeQueue[i][1]==p[1])
				            return true;
				    return false;
				}
	
				// 동전 생성 및 충돌
				function setCoin(){
				    do{
				        var rand = parseInt(Math.random()*((MY-2)*(MX-2)));
				        cy=parseInt(rand/(MX-2))+1;
				        cx=rand%(MX-2)+1;
				    }while(isInQueue(cy,cx))
				    document.getElementById(String(cy)+" "+String(cx)).style.background = coinColor;
				    document.getElementById(String(cy)+" "+String(cx)).style.borderRadius = "6px";
				}
				function isCoin(){
				    return (y==cy && x==cx);
				}
	
				// 점수 반영 및 게임 오버
				function scoring(){
				    document.getElementById("score").innerHTML = score;
				}
				function gameover(){
				    alert("[Game Over]\nScore: "+score);
				    init();
				    location.reload();
				}
			</script>
			
			<!-- //contet -->
		</div>
	</div>
</body>
</html>