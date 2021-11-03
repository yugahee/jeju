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
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import reservation.model.vo.Reservation;

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
				rooms.setLocation(rset.getString("location"));
				rooms.setRoomName(rset.getString("room_name"));
				rooms.setRoomTitle(rset.getString("room_title"));
				rooms.setPrice(rset.getInt("price"));
				rooms.setStar(rset.getDouble("star"));
				
				List<Files> fileList = new ArrayList<>();
				Files files = new Files();
				files.setFilePath(rset.getString("file_path"));
				files.setChangeName(rset.getString("change_name"));
				
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


	public List<Reservation> userReservation(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> reservationList = new ArrayList<>();
		String sql =  roomQuery.getProperty("userReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation reserve = new Reservation();
				reserve.setRoom_reserve(rset.getInt("room_reserve"));
				reserve.setGuest(userId);
				reserve.setPerson_reserve(rset.getString("person_reserve"));
				reserve.setStart_date(rset.getDate("start_date"));
				reserve.setEnd_date(rset.getDate("end_date"));
				reserve.setReserve_num(rset.getInt("reserve_num"));
				reserve.setReserve_state(rset.getString("reserve_state"));						
				
				Rooms room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));
				room.setRoomName(rset.getString("room_name"));
				room.setAddress(rset.getString("address"));
				room.setStartTime(rset.getString("start_time"));
				room.setEndTime(rset.getString("end_time"));
				
				Files file = new Files();
				file.setFilePath(rset.getString("file_path"));
				file.setChangeName(rset.getString("change_name"));
				List<Files> fileList = new ArrayList<>();
				fileList.add(file);
				
				room.setFileList(fileList);
				
				reserve.setRoom_info(room);
				
				reservationList.add(reserve);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return reservationList;
	}


	public int reservationCancle(Connection conn, int reserv_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  roomQuery.getProperty("reservationCancle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserv_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}	

	
}
