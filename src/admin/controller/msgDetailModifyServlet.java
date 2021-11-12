package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import host.model.vo.Rooms;
import member.model.vo.Member;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class userDetailModifyServlet
 */
@WebServlet("/admin/msgDetailModify")
public class msgDetailModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public msgDetailModifyServlet() {
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
		String mVal = request.getParameter("mVal");
		String cVal = request.getParameter("cVal");
		String firstcVal = request.getParameter("firstcVal");
		
		Messenger msg = new Messenger();
		int result = new AdminService().modifyMsg(msg, mVal, firstcVal, cVal);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/inquireMg");
		}else {
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	
	}

}
