/*  ===공통=== */
var main = false;

//스크롤이동
function goTo(to){
	$('html, body').stop().animate({scrollTop : to});
};

$(function(){
	// checkbox 태그
	const remeber = document.querySelector("#remember");
	if(remeber){
		//userId input 태그
		const userId = document.querySelector("#userId");
		// 저장된 쿠키 값 가져오기
		let rememberId = getCookie("rememberId");
		// input 태그에 해당 값 넣기(없을 경우 공백이므로 아무 값도 들어가지 않음)
		userId.value = rememberId;
		// 위의 코드를 통해 input 태그에 값이 들어간 경우 아이디 저장하기 기능 사용 중이므로
		if(userId.value != ""){
			// 아이디 저장하기 체크 박스를 체크한 상태로 만들기
			remember.checked = true;
			remember.closest(".inp_check").classList.add('checked');
		}
		//체크 박스 체크한 상태에서 input 태그에 값 입력할 경우
		userId.addEventListener('keyup', function(){
			// id 저장하기 체크된 상태일 경우
			if(remember.checked){
				setCookie("rememberId", userId.value, 7);
			}
		});
		/* 쿠키 저장 (쿠키 이름, 값, 유효 일자) */
		function setCookie(cookieName, value, exdays){		
		    let exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    let cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());   
		    document.cookie = cookieName + "=" + cookieValue;
		}

		/* 쿠키 삭제 (쿠키 이름) */
		function deleteCookie(cookieName){
			let expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		/* 쿠키 가져오기 (쿠키 이름) */
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    let cookieData = document.cookie;
		    let start = cookieData.indexOf(cookieName);
		    let cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        let end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
	}
	// 쿠키 끝
	
	// 체크박스
	$(document).on('click', '.inp_check label', function (){
		if ($(this).parent().hasClass('readOnly')){return false;}
		if ($(this).parent().hasClass('disabled')){return false;}
		
		var tar = $(this).parent().find('input');
		var chk = tar.prop('checked');
		var grpNm = tar.attr('name');


		if ($(this).parent('.inp_check').hasClass('allChk')){ // 전체동의
			var chkStatus = tar.prop('checked');
			$("input:checkbox[name=" + grpNm + "]").each(function() {
				if (chkStatus) {
					$(this).closest(".inp_check").removeClass("checked");
					$(this).prop("checked",false);
				} else {
					$(this).closest(".inp_check").addClass("checked");
					$(this).prop("checked",true);
				}
			});
		} else {
			if ($(this).parent().hasClass('checked')) {
				$("input:checkbox[name=" + grpNm + "]").each(function() {
					$(this).closest('.inp_check.allChk').removeClass('checked');;
					$(this).closest('.inp_check.allChk input').prop("checked",false);
				});
				$(this).parent().removeClass('checked');				
				if($(this).attr('for') == 'remember'){
					deleteCookie("rememberId");// 쿠키 삭제
				}
				tar.prop("checked",false);
			} else {
				$(this).parent().addClass('checked');				
				if($(this).attr('for') == 'remember'){
					setCookie("rememberId", userId.value, 7);// 쿠키 생성
				}
				tar.prop("checked",true);
			}
		}
		console.log(tar.prop('checked'));
		return false;
	});
	//라디오버튼
	$(document).on('click', '.inp_radio input', function (){
		if ($(this).parent().hasClass('readOnly')){return false;}
		if ($(this).parent().hasClass('disabled')){return false;}
		var grpNm = $(this).attr("name");
		$("input:radio[name=" + grpNm + "]").each(function() {
			$(this).closest(".inp_radio").removeClass("checked");
        	$(this).prop("checked",false);
		});
		$(this).parent().addClass("checked");
        $(this).parent().find("input").prop("checked",true);
	});
	
	//file upload
	$(document).on('click', '.btn_upload .add_file', function (){
		$(this).next('.inp_file').click();
	});
	$(document).on("click", ".addFile_btn .addFile_show", function(e){
		e.preventDefault();
		$(this).parent().find(".addFile_real").trigger("click");
	});

	// 아코디언
	$(document).on('click', '.slideTit > button', function (){
		var slideOpen = $(this).parent().hasClass('open');
		if (slideOpen) {
			$(this).parent().removeClass('open');
			$(this).parent().next('.slideCon').stop().slideUp(200);
		} else {
			$(this).parent().addClass('open');
			$(this).parent().next('.slideCon').stop().slideDown(200);
		}
	});

	//탭메뉴
	$(document).on('click', '.tabMenu a', function(){
		var tar = $(this).attr('href');
		$(this).closest('ul').find('li').removeClass('on');
		$(this).parent().addClass('on');
		$(this).closest('.tabMenu').next('.tabContents').find('.tab_con').hide();
		$(tar).show();
		return false;
	});

	//구매후기 별점부여
	$('.rating_star_large .starPoint button').on('click', function(){
		var point = $(this).index() + 1;
		$('.rating_star_large .pointBg em').text(point);
		$('.rating_star_large .pointBg').css({'left': (point * 20) + '%'});
		$('.rating_star_large .pointBg').attr('point', (point * 20));
	});

	//포토후기
	if ($('#photoUpload').size() >= 1){
		$('#photoUpload .articleArea').sortable({
			items: '.articleItem'
			,helper: 'original'
			,axis: 'y'
			,handle: '.drag_guide'
			,forceHelperSize: true
			,forcePlaceholderSize: true
			,scroll: true
			,scrollSensitivity: 230
			,scrollSpeed: 20
			,activate: function(event, ui){
				ui.helper.css('height', 150).siblings().css('opacity', 0.6);
			}
			,beforeStop: function(event, ui){ 
				ui.helper.css('height', 'auto').siblings().css('opacity', 1);
			}
		});
		$('#photoUpload .articleArea').disableSelection();
	}
	
	//셀렉트바 초기 선택 표기
	$('.selectbox').each(function(){
		var txt_value = $(this).find('.selList input[checked=checked]').next('label').text();
		if (txt_value != '') {
			$(this).find('.selList label').parents('.selectbox').find('.title').text(txt_value);
		}
	});
});

//ul 서치박스
$(function(){
	$(document).on('click', '.selectbox .title', function(){
		if ($(this).parent('.selectbox').hasClass('disabled')) {return false;}
	
		var target = $(this).parent();
	
		if (target.hasClass('open')) {
			$(this).siblings('.selList').stop().animate({'maxHeight' : 0+'px'}, 250, 'easeOutCubic');
			setTimeout(function(){
				target.find('.selList').hide();
				target.removeClass('open');
			},250);			
		} else {
			//$('.selectbox.open .title').click();
			$(this).parent('.selectbox').addClass('open');
			$(this).siblings('.selList').show();
			$(this).siblings('.selList').stop().animate({'maxHeight' : 250+'px'}, 500, 'easeOutCubic');
		};
	});

	$(document).on('click', '.selectbox .selList label', function (){
		
		var txt_value = $(this).text();
		var target = $(this).parents('.selectbox');
		target.find('.title').text(txt_value);
		target.find('.inputVal').val(txt_value);
		target.find('input').removeAttr('checked');
		$(this).prev('input').attr('checked','checked');
		$(this).parents('.selList').stop(true, false).animate({'maxHeight' : 0+'px'}, 250, 'easeOutCubic');
		if(txt_value == '승인반려'){	// 숙소등록 상태값 승인반려일 시
			$('.chatTr').show();
		}else if(txt_value == '승인대기' || txt_value == '등록완료'){
			$('.chatTr').hide();			
		}
		setTimeout(function(){
			target.removeClass('open');
			target.find('.selList').hide();
		},250);
	});

	$(document).on('mouseleave', '.selectbox', function(){
		var _target = $(this);
		_target.find('.selList').stop(true, false).animate({'maxHeight' : 0+'px'}, 250, 'easeOutCubic');
		setTimeout(function(){
			_target.removeClass('open');
			_target.find('.selList').hide();
		},250);
	});
});

//제품수량 up down 버튼
function qtyUp(num){
	if ($(num).parent('.inp_qty').hasClass('readOnly')) {return false;}
	var thisVal = parseInt($(num).parents('.inp_qty').find("input").val());
	intVal = thisVal+1;
	$(num).parents('.inp_qty').find("input").val(intVal);
}
function qtyDown(num){
	if ($(num).parent('.inp_qty').hasClass('readOnly')) {return false;}
	var thisVal = parseInt($(num).parents('.inp_qty').find("input").val());
	if(thisVal > 1){
		value = thisVal-1;
		$(num).parents('.inp_qty').find("input").val(value);
	}
}

/* layer */
var open_pos,
	winH, docH, layerH,
	hasScroll;

function showLayer(e){
	$('.mask').remove();
	$('#'+e).imagesLoaded(function() {
		layerH = $('#'+e).outerHeight();
		docH = layerH + 100;
		winH = $(window).height();
		open_pos = $(window).scrollTop();
		hasScroll = $('#' + e + ':has(.scrollarea)').length;

		if (docH > winH){
			$('body').removeClass('ofH');
			$('#'+e).addClass('layerScale');
			$('html, body').stop().animate({scrollTop : 0});
			$('#wrap').css({'height' : docH, 'overflow' : 'hidden'});
		} else {
			$('#'+e).css({'top' : '50%', 'margin-top' : -layerH/2});
			$('body').addClass('ofH');
		}

		if (hasScroll > 0) {
			$('#' + e).find('.scrollarea').mCustomScrollbar();
		}

		$('#'+e).addClass('on').stop().fadeIn(500);
		$('#wrap').append('<div class="mask"></div>');
	});
}

function resizeLayer(e){
	$('#'+e).imagesLoaded(function() {
		layerH = $('#'+e).outerHeight();
		docH = layerH + 100;
		winH = $(window).height();
		
		if (docH > winH){
			$('#'+e).addClass('layerScale');
			$('html, body').stop().animate({scrollTop : 0});
			$('#wrap').css({'height' : docH, 'overflow' : 'hidden'});
			$('body').removeClass('ofH');
		} else {
			$('#'+e).removeClass('layerScale');
			$('#'+e).css({'top' : '50%', 'margin-top' : -layerH/2});
			$('body').addClass('ofH');
		}

	});
}

function showLayerAlert(msg){
	var options  = {};
	$('.mask').remove();
	$('#layer_alert').imagesLoaded(function() {
		$('#layer_alert').find('.txt').html(msg)
		$('#layer_alert').find('.btnType2.ok').attr('onclick', 'hideLayer("layer_alert");return false;');
		layerH = $('#layer_alert').outerHeight();
		docH = layerH;
		winH = $(window).height();
		open_pos = $(window).scrollTop();

		if (docH > winH){
			$('body').removeClass('ofH');
			$('#layer_alert').addClass('layerScale');
			$('html, body').stop().animate({scrollTop : 0});
			$('#wrap').css({'height' : docH, 'overflow' : 'hidden'});
		} else {
			$('#layer_alert').css({'top' : '50%', 'margin-top' : -layerH/2});
			$('body').addClass('ofH');
		}

		$('#layer_alert').addClass('on').stop().fadeIn(500);
		$('#wrap').append('<div class="mask"></div>');
	});
	return {
        ok: function (fun) {
        	options.ok_callBack = fun;
        	$('#layer_alert').find('.btnType2.ok').unbind('click');
        	$('#layer_alert').find('.btnType2.ok').removeAttr('onclick');
        	$('#layer_alert').find('.btnType2.ok').on('click', function(){
    			options.ok_callBack();
    			hideLayer("layer_alert");
    			return false;
    		});
            return this;
        }
    };
}

function showLayerConfirm(msg){
	var options  = {};
	$('.mask').remove();
	$('#layer_confirm').imagesLoaded(function() {
		$('#layer_confirm').find('.txt').html(msg)
		$('#layer_alert').find('.btnType2.ok').attr('onclick', 'hideLayer("layer_confirm");return false;');
		$('#layer_alert').find('.btnType4.cancel').attr('onclick', 'hideLayer("layer_confirm");return false;');
		layerH = $('#layer_confirm').outerHeight();
		docH = layerH;
		winH = $(window).height();
		open_pos = $(window).scrollTop();
		if (docH > winH){
			$('body').removeClass('ofH');
			$('#layer_confirm').addClass('layerScale');
			$('html, body').stop().animate({scrollTop : 0});
			$('#wrap').css({'height' : docH, 'overflow' : 'hidden'});
		} else {
			$('#layer_confirm').css({'top' : '50%', 'margin-top' : -layerH/2});
			$('body').addClass('ofH');
		}
		$('#layer_confirm').addClass('on').stop().fadeIn(500);
		$('#wrap').append('<div class="mask"></div>');
	});
	
	return {
        ok: function (fun) {
        	options.ok_callBack = fun;
        	$('#layer_confirm').find('.btnType2.ok').unbind('click');
        	$('#layer_confirm').find('.btnType2.ok').removeAttr('onclick');
    		$('#layer_confirm').find('.btnType2.ok').on('click', function(){
    			options.ok_callBack();
    			hideLayer("layer_confirm");
    			return false;
    		});
    		return this;
        },
        cancel: function (fun) {
        	options.cancel_callBack = fun;
        	$('#layer_confirm').find('.btnType4.cancel').unbind('click');
        	$('#layer_confirm').find('.btnType4.cancel').removeAttr('onclick');
        	$('#layer_confirm').find('.btnType4.cancel').on('click', function(){
    			options.cancel_callBack();
    			hideLayer("layer_confirm");
    			return false;
    		});
        	return this;
        }
    };
};

function hideLayer(e){
	$('#'+e).removeClass('on, layerScale').stop().fadeOut(500);
	$('body').removeClass('ofH');
	$('.mask').stop().fadeOut(500);
	$('#wrap').css({'height' : '100%', 'overflow' : 'visible'});
	$('html, body').stop().animate({scrollTop : open_pos}, 50);
	if (hasScroll > 0) {
		$('#' + e).find('.scrollarea').mCustomScrollbar('destroy');
	}
}