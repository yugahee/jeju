package reservation.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationCheckServlet
 */
@WebServlet("/reservation/checkView")
public class ReservationCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			request.getSession().setAttribute("message", "로그인을 해주셔야 예약조회가 가능합니다.");
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
				
		String userId = "";
		userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		// 예약리스트 가져오기
		List<Reservation> reservationList = new ReservationService().userReservation(userId);		
		
		Date current = new Date();
		
		for(Reservation reserv : reservationList) {
			// 예약완료 중에서
			if(reserv.getReserve_state().equals("예약완료")) {
				Date endDate = reserv.getEnd_date();
				// 예약날짜 지났는지 확인
				if(current.compareTo(endDate) > 0) {
					int reserveStateUpdate = new ReservationService().reserveEndUpdate(reserv.getRoom_reserve());
				}
			}			
			
		}
				
		request.setAttribute("reservationList", reservationList);
		request.getRequestDispatcher("/views/reservation/reservationCheckView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
