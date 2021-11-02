package reservation.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import host.model.vo.Rooms;
import reservation.model.dao.ReservationDao;

public class ReservationService {

	private ReservationDao reservationDao = new ReservationDao();
	
	
	public List<Rooms> selectRoom() {
		Connection conn = getConnection();
		
		List<Rooms> roomList = reservationDao.selectRoom(conn); 
		
		close(conn);
		
		return roomList;
	}

	
}
