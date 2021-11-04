package point.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import point.model.vo.Point;
import static common.JDBCTemplate.*;

public class PointDao {
	
	private Properties pointQuery = new Properties();
	
	public PointDao() {
		String fileName = PointDao.class.getResource("/sql/point/point-query.xml").getPath();
		
		try {
			pointQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Point> selectPoint(Connection conn, String userId) {
		ArrayList<Point> pointList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		String sql = pointQuery.getProperty("selectPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Point point = new Point();
				point.setPointNo(rset.getInt("point_no"));
				point.setPointDate(rset.getTimestamp("point_date"));
				point.setPointDivi(rset.getString("point_divi"));
				point.setPoint(rset.getInt("point"));
				point.setRecepNum(rset.getInt("recep_no"));
				point.setPuserId(userId);
				
				pointList.add(point);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return pointList;
	}

	public Member userPoint(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		Member userPoint = new Member();
		String sql = pointQuery.getProperty("userPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userPoint.setPoint(rset.getInt("point"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return userPoint;
	}

}
