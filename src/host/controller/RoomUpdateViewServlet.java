package host.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.service.RoomsService;
import host.model.vo.Rooms;

/**
 * Servlet implementation class RoomUpdateViewServlet
 */
@WebServlet("/host/roomUpdateView")
public class RoomUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomno"));
		
		Rooms room = new RoomsService().selectRoomBasic(roomNo);
		// System.out.println(room);
		
		if(room != null) {
			request.setAttribute("room", room);
			request.getRequestDispatcher("/views/host/roomUpdateBasic.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "숙소 수정 페이지로 이동에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
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
