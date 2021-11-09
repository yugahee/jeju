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

import admin.model.vo.Search;
import common.model.vo.RoomReview;

import static common.JDBCTemplate.*;

import host.model.vo.Files;
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import member.model.vo.Member;
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
				rooms.setRoomNo(rset.getInt("room_no"));
				
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

	public Rooms detailSelectRoom(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Rooms room = null;
		List<Files> fileList = null;
		String sql = roomQuery.getProperty("detailSelectRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
		
			rset = pstmt.executeQuery();
			while(rset.next()) {
			if( room == null) {
				room = new Rooms();
				room.setRoomName(rset.getString("room_name"));
				room.setRoomDes(rset.getString("room_des"));
				room.setMinPeople(rset.getInt("min_people"));
				room.setMaxPeople(rset.getInt("max_people"));
				room.setMinStay(rset.getInt("min_stay"));
				room.setMaxStay(rset.getInt("max_stay"));
				room.setPrice(rset.getInt("price"));
				room.setExtraCost(rset.getInt("extra_cost"));
				room.setStartTime(rset.getString("start_time"));
				room.setEndTime(rset.getString("end_time"));
				room.setRoomType(rset.getString("room_type"));
				room.setBuildingType(rset.getString("building_type"));
				room.setRoomSize(rset.getString("room_size"));
				room.setRoom(rset.getInt("room"));
				room.setBed(rset.getInt("bed"));
				room.setBath(rset.getInt("bath"));
				room.setRoomFac(rset.getString("room_fac"));
				room.setRoomLink(rset.getString("room_link"));
				room.setRoomNo(rset.getInt("room_no"));
				fileList = new ArrayList<>();
			}
				Files files = new Files();
				files.setFilePath(rset.getString("file_path"));
				files.setChangeName(rset.getString("change_name"));
				
				fileList.add(files);
			}

			room.setFileList(fileList);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return room;
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

	public List<RoomReview> selectRoomReview(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<RoomReview> roomReviewList = new ArrayList<>();
		String sql =  roomQuery.getProperty("selectRoomReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RoomReview roomReview = new RoomReview();
				roomReview.setStar(rset.getInt("star"));
				roomReview.setReview(rset.getString("review"));
				roomReview.setReviewDate(rset.getDate("review_date"));
				roomReview.setUserName(rset.getString("user_name"));
				
				roomReviewList.add(roomReview);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return roomReviewList;
	}


	public int reserveEndUpdate(Connection conn, int room_reserve) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  roomQuery.getProperty("reserveEndUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room_reserve);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int insertReservation(Connection conn, Member loginUser, Reservation reserveInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  roomQuery.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setDate(1, reserveInfo.getStart_date());
			pstmt.setDate(2, reserveInfo.getEnd_date());
			pstmt.setString(3, loginUser.getUser_name());
			pstmt.setString(4, loginUser.getPhone());
			pstmt.setInt(5, reserveInfo.getReserve_num());
			pstmt.setString(6, loginUser.getUser_id());
			pstmt.setInt(7, reserveInfo.getRoom_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public List<Reservation> selectReserveInfoList(Connection conn, String userId, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> reserveInfo = new ArrayList<>();
		String sql =  roomQuery.getProperty("selectReserveInfoList");
		
		// 검색 목록 조회
		if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("guestName")) {
				sql = roomQuery.getProperty("selectGuestNameList");
			} else if(search.getSearchCondition().equals("roomName"))  {
				sql = roomQuery.getProperty("selectRoomNameList");
			} else if(search.getSearchCondition().equals("reserveNum")){
				sql = roomQuery.getProperty("selectReserveNumList");
			}
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			int index = 1;
			pstmt.setString(index++, userId);
			
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(index, search.getSearchValue());
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation	reservation = new Reservation();
				reservation.setRoom_reserve(rset.getInt("room_reserve"));
				reservation.setStart_date(rset.getDate("start_date"));
				reservation.setEnd_date(rset.getDate("end_date"));
				reservation.setPerson_reserve(rset.getString("person_reserve"));
				reservation.setPone(rset.getString("pone"));
				reservation.setReserve_state(rset.getString("reserve_state"));
				reservation.setReserve_num(rset.getInt("reserve_num"));
				reservation.setRoom_no(rset.getInt("room_no"));
				
				Rooms room = new Rooms();
				room.setRoomName(rset.getString("room_name"));
				
				reservation.setRoom_info(room);
				
				reserveInfo.add(reservation);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reserveInfo;
	}


	public int paymentWaitUpdate (Connection conn, int reserve_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  roomQuery.getProperty("paymentWait");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserve_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	




	
}
