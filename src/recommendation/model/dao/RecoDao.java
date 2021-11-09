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
											  , rset.getInt("like_count")));
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
											  , rset.getInt("like_count")));
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
											  , rset.getInt("like_count")));
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
											  , rset.getInt("like_count")));
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
											  , rset.getInt("like_count")));
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
						  				, rset.getInt("like_count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reco;
	}

}
