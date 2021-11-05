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

	public int insertPoint(String userId, Point point, int reserveNo) {
		Connection conn = getConnection();
		
		int result = pointDao.pointInsert(conn, userId, point, reserveNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int userPointUpdate(String userId, Point point) {
		Connection conn = getConnection();
		
		int result = pointDao.userPointUpdate(conn, userId, point);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	
}
