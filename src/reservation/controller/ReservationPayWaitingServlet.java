package reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationPayWaitingServlet
 */
@WebServlet("/payment/waiting")
public class ReservationPayWaitingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPayWaitingServlet() {
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
	
		// 업데이트 시 구분 값(예약번호)
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		int result = new ReservationService().paymentWaitUpdate(reserve_no);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "예약신청이 수락되었습니다.");
			response.sendRedirect(request.getContextPath() + "/reserve/select/admin");
		} else {
			request.setAttribute("message", "예약신청이 수락이 실패되었습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
