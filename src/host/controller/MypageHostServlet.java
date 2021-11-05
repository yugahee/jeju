package host.controller;

import java.io.IOException;
import java.util.List;

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
		// 유저 아이디  ********** 로그인 연결되면 주석 지우기 **************
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();					
		// String userId = "host1";  // 테스트용 유저아이디
		
		List<Rooms> roomList = new RoomsService().selectRooms(userId);
		
		/* 호스트의 숙소에 관련된 리뷰 조회 */
		List<RoomReview> reviewList = new RoomsService().selectRoomReview(userId);
		// System.out.println(review);
		
		request.setAttribute("roomList", roomList);
		request.setAttribute("reviewList", reviewList);
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
