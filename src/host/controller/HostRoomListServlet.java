package host.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.vo.Search;
import host.model.service.RoomsService;
import host.model.vo.Rooms;
import member.model.vo.Member;

/**
 * Servlet implementation class HostRoomListServlet
 */
@WebServlet("/host/roomlist")
public class HostRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostRoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		/* 호스트의 숙소목록 불러오기 */	
		// 유저 아이디  
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		// *** page : 현재 요청 페이지  (get방식이니까 uri에 page값 출력됨) ***
		// 기본적으로 게시판은 1페이지부터 시작
		int page = 1;
						
		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 검색 관련
		String searchCondition = request.getParameter("searchCondition");   // 검색조건
		String searchValue = request.getParameter("searchValue");           // 입력값
		
		// 페이징과 관련 된 데이터, 조회 된 RoomList를 Map에 담아 리턴
		Map<String, Object> map = new RoomsService().selectRoomList(page, userId, new Search(searchCondition, searchValue));
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("roomList", map.get("roomList"));
		
		// request.setAttribute("roomList", roomList);
		request.getRequestDispatcher("/views/host/RoomListHost.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
