package host.model.service;

import host.model.dao.RoomsDao;
import host.model.vo.Files;
import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;


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
		
		/* PeakSeason 테이블에 업데이트 : 성수기 설정되어 있는 경우 */
		int psResult = 1;
		if(room.getPeak() != null) {
			int peakResult = roomDao.updatePeakSeason(conn, room.getPeak());
			
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
		
		return result;
	}



}
