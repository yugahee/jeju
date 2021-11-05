package host.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.RoomReview;
import host.model.service.RoomsService;
import host.model.vo.Rooms;
import member.model.vo.Member;

/**
 * Servlet implementation class MypageHostServlet
 */
@WebServlet("/host/mypage")
public class MypageHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageHostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 호스트의 숙소목록 조회 */
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();					
		// String userId = "host1";  // 테스트용 유저아이디
		
		// *** page : 현재 요청 페이지  (get방식이니까 uri에 page값 출력됨) ***
		// 기본적으로 게시판은 1페이지부터 시작
		int page = 1;
							
		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 페이징 처리 안한 숙소목록조회
		List<Rooms> roomList = new RoomsService().selectRooms(userId);
		request.setAttribute("roomList", roomList);
		
		// 페이징과 관련 된 데이터, 조회 된 RoomList를 Map에 담아 리턴 => 숙소목록
//		Map<String, Object> map = new RoomsService().selectRoomList(page, userId);
//		request.setAttribute("pi", map.get("pi"));
//		request.setAttribute("roomList", map.get("roomList"));
		
		// 페이징과 관련 된 데이터, 리뷰조회
		Map<String, Object> rMap = new RoomsService().selectRoomReview(page, userId);
		request.setAttribute("reviewPi", rMap.get("reviewPi"));
		request.setAttribute("reviewList", rMap.get("reviewList"));
		
		request.getRequestDispatcher("/views/host/MypageHost.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
