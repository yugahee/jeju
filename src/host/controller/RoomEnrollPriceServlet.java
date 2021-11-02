package host.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.vo.PeakSeason;
import host.model.vo.Rooms;

/**
 * Servlet implementation class RoomEnrollPriceServlet
 */
@WebServlet("/host/roomenrollbasic2")
public class RoomEnrollPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomEnrollPriceServlet() {
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
		
		/* 입력 값 불러오기 - 1 */
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
		
		/* 입력 값 불러오기 - 2 */
		
		int minStay = Integer.parseInt(request.getParameter("minstay"));
		int maxStay = Integer.parseInt(request.getParameter("maxstay"));
		int minPeople = Integer.parseInt(request.getParameter("minpeople"));
		int maxPeople = Integer.parseInt(request.getParameter("maxpeople"));
		int price = Integer.parseInt(request.getParameter("price"));
		int extraCost = Integer.parseInt(request.getParameter("extracost"));
		
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
		rooms.setMinStay(minStay);
		rooms.setMaxStay(maxStay);
		rooms.setMinPeople(minPeople);
		rooms.setMaxPeople(maxPeople);
		rooms.setPrice(price);
		rooms.setExtraCost(extraCost);
		
		// 성수기 입력사항 있는 경우
		if(request.getParameter("peakstart") != null && request.getParameter("peakend") != null 
				&& request.getParameter("peakprice") != null) {
					
			PeakSeason peak = new PeakSeason();

			// String으로 넘어온 값을 Date 타입으로 변환
			Date peakStart = Date.valueOf(request.getParameter("peakstart")); 
			Date peakEnd = Date.valueOf(request.getParameter("peakend"));
				
			peak.setPeakStart(peakStart);   
			peak.setPeakEnd(peakEnd);
	
			peak.setPeakPrice(Integer.parseInt(request.getParameter("peakprice")));
				
			rooms.setPeak(peak);
		}		
		
		request.setAttribute("rooms", rooms);
		request.getRequestDispatcher("/views/host/RoomEnrollPhoto.jsp").forward(request, response);
	
	}

}
