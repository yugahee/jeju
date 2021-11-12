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

	public int pointInsert(Connection conn, String userId, Point point, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = pointQuery.getProperty("pointInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, point.getPointDivi());
			pstmt.setInt(2, point.getPoint());
			pstmt.setString(3, userId);
			pstmt.setInt(4, reserveNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int userPointUpdate(Connection conn, String userId, Point point) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "";		
		
		if(point.getPointDivi().equals("사용")) {
			sql = pointQuery.getProperty("userUsingPoint");			
		}else {
			sql = pointQuery.getProperty("userAddPoint");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point.getPoint());
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int pointBack(Connection conn, int reserv_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = pointQuery.getProperty("pointBack");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserv_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}


}
