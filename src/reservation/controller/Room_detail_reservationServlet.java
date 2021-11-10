package reservation.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.RoomReview;
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
	
		// 페이지 파라미터가 넘어오냐, 안 오냐에 따라 다른 화면
		// page : 현재 요청 페이지  
		// 기본적으로 게시판은 1페이지부터 시작
		int page = 1;
							
		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		// 숙소 디테일뷰 데이터 값들 조회
		Rooms room = new ReservationService().detailSelectRoom(roomNo);
		
		// 페이징 처리 된 숙소 리뷰 조회 
		Map<String, Object> rMap = new ReservationService().selectRoomReview(page, roomNo);
		
		if(room != null && rMap != null) {
		 request.setAttribute("roomNo", roomNo);
         request.setAttribute("room", room);
         request.setAttribute("reviewPi", rMap.get("reviewPi"));
 		 request.setAttribute("roomReviewList", rMap.get("roomReviewList"));
        request.getRequestDispatcher("/views/reservation/detail_room_reservation.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "숙소 예약 페이지 상세보기에 실패하였습니다.");
        request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
      }
		
		
//		/* 여기서부터 원래 해놨던 것*/
//		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
//		Rooms room = new ReservationService().detailSelectRoom(roomNo);
//		
//		// 디테일페이지 숙소리뷰 조회
//		List<RoomReview> roomReviewList = new ReservationService().selectRoomReview(roomNo);
//		
//		//System.out.println(roomReviewList);
//		
//		if(room != null && roomReviewList != null) {
//			 request.setAttribute("roomNo", roomNo);
//	         request.setAttribute("room", room);
//	 		 request.setAttribute("roomReviewList", roomReviewList );
//	         request.getRequestDispatcher("/views/reservation/detail_room_reservation.jsp").forward(request, response);
//	      } else {
//	         request.setAttribute("message", "숙소 예약 페이지 상세보기에 실패하였습니다.");
//	         request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
//	      }
		
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
