// 헤더 유저 아이콘
function userCon(){
    let userCon = document.querySelector('.userCon');
    if(userCon.style.display == 'none'){
        userCon.style.display = 'block';
    }else{
        userCon.style.display = 'none';
    }
}

function scrollSet(scrollPo){
	if ($(scrollPo).closest('.terms_page, .privacy_page')){
		$('html, body').animate({'scrollTop' : $(scrollPo).offset().top - 50},200);
	} else {
		$('html, body').animate({'scrollTop' : $(scrollPo).offset().top + 4},200);
	}	
}

$(document).on('click', '.btnTop', function(){
	$('html, body').animate({'scrollTop' : 0},200);
});

$(window).on('load', function(){
	if ($('.product_detail, .mypage').length > 0){
		$('.btnTop').css('bottom','182px')
	}
});

$(window).scroll(function(){
	if ($(this).scrollTop() > 200){
		$('.btnTop').fadeIn();
	} else {
		$('.btnTop').fadeOut();
	}
	return false;
});