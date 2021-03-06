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
            <div class="status_bar"><div class="bar" style="width:75%;"></div></div>
            <h1 class="test_page-title">차가 막혀서 계획한 시간보다<br>일정이 늦어졌다면?</h1>
            <div class="test_status">
                <p>4/4</p>
            </div>
            <div class="select-button">
                <a href="${ contextPath }/mbti/resultView?test1=${test1}&test2=${test2}&test3=${test3}&test4=1" class="btn btnType2 btnSizeL"><span>변경된 시간에 맞춰서 일정을 새로 계획한다.</span></a>
                <a href="${ contextPath }/mbti/resultView?test1=${test1}&test2=${test2}&test3=${test3}&test4=2" class="btn btnType2 btnSizeL"><span>늦으면 뭐 어때~ 느긋하게 즐기고 새로운 장소로 간다.</span></a>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            $(".bar").css('width', '100%');
        });
    </script>
</body>
</html>