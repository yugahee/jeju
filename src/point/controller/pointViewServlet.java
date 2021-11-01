package point.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import point.model.service.PointService;
import point.model.vo.Point;

/**
 * Servlet implementation class pointViewServlet
 */
@WebServlet("/mypage/point")
public class pointViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pointViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		// 해당 유저 포인트 조회
		ArrayList<Point> pointList = new PointService().selectPoint(userId);		
		
		System.out.println(pointList);
		
		// 총 포인트 추출
		int totalPoint = 0;
		for(Point point : pointList) {
			if(point.getPointDivi().equals("적립")) {
				totalPoint += point.getPoint();				
			}else {
				totalPoint -= point.getPoint();
			}
		}
		
		request.setAttribute("totalPoint", totalPoint);
		request.setAttribute("pointList", pointList);		
		
		request.getRequestDispatcher("/views/mypage/point.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
