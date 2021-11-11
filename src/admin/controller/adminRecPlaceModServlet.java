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
@WebServlet("/admin/recPlace_mod")
public class adminRecPlaceModServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminRecPlaceModServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recoNo = Integer.parseInt(request.getParameter("recoNo"));
		AdminService adminService = new AdminService();
		
		Recommendation rec = adminService.selectReco(recoNo);
		
		if(rec != null) {
			request.setAttribute("rec", rec);
			request.getRequestDispatcher("/views/admin/recPlaceMod_management.jsp").forward(request, response);
			System.out.println(rec);
		}else {
			request.setAttribute("message", "조회 실패");
		}
		
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
		
		int recoNo = Integer.parseInt(multiRequest.getParameter("recoNo"));
		String publicYn = multiRequest.getParameter("select1");
		int recoArea = Integer.parseInt(multiRequest.getParameter("select2"));
		int recoCategory = Integer.parseInt(multiRequest.getParameter("select3"));
		String recoName = multiRequest.getParameter("recoName");
		String recoAddress = multiRequest.getParameter("recoAddress");
		String naverMap = multiRequest.getParameter("naverMap");
		String kakaoMap = multiRequest.getParameter("kakaoMap");
		String recoKeyword = multiRequest.getParameter("recoKeyword");
		String recoExpl = multiRequest.getParameter("recoExpl");
		String recoImage = multiRequest.getParameter("recoImage");
		String imageName = multiRequest.getParameter("imageName");
		String uploadName = "uploadName";
		
		System.out.println(imageName);
		
		rec.setRecoNo(recoNo);
		rec.setRecoName(recoName);
		rec.setPublicYn(publicYn);
		rec.setRecoArea(recoArea);
		rec.setRecoCategory(recoCategory);
		rec.setRecoAddress(recoAddress);
		rec.setNaverMap(naverMap);
		rec.setKakaoMap(kakaoMap);
		rec.setRecoKeyword(recoKeyword);
		rec.setRecoExpl(recoExpl);
		rec.setRecoImage(recoImage);
		rec.setImageName(imageName);		
		
		if(multiRequest.getFilesystemName(uploadName) != null) {
			rec.setRecoImage("/resources/uploadFiles/");
			rec.setImageName(multiRequest.getFilesystemName(uploadName));		
		}
		
		System.out.println("값 확인 : " + rec);
				
		int result = new AdminService().updateRecoPhoto(rec);
		if(result > 0) {
			request.setAttribute("rec", rec);
			request.getSession().setAttribute("message", "변경된 내용이 저장되었습니다.");
			response.sendRedirect(request.getContextPath() + "/admin/recPlaceMg");
		}else {
			request.setAttribute("message", "실패");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
