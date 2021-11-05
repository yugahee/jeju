package reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.vo.Rooms;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class Room_detail_reservationServlet
 */
@WebServlet("/room/reserve/detail")
public class Room_detail_reservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Room_detail_reservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		Rooms room = new ReservationService().detailSelectRoom(roomNo);

		System.out.println(room);
		
		if(room != null) {
	         request.setAttribute("room", room);
	 		 request.getRequestDispatcher("/views/reservation/detail_room_reservation.jsp").forward(request, response);
	      } else {
	         request.setAttribute("message", "숙소 예약 페이지 상세보기에 실패하였습니다.");
	         request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
	      }
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
