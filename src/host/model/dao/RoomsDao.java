package host.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
	
	// 숙소목록 불러오기 (숙소이름, 등록상태, 숙소생성일, 메인사진경로, 메인사진이름)
	public List<Rooms> selectRooms(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		String sql = roomsQuery.getProperty("selectRooms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rooms rooms = new Rooms();
				rooms.setRoomNo(rset.getInt("room_no"));
				rooms.setRoomName(rset.getString("room_name"));
				rooms.setEnrollStatus(rset.getString("enroll_status"));
				rooms.setCreateDate(rset.getTimestamp("create_date"));
				
				List<Files> fileList = new ArrayList<>();
				Files file = new Files();
				file.setFilePath(rset.getString("file_path"));
				file.setChangeName(rset.getString("change_name"));
				fileList.add(file);
				rooms.setFileList(fileList);
				
				roomList.add(rooms);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return roomList;
	}

	public Rooms selectRoomBasic(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Rooms room = null;
		String sql = roomsQuery.getProperty("selectRoomBasic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));
				room.setRoomName(rset.getString("room_name"));
				room.setRoomTitle(rset.getString("room_title"));
				room.setRoomDes(rset.getString("room_des"));
				room.setRoom(rset.getInt("room"));
				room.setBed(rset.getInt("bed"));
				room.setBath(rset.getInt("bath"));
				room.setRoomType(rset.getString("room_type"));
				room.setBuildingType(rset.getString("building_type"));
				room.setRoomSize(rset.getString("room_size"));
				room.setStartTime(rset.getString("start_time"));
				room.setEndTime(rset.getString("end_time"));
				room.setRoomFac(rset.getString("room_fac"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return room;
	}

	public int updateRoomBasic(Connection conn, Rooms rooms) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("updateRoomBasic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rooms.getRoomName());
			pstmt.setString(2, rooms.getRoomTitle());
			pstmt.setString(3, rooms.getRoomDes());
			pstmt.setInt(4, rooms.getRoom());
			pstmt.setInt(5, rooms.getBed());
			pstmt.setInt(6, rooms.getBath());
			pstmt.setString(7, rooms.getRoomType());
			pstmt.setString(8, rooms.getBuildingType());
			pstmt.setString(9, rooms.getRoomSize());
			pstmt.setString(10, rooms.getStartTime());
			pstmt.setString(11, rooms.getEndTime());
			pstmt.setString(12, rooms.getRoomFac());
			pstmt.setInt(13, rooms.getRoomNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Rooms selectRoomPrice(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Rooms room = null;
		String sql = roomsQuery.getProperty("selectRoomPrice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));
				room.setPrice(rset.getInt("price"));
				room.setExtraCost(rset.getInt("extra_cost"));
				room.setMinPeople(rset.getInt("min_people"));
				room.setMaxPeople(rset.getInt("max_people"));
				room.setMinStay(rset.getInt("min_stay"));
				room.setMaxStay(rset.getInt("max_stay"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return room;
	}

	public PeakSeason selectRoomPeak(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PeakSeason peak = null;
		String sql = roomsQuery.getProperty("selectRoomPeak");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				peak = new PeakSeason();
				peak.setRoomNo(rset.getInt("room_no"));
				peak.setPeakStart(rset.getDate("peak_start"));
				peak.setPeakEnd(rset.getDate("peak_end"));
				peak.setPeakPrice(rset.getInt("peak_price"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return peak;
	}

}
