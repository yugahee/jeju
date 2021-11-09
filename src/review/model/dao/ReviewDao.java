package review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import common.model.vo.RoomReview;

public class ReviewDao {
	private Properties reviewQuery = new Properties();
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/review/review-query.xml").getPath();
		
		try {
			reviewQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int reviewInsert(Connection conn, RoomReview roomReview, int starScore) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = reviewQuery.getProperty("roomReviewInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, starScore);
			pstmt.setString(2, roomReview.getReview());
			pstmt.setInt(3, roomReview.getRoomNo());
			pstmt.setString(4, roomReview.getUserId());
			pstmt.setInt(5, roomReview.getReserveNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public RoomReview selectReview(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = reviewQuery.getProperty("selectReview");
		RoomReview review = new RoomReview();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				review.setReviewNo(rset.getInt("review_no"));
				review.setStar(rset.getDouble("star"));
				review.setReview(rset.getString("review"));
				review.setRoomNo(rset.getInt("review_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
				
		return review;
	}

	public int reviewUpdate(Connection conn, RoomReview roomReview, int star) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = reviewQuery.getProperty("roomReviewUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, star);
			pstmt.setString(2, roomReview.getReview());
			pstmt.setInt(3, roomReview.getReviewNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
