package recommendation.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import member.model.vo.Member;
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
		
		// 리뷰 조회 추가
		List<Reco_Review> reviewList = recoDao.selectReviewList(conn, rno);
		
		reco.setReviewList(reviewList);

		close(conn);
		
		return reco;
	}
	
	// 리뷰 삭제
	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		int result = recoDao.deleteReview(conn, reviewNo);
		
		if(result > 0) {		// 삭제 잘 될 경우에 삭제된 리뷰 리스트 읽어오기
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return result;
	}
	
	// 지역만 선택된 경우 리스트 출력
	/*public List<Recommendation> selectList(int recoArea) {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn, recoArea);
		
		close(conn);
		
		return recoList;
	}*/

	// 지역과 카테고리, 라디오버튼 선택 시 리스트 출력
	/*public List<Recommendation> selectNewList(int recoArea, int recoCategory, int radio1) {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn, recoArea, recoCategory, radio1);
		
		close(conn);
		
		return recoList;
	}*/
	
	// 최종
	public List<Recommendation> selectList(String recoArea, String recoCategory, String recoKeyword, String radio1) {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn, recoArea, recoCategory, recoKeyword, radio1);
		
		close(conn);
		
		return recoList;
	}
	
	
	// 리뷰 등록
	public int insertReview(String userId, int recoNo, int score, String sComment) {
		Connection conn = getConnection();
		int result = recoDao.insertReview(conn, userId, recoNo, score, sComment);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int countLike(int no) {
		Connection conn = getConnection();		
		int result = recoDao.countLike(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
