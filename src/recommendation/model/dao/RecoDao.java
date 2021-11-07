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

}
