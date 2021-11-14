package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.vo.Member;

/**
 * Servlet implementation class userDetailModifyServlet
 */
@WebServlet("/admin/blackDetailModify")
public class blackDetailModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public blackDetailModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String statusVal = request.getParameter("statusVal");
		String idVal = request.getParameter("idVal");
		int rcount = Integer.parseInt(request.getParameter("rcount"));
		
		Member member = new Member();
		System.out.println(rcount);
		int result = new AdminService().modifyMember(member, idVal, statusVal, rcount);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "정보가 수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/admin/userMg02");
		}else {
			request.setAttribute("message", "정보 수정 실패");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
