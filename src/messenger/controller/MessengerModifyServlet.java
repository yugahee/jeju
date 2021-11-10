package messenger.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import messenger.model.service.MessengerService;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class MessengerModifyServlet
 */
@WebServlet("/messenger/modify")
public class MessengerModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerModifyServlet() {
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
		int msg_no = Integer.parseInt(request.getParameter("msg_no"));
		String NreportId = request.getParameter("NreportId");
		String Ncontent = request.getParameter("Ncontent");
		
		Messenger messenger = new Messenger();
		messenger.setMsg_no(msg_no);
		messenger.setReport_user(NreportId);
		messenger.setMsg_content(Ncontent);
		
		int result = new MessengerService().modifyMessenger(messenger);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "정보가 수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/messenger/list");
		}else {
			request.setAttribute("message", "정보 수정 실패");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
