package reservation.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.vo.Rooms;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;


/**
 * Servlet implementation class ReservevationAdminServlet
 */
@WebServlet("/reservation/insert")
public class ReservevationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservevationInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Rooms room = new Rooms();
		
		
		String[] roomFac;
		if( room.getRoomFac() != null) {
			roomFac = room.getRoomFac().split("\\,"); // 배열로 잘라짐
		} else {
			roomFac = new String[] {"", "", "", "", ""};
		}
		
		String[] defaultFac = { "tv", "TV", "에어컨", "와이파이", "전기포트", "전자렌지",
				"밥솥", "수건", "식기", "다리미", "헤어드라이기", "냉장고"};
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		Member loginUser = ((Member)request.getSession().getAttribute("loginUser"));
		
		//if문을 위한 user_type
		String user_type = request.getParameter("user_type"); 
		
		// 예약자 정보(체크인, 체크아웃, 예약번호, 숙소번호)
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		Date start_date = Date.valueOf(request.getParameter("start_date"));
		Date end_date = Date.valueOf(request.getParameter("end_date"));
		int reserve_num = Integer.parseInt(request.getParameter("reserve_num"));
		// 숙소이름 
		String roomName = request.getParameter("roomName");
		
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		String start_date = format.format(request.getParameter("start_date"));
//		String end_date = format.format(request.getParameter("end_date"));
		
		// 예약자 정보 예약객체에 설정 
		Reservation reserveInfo = new Reservation();
		reserveInfo.setStart_date(start_date);
		reserveInfo.setEnd_date(end_date);
		reserveInfo.setReserve_num(reserve_num);
		reserveInfo.setRoom_no(roomNo);
		
		int result = new ReservationService().insertReservation(loginUser, reserveInfo);
		
		if( result > 0  ) {
			if(user_type.equals("게스트")) { 
				  response.sendRedirect( request.getContextPath() + "/reservation/checkView");
			  } 
		} else {
			request.setAttribute("message", "예약자 정보 insert 실패");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
//		// 예약신청 확인 버튼 클릭 시 호스트가 아니면 예약조회로 재요청
//		// 호스트면 예약관리로 포워딩 
//		if(user_type.equals("호스트")) {
//			request.getRequestDispatcher("/views/host/RoomReservation.jsp").forward(request, response);
//		} else {
//			response.sendRedirect( request.getContextPath() + "/reservation/checkView");
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
