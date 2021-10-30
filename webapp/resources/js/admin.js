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