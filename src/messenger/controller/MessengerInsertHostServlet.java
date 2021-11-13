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
 * Servlet implementation class MessengerInsertHostServlet
 */
@WebServlet("/messenger/insert/host")
public class MessengerInsertHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerInsertHostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 호스트에게 보내는 메시지 
		String to_user = request.getParameter("to_user");
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
		
		int result = new MessengerService().insertMessengerHost(messenger);
		
		if(result > 0) {
			
			request.getSession().setAttribute("message", "메시지 전송이 완료 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/messenger/list/sent");
		} else {
			
			request.setAttribute("message", "메시지 전송에 실패 하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
