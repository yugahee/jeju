package host.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import host.model.service.RoomsService;
import host.model.vo.Files;
import host.model.vo.Rooms;

/**
 * Servlet implementation class RoomUpdate3Servlet
 */
@WebServlet("/host/roomUpdate3")
public class RoomUpdate3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdate3Servlet() {
        super();
        // TODO Auto-generated constructor stub
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
		/* enctype이 multipart/form-data 로 전송되었는지 확인 */
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("message", "잘못 된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
			return;    
		}
		
		int maxSize = 1024*1024*10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "resources\\uploadFiles\\";   
		
		/* HttpServletRequest => MultipartRequest 변경 */
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		/* 입력 값 불러오기 */	
		Rooms rooms = new Rooms();
		
		int roomNo = Integer.parseInt(multiRequest.getParameter("roomno"));
		String location = multiRequest.getParameter("location");
		String address = multiRequest.getParameter("address");
		rooms.setRoomNo(roomNo);
		rooms.setLocation(location);
		rooms.setAddress(address);
		
		if(!multiRequest.getParameter("roomlink").equals("")) {
			rooms.setRoomLink(multiRequest.getParameter("roomlink"));
		}
		
		/* 사진 수정값 불러오기 */
		List<Files> fileList = new ArrayList<>();
		String[] fileNames = {"mainimg" , "subimg1", "subimg2", "subimg3", "subimg4"};
		String[] changeNames = multiRequest.getParameterValues("changeName");  // 변경되기 전의 파일명
		
		for(int i = 0; i < fileNames.length; i++) {
			 /* 서브 이미지 : 파일이 업로드되지 않았을 경우 다음 fileName으로 넘어감 */
			if(multiRequest.getFilesystemName(fileNames[i]) == null)
				continue;
			
			// 수정을 위해 첨부 된 파일이 있는 경우
			Files file = new Files();
			file.setFilePath("/resources/uploadFiles/");
			file.setChangeName(multiRequest.getFilesystemName(fileNames[i]));
						
			if(i == 0) {
				file.setFileLevel(0);  // 메인사진
			} else {
				file.setFileLevel(1);  // 서브사진
			}

			// 원래 저장 된 파일이 있었다면 -> DB에서 update 처리 & 서버에서 기존 파일 delete 처리
			if(changeNames.length >= i+1) {   // 원래 저장된 파일개수보다 크면 원래 파일에 없던 파일이 추가된 경우(insert)이므로 if문에는 안들어가
				file.setDeletedName(changeNames[i]);   // 수정 전 파일이름을 deletedName으로 설정
			}
			
			fileList.add(file);

		}
		
		rooms.setFileList(fileList);
		
		int result = new RoomsService().updateRoomPhoto(rooms);
		// System.out.println(result);
		
		if(result > 0) {
			// 수정 성공시 덮어쓰기 된 사진 삭제
			for(Files file : fileList) {
				if(file.getDeletedName() != null) {
					File deletedFile = new File(savePath + file.getDeletedName());
					deletedFile.delete();
				}
			}
			// System.out.println("성공");
			response.sendRedirect(request.getContextPath() + "/host/roomlist");
			
		} else {
			// 수정 실패 시 수정을 위해 새로 첨부 된 사진 삭제하기
			for(Files file : fileList) {
				File failedFile = new File(savePath + file.getChangeName());
				failedFile.delete();
			}
			
			request.setAttribute("message", "사진 첨부 수정에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
		
	}

}
