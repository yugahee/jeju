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

import admin.model.vo.PageInfo;
import admin.model.vo.Search;
import common.model.vo.RoomReview;

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

	public int updateRoomPrice(Connection conn, Rooms room) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("updateRoomPrice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room.getMinStay());
			pstmt.setInt(2, room.getMaxStay());
			pstmt.setInt(3, room.getMinPeople());
			pstmt.setInt(4, room.getMaxPeople());
			pstmt.setInt(5, room.getPrice());
			pstmt.setInt(6, room.getExtraCost());
			pstmt.setInt(7, room.getRoomNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePeakSeason(Connection conn, PeakSeason peak) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("updatePeakSeason");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, peak.getPeakStart());
			pstmt.setDate(2, peak.getPeakEnd());
			pstmt.setInt(3, peak.getPeakPrice());
			pstmt.setInt(4, peak.getRoomNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Rooms selectRoomPhoto(Connection conn, int roomNo) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		Rooms room = null;
		String sql = roomsQuery.getProperty("selectRoomPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));
				room.setLocation(rset.getString("location"));
				room.setAddress(rset.getString("address"));
				room.setRoomLink(rset.getString("room_link"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return room;
	}

	public List<Files> selectFiles(Connection conn, int roomNo) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		List<Files> fileList = new ArrayList<>();
		String sql = roomsQuery.getProperty("selectFiles");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Files file = new Files();
				file.setRoomNo(rset.getInt("room_no"));
				file.setChangeName(rset.getString("change_name"));
				file.setFilePath(rset.getString("file_path"));
				file.setFileLevel(rset.getInt("file_level"));
				
				fileList.add(file);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fileList;
	}

	public int updateRoomPhoto(Connection conn, Rooms rooms) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("updateRoomPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rooms.getLocation());
			pstmt.setString(2, rooms.getAddress());
			pstmt.setString(3, rooms.getRoomLink());
			pstmt.setInt(4, rooms.getRoomNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateFile(Connection conn, Files file) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("updateFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getChangeName());
			pstmt.setString(2, file.getDeletedName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAddedFile(Connection conn, int roomNo, Files file) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("insertAddedFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getChangeName());
			pstmt.setInt(2, roomNo);
			pstmt.setString(3, file.getFilePath());
			pstmt.setInt(4, file.getFileLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public int deleteRoom(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("deleteRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;
	}

//	public List<RoomReview> selectRoomReview(Connection conn, String userId) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		List<RoomReview> reviewList = new ArrayList<>();
//		String sql = roomsQuery.getProperty("selectRoomReview");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userId);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				RoomReview review = new RoomReview();
//				review.setRoomNo(rset.getInt("room_no"));
//				review.setRoomName(rset.getString("room_name"));
//				review.setReview(rset.getString("review"));
//				review.setReviewDate(rset.getDate("review_date"));
//				review.setUserId(rset.getString("user_id"));
//				
//				reviewList.add(review);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}	
//		
//		return reviewList;
//	}

	public int getListCount(Connection conn, String userId, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = roomsQuery.getProperty("getListCount");    // 전체 목록 조회 
		
		// 검색 목록 조회 (검색 조건 있는 경우)
		if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("roomname")) {
				sql = roomsQuery.getProperty("getRnameListCount");
			} else if(search.getSearchCondition().equals("roomstatus")) {
				sql = roomsQuery.getProperty("getRstatusListCount");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			// 검색목록조회 sql문 실행시
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(2, search.getSearchValue());
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);   // 결과로 나온 개수에 해당하는 숫자값 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listCount;
	}

	public List<Rooms> selectList(Connection conn, PageInfo pi, String userId, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Rooms> roomList = new ArrayList<>();
		String sql = roomsQuery.getProperty("selectList");  // 전체목록 조회
		
		// 검색 목록 조회
		if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("roomname")) {
				sql = roomsQuery.getProperty("selectRnameList");
			} else if(search.getSearchCondition().equals("roomstatus")) {
				sql = roomsQuery.getProperty("selectRstatusList");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			int index = 1;
			pstmt.setString(index++, userId);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			// 검색 목록 조회 sql 실행
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(index++, search.getSearchValue());
			}
			
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rooms room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));
				room.setRoomName(rset.getString("room_name"));
				room.setEnrollStatus(rset.getString("enroll_status"));
				room.setCreateDate(rset.getTimestamp("create_date"));
				
				List<Files> fileList = new ArrayList<>();
				Files file = new Files();
				file.setFilePath(rset.getString("file_path"));
				file.setChangeName(rset.getString("change_name"));
				fileList.add(file);
				room.setFileList(fileList);
				
				roomList.add(room);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return roomList;
	}

	public int deletePeak(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("deletePeak");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAddPeak(Connection conn, PeakSeason peak) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = roomsQuery.getProperty("insertAddPeak");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, peak.getRoomNo());
			pstmt.setDate(2, peak.getPeakStart());
			pstmt.setDate(3, peak.getPeakEnd());
			pstmt.setInt(4, peak.getPeakPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 리뷰 목록 개수 조회
	public int getReviewCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int reviewCount = 0;
		String sql = roomsQuery.getProperty("getReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reviewCount = rset.getInt(1);   // 결과로 나온 개수에 해당하는 숫자값 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return reviewCount;
	}

	public List<RoomReview> selectReviewList(Connection conn, PageInfo pi, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<RoomReview> reviewList = new ArrayList<>();
		String sql = roomsQuery.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RoomReview review = new RoomReview();
				review.setRoomNo(rset.getInt("room_no"));
				review.setRoomName(rset.getString("room_name"));
				review.setReview(rset.getString("review"));
				review.setReviewDate(rset.getDate("review_date"));
				review.setUserId(rset.getString("user_id"));
				
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
			
		return reviewList;
	}

}
