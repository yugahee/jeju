package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AccountDeleteServlet
 */
@WebServlet("/delete")
public class AccountDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountDeleteServlet() {
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/delete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		String reason = request.getParameter("radio");
		
		// 기타를 선택한 경우 입력값이 이유로 오게
		if(reason.equals("기타")) 
			reason = request.getParameter("radioEct");
		
		
		int reasult = new MemberService().deleteAccount(userId, reason);
		
		if(reasult > 0) {
			request.getSession().removeAttribute("loginUser"); //로그인 세선 정보 삭제
			request.getSession().setAttribute("message", "회원 탈퇴가 완료되었습니다.");	
			response.sendRedirect(request.getContextPath()); // 메인 페이지로 이동(서버 재요청)
		} else {
			request.setAttribute("message", "회원 탈퇴에 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
