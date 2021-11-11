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
 * Servlet implementation class RoomUpdate1Servlet
 */
@WebServlet("/host/roomUpdate1")
public class RoomUpdate1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdate1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomno"));
		
		Rooms room = new RoomsService().selectRoomPrice(roomNo);
		// System.out.println(room);
		
		if(room != null) {
			request.setAttribute("room", room);
			request.getRequestDispatcher("/views/host/roomUpdatePrice.jsp").forward(request, response);			
		} else {
			request.setAttribute("message", "숙소 요금 정보를 가져오는데 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int roomNo = Integer.parseInt(request.getParameter("roomno"));
		
		/* 입력 값 불러오기 */
		String roomName = request.getParameter("roomname");
		String roomTitle = request.getParameter("roomtitle");
		String roomDes = request.getParameter("roomdes");
		int room = Integer.parseInt(request.getParameter("room"));
		int bed = Integer.parseInt(request.getParameter("bed"));
		int bath = Integer.parseInt(request.getParameter("bath"));
		String roomType = request.getParameter("roomtype");
		String buildingType = request.getParameter("buildingtype");	
		String roomSize = request.getParameter("roomsize");
		
		String startTime = request.getParameter("starttime");
		String endTime = request.getParameter("endtime");
		
		String[] roomFacArr = request.getParameterValues("roomfac");	
		
		String roomFac = "";
		if(roomFacArr != null) {
			roomFac = String.join(",", roomFacArr);
		}
		
		Rooms rooms = new Rooms();
		rooms.setRoomNo(roomNo);
		rooms.setRoomName(roomName);
		rooms.setRoomTitle(roomTitle);
		rooms.setRoomDes(roomDes);
		rooms.setRoom(room);
		rooms.setBed(bed);
		rooms.setBath(bath);
		rooms.setRoomType(roomType);
		rooms.setBuildingType(buildingType);
		rooms.setRoomSize(roomSize);
		rooms.setStartTime(startTime);
		rooms.setEndTime(endTime);
		rooms.setRoomFac(roomFac);
		
		int result = new RoomsService().updateRoomBasic(rooms);
		// System.out.println(result);
		
		if(result > 0) {
			Rooms roomSel = new RoomsService().selectRoomPrice(roomNo);
			
			request.setAttribute("room", roomSel);
			request.getSession().setAttribute("message", "변경된 내용이 저장되었습니다.");
			request.getRequestDispatcher("/views/host/roomUpdatePrice.jsp").forward(request, response);
			
			
		} else {
			request.setAttribute("message", "숙소 내용 수정에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
