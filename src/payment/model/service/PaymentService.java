package payment.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import host.model.vo.PeakSeason;
import payment.model.dao.PaymentDao;
import payment.model.vo.Payment;
import reservation.model.vo.Reservation;

public class PaymentService {
	private PaymentDao paymentDao = new PaymentDao();
	
	public Reservation reservePayment(int reserveNo) {
		Connection conn = getConnection();
		
		Reservation reserve = paymentDao.reservePayment(conn, reserveNo);
		
		close(conn);
		
		return reserve;
	}


	public PeakSeason peakChk(int roomNo) {
		Connection conn = getConnection();
		
		PeakSeason peak = paymentDao.peakChk(conn, roomNo);
		
		close(conn);
		
		return peak;
	}


	public int paymentInsert(int reserveNo, int totalPrice) {
		Connection conn = getConnection();
		
		int result = paymentDao.paymentInsert(conn, reserveNo, totalPrice);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public int reserveStateUpdate(int reserveNo, String reserveName, String phone) {
		Connection conn = getConnection();
		
		int result = paymentDao.reserveStateUpdate(conn, reserveNo, reserveName, phone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public Payment reservePayCheck(int reserv_no) {
		Connection conn = getConnection();
		
		Payment pay = paymentDao.reservePayCheck(conn, reserv_no);
		
		close(conn);
		
		return pay;
	}


	public int payBack(int reserv_no) {
		Connection conn = getConnection();
		
		int result = paymentDao.payBack(conn, reserv_no);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
