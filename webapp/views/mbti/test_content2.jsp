<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>제주라도 넘어갈까</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection"
	content="telephone=no, address=no, email=no">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.png">
<script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/imagesloaded.pkgd.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/ui.js"></script>
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/css/main.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/css/contents.css">
<script type="text/javascript"
	src="${contextPath}/resources/js/contents.js"></script>

<!-- 구글 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
</head>
<body>
    <div id="test_home" class="test_big-bg wrapper">
        <div class="test_home-content wrapper">
            <div class="status_bar"><div class="bar" style="width:25%;"></div></div>
            <h1 class="test_page-title">여행 후, 거기 어땠냐는<br>친구의 질문에 나는?</h1>
            <div class="test_status">
                <p>2/4</p>
            </div>
            <div class="select-button">
                <a href="${ contextPath }/mbti/test3?test1=${test1}&test2=1" class="btn btnType2 btnSizeL"><span>여행에서 있었던 온갖 에피소드를 줄줄이 얘기해준다.</span></a>
                <a href="${ contextPath }/mbti/test3?test1=${test1}&test2=2" class="btn btnType2 btnSizeL"><span>딱 큰 느낌 정도만 간추려서 얘기해준다.</span></a>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            $(".bar").css('width', '50%');
        });
    </script>
</body>
</html>