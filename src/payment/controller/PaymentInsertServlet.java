package payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.vo.Member;
import payment.model.service.PaymentService;
import point.model.service.PointService;
import point.model.vo.Point;

/**
 * Servlet implementation class PaymentInsertServlet
 */
@WebServlet("/payment/insert")
public class PaymentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInsertServlet() {
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
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int usingPoint = Integer.parseInt(request.getParameter("usingPoint"));
		String reserveName = request.getParameter("name");
		String phone = request.getParameter("phone");
				
		// 포인트 적립
		int pointResult = 0;
		int userPointResult = 0;
		Point point = new Point();
		if(usingPoint > 0) {
			point.setPointDivi("사용");
			point.setPoint(usingPoint);
			
			pointResult = new PointService().insertPoint(userId, point, reserveNo);
			userPointResult = new PointService().userPointUpdate(userId, point);
		}else {			
			int addPointTotal = (int)(totalPrice * 0.1); // 결제금액 10%
			point.setPointDivi("적립");
			point.setPoint(addPointTotal);
			
			pointResult = new PointService().insertPoint(userId, point, reserveNo);
			userPointResult = new PointService().userPointUpdate(userId, point);
		}	
		
		
		int paymentResult = new PaymentService().paymentInsert(reserveNo, totalPrice);		
		
		System.out.println("포인트insert : " + pointResult + "\n 멤버포인트 : " +  userPointResult + "\n 결제insert : " + paymentResult);
		
		String msg = "";
		if(pointResult > 0 && userPointResult > 0 && paymentResult > 0) {
			// 예약완료로 상태값 변경
			int reserveStateResult = new PaymentService().reserveStateUpdate(reserveNo, reserveName, phone);
			
			if(reserveStateResult > 0) {
				msg = "success";				
			}else {
				msg = "fail";
			}
		}else {
			msg = "fail";
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(msg, response.getWriter());
	}

}
