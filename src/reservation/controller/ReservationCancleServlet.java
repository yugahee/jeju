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
		// user_type 처리를 위한 인코딩 
		request.setCharacterEncoding("UTF-8");
		String user_type = request.getParameter("user_type"); 
			
		int reserv_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		int result = new ReservationService().reservationCancle(reserv_no);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "예약취소가 완료되었습니다😢");
			
			// 호스트가 예약신청 응답으로 거절버튼을 눌렀을 경우 
			if(user_type.equals("호스트")) {
				  response.sendRedirect( request.getContextPath() + "/reserve/select/admin");
			} else {
				// 게스트가 예약 취소 버튼 눌렀을 경우 
				response.sendRedirect(request.getContextPath() + "/reservation/checkView");
			}
		} else {
			request.setAttribute("message", "예약취소가 실패되었습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
