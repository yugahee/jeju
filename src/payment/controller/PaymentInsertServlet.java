package payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import payment.model.service.PaymentService;

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
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int usingPoint = Integer.parseInt(request.getParameter("usingPoint"));
		String reserveName = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		int paymentResult = new PaymentService().paymentInsert(reserveNo, totalPrice);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(roomNo, response.getWriter());
	}

}
