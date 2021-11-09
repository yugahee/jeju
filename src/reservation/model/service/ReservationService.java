package reservation.model.service;

import java.sql.Connection;
import java.util.List;

import admin.model.vo.Search;
import common.model.vo.RoomReview;

import static common.JDBCTemplate.*;

import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import member.model.vo.Member;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;

public class ReservationService {

	private ReservationDao reservationDao = new ReservationDao();
	
	// 숙소예약 화면 리스트 조회 
	public List<Rooms> selectRoom() {
		Connection conn = getConnection();
		
		List<Rooms> roomList = reservationDao.selectRoom(conn);	
				
		close(conn);
		
		return roomList;
	}
	
	// 숙소예약 화면에서 숙소 클릭 시 디테일 정보  조회 
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
		
		close(conn);
		
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
		
		close(conn);
		
		return result;
	}


	// 숙소 예약 화면(디테일 뷰) 리뷰 조회 
	public List<RoomReview> selectRoomReview(int roomNo) {
		Connection conn = getConnection();
		
		List<RoomReview> roomReviewList = reservationDao.selectRoomReview(conn, roomNo);
		
		close(conn);
		
		return roomReviewList;
	}

	// 예약 신청 버튼 클릭 후 확인 버튼 클릭 시 예약자 정보 삽입 
	public int insertReservation(Member loginUser, Reservation reserveInfo) {
		Connection conn = getConnection();
		
		int result = reservationDao.insertReservation(conn, loginUser, reserveInfo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 예약테이블에서 예약자 정보 조회
	public List<Reservation> selectReserveInfoList(String userId, Search search) {
		Connection conn = getConnection();
		
		List<Reservation> reserveInfo = reservationDao.selectReserveInfoList(conn, userId, search);
		
		 close(conn);
		
		return reserveInfo;
	}

	// 예약상태 '결제대기'로 업데이트
	public int paymentWaitUpdate (int reserve_no) {
		Connection conn = getConnection();
		
		int result = reservationDao.paymentWaitUpdate(conn, reserve_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int reviewComplete(int reserveNo) {
		Connection conn = getConnection();
		
		int result = reservationDao.reviewComplete(conn, reserveNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}





	




	



	
}
