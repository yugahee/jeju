package recommendation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.close;

import recommendation.model.vo.Reco_Review;
import recommendation.model.vo.Recommendation;

public class RecoDao {
	private Properties recoQuery = new Properties();
	
	public RecoDao() {
		String fileName = RecoDao.class.getResource("/sql/recommendation/recommendation-query.xml").getPath();
		
		try {
			recoQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 전체 리스트 조회
	public List<Recommendation> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Recommendation> recoList = new ArrayList<>();
		
		String sql = recoQuery.getProperty("selectAllList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				recoList.add(new Recommendation(rset.getInt("reco_no")
											  , rset.getString("public_yn")
											  , rset.getInt("reco_area")
											  , rset.getString("reco_address")
											  , rset.getInt("reco_category")
											  , rset.getString("reco_expl")
											  , rset.getString("reco_keyword")
											  , rset.getString("reco_name")
											  , rset.getString("naver_map")
											  , rset.getString("kakao_map")
											  , rset.getString("reco_image")
											  , rset.getInt("like_count")
											  , rset.getString("image_name")
											  , rset.getString("coordinate")
											  , rset.getDouble("avg_score")
											  , rset.getInt("int_score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoList;
	}
	
	/* 지역과 카테고리 선택 후 select */
	public List<Recommendation> selectList(Connection conn, int recoArea, int recoCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Recommendation> recoList = new ArrayList<>();
		
		String sql = recoQuery.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recoArea);
			pstmt.setInt(2, recoCategory);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				recoList.add(new Recommendation(rset.getInt("reco_no")
											  , rset.getString("public_yn")
											  , rset.getInt("reco_area")
											  , rset.getString("reco_address")
											  , rset.getInt("reco_category")
											  , rset.getString("reco_expl")
											  , rset.getString("reco_keyword")
											  , rset.getString("reco_name")
											  , rset.getString("naver_map")
											  , rset.getString("kakao_map")
											  , rset.getString("reco_image")
											  , rset.getInt("like_count")
											  , rset.getString("image_name")
											  , rset.getString("coordinate")
											  , rset.getDouble("avg_score")
											  , rset.getInt("int_score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoList;
	}
	
	// 선호도순 리스트 조회
	public List<Recommendation> selectLikeList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Recommendation> recoList = new ArrayList<>();
		
		String sql = recoQuery.getProperty("selectLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				recoList.add(new Recommendation(rset.getInt("reco_no")
											  , rset.getString("public_yn")
											  , rset.getInt("reco_area")
											  , rset.getString("reco_address")
											  , rset.getInt("reco_category")
											  , rset.getString("reco_expl")
											  , rset.getString("reco_keyword")
											  , rset.getString("reco_name")
											  , rset.getString("naver_map")
											  , rset.getString("kakao_map")
											  , rset.getString("reco_image")
											  , rset.getInt("like_count")
											  , rset.getString("image_name")
											  , rset.getString("coordinate")
											  , rset.getDouble("avg_score")
											  , rset.getInt("int_score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoList;
	}
	
	// 별점순 리스트 조회
	public List<Recommendation> selectStarList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Recommendation> recoList = new ArrayList<>();
		
		String sql = recoQuery.getProperty("selectStarList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				recoList.add(new Recommendation(rset.getInt("reco_no")
											  , rset.getString("public_yn")
											  , rset.getInt("reco_area")
											  , rset.getString("reco_address")
											  , rset.getInt("reco_category")
											  , rset.getString("reco_expl")
											  , rset.getString("reco_keyword")
											  , rset.getString("reco_name")
											  , rset.getString("naver_map")
											  , rset.getString("kakao_map")
											  , rset.getString("reco_image")
											  , rset.getInt("like_count")
											  , rset.getString("image_name")
											  , rset.getString("coordinate")
											  , rset.getDouble("avg_score")
											  , rset.getInt("int_score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoList;
	}
	
	// 키워드 리스트 조회
	public List<Recommendation> selectKeywordList(Connection conn, String recoKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Recommendation> recoList = new ArrayList<>();
		
		String sql = recoQuery.getProperty("selectKeywordList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, recoKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				recoList.add(new Recommendation(rset.getInt("reco_no")
											  , rset.getString("public_yn")
											  , rset.getInt("reco_area")
											  , rset.getString("reco_address")
											  , rset.getInt("reco_category")
											  , rset.getString("reco_expl")
											  , rset.getString("reco_keyword")
											  , rset.getString("reco_name")
											  , rset.getString("naver_map")
											  , rset.getString("kakao_map")
											  , rset.getString("reco_image")
											  , rset.getInt("like_count")
											  , rset.getString("image_name")
											  , rset.getString("coordinate")
											  , rset.getDouble("avg_score")
											  , rset.getInt("int_score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoList;
	}
	
	// 추천장소 상세 페이지 조회
	public Recommendation selectReco(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Recommendation reco = null;
		
		String sql = recoQuery.getProperty("selectReco");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reco = new Recommendation(rset.getInt("reco_no")
									  	, rset.getString("public_yn")
									  	, rset.getInt("reco_area")
									  	, rset.getString("reco_address")
									  	, rset.getInt("reco_category")
									  	, rset.getString("reco_expl")
									  	, rset.getString("reco_keyword")
									  	, rset.getString("reco_name")
									  	, rset.getString("naver_map")
									  	, rset.getString("kakao_map")
									  	, rset.getString("reco_image")
									  	, rset.getInt("like_count")
									  	, rset.getString("image_name")
									  	, rset.getString("coordinate")
									  	, rset.getDouble("avg_score")
									  	, rset.getInt("int_score"));
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reco;
	}

	public List<Reco_Review> selectReviewList(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reco_Review> reviewList = new ArrayList<>();
		
		String sql = recoQuery.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reviewList.add(new Reco_Review(rset.getInt("reco_review_no")
											 , rset.getInt("score")
											 , rset.getString("s_comment")
											 , rset.getDate("write_time")
											 , rset.getInt("reco_no")
											 , rset.getString("user_id")
											 , rset.getString("public_yn")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reviewList;
	}
	
	// 리뷰 삭제
	public int deleteReview(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = recoQuery.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
