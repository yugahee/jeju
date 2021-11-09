package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.RoomReview;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import review.model.service.ReviewService;


/**
 * Servlet implementation class RoomReviewInsert
 */
@WebServlet("/roomReviewInsert")
public class RoomReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewInsert() {
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
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id(); 
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		int starScore = Integer.parseInt(request.getParameter("starScore"));
		String reviewContent = request.getParameter("room_review");
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
				
		RoomReview roomReview = new RoomReview();
		roomReview.setRoomNo(roomNo);
		roomReview.setUserId(userId);
		roomReview.setReview(reviewContent);
		
		int ReviewResult = new ReviewService().reviewInsert(roomReview, starScore);
		int reserveStateResult = new ReservationService().reviewComplete(reserveNo);
		
		if(ReviewResult > 0 && reserveStateResult > 0) {						
			request.getSession().setAttribute("message", "리뷰가 성공적으로 등록되었습니다!");
			response.sendRedirect(request.getContextPath() + "/reservation/checkView");				
			
		}else{
			request.setAttribute("message", "리뷰등록이 실패되었습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
