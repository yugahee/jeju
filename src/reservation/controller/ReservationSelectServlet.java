package reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.vo.Search;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationForwardAdeminServlet
 */
@WebServlet("/reserve/select/admin")
public class ReservationSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)(request.getSession().getAttribute("loginUser"))).getUser_id();
		
		
		// 검색 조건 및 입력 값 추출
		String searchCondition = request.getParameter("searchCondition");   
		String searchValue = request.getParameter("searchValue");          
		
		// 예약테이블에서 예약자 정보 조회하여 예약관리 페이지에 표현하기위한 로직 
		List<Reservation> reserveInfo =  new ReservationService().selectReserveInfoList(userId, new Search (searchCondition, searchValue));
		//System.out.println(reserveInfo);
		
		int reserveRequestCount = new ReservationService().reserveRequestCount(userId);
		int paymentWaitCount = new ReservationService().paymentWaitCount(userId);
		int reserveCancleCount = new ReservationService().reserveCancleCount(userId);
		int reserveCompletion = new ReservationService().reserveCompletion(userId);
		int lodgeCompletion = new ReservationService().lodgeCompletion(userId);
				
		request.setAttribute("reserveInfo", reserveInfo);
		request.setAttribute("reserveRequestCount", reserveRequestCount);
		request.setAttribute("paymentWaitCount", paymentWaitCount);
		request.setAttribute("reserveCancleCount", reserveCancleCount);
		request.setAttribute("reserveCompletion", reserveCompletion);
		request.setAttribute("lodgeCompletion", lodgeCompletion);
		
		request.getRequestDispatcher("/views/host/RoomReservationAdmin.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
