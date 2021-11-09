package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class adminModifyServlet
 */
@WebServlet("/admin/modify")
public class adminModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String adminName = request.getParameter("adminName");
		String newUmail = request.getParameter("newUmail");
		String adminPhone = request.getParameter("adminPhone");
		String newPwd = request.getParameter("newPwd1");
		int result = new AdminService().modifyAdmin(adminName, newUmail, adminPhone, newPwd);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "내 정보 수정이 완료되었습니다. 다시 로그인해주세요!");
			request.getSession().removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		} else {
			request.setAttribute("message", "정보 수정에 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
