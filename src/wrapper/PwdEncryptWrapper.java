package wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

// HttpServletRequestWrapper를 상속받는 클래스
public class PwdEncryptWrapper extends HttpServletRequestWrapper {

	// HttpServletRequestWrapper를 매개변수로 하는 생성자 작성 필수
	public PwdEncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	// ServletRequestWrapper의 getParameter 메소드 오버라이딩
	/* getParameter는 서블릿에서 요청에 포함된 값을 가져올 때 사용하는 메소드인데 (ex: request.getParameter("userId");) 
	 * EncryptFilter와 연결한 서블릿들은 getParameter를 호출했을 때 여기서 오버라이딩한 메소드를 호출하게 됨
	 * */ 
	@Override
	public String getParameter(String key) {
		String value = "";
		
		if(key != null && (key.equals("userPwd") || key.equals("newPwd1") || key.equals("adUserPwd") || key.equals("checkKey"))) {
			// request 객체에 담긴 파라미터 키 값이 userPwd 또는 newPwd1(비번재설정 서블릿으로 넘긴 요청값)인 경우 암호화
			value = getSha512(super.getParameter(key));
			
		} else {
			// 위의 경우가 아니라면 기존 request값 그대로 사용
			value = super.getParameter(key);
		}
		return value;
	}

	// sha512 해쉬 함수를 통한 처리=> 암호화 로직
	public String getSha512(String userPwd) {
		
		String encPwd = null;
		
		try {
			// sha512 방식의 암호화 객체
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			
			// 요청에서 전달받은 String 타입의 userPwd를 바이트 배열로 변경
			byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
			
			// md 객체에 userPwd 바이트 배열을 전달해서 update 호출
			md.update(bytes);
			
			// md.digest() => 해쉬 함수 처리 된 결과를 byte 배열로 리턴
			// 해당 바이트 배열을 다시 String타입으로 인코딩
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
			// 매개변수로 전달한 알고리즘 명이 틀렸을 경우 예외 발생
			e.printStackTrace();
		}
		
		return encPwd;
	}

}
