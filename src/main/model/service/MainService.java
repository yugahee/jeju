package main.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import host.model.vo.Rooms;
import main.model.dao.MainDao;

public class MainService {
	
	private MainDao mainDao = new MainDao();

	public List<Rooms> randomRoom() {
		Connection conn = getConnection();
		
		List<Rooms> roomList = mainDao.roomList(conn); 
		
		close(conn);
		
		return roomList;
	}

}
