package payment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import host.model.vo.PeakSeason;
import payment.model.dao.PaymentDao;
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
		
		
		return 0;
	}
}
