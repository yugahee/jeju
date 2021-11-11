package host.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.service.RoomsService;

/**
 * Servlet implementation class RoomDeleteServlet
 */
@WebServlet("/host/roomDelete")
public class RoomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomno"));
		
		// 해당 숙소의 예약진행내역 파악 => '예약신청', '결제대기', '예약완료' 포함되면 삭제불가
		int reserveCount = new RoomsService().reserveState(roomNo);
		
		if(reserveCount > 0) {
			// 삭제불가
			request.getSession().setAttribute("message", "해당 숙소의 예약내역이 존재하여 숙소 삭제를 할 수 없습니다.");
			response.sendRedirect(request.getContextPath() + "/host/roomlist");
			
		} else {
			// 삭제가능
			// 숙소 삭제 로직 : 예약진행내역이 없는경우 수행
			int result = new RoomsService().deleteRoom(roomNo);
			// System.out.println(result);
			
			if(result > 0) {			
				response.sendRedirect(request.getContextPath() + "/host/roomlist");
				
			} else {
				request.setAttribute("message", "해당 숙소 삭제에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
