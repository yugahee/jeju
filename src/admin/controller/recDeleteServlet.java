package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import recommendation.model.vo.Recommendation;

/**
 * Servlet implementation class recDeleteServlet
 */
@WebServlet("/admin/recDelete")
public class recDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recDeleteServlet() {
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
		String[] arr = request.getParameterValues("arrVal[]");
		// Recommendation rec = new AdminService().deleteReco(arr);
		
		int result = new AdminService().deleteReco(arr);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "정보가 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/admin/recPlaceMg");
		}else {
			request.setAttribute("message", "정보 삭제 실패");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
		
	}

}
