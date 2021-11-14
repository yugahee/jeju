package recommendation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import recommendation.model.service.RecoService;

/**
 * Servlet implementation class RecommendationReviewInsertServlet
 */
@WebServlet("/reco/insertReview")
public class RecommendationReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendationReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
	         request.getSession().setAttribute("message", "로그인을 해주셔야 리뷰 작성이 가능합니다.");
	         response.sendRedirect(request.getContextPath() + "/login");
	         return;
	      }
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		int recoNo = Integer.parseInt(request.getParameter("rno"));
		int score = Integer.parseInt(request.getParameter("starScore"));
		String sComment = request.getParameter("comment");
		
		int result = new RecoService().insertReview(userId, recoNo, score, sComment);
		System.out.println(result);
		
		if(result > 0) {
			/* 성공 시 "리뷰 등록이 완료되었습니다" alert 후 추천장소 리스트로 */
			request.getSession().setAttribute("message", "리뷰 등록이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/reco/mainView");
		} else {
			/* 실패 시 "리뷰 등록에 실패했습니다" message 설정하여 에러페이지로 */
			request.setAttribute("message", "리뷰 등록에 실패했습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
