package host.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RoomEnrollPhotoServlet
 */
@WebServlet("/host/roomenrollphoto")
public class RoomEnrollPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomEnrollPhotoServlet() {
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
		String roomFac = request.getParameter("roomfac");
		
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		String roomlink = request.getParameter("roomlink");
		
		
	}

}
