package host.model.service;

import host.model.dao.RoomsDao;
import host.model.vo.Files;
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.model.vo.PageInfo;
import common.model.vo.RoomReview;


public class RoomsService {
	private RoomsDao roomDao = new RoomsDao();

	public int insertRooms(Rooms rooms) {
		Connection conn = getConnection();
		
		/* Rooms 테이블에 삽입 */
		int roomResult = roomDao.insertRooms(conn, rooms);
		
		/* Files 테이블에 삽입 */
		int fileResult = 0;
		for(Files files : rooms.getFileList()) {
			fileResult += roomDao.insertFiles(conn, files);  // 결과가 1~5개
		}
		
		/* PeakSeason 테이블에 삽입 : 성수기 설정되어 있는 경우 */
		int psResult = 1;
		if(rooms.getPeak() != null) {
			int peakResult = roomDao.insertPeakSeason(conn, rooms.getPeak());
			
			if(peakResult > 0) {    // 쿼리문 제대로 작동했을 경우
				psResult = 2;
			} else {                // 쿼리문 실패했을 경우
				psResult = 0;
			}
		}
		
		int result = 0;
		if(roomResult > 0 && fileResult == rooms.getFileList().size() && psResult > 0) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public List<Rooms> selectRooms(String userId) {
		Connection conn = getConnection();
		
		List<Rooms> roomList = roomDao.selectRooms(conn, userId);
		
		close(conn);
		
		return roomList;
	}
	

	public Rooms selectRoomBasic(int roomNo) {
		Connection conn = getConnection();
		
		Rooms room = roomDao.selectRoomBasic(conn, roomNo);
		
		close(conn);
		
		return room;
	}

	public int updateRoomBasic(Rooms rooms) {
		Connection conn = getConnection();
		
		int result = roomDao.updateRoomBasic(conn, rooms);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Rooms selectRoomPrice(int roomNo) {
		Connection conn = getConnection();
		
		Rooms room = roomDao.selectRoomPrice(conn, roomNo);
		
		PeakSeason peak = roomDao.selectRoomPeak(conn, roomNo);
		
		if(peak != null) {
			room.setPeak(peak);
		}
		
		close(conn);
		
		return room;
	}

	public int updateRoomPrice(Rooms room) {
		Connection conn = getConnection();
		
		/* Rooms 테이블에 업데이트 */
		int roomResult = roomDao.updateRoomPrice(conn, room);
		// System.out.println("roomResult : " + roomResult);
		
		/* PeakSeason 테이블에 업데이트 : 성수기 설정되어 있는 경우 */
		int psResult = 1;
		if(room.getPeak() != null) {
			int peakResult = roomDao.updatePeakSeason(conn, room.getPeak());
			// System.out.println("peakResult : " + peakResult);
			
			if(peakResult > 0) {    // 쿼리문 제대로 작동했을 경우
				psResult = 2;
			} else {                // 쿼리문 실패했을 경우
				psResult = 0;
			}
		}
		
		int result = 0;
		if(roomResult > 0 && psResult > 0) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
			
		return result;
	}

	public Rooms selectRoomPhoto(int roomNo) {
		Connection conn = getConnection();
		
		Rooms room = roomDao.selectRoomPhoto(conn, roomNo);
		
		List<Files> fileList = roomDao.selectFiles(conn, roomNo);
		
		room.setFileList(fileList);
		
		close(conn);
		
		return room;
	}

	public int updateRoomPhoto(Rooms rooms) {
		Connection conn = getConnection();
		
		/* Rooms 테이블 수정  */
		int roomResult = roomDao.updateRoomPhoto(conn, rooms);
		
		// 수행한 결과 개수
		int updateFileResult = 0;
		int insertFileResult = 0;
		int updateListCount = 0;
		int insertListCount = 0;
		
		/* Files 테이블 수정 및 삽입 */
		for(Files file : rooms.getFileList()) {
			if(file.getDeletedName() != null) {
				/* 기존에 있던 파일을 덮어쓰기 - update */
				updateFileResult += roomDao.updateFile(conn, file);
				updateListCount++;
				// System.out.println("update : " + file);
				// System.out.println("updatePhotoResult : " + updateFileResult);
				
			} else {
				/* 새로 첨부 된 파일을 추가하기 - insert */
				insertFileResult += roomDao.insertAddedFile(conn, rooms.getRoomNo(), file);    
				insertListCount++;
				// System.out.println("insert : " + file);
				// System.out.println("insertPhotoResult : " + insertFileResult);
			}
		}
		
		int result = 0;
		if(roomResult > 0 && updateFileResult == updateListCount && insertFileResult == insertListCount) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteRoom(int roomNo) {
		Connection conn = getConnection();
		
		int result = roomDao.deleteRoom(conn, roomNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	// 숙소목록 페이징처리
	public Map<String, Object> selectRoomList(int page, String userId) {
		Connection conn = getConnection();
		
		/* 호스트의 숙소 전체 갯수 조회 */
		int listCount = roomDao.getListCount(conn, userId);
		// System.out.println(listCount);
		
		/* pageInfo 객체 생성 => 3 : 하단에 보여질 페이지 목록 수, 6 : 한 페이지에 보여질 게시글 최대  */
		PageInfo pi = new PageInfo(page, listCount, 3, 6);   
		
		/* 페이징 처리 된 게시글 목록 조회 */
		List<Rooms> roomList = roomDao.selectList(conn, pi, userId);
		// System.out.println(pi);
		// System.out.println(roomList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("roomList", roomList);
		
		close(conn);
		
		return map;
	}

	public int deletePeak(int roomNo) {
		Connection conn = getConnection();
		
		int result = roomDao.deletePeak(conn, roomNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	public int insertPeak(PeakSeason peak) {
		Connection conn = getConnection();
		
		int result = roomDao.insertAddPeak(conn, peak);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

//	public List<RoomReview> selectRoomReview(String userId) {
//		Connection conn = getConnection();
//		
//		List<RoomReview> reviewList = roomDao.selectRoomReview(conn, userId);
//		
//		close(conn);
//		
//		return reviewList;
//	}
	
	public Map<String, Object> selectRoomReview(int page, String userId) {
		Connection conn = getConnection();
		
		/* 호스트의 숙소 리뷰 전체 갯수 조회 */
		int reviewCount = roomDao.getReviewCount(conn, userId);
		
		/* pageInfo 객체 생성 => 3 : 하단에 보여질 페이지 목록 수, 10 : 한 페이지에 보여질 게시글 최대  */
		PageInfo reviewPi = new PageInfo(page, reviewCount, 3, 10);   
		
		/* 페이징 처리 된 리뷰 목록 조회 */
		List<RoomReview> reviewList = roomDao.selectReviewList(conn, reviewPi, userId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("reviewPi", reviewPi);
		map.put("reviewList", reviewList);
		
		return map;
	}



}
