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
 * Servlet implementation class RoomReviewUpdateView
 */
@WebServlet("/roomReview/update")
public class RoomReviewUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewUpdateView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		
		RoomReview review = new ReviewService().selectReview(reserveNo);
		
		int star = (int)review.getStar();
		
		request.setAttribute("review", review);
		request.setAttribute("star", star);
		request.getRequestDispatcher("/views/reservation/roomReviewUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
