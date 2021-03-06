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
    <div id="test_result" class="test_big-bg">
        <!-- 사진부 시작 -->
        <div class="test_result-sub wrapper mbti-imgArea">
            <div class="imageArea" style="background-image: url(${ contextPath }/resources/images/mbti/${ mbti.recoImage });">
            </div>
            <div>
                <a href="${ contextPath }/reco/mainView"><img src='${ contextPath }/resources/images/ch/more.png'></a>
            </div>
        </div><!-- 사진부 끝 -->
		<div class="container">
        <div class="test_result-content wrapper">
            <!--내용부 시작 -->
            <div class="result_type">
                <p>나의 여행 유형은</p>
                <p>${ mbti.mbtiType }</p>
                <p>${ mbti.mbtiContent }</p>
            </div>

            <div class="result_place">
                <div class="memo_imageArea" style="background-image: url(${ contextPath }/resources/images/mbti/memo.png);">
                    <p>&lt;나와 어울리는 제주 여행지?&gt;</p>
                    <p>${ mbti.reco }</p>
                    <p>${ mbti.recoContent }</p>
                </div>
            </div>
        </div><!-- 내용부 끝 -->
		</div>
        <div class="test_result-button wrapper mbti-bottom"><!-- 버튼부 시작 -->
            <a href="${ contextPath }/mbti/mainView"><img src='${ contextPath }/resources/images/ch/retry.png'></a>
            <a href='#' onclick="clip(); return false;"><img src='${ contextPath }/resources/images/ch/share.png'></a>
        </div><!-- 버튼부 끝 -->
    </div>
</body>
</html>
<script>

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

</script>