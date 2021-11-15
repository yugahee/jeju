package messenger.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import messenger.model.service.MessengerService;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class MessengerInsertServlet
 */
@WebServlet("/messenger/insert")
public class MessengerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 관리자에게 보내는 메시지 = to_user는 관리자 아이디로 고정
		String to_user = "admin";
		String from_user = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		String msg_cate = request.getParameter("category");
		String report_user = request.getParameter("reportId");
		String msg_content = request.getParameter("msg_content");
		
		Messenger messenger = new Messenger();
		
		messenger.setTo_user(to_user);
		messenger.setFrom_user(from_user);
		messenger.setMsg_cate(msg_cate);
		messenger.setReport_user(report_user);
		messenger.setMsg_content(msg_content);
		
		int result = new MessengerService().insertMessenger(messenger);
		
		if(result > 0) {
			
			request.getSession().setAttribute("message", "메시지 전송이 완료 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/messenger/list/sent");
		} else {
			
			request.setAttribute("message", "메시지 전송에 실패 하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
