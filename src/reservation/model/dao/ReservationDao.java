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

import admin.model.vo.PageInfo;
import admin.model.vo.Search;
import common.model.vo.RoomReview;

import static common.JDBCTemplate.*;

import host.model.vo.Files;
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import member.model.vo.Member;
import reservation.model.vo.Reservation;
import reservation.model.vo.RoomSearch;

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
	
	// 숙소예약 클릭 시 숙소 전체목록 조회 
	public List<Rooms> selectRoomList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		
		String sql = roomQuery.getProperty("selectRoomList");
		
		
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
	
	// 조건검색 시 숙소리스트 목록 조회 
	public List<Rooms> filterRoomList(Connection conn, RoomSearch roomSearch) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> filterRoomList = new ArrayList<>();
		String sql = roomQuery.getProperty("filterRoomList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, roomSearch.getLocation());
			pstmt.setString(2, roomSearch.getRoom_type());
			pstmt.setString(3, roomSearch.getSpecialFac());
			pstmt.setString(4, roomSearch.getBuilding_type());
			
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

				filterRoomList.add(rooms);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return filterRoomList;
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
				room.setAddress(rset.getString("address"));
				room.setRoomNo(rset.getInt("room_no"));
				room.setUserId(rset.getString("user_id"));
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
				room.setUserId(rset.getString("user_id"));
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

//	public List<RoomReview> selectRoomReview(Connection conn, int roomNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		List<RoomReview> roomReviewList = new ArrayList<>();
//		String sql =  roomQuery.getProperty("selectRoomReview");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, roomNo);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				RoomReview roomReview = new RoomReview();
//				roomReview.setStar(rset.getInt("star"));
//				roomReview.setReview(rset.getString("review"));
//				roomReview.setReviewDate(rset.getDate("review_date"));
//				roomReview.setUserName(rset.getString("user_name"));
//				
//				roomReviewList.add(roomReview);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//			close(rset);
//		}
//		
//		
//		return roomReviewList;
//	}

	
	// 리뷰게시글 총 개수 구하기 
	public int getReviewCount(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int reviewCount = 0;
		String sql = roomQuery.getProperty("getReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reviewCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		
		return reviewCount;
	}
	
	// 페이징 처리 된 숙소 리뷰 조회 
	public List<RoomReview> selectRoomReview(Connection conn, PageInfo reviewPi, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<RoomReview> roomReviewList = new ArrayList<>();
		String sql =  roomQuery.getProperty("selectRoomReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			int startRow = (reviewPi.getPage() - 1) * reviewPi.getBoardLimit() + 1;
			int endRow = startRow + reviewPi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
		List<Reservation> reserveInfoList = new ArrayList<>();
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
				
				reserveInfoList.add(reservation);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reserveInfoList;
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


	public int reviewComplete(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  roomQuery.getProperty("reviewComplete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int reserveRequestCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int reserveRequestCount = 0;
		String sql =  roomQuery.getProperty("reserveRequestCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reserveRequestCount = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reserveRequestCount;
	}


	public int paymentWaitCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int paymentWaitCount = 0;
		String sql =  roomQuery.getProperty("paymentWaitCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				paymentWaitCount = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return paymentWaitCount;
	}


	public int reserveCancleCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int reserveCancleCount = 0;
		String sql =  roomQuery.getProperty("reserveCancleCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reserveCancleCount = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reserveCancleCount;
	}


	public int reserveCompletion(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int reserveCompletion = 0;
		String sql =  roomQuery.getProperty("reserveCompletion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reserveCompletion = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reserveCompletion;
	}


	public int lodgeCompletion(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int lodgeCompletion = 0;
		String sql =  roomQuery.getProperty("lodgeCompletion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				lodgeCompletion = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return lodgeCompletion;
	}


	public List<Reservation> possibleReservation(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> possibleReservList = new ArrayList<>();
		String sql = roomQuery.getProperty("possibleReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Reservation reserve = new Reservation();
				reserve.setStart_date(rset.getDate("start_date"));
				reserve.setEnd_date(rset.getDate("end_date"));
				
				possibleReservList.add(reserve);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return possibleReservList;
	}

	// 숙소 리스트 뷰에서 체크인, 체크아웃 날짜로 검색 시 
	public List<Rooms> searchRoomList(Connection conn, RoomSearch search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		
		String sql = roomQuery.getProperty("roomSearch1");

		
		try {
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setString(1, search.getCheckIn());
			pstmt.setString(2, search.getCheckOut());

			
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

	
	// 숙소 리스트 뷰에서 조건 검색으로 검색 시  
	public List<Rooms> searchRoomList2(Connection conn, RoomSearch search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		
		String sql = roomQuery.getProperty("roomSearch2");
		
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search.getSpecialFac());
			pstmt.setString(2, search.getLocation());
			pstmt.setString(3, search.getRoom_type());
			pstmt.setString(4, search.getBuilding_type());
			
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

	public List<Rooms> searchRoomList3(Connection conn, RoomSearch search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		String sql = roomQuery.getProperty("roomSearch3");			
		
		if(search.getCheckIn().equals("") || search.getCheckOut().equals("")) {
			sql = roomQuery.getProperty("roomSearch4");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			if(!search.getCheckIn().equals("") || !search.getCheckOut().equals("")) {
				pstmt.setString(1, search.getCheckIn());
				pstmt.setString(2, search.getCheckOut());
				pstmt.setString(3, search.getLocation());
			}else {
				pstmt.setString(1, search.getLocation());
			}
			
			
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



	
}
