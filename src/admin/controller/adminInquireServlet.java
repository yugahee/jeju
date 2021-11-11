package admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Search;

/**
 * Servlet implementation class adminMainServlet
 */
@WebServlet("/admin/inquireMg")
public class adminInquireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminInquireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		String searchCondition = request.getParameter("searchCondition");
		String searchCondition2 = request.getParameter("searchCondition2");
		String searchValue = request.getParameter("searchValue");
		
		Map<String, Object> map = new AdminService().selectMsgList(page,new Search(searchCondition, searchCondition2, searchValue));

		request.setAttribute("listCount", map.get("listCount"));
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("msgList", map.get("msgList"));
		
		request.getRequestDispatcher("/views/admin/inquire_management.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
