<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
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
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<body>	
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
                        <li><a href="<%= request.getContextPath() %>/admin/password">비밀번호 관리</a></li>
                        <li><a href="<%= request.getContextPath() %>/admin/logout">로그아웃</a></li>
                    </ul>
				</div>
			</div>
			<div class="content">
                <div class="adinfoForm">
                <form action="${contextPath}/admin/modify" method="post" onsubmit="return chkAdmin();">
                    <div class="listTit al_c">계정 관리</div>
                    <dl>
                        <dt>이름</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="adminName" id="adminName" value="<%= loginUser.getUser_name() %>"/>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>이메일</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="userEmail" id="" class="readOnly" readonly value="<%= loginUser.getEmail() %>" />
                            </div>
                            <a href="#none" onclick="showEmail();" class="btn btnType1 btnSizeS"><span>재설정</span></a>
                        </dd>
                    </dl>
                    <dl class="modifyArea1">
                        <dt>변경할 이메일</dt>
                        <dd>
                            <div class="inp_text inp_cell" id="userNMail">
                                <input type="email" name="newUmail" id="userNmail"/>
                            </div>
							<button type="button" class="btnEmail btn btnType1 btnSizeS" id="sendEmail"><span>인증 메일 전송</span></button>
                        </dd>
                        <dt>인증 코드</dt>
                        <dd>
                            <div class="inp_text inp_cell" id="mailConfirm">
                                <input type="text" name="numberConfirm" id="numberConfirm"/>
                            </div>
							<button type="button" class="btn btnType1 btnSizeS btnNumber disabled" id="numberChk" disabled><span>인증 코드 확인</span></button>
                        </dd>
                    </dl>
                    <dl>
                        <dt>아이디</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="adminId" id="adminId" class="readOnly" readonly value="<%= loginUser.getUser_id() %>" />
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>전화번호</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="text" name="adminPhone" id="adminPhone" value="<%= loginUser.getPhone() %>"/>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="password" name="" id="" class="readOnly" readonly value="<%= loginUser.getUser_pwd() %>" />
                            </div>
                            <a href="#none" onclick="showPwd();" class="btn btnType1 btnSizeS"><span>재설정</span></a>
                        </dd>
                    </dl>
                    <dl class="modifyArea2">
                        <dt>변경할 비밀번호</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="password" name="newPwd1" id="newPwd1" />
                            </div>
                        </dd>
                        <dt>비밀번호 확인</dt>
                        <dd>
                            <div class="inp_text">
                                <input type="password" name="newPwd2" id="newPwd2" />
                            </div>
                            <p class="error" id="error"></p>
                        </dd>
                    </dl>
                    <div class="btn_wrap al_c">
                        <button type="submit" class="btn btnType1 btnSizeM" id="save"><span>저장</span></button>
                        <a href="${contextPath }/admin" class="btn btnType2 btnSizeM"><span>취소</span></a>
                    </div>
                </form>
                </div>
			</div>
			<!-- //contet -->
		</div>
	</div>
	<script>
	function showEmail(){
		if($('.modifyArea1').css('display') == 'block'){
			$('#save').attr('disabled', false);
			$('#save').removeClass('disabled');
		}else{
			$('#save').attr('disabled', true);
			$('#save').addClass('disabled');
		}
		$('.modifyArea1').stop().slideToggle();
	}
	function showPwd(){
		$('.modifyArea2').stop().slideToggle();
	}
	
	function check(regExp, input, msg){
	    if(regExp.test(input.value)) return true;
	    alert(msg);
	    input.value = '';  // 값 비우고
	    input.focus();  // 포커스 들어가게
	    return false;
	}
	function chkAdmin(){
		let name = document.getElementById('adminName');
		let phone = document.getElementById('adminPhone');
		let pwd1 = document.getElementById('newPwd1');
		let pwd2 = document.getElementById('newPwd2');
		
	    if(!check(/^[가-힣]{2,15}$/, name, "이름은 한글로 2~15자 이내만 허용됩니다.")){
	        return false;
	    }

	    if(!check(/^[0-9]{10,11}$/, phone, "전화번호는 숫자로 10~11자 이내만 허용됩니다.")){
	        return false;
	    }
	    
		if(pwd1.value != ''){
		    if(!check(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,30}/, pwd1, 
		    "비밀번호는 영문 대소문자, 숫자, 특수문자를 하나 이상 포함하여 8~30자 이내만 허용됩니다.")){
		        return false;
		    }
			
		    if(pwd1.value != pwd2.value){
		        pwd2.className = "error";
		        error.innerHTML = "비밀번호가 일치하지 않습니다.";
		        pwd2.value = '';  // 값 비우고
		        pwd2.focus();  // 포커스 들어가게
		        return false;
		    }
		}
	}
	// 인증 메일 전송 버튼 ajax
	$("#sendEmail").on('click',function(){
		var newMail = $("[name=newUmail]");		
		// 새로 등록할 이메일도 기존 가입 시 적은 이메일 정규식과 같게 적용
		var regExp = (/^[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*@[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*\.[a-zA-Z]{2,3}$/i);				
		
		if(!newMail || newMail.val().match(regExp) == null){
			alert("올바른 이메일 형식이 아닙니다.");
			newMail.focus();
		} else {
			$.ajax({
				url : "${contextPath}/mypage/mailChange",
				type : "post",
				data : { newMail : newMail.val() },
				success : function(result){
						if(result == "success"){
						alert("인증 메일을 발송하였습니다. 인증 코드를 입력해주세요.");	
						$('#numberChk').attr('disabled', false);
						$('#numberChk').removeClass('disabled');
					} else {
						alert("인증 메일 발송에 실패했습니다. 다시 한 번 시도해주세요.");
					}
				},
				error : function(e){
					console.log(e);
				}
			});		
		}	
	});	
		
	// 인증 코드 확인 버튼 ajax
	$("#numberChk").click(function(){
		var numChk = $("[name=numberConfirm]");		
		// 최종 저장 submit버튼이 가능하게 하기 위한 확인용 변수
		var mailConfirm = false;	
		$.ajax({
			url : "${contextPath}/mypage/checkNumber",
			type : "post",
			data : { numChk : numChk.val() },			
			success : function(result){
				if(result != "fail"){
					alert("인증 코드 확인에 성공했습니다.");
					mailConfirm = true;
				} else {
					alert("인증 코드 확인에 실패했습니다.");
					mailConfirm = false;
					numChk.focus();
				}				
				// 메일 인증 확인이 완료된 경우  저장하기 disabled 속성을 없애고
				if(mailConfirm){
					$("#save").removeAttr("disabled");
					// 클래스명에서 disabled도 지워짐
					document.getElementById("save").className = "btn btnType1 btnSizeM";
				} else {
					$("#save").attr("disabled", true);
					document.getElementById("save").className = "btn btnType1 btnSizeM disabled";
				}	
			},
			error : function (e){
				console.log(e);
			
			}
		});
	});
	</script>
</body>
</html>