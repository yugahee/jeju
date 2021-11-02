package host.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.vo.Rooms;

/**
 * Servlet implementation class RoomEnrollBasicServlet
 */
@WebServlet("/host/roomenrollbasic")
public class RoomEnrollBasicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomEnrollBasicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/host/RoomEnrollBasic.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		/* 입력 값 불러오기 */
		String roomName = request.getParameter("roomname");
		String roomTitle = request.getParameter("roomtitle");
		String roomDes = request.getParameter("roomdes");
		int room = Integer.parseInt(request.getParameter("room"));
		int bed = Integer.parseInt(request.getParameter("bed"));
		int bath = Integer.parseInt(request.getParameter("bath"));
		String roomType = request.getParameter("roomtype");
		String buildingType = request.getParameter("buildingtype");
		
		String roomSize = "";
		if(request.getParameter("roomsize") != null) {
			roomSize = request.getParameter("roomsize");
		} 
		
		String startTime = request.getParameter("starttime");
		String endTime = request.getParameter("endtime");
		String[] roomFacArr = request.getParameterValues("roomfac");
		
		String roomFac = "";
		if(roomFacArr != null) {
			roomFac = String.join(",", roomFacArr);
		}
		
		Rooms rooms = new Rooms();
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
		
		request.setAttribute("rooms", rooms);
		request.getRequestDispatcher("/views/host/RoomEnrollPrice.jsp").forward(request, response);
		
	}

}
