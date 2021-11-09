package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class adminLoginServlet
 */
@WebServlet("/admin/login")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adUserId = request.getParameter("userId");
		String adUserPwd = request.getParameter("adUserPwd");
		
		Member loginUser = new MemberService().loginMember(adUserId, adUserPwd);
		if(loginUser != null && loginUser.getUser_type().equals("관리자")) {
			
			request.getSession().setMaxInactiveInterval(6000);			
			request.getSession().setAttribute("loginUser", loginUser);
			
			response.sendRedirect(request.getContextPath() + "/admin");			
		}else {
			request.setAttribute("message", "로그인 오류");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
