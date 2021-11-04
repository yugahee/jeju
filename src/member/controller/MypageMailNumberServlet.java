package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

/**
 * Servlet implementation class MypageMailNumberServlet
 */
@WebServlet("/mypage/checkNumber")
public class MypageMailNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMailNumberServlet() {
        
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
		/* 인증번호 확인하는 서블릿 */
		
		// 사용자가 입력한 인증 번호
		String numChk = request.getParameter("numChk");
		// 세션에 저장된 메일로 보냈던 인증 번호
		String checkKey = (String) request.getSession().getAttribute("checkKey");
		
		PrintWriter out = response.getWriter();
		
		if(!numChk.equals(checkKey)) {
			out.print("fail");
		} else {
			out.print("success");
		}
				
	}

}
