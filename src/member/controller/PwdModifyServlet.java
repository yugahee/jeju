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
 * Servlet implementation class PwdModifyServlet
 */
@WebServlet(name="PwdModifyServlet", urlPatterns="/pwdModify")
public class PwdModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/member/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("pwd_id");
		String userMail = request.getParameter("pwd_mail");
		String newPwd = request.getParameter("newPwd1");
		
		Member updatedMember = new MemberService().updatePwd(userId, userMail, newPwd);
		
		// 로그인되어있는 상태라면 세션에 저장된 loginUser의 정보도 바꾸기
		Object loginUser = request.getSession().getAttribute("loginUser");
		
		if(updatedMember != null) {
			if(loginUser != null) {		// 로그인되어있는 상태라면 세션에 저장된 loginUser의 정보도 바꾸기
				request.getSession().setAttribute("message", "비밀번호가 변경되었습니다.");
				request.getSession().setAttribute("loginUser", updatedMember);
				response.sendRedirect(request.getContextPath());
			} else {
				request.getSession().setAttribute("message", "비밀번호가 변경되었습니다.");
				response.sendRedirect(request.getContextPath());
			}
			
		} else {
			request.getSession().setAttribute("message", "비밀번호 변경에 실패하였습니다.");
			response.sendRedirect(request.getContextPath());
		}
	}

}
