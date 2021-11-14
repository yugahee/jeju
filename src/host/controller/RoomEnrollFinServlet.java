package host.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
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
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import member.model.vo.Member;

/**
 * Servlet implementation class RoomEnrollFinServlet
 */
@WebServlet("/host/roomenrollfin")
public class RoomEnrollFinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomEnrollFinServlet() {
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
		/* enctype이 multipart/form-data로 전송 되었는지 확인하고 아닐 경우 에러페이지 이동 */
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("message", "잘못 된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
			return;
		}
		
		/* 1. 파일용량 제한 : 10MB */
		int maxSize = 1024*1024*10;
		
		/* 2. 웹 서버 컨테이너 경로 추출 후 파일이 실제 저장 될 경로 지정 */
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "resources\\uploadFiles\\";      // 역슬래시 2개는 이스케이프하려고!
		
		/* 3. HttpServletRequest => MultipartRequest 변경 */
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		/* 4. 입력 값 불러오기 */
		String roomName = multiRequest.getParameter("roomname");
		String roomTitle = multiRequest.getParameter("roomtitle");
		String roomDes = multiRequest.getParameter("roomdes");
		int room = Integer.parseInt(multiRequest.getParameter("room"));
		int bed = Integer.parseInt(multiRequest.getParameter("bed"));
		int bath = Integer.parseInt(multiRequest.getParameter("bath"));
		String roomType = multiRequest.getParameter("roomtype");
		String buildingType = multiRequest.getParameter("buildingtype");
		String roomSize = multiRequest.getParameter("roomsize");
		String startTime = multiRequest.getParameter("starttime");
		String endTime = multiRequest.getParameter("endtime");
		String roomFac = multiRequest.getParameter("roomfac");
		
		int minStay = Integer.parseInt(multiRequest.getParameter("minstay"));
		int maxStay = Integer.parseInt(multiRequest.getParameter("maxstay"));
		int minPeople = Integer.parseInt(multiRequest.getParameter("minpeople"));
		int maxPeople = Integer.parseInt(multiRequest.getParameter("maxpeople"));
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		int extraCost = Integer.parseInt(multiRequest.getParameter("extracost"));
		
		Rooms rooms = new Rooms();
		rooms.setRoomName(roomName);
		rooms.setRoomTitle(roomTitle);
		rooms.setRoomDes(roomDes);
		rooms.setRoom(room);
		rooms.setBed(bed);
		rooms.setBath(bath);
		rooms.setRoomType(roomType);
		rooms.setBuildingType(buildingType);
		rooms.setRoomSize(roomSize);
		rooms.setStartTime(startTime);
		rooms.setEndTime(endTime);
		rooms.setRoomFac(roomFac);
		rooms.setMinStay(minStay);
		rooms.setMaxStay(maxStay);
		rooms.setMinPeople(minPeople);
		rooms.setMaxPeople(maxPeople);
		rooms.setPrice(price);
		rooms.setExtraCost(extraCost);
		
		// 성수기 입력사항 있는 경우 => null 조건은 오류나서 변경함
		if(!multiRequest.getParameter("peakstart").equals("") && !multiRequest.getParameter("peakend").equals("") 
				&& !multiRequest.getParameter("peakprice").equals("")) {
					
			PeakSeason peak = new PeakSeason();

			// String으로 넘어온 값을 Date 타입으로 변환
			Date peakStart = Date.valueOf(multiRequest.getParameter("peakstart")); 
			Date peakEnd = Date.valueOf(multiRequest.getParameter("peakend"));
				
			peak.setPeakStart(peakStart);   
			peak.setPeakEnd(peakEnd);
	
			peak.setPeakPrice(Integer.parseInt(multiRequest.getParameter("peakprice")));
				
			rooms.setPeak(peak);
		}		
		
		/* 4. 입력 값 불러오기 - 2 */
		String location = multiRequest.getParameter("location");
		String address = multiRequest.getParameter("address");
		rooms.setLocation(location);
		rooms.setAddress(address);
		
		if(!multiRequest.getParameter("roomlink").equals("")) {
			rooms.setRoomLink(multiRequest.getParameter("roomlink"));
		}
		
		/* 5. 파일 불러오기 */
		List<Files> fileList = new ArrayList<>();
		String[] fileNames = {"mainimg" , "subimg1", "subimg2", "subimg3", "subimg4"};
		
		for(int i = 0; i < fileNames.length; i++) {
			 /* 서브 이미지 : 파일이 업로드되지 않았을 경우 다음 fileName으로 넘어감 */
			if(multiRequest.getFilesystemName(fileNames[i]) == null)
				continue;
			
			Files files = new Files();
			files.setFilePath("/resources/uploadFiles/");
			// MyRenamePolicy의 rename 메소드에서 작성한대로 rename 된 파일명
			files.setChangeName(multiRequest.getFilesystemName(fileNames[i]));  
			
			if(i == 0) {
				files.setFileLevel(0);   // 메인사진
			} else {
				files.setFileLevel(1);   // 서브사진
			}
			
			fileList.add(files);
		}
		
		rooms.setFileList(fileList);
		// System.out.println(rooms);
		
		// userid는 로그인한 유저정보 불러와서 대입하기   
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		rooms.setUserId(userId);
		
		// 테스트용 임시 userid host1 이용
		// rooms.setUserId("host1");
		
		/* 비즈니스 로직 */
		int result = new RoomsService().insertRooms(rooms);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "숙소 설정을 완료했습니다. 관리자에게 등록 승인 요청을 하였습니다. 등록완료가 되면 게스트가 해당 숙소를 이용할 수 있습니다.");
			response.sendRedirect(request.getContextPath() + "/host/roomlist");
			
		} else {
			// 실패 시 저장된 사진 삭제
			for(Files files : fileList) {    // 이름 변경된 사진 파일 저장해놨으니까		
				File failedFile = new File(savePath + files.getChangeName());
				failedFile.delete();
			}
						
			request.setAttribute("message", "숙소 등록에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
		}
	}

}
