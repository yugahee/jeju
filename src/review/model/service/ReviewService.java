package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import common.model.vo.RoomReview;
import review.model.dao.ReviewDao;


public class ReviewService {
	private ReviewDao reviewDao = new ReviewDao();
	
	public int reviewInsert(RoomReview roomReview, int starScore) {
		Connection conn = getConnection();
		
		int result = reviewDao.reviewInsert(conn, roomReview, starScore);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public RoomReview selectReview(int reserveNo) {
		Connection conn = getConnection();
		
		RoomReview review = reviewDao.selectReview(conn, reserveNo);
		
		close(conn);
		
		return review;
	}

	public int roomReviewUpdate(RoomReview roomReview, int star) {
		Connection conn = getConnection();
		
		int result = reviewDao.reviewUpdate(conn, roomReview, star);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
