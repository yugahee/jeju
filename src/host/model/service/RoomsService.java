package host.model.service;

import host.model.dao.RoomsDao;
import host.model.vo.Files;
import host.model.vo.Rooms;
import static common.JDBCTemplate.*;

import java.sql.Connection; 

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
	

}
