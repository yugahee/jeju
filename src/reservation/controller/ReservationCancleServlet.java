package reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationCancleServlet
 */
@WebServlet("/reservation/cancle")
public class ReservationCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCancleServlet() {
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
		int reserv_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		int result = new ReservationService().reservationCancle(reserv_no);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "예약취소가 완료되었습니다😢");
			response.sendRedirect(request.getContextPath() + "/reservation/checkView");
		}else {
			request.setAttribute("message", "예약취소가 실패되었습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
