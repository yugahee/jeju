package point.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.vo.Member;
import point.model.dao.PointDao;
import point.model.vo.Point;

public class PointService {
	
	private PointDao pointDao = new PointDao();
	
	public ArrayList<Point> selectPoint(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Point> pointList = pointDao.selectPoint(conn, userId);
		
		close(conn);
		
		return pointList;
	}

	public Member userPoint(String userId) {
		Connection conn = getConnection();
		
		Member userPoint = pointDao.userPoint(conn, userId);
		
		close(conn);
		
		return userPoint;
	}

	
	
}
