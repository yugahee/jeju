$(document).on('click', '.lnb .menuList > li > a', function(){
    $('.lnb .menuList > li > a').removeClass('active');
    if($(this).siblings().hasClass('subMenu')){
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $(this).next('.subMenu').stop().slideUp(200);
        } else {
            $(this).addClass('active');
            $(this).next('.subMenu').stop().slideDown(200);
        }
		return false;
    }else{
        $('.subMenu').stop().slideUp(200);
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        } else {
            $(this).addClass('active');
        }
    }
});
$(document).on('click', '.subMenu li a', function(){
	$('.subMenu li a').removeClass('active');
	$(this).addClass('active');
});

/**
POPUP
**/
var pop = new Array(), popObj, popReady = true;
var pop_idx = -1;

function showPop(e) {
	if (popReady){
		popReady = false;
		pop.push(e);
		pop_idx++;
		popObj = $('#' + pop[pop_idx]);
		if (pop_idx > 0) {
			popObj.css('z-index', + (7000 + pop_idx));
		}
		$('html').css({'overflow-y' : 'hidden'});
		popObj.fadeIn(300, function(){
			popObj.addClass('open');
			popReady = true;
		});
	}
}

function showPopClose(){
	if (popReady){
		popReady = false;
		pop.pop();
		pop_idx = pop_idx - 1;
		if (pop_idx < 0) {
			$('html').css({ 'overflow-y':'' });
		}
		popObj.fadeOut(300, function(){
			popObj.removeClass('open').css('z-index','');
			popObj = $('#' + pop[pop_idx]);
			popReady = true;
			//console.log('show idx : ' + pop_idx);
		})
	}
};

$(document).on('click', '.popInPop', function() {
	if ($(this).hasClass('open')){
		closePopInPop();
	}
});
$(document).on('click', '.lyPopArea', function(){
	if ($(this).hasClass('open')){
		showPopClose();
	}
});
$(document).on('click', '.lyPopArea .lyPop, .popInPop .lyPop', function(e){
	e.stopPropagation();
});

var popObj2;
function openPopInPop(e) {
	popObj2 = $('#' + e);
	popObj2.fadeIn(300, function(){
		popObj2.addClass('open');
	});
}
function closePopInPop(){
	popObj2.fadeOut(300).removeClass('open');
}

/* 꼬리잡기 복붙 */
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
    document.getElementById('board').innerHTML = boardTag;
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