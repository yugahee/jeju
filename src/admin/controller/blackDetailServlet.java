package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import member.model.vo.Member;
import messenger.model.vo.Messenger;

/**
 * Servlet implementation class userDetailServlet
 */
@WebServlet("/admin/blackDetail")
public class blackDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public blackDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("input");		
		Member member = new AdminService().selectMemberDetail(userId);
		List<Messenger> msgList = new AdminService().selectReport(userId);
		Map<String, Object> map = new HashMap<>();
		map.put("member", member);
		map.put("msgList", msgList);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(map, response.getWriter());		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
