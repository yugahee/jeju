package messenger.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.vo.Member;
import messenger.model.service.MessengerService;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class MessengerDetailServlet
 */
@WebServlet("/messenger/detail")
public class MessengerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msgNo = Integer.parseInt(request.getParameter("msgNo"));
		String loginUser = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		
		Messenger messenger = new MessengerService().selectMessage(msgNo, loginUser);
			
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(messenger, response.getWriter());			
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
