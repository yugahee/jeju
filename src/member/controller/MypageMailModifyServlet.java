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
 * Servlet implementation class MypageMailModifyServlet
 */
@WebServlet("/mypage/mail/modify")
public class MypageMailModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMailModifyServlet() {
        
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
		// 쿼리문 where절 조건에 필요한 아이디를 세션에 저장된 정보에서 가져옴
		String user_id = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		String user_mail = request.getParameter("userEmail"); 	// 현재 메일 주소
		String newMail = request.getParameter("newUmail");		// 새로운 메일 주소
		
		Member updatedMember = new MemberService().updateMail(user_id, user_mail, newMail);
		
		if(updatedMember != null) {
			request.getSession().setAttribute("message", "회원 정보 수정이 완료되었습니다.");
			// 수정 된 값으로 loginUser 변경
			request.getSession().setAttribute("loginUser", updatedMember);			
			// 메인 화면으로 redirect
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("message", "이메일 재설정에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
		
	}

}
