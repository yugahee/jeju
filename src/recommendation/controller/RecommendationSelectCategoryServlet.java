package recommendation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recommendation.model.service.RecoService;
import recommendation.model.vo.Recommendation;

/**
 * Servlet implementation class RecommendationSelectCategoryServlet
 */
@WebServlet("/reco/select/category")
public class RecommendationSelectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendationSelectCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Recommendation> recoList = null;
		
		
		
		String recoArea = request.getParameter("recoArea");
		String recoCategory =  request.getParameter("recoCategory");
		String recoKeyword = request.getParameter("recoKeyword");
		String radio1 = request.getParameter("radio1");
		
		recoList = new RecoService().selectList(recoArea, recoCategory, recoKeyword, radio1);
		

		request.setAttribute("recoList", recoList);
		
		request.getRequestDispatcher("/views/recommendation/reco_main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
