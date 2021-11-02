package main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import host.model.vo.Rooms;
import main.model.service.MainService;

/**
 * Servlet implementation class MainRamdomRoom
 */
@WebServlet("/ramdomRoom")
public class MainRamdomRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainRamdomRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Rooms> roomList = new ArrayList<>();
		// 전체 룸 리스트 가져오기
		roomList = new MainService().randomRoom();
		
		List<Rooms> randomRoomList = new ArrayList<>();
		int[] num = new int[4];
		
		
		for(int i = 0; i < 4; i++) {
			int random = (int) (Math.random() * (roomList.size()-1)) + 1;
			num[i] = random;
			
			for(int j = 0; j < i; j++) {
				if(num[i] == num[j]) {
					i--;
				}
			}
		}
		
		for(int i = 0; i < num.length; i++) {
			randomRoomList.add(roomList.get(num[i]));
		}
		
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(randomRoomList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
