package messenger.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import messenger.model.service.MessengerService;

/**
 * Servlet implementation class MessengerDeleteServelt
 */
@WebServlet("/messenger/delete")
public class MessengerDeleteServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerDeleteServelt() {
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
		int msgNo = Integer.parseInt(request.getParameter("msg_no"));
		
		int result = new MessengerService().deleteMessage(msgNo);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "메시지 삭제가 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+"/messenger/list/received");
		} else {
			request.setAttribute("message", "메시지 삭제에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
