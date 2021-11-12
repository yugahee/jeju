package recommendation.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import recommendation.model.dao.RecoDao;
import recommendation.model.vo.Reco_Review;
import recommendation.model.vo.Recommendation;

public class RecoService {
	
	private RecoDao recoDao = new RecoDao();
	
	// 전체 리스트 출력
	public List<Recommendation> selectList() {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn);
		
		close(conn);
		
		return recoList;
	}
	
	// 카테고리 선택 시 리스트 출력
	public List<Recommendation> selectList(int recoArea, int recoCategory) {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn, recoArea, recoCategory);
		
		recoList = recoDao.selectList(conn, recoArea, recoCategory);
	
		close(conn);
		
		return recoList;
	}
	
	// 선호도순 리스트 출력
	public List<Recommendation> selectLikeList() {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectLikeList(conn);
		
		close(conn);
		
		return recoList;
	}
	
	// 별점순 리스트 출력
	public List<Recommendation> selectStarList() {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectStarList(conn);
		
		close(conn);
		
		return recoList;
	}
	
	// 키워드 리스트 출력
	public List<Recommendation> selectList(String recoKeyword) {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectKeywordList(conn, recoKeyword);
		
		close(conn);
		
		return recoList;
	}
	
	// 상세 페이지 조회
	public Recommendation selectReco(int rno) {
		Connection conn = getConnection();
		Recommendation reco = recoDao.selectReco(conn, rno);
		
		// 댓글 조회 추가
		List<Reco_Review> reviewList = recoDao.selectReviewList(conn, rno);
		
		reco.setReviewList(reviewList);

		close(conn);
		
		return reco;
	}
	
	// 리뷰 삭제
	public List<Reco_Review> deleteReview(int reviewNo, int rno) {
		Connection conn = getConnection();
		List<Reco_Review> reviewList = null;
		int result = recoDao.deleteReview(conn, reviewNo);
		
		if(result > 0) {		// 삭제 잘 될 경우에 삭제된 리뷰 리스트 읽어오기
			reviewList = recoDao.selectReviewList(conn, rno);
			System.out.println(1);
			commit(conn);
		} else {
			System.out.println(0);
			rollback(conn);
		}
		
		System.out.println(reviewList);		// 아 왜 계속 null 뜨지ㅠㅠㅠㅠㅠㅠ
		
		close(conn);
		
		return reviewList;
	}

}
