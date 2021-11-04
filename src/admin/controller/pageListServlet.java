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
 * Servlet implementation class pageListServlet
 */
@WebServlet("/admin/pagelist")
public class pageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		int chkval = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("chkval") != null) {
			chkval = Integer.parseInt(request.getParameter("chkval"));
		}
		
		String searchCondition = request.getParameter("searchCondition");
		String searchCondition2 = request.getParameter("searchCondition2");
		String searchValue = request.getParameter("searchValue");
		
		Map<String, Object> map = new AdminService().selectList(page, chkval, new Search(searchCondition, searchCondition2, searchValue));

		request.setAttribute("listCount", map.get("listCount"));
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("MemberList", map.get("MemberList"));		
		
		//request.getRequestDispatcher("/views/admin/user_management01.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/admin/userMg01");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
