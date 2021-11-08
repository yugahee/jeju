package host.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import host.model.service.RoomsService;
import member.model.vo.Member;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/host/calendar")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/host/RoomCalendar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// host id 값
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		List<Reservation> reserveList = new RoomsService().selectReserveList(userId);
		// System.out.println(reserveList);

		
		/* GSON 라이브러리 추가 후 GSON 객체의 toJson 메소드로 처리 */
		response.setContentType("application/json; charset=utf-8");
		
		/* GSON 사용 시 날짜 값은 Date 포맷에 대한 컨트롤이 필요함 
		 * GsonBuilder 클래스의 setDateFormat 메소드 사용 */
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(reserveList, response.getWriter());
		
	}

}
