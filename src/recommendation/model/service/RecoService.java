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
		
//		// 카테고리와 지역 선택이 완료된 경우 목록 조회
//		if(recoArea != 0 && recoCategory != 0) {
//			recoList = recoDao.selectList(conn, recoArea, recoCategory);
//		} else {	// 전달되지 않았다면 모든 목록 조회
//			recoList = recoDao.selectList(conn);
//		}
		
		close(conn);
		
		return recoList;
	}

}
