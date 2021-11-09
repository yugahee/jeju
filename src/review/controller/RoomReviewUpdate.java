package review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.RoomReview;
import review.model.service.ReviewService;

/**
 * Servlet implementation class RoomReviewUpdate
 */
@WebServlet("/roomReviewUpdate")
public class RoomReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewUpdate() {
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
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int star = Integer.parseInt(request.getParameter("starScore"));
		String review = request.getParameter("room_review");
		
		RoomReview roomReview = new RoomReview();
		roomReview.setReviewNo(reviewNo);
		roomReview.setReview(review);
		
		int result = new ReviewService().roomReviewUpdate(roomReview, star);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "리뷰가 성공적으로 수정되었습니다!");
			response.sendRedirect(request.getContextPath() + "/reservation/checkView");
		}else {
			request.setAttribute("message", "리뷰수정이 실패되었습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
