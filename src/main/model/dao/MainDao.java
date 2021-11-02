package main.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import host.model.vo.Files;
import host.model.vo.Rooms;


public class MainDao {
	private Properties mainQuery = new Properties();
	
	public MainDao() {
		String fileName = MainDao.class.getResource("/sql/main/main-query.xml").getPath();
		
		try {
			mainQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<Rooms> roomList(Connection conn) {
		List<Rooms> roomList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		String sql = mainQuery.getProperty("roomList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rooms room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));
				room.setLocation(rset.getString("location"));
				room.setRoomName(rset.getString("room_name"));
				room.setRoomTitle(rset.getString("room_title"));
				
				Files file = new Files();
				file.setChangeName(rset.getString("change_name"));
				file.setFilePath(rset.getString("file_path"));
				
				List fileList = new ArrayList<>();
				fileList.add(file);
				
				room.setFileList(fileList);
				
				roomList.add(room);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return roomList;
	}

}
