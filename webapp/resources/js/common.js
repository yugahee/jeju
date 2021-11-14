// 헤더 유저 아이콘
function userCon(){
    let userCon = document.querySelector('.userCon');
    if(userCon.style.display == 'none'){
        userCon.style.display = 'block';
    }else{
        userCon.style.display = 'none';
    }
}

// 스크롤 탑
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