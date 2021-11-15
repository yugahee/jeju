package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet(name="JoinServlet", urlPatterns="/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 메인에서 회원가입 버튼 눌렀을 때 가입 화면으로 연결
		request.getRequestDispatcher("/views/member/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("userTel");
		String email = request.getParameter("userMail");
		String userType = request.getParameter("userType");
		
		Member member = new Member();
		
		member.setUser_id(userId);
		member.setUser_pwd(userPwd);
		member.setUser_name(userName);
		member.setPhone(phone);
		member.setEmail(email);
		member.setUser_type(userType);
		
		int result = new MemberService().insertMember(member);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "회원가입이 완료되었습니다. 로그인 하신 후 이용해주세요.");
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("message", "회원 가입에 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
