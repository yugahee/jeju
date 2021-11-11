package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import host.model.vo.Rooms;
import member.model.vo.Member;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class userDetailServlet
 */
@WebServlet("/admin/msgDetail")
public class msgDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public msgDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msgNo = Integer.parseInt(request.getParameter("msgNo"));
		
		Messenger msg = new AdminService().msgDetail(msgNo);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(msg, response.getWriter());		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
