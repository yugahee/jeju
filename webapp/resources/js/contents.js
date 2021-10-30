
/* 효은님 */
/* join */
let count = 0; // 클릭 할 때마다 바뀌게

function gest(){
    count++;
    
    if(count % 2 == 1) {
        document.getElementById('gestGray').style.content = "url(/semiProject/resources/images/join/user_orange.png)"
        document.getElementById('memberG').style.color = "#ff8b33";
    }
    else {
        document.getElementById('gestGray').style.content = "url(/semiProject/resources/images/join/user_gray.png)"
        document.getElementById('memberG').style.color = "gray";
    }

}

function host(){
    count++;

    if(count % 2 == 1) {
        document.getElementById('hostGray').style.content = "url(/semiProject/resources/images/join/home_orange.png)";
        document.getElementById('memberH').style.color = "#ff8b33";
    }
    else {
        document.getElementById('hostGray').style.content = "url(/semiProject/resources/images/join/home_gray.png)";
        document.getElementById('memberH').style.color = "gray";
    }

}

// 입력 값 정규식
function check(regExp, input, msg){
    // 정규 표현식을 만족할 경우 true 리턴
    if(regExp.test(input.value)) return true;
    // 정규 표현식 불만족할 경우 false 리턴 
    // => 이 alert창을 showLayerAlert 형식으로 띄울 수 있을까? or 다른 애들도 비번 확인처럼 error표시로 바꿀지
    alert(msg);
    input.value = '';  // 값 비우고
    input.focus();  // 포커스 들어가게
    return false;

}

function join(){
    let name = document.getElementById('userName');
    let mail = document.getElementById('userEmail');
    let phone = document.getElementById('userTel');
    let id = document.getElementById('userId');
    let pwd = document.getElementById('userPwd');
    let pwd2 = document.getElementById('userPwd2');
    let error = document.getElementById('error');
    

    if(!check(/^[가-힣]{2,15}$/, name, "이름은 한글로 2~15자 이내만 허용됩니다.")){
        return false;
    }

    if(!check(/^[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*@[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*\.[a-zA-Z]{2,3}$/i, mail, "올바른 이메일 형식이 아닙니다.")){
        return false;
    }

    if(!check(/^[0-9]{10,11}$/, phone, "전화번호는 숫자로 10~11자 이내만 허용됩니다.")){
        return false;
    }

    if(!check(/^[a-zA-Z0-9]{5,20}$/, id, "아이디는 영문과 숫자로 5~20자 이내만 허용됩니다.")){
        return false;
    }

    if(!check(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,30}/, pwd, 
    "비밀번호는 영문 대소문자, 숫자, 특수문자를 하나 이상 포함하여 8~30자 이내만 허용됩니다.")){
        return false;
    }
        
    if(pwd.value != pwd2.value){
        pwd2.className = "error";
        error.innerHTML = "비밀번호가 일치하지 않습니다.";
        pwd2.value = '';  // 값 비우고
        pwd2.focus();  // 포커스 들어가게
        return false;
    }

}
/* login */
//function login() {
//    let id = document.getElementById('userId');
//    let pwd = document.getElementById('userPwd');
//
//    if(id.value != null || pwd.value != null){
//        return false;
//    } else {
//    	return true;   
//    }
//
//}

function findResult(){
    let name = document.getElementById('id_name').value;
    let mail = document.getElementById('id_mail').value;
    let result = document.getElementById('result');

    if(name == '김제주' && mail == 'com'){
        result.innerHTML = "김제주님의 아이디는 user01 입니다.";
    }
}
/* newPwd */
// 입력 값 정규식
function check(regExp, input, msg){
    // 정규 표현식을 만족할 경우 true 리턴
    if(regExp.test(input.value)) return true;
    // 정규 표현식 불만족할 경우 false 리턴 
    alert(msg);
    input.value = '';  // 값 비우고
    input.focus();  // 포커스 들어가게
    return false;

}

function newPwd(){
    let pwd1 = document.getElementById('newPwd1');
    let pwd2 = document.getElementById('newPwd2');
    let error = document.getElementById('error');

    if(!check(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,30}/, pwd1, 
    "비밀번호는 영문 대소문자, 숫자, 특수문자를 하나 이상 포함하여 8~30자 이내만 허용됩니다.")){
        return false;
    }

    if(pwd1.value != pwd2.value) {
        pwd2.className = "error";
        error.innerHTML = "비밀번호가 일치하지 않습니다.";
        pwd2.value = '';  // 값 비우고
        pwd2.focus();  // 포커스 들어가게

        return false;
    }
}

/* delete */
// 체크 박스 눌리면 탈퇴 버튼 활성화 되게 
// => 버튼 클래스 이름 바꿔주고 disabled=false;


$(document).ready(function(){
    /* 가희님 */
    /* 결제 포인트 */
    $('#pointChk').click(function(){
        if($(this).prop("checked",true)){
            alert('dd');
        }
    });
    /* 지희님 */
    /* 하트 체크 */
    $(function(){
        $('.heart').click(function(){
            if($(this).attr('src') == '/semiProject/resources/images/ch/heart_empty.png'){
                $(this).attr('src', '/semiProject/resources/images/ch/heart.png');
            }else{
                $(this).attr('src', '/semiProject/resources/images/ch/heart_empty.png');
            }
        });
    });
});