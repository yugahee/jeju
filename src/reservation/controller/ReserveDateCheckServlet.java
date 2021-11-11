package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReserveCheckServlet
 */
@WebServlet("/reserve/dateCheck")
public class ReserveDateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveDateCheckServlet() {
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
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		Date startDate = Date.valueOf(request.getParameter("startDate")); 
		Date endDate = Date.valueOf(request.getParameter("endDate"));
		
		
		// 예약 체킹
		List<Reservation> possibleReservList = new ReservationService().possibleReservation(roomNo);
		//System.out.println(possibleReservList);
		
		//response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = 0; // 성공시 1, 실패시 0....
		for(Reservation DateCheck : possibleReservList) {
			Date startDateDB = DateCheck.getStart_date();
			Date endDateDB = DateCheck.getEnd_date();
			
			//인수 날짜가Date 객체와 같으면0을 반환합니다.
			//Date 객체가 인수 날짜 이후 인 경우 양수 값을 반환합니다.
			//Date 객체가 인수 날짜보다 앞에 있으면 음수를 반환합니다.
			if(startDateDB.compareTo(startDate) == 0 && endDateDB.compareTo(endDate) == 0) {
				result = 0;
				break;
			} else if(startDateDB.compareTo(startDate) != 0 && endDateDB.compareTo(endDate) != 0) {
				result = 1;
			}
			
		}
		
		if(result == 1) {
			out.print("success");
		} else {
			out.print("fail");	
		}
		
	}

}
