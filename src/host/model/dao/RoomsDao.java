package host.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.close;

import host.model.vo.Files;
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;

public class RoomsDao {
	private Properties roomsQuery = new Properties();
	
	public RoomsDao() {
		String fileName = RoomsDao.class.getResource("/sql/host/rooms-query.xml").getPath();
		try {
			roomsQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertRooms(Connection conn, Rooms rooms) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("insertRooms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rooms.getUserId());
			pstmt.setString(2, rooms.getAddress());
			pstmt.setString(3, rooms.getLocation());
			pstmt.setString(4, rooms.getRoomName());
			pstmt.setString(5, rooms.getRoomTitle());
			pstmt.setString(6, rooms.getRoomDes());
			pstmt.setString(7, rooms.getRoomType());
			pstmt.setString(8, rooms.getRoomFac());
			pstmt.setInt(9, rooms.getPrice());
			pstmt.setInt(10, rooms.getMinPeople());
			pstmt.setInt(11, rooms.getMaxPeople());
			pstmt.setString(12, rooms.getStartTime());
			pstmt.setString(13, rooms.getEndTime());
			pstmt.setInt(14, rooms.getRoom());
			pstmt.setInt(15, rooms.getBed());
			pstmt.setInt(16, rooms.getBath());
			pstmt.setString(17, rooms.getBuildingType());
			pstmt.setString(18, rooms.getRoomSize());
			pstmt.setInt(19, rooms.getMinStay());
			pstmt.setInt(20, rooms.getMaxStay());
			pstmt.setString(21, rooms.getRoomLink());
			pstmt.setInt(22, rooms.getExtraCost());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertFiles(Connection conn, Files files) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("insertFiles");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, files.getChangeName());
			pstmt.setString(2, files.getFilePath());
			pstmt.setInt(3, files.getFileLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPeakSeason(Connection conn, PeakSeason peak) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("insertPeakSeason");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, peak.getPeakStart());
			pstmt.setDate(2, peak.getPeakEnd());
			pstmt.setInt(3, peak.getPeakPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
