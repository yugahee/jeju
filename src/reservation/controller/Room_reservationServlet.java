package reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.vo.Rooms;
import reservation.model.service.ReservationService;
import reservation.model.vo.RoomSearch;

/**
 * Servlet implementation class Room_reservation
 */
@WebServlet("/room/reservation")
public class Room_reservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Room_reservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 조건 검색 적용 시
		String[] locationArr = request.getParameterValues("location"); // 숙소위치
		String[] room_typeArr = request.getParameterValues("room_type"); //숙소종류
		String[] building_typeArr = request.getParameterValues("building_type"); //건물유형
		String[] specialFacArr = request.getParameterValues("specialFac"); // 특별시설		
		
		String location = "";
		String room_type = "";
		String building_type = "";
		String specialFac  = "";
		
		
		if(locationArr != null && !locationArr[0].equals("")) {
			location = String.join("%" , locationArr);
		}
		
		if(room_typeArr != null && !room_typeArr[0].equals("")) {
			room_type = String.join("%", room_typeArr);
		}
		
		if(building_typeArr != null && !building_typeArr[0].equals("")) {
			building_type = String.join("%" , building_typeArr);
		}
		
		if(specialFacArr != null && !specialFacArr[0].equals("")) {
			specialFac = String.join("%", specialFacArr);
		}

		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String mainLocation = request.getParameter("mainLocation");
		
		if(mainLocation != null) {
			location = mainLocation;
		}
		
		// 숙소예약화면 클릭 시 OR 조건검색 적용시 
		List<Rooms> roomList = new ReservationService().selectRoomList(new RoomSearch(location, room_type, building_type, specialFac, checkIn, checkOut));
//		
//		for(int i = 0; i< roomList.size(); i++) {
//			System.out.println(roomList.get(i).getReviewCount());
//		}
		System.out.println(roomList);
		
		request.setAttribute("roomList", roomList);			
		
		//int reviewCount = new ReservationService().getReviewCount();
		
		request.getRequestDispatcher("/views/reservation/room_reservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
