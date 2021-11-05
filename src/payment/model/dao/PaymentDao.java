package payment.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import host.model.vo.PeakSeason;
import host.model.vo.Rooms;
import reservation.model.vo.Reservation;

public class PaymentDao {
	private Properties paymentQuery = new Properties();

	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.xml").getPath();
		try {
			paymentQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Reservation reservePayment(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation reserve = new Reservation();
		String sql =  paymentQuery.getProperty("reservePayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reserve.setRoom_reserve(reserveNo);
				reserve.setGuest(rset.getString("guest"));
				reserve.setReserve_num(rset.getInt("reserve_num"));
				reserve.setStart_date(rset.getDate("start_date"));
				reserve.setEnd_date(rset.getDate("end_date"));
				
				Rooms room = new Rooms();
				
				room.setRoomNo(rset.getInt("room_no"));
				room.setRoomName(rset.getString("room_name"));
				room.setAddress(rset.getString("address"));
				room.setPrice(rset.getInt("price"));
				
				reserve.setRoom_info(room);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return reserve;
	}


	public PeakSeason peakChk(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PeakSeason peak = new PeakSeason();
		String sql =  paymentQuery.getProperty("roomPeakCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				peak.setRoomNo(roomNo);
				peak.setPeakStart(rset.getDate("peak_start"));
				peak.setPeakEnd(rset.getDate("peak_end"));
				peak.setPeakPrice(rset.getInt("peak_price"));
			}
								
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return peak;
	}

	public int paymentInsert(Connection conn, int reserveNo, int totalPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  paymentQuery.getProperty("paymentInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			pstmt.setInt(2, totalPrice);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reserveStateUpdate(Connection conn, int reserveNo, String reserveName, String phone) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  paymentQuery.getProperty("reserveUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reserveName);
			pstmt.setString(2, phone);
			pstmt.setInt(3, reserveNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
}
