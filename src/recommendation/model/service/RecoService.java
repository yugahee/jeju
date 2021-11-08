package recommendation.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;
import recommendation.model.dao.RecoDao;
import recommendation.model.vo.Recommendation;

public class RecoService {
	
	private RecoDao recoDao = new RecoDao();

	public List<Recommendation> selectList() {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn);
		
		close(conn);
		
		return recoList;
	}

	public List<Recommendation> selectList(int recoArea, int recoCategory) {
		Connection conn = getConnection();
		List<Recommendation> recoList = recoDao.selectList(conn, recoArea, recoCategory);
		
		recoList = recoDao.selectList(conn, recoArea, recoCategory);
	
		close(conn);
		
		return recoList;
	}

}
