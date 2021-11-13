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
		
		if(request.getParameter("recoArea") != null && request.getParameter("recoCategory") != null) {		// 지역과 카테고리 모두 설정된 경우
			int recoArea = Integer.parseInt(request.getParameter("recoArea"));
			int recoCategory = Integer.parseInt(request.getParameter("recoCategory"));
			//int radio1 = Integer.parseInt(request.getParameter("radio1"));
			recoList = new RecoService().selectList(recoArea, recoCategory);			
		} else {		// 지역과 카테고리 모두 설정되지 않은 경우
			recoList = new RecoService().selectList();
		}
		
		request.setAttribute("recoList", recoList);
		
		System.out.println(recoList);
		
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
