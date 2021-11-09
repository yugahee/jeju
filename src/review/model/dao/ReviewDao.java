package review.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
