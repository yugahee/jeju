package mbti.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mbti.model.vo.Mbti;

/**
 * Servlet implementation class MbtiResultViewServlet
 */
@WebServlet("/mbti/resultView")
public class MbtiResultViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MbtiResultViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int test1 = Integer.parseInt(request.getParameter("test1"));
		int test2 = Integer.parseInt(request.getParameter("test2"));
		int test3 = Integer.parseInt(request.getParameter("test3"));
		int test4 = Integer.parseInt(request.getParameter("test4"));
		
		Mbti mbti = new Mbti();
		
		if(test1 == 1 && test2 == 1 && test3 == 1 && test4 == 1) {
			mbti.setMbtiType("새로움 추구 열혈탐험가 INTP");
			mbti.setMbtiContent("논리를 바탕으로 톡톡튀는 생각의 현실화를 꿈꾸는 당신!");
			mbti.setReco("레고박물관 브릭캠버스");
			mbti.setRecoContent("어딜봐도 레고가 가득한 레고 박물관 브릭캠버스!");
			mbti.setRecoImage("intp.jpg");
		}
		
		
		request.setAttribute("mbti", mbti);
		request.getRequestDispatcher("/views/mbti/test_result.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
