package messenger.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import messenger.model.service.MessengerService;

/**
 * Servlet implementation class MessengerListServlet
 */
@WebServlet("/messenger/list/sent")
public class MsgSentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgSentListServlet() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// * page : 현재 요청 페이지
		// 기본적으로 게시판은 1페이지부터 시작
		int page = 1;

		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String fromUser = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();

		// 페이징과 관련 된 데이터, 조회 된 boardList를 map에 담아 리턴
		Map<String, Object> map = new MessengerService().selectSentList(page, fromUser);

		//System.out.println(map);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("messengerList", map.get("messengerList"));

		request.getRequestDispatcher("/views/messenger/sentMessage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
