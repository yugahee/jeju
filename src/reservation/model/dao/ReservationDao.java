package reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.*;

import host.model.vo.Files;
import host.model.vo.Rooms;

public class ReservationDao {

	private Properties roomQuery = new Properties();

	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-query.xml").getPath();
		try {
			roomQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<Rooms> selectRoom(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		String sql =  roomQuery.getProperty("selectRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rooms rooms = new Rooms();
				rooms.setRoomName(rset.getString("room_name"));
				rooms.setRoomTitle(rset.getString("room_title"));
				rooms.setPrice(rset.getInt("price"));
				
				List<Files> fileList = new ArrayList<>();
				Files files = new Files();
				files.setFilePath(rset.getString("file_path"));
				files.setChangeName(rset.getString("chang_name"));
				
				fileList.add(files);
				rooms.setFileList(fileList);

				roomList.add(rooms);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return roomList;
	}
	
}
