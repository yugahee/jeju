package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.service.MemberService;

/**
 * Servlet implementation class MypageMailChangeServlet
 */
@WebServlet(name="pwdReset", urlPatterns="/admin/pwdReset")
public class pwdSendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdSendMailServlet() {

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 입력받은 메일 주소로 인증코드 보내는 서블릿 */
		
		// mail server 설정
		String host = "smtp.gmail.com";			// 메일에서 설정 한 smtp 서버명
		String user = "jejukim00@gmail.com";	// gmail 아이디
		String password = "jejurado@@";			// 비밀번호
		
		String to_email = request.getParameter("email"); 	// 메일 받을 주소
	
		// SMTP 서버 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");	//TLS 버전 정보 맞추기

		
		// 메일로 보낼 인증 코드 생성(랜덤 영문+난수 8자)
		StringBuffer temp = new StringBuffer();
		Random ran = new Random();
		for(int i = 0; i < 8; i++) {
			int rIndex = ran.nextInt(3);
			switch (rIndex) {	//case 0= a~z, 1= A~Z, 2= 0~9
				case 0 : temp.append((char)((int)(ran.nextInt(26)) + 97)); break;
				case 1 : temp.append((char)((int)(ran.nextInt(26)) + 65)); break;
				case 2 : temp.append((ran.nextInt(10))); break;
			}
		}
		
		 Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			 // java.net이 아니라 javax.mail로 임포트! 
			 protected PasswordAuthentication getPasswordAuthentication() {		
				 return new PasswordAuthentication(user, password);  
				 } 
			 });
		 
		 // ajax 결과로 보내줄 출력문 작성을 위해 out 정의해둠
		 PrintWriter out = response.getWriter();
		 try {
			 MimeMessage msg = new MimeMessage(session);
			 // 메일 발신자 이름
			 msg.setFrom(new InternetAddress(user, "제주라도 넘어갈까"));
			 msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			 // 메일 제목
			 msg.setSubject("'제주라도 넘어갈까' 비밀번호 초기화 메일입니다.");
			 // 메일 내용
			 msg.setText("안녕하세요. 제주라도 넘어갈까 관리자입니다.\n 회원님의 임시 비밀번호는 [ " + temp + " ] 입니다. \n 개인정보 보호를 위해 로그인 후 비밀번호를 변경해주세요😊");

			 Transport.send(msg);
		 } catch (Exception e) {
            e.printStackTrace();
		 }

		 String checkKey = getSha512(temp.toString());
		 System.out.println(checkKey);
		 // 인증 코드 문자열로 저장하고
		 int result = new AdminService().pwdReset(checkKey, to_email);
		 	
	}

	private String getSha512(String userPwd) {
		
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


