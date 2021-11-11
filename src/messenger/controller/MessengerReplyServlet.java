package messenger.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class MessengerReplyServlet
 */
@WebServlet("/messenger/reply")
public class MessengerReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerReplyServlet() {
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
		int msg_no = Integer.parseInt(request.getParameter("msg_no"));
		String from_user = request.getParameter("from_user");
		String to_user = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		String reply_content = request.getParameter("Rcontent");
		
		Messenger messenger = new Messenger();
		messenger.setMsg_no(msg_no);
		messenger.setFrom_user(from_user);
		messenger.setTo_user(to_user);
		messenger.setReply_content(reply_content);
		
		System.out.println(messenger);
	}

}
