package payment.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.vo.PeakSeason;
import payment.model.service.PaymentService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class paymentViewServlet
 */
@WebServlet("/payment")
public class paymentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveNo = Integer.parseInt(request.getParameter("reserv"));	
		
		Reservation reservationInfo = new PaymentService().reservePayment(reserveNo);
		
		// 성수기 인지 아닌지 체크
		int roomNo = reservationInfo.getRoom_info().getRoomNo();
		
		// 성수기가 있는 방인지 체크
		PeakSeason peak = new PaymentService().peakChk(roomNo);
		
		System.out.println(reservationInfo);
		System.out.println(peak);
		
		int price = 0;
		if(peak != null) {
			//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date reserveStart = reservationInfo.getStart_date();
			Date reserveEnd = reservationInfo.getEnd_date();			
			Date peakStart = peak.getPeakStart();
			Date peakEnd = peak.getPeakEnd();
			
			// 시작 비교
			int Startcompare = reserveStart.compareTo(peakStart);
			// 끝 날짜 비교
			int Endcompare = reserveEnd.compareTo(peakEnd);
			
			if(Startcompare < 0 || Endcompare > 0) {
				price = reservationInfo.getRoom_info().getPrice();
			}else {
				price = peak.getPeakPrice();
			}
			
		}else {
			price = reservationInfo.getRoom_info().getPrice();			
		}
				
		request.setAttribute("roomPrice", price);
		request.setAttribute("reserve", reservationInfo);
		request.getRequestDispatcher("/views/payment/payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
