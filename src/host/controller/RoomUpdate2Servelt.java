package host.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import host.model.service.RoomsService;
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;

/**
 * Servlet implementation class RoomUpdate2Servelt
 */
@WebServlet("/host/roomUpdate2")
public class RoomUpdate2Servelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdate2Servelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomno"));
		
		Rooms rooms = new RoomsService().selectRoomPhoto(roomNo);
		// System.out.println(rooms);
		if(rooms != null) {
			request.setAttribute("rooms", rooms);
			request.getRequestDispatcher("/views/host/roomUpdatePhoto.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "숙소 사진관련 정보를 가져오는데 실패하였습니다.");
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
		int minStay = Integer.parseInt(request.getParameter("minstay"));
		int maxStay = Integer.parseInt(request.getParameter("maxstay"));
		int minPeople = Integer.parseInt(request.getParameter("minpeople"));
		int maxPeople = Integer.parseInt(request.getParameter("maxpeople"));
		int price = Integer.parseInt(request.getParameter("price"));
		int extraCost = Integer.parseInt(request.getParameter("extracost"));
		
		Rooms room = new Rooms();
		room.setRoomNo(roomNo);
		room.setMinStay(minStay);
		room.setMaxStay(maxStay);
		room.setMinPeople(minPeople);
		room.setMaxPeople(maxPeople);
		room.setPrice(price);
		room.setExtraCost(extraCost);
		
		// 성수기 - 기존데이터 있는경우 : 수정(update), 기존데이터 없었는데 넘어온 값 있다면 : 추가(insert)
		if(!request.getParameter("originpeakstart").equals("") && !request.getParameter("originpeakend").equals("") 
				&& !request.getParameter("originpeakprice").equals("")) {
			
			// 기존데이터 있으면서 변경할 값 있는 경우
			if(!request.getParameter("peakstart").equals("") && !request.getParameter("peakend").equals("") 
					&& !request.getParameter("peakprice").equals("")) {
				
				PeakSeason peak = new PeakSeason();
				
				// String으로 넘어온 값을 Date 타입으로 변환
				Date peakStart = Date.valueOf(request.getParameter("peakstart")); 
				Date peakEnd = Date.valueOf(request.getParameter("peakend"));
				
				peak.setPeakStart(peakStart);   
				peak.setPeakEnd(peakEnd);
				
				peak.setPeakPrice(Integer.parseInt(request.getParameter("peakprice")));
				peak.setRoomNo(roomNo);
				
				room.setPeak(peak);
				
			} else {
				// 기존데이터 있으면서 변경할 값 비어있는 경우 : 삭제
				int deletePeak = new RoomsService().deletePeak(roomNo);
				
				if(deletePeak == 0) {
					request.setAttribute("message", "성수기 내용 삭제에 실패하였습니다.");
					request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
				}
			}
			
		} else {
			// 기존데이터 없는데 추가하는 경우
			if(!request.getParameter("peakstart").equals("") && !request.getParameter("peakend").equals("") 
					&& !request.getParameter("peakprice").equals("")) {
				
				PeakSeason peak = new PeakSeason();
				
				// String으로 넘어온 값을 Date 타입으로 변환
				Date peakStart = Date.valueOf(request.getParameter("peakstart")); 
				Date peakEnd = Date.valueOf(request.getParameter("peakend"));
				
				peak.setPeakStart(peakStart);   
				peak.setPeakEnd(peakEnd);
				
				peak.setPeakPrice(Integer.parseInt(request.getParameter("peakprice")));
				peak.setRoomNo(roomNo);
				
				int result = new RoomsService().insertPeak(peak);
				
				if(result == 0) {
					request.setAttribute("message", "성수기 내용 추가에 실패하였습니다.");
					request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
				}
			} 
		}

		
		int result = new RoomsService().updateRoomPrice(room);
		
		if(result > 0) {
			Rooms rooms = new RoomsService().selectRoomPhoto(roomNo);
			
			request.setAttribute("rooms", rooms);
			request.getSession().setAttribute("message", "변경된 내용이 저장되었습니다.");
			request.getRequestDispatcher("/views/host/roomUpdatePhoto.jsp").forward(request, response);
			
		} else {
			request.setAttribute("message", "숙소 내용 수정에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
