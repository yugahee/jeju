package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MypageModifyServlet
 */
@WebServlet("/mypage/modify")
public class MypageModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/information.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("userId");
		String user_name = request.getParameter("userName");
		String phone = request.getParameter("userTel");
		
		Member member = new Member();
		member.setUser_id(user_id);
		member.setUser_name(user_name);
		member.setPhone(phone);
		
		Member updatedMember = new MemberService().updateMember(member);
		
		if(updatedMember != null) {
			// 세션에 저장된 loginUser의 정보도 수정되게
			request.getSession().setAttribute("message", "내 정보 수정이 완료되었습니다.");
			request.getSession().setAttribute("loginUser", updatedMember);
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("message", "정보 수정에 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
