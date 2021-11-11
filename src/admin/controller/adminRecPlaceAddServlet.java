package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import admin.model.service.AdminService;
import common.MyFileRenamePolicy;
import recommendation.model.vo.Recommendation;

/**
 * Servlet implementation class adminMainServlet
 */
@WebServlet("/admin/recPlace_add")
public class adminRecPlaceAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminRecPlaceAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/recPlaceAdd_management.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* enctype이 multipart/form-data 로 전송되었는지 확인 */
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("message", "잘못 된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
			return;    
		}

		int maxSize = 1024*1024*10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "resources\\uploadFiles\\";  
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		Recommendation rec = new Recommendation();
		
		String publicYn = multiRequest.getParameter("select1");
		int recoArea = Integer.parseInt(multiRequest.getParameter("select2"));
		int recoCategory = Integer.parseInt(multiRequest.getParameter("select3"));
		String recoName = multiRequest.getParameter("recoName");
		String recoAddress = multiRequest.getParameter("recoAddress");
		String naverMap = multiRequest.getParameter("naverMap");
		String kakaoMap = multiRequest.getParameter("kakaoMap");
		String recoKeyword = multiRequest.getParameter("recoKeyword");
		String recoExpl = multiRequest.getParameter("recoExpl");
		String uploadName = "uploadName";
		
		rec.setPublicYn(publicYn);
		rec.setRecoArea(recoArea);
		rec.setRecoAddress(recoAddress);
		rec.setRecoCategory(recoCategory);
		rec.setRecoExpl(recoExpl);
		rec.setRecoKeyword(recoKeyword);
		rec.setRecoName(recoName);
		rec.setNaverMap(naverMap);
		rec.setKakaoMap(kakaoMap);
		rec.setRecoImage("/resources/uploadFiles/");
		rec.setImageName(multiRequest.getFilesystemName(uploadName));	
				
		int result = new AdminService().insertRecoPhoto(rec);
		if(result > 0) {
			request.setAttribute("rec", rec);
			request.getSession().setAttribute("message", "정보 추가 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/admin/recPlaceMg");
		}else {
			request.setAttribute("message", "실패");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
