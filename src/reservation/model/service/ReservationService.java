package reservation.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;

public class ReservationService {

	private ReservationDao reservationDao = new ReservationDao();
	
	
	public List<Rooms> selectRoom() {
		Connection conn = getConnection();
		
		List<Rooms> roomList = reservationDao.selectRoom(conn);	
				
		close(conn);
		
		return roomList;
	}
	
	public Rooms detailSelectRoom(int roomNo) {
		Connection conn = getConnection();
		
		Rooms room = reservationDao.detailSelectRoom(conn, roomNo);
		
		close(conn);
		
		return room;
	}
	

	public List<Reservation> userReservation(String userId) {
		Connection conn = getConnection();
		
		List<Reservation> reservationList = reservationDao.userReservation(conn, userId);
		
		close(conn);
		
		return reservationList;
	}


	public int reservationCancle(int reserv_no) {
		Connection conn = getConnection();
		
		int result = reservationDao.reservationCancle(conn, reserv_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int reserveEndUpdate(int room_reserve) {
		Connection conn = getConnection();
		
		int result = reservationDao.reserveEndUpdate(conn, room_reserve);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}


	



	
}
