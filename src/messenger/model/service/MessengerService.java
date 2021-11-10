package messenger.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.model.vo.PageInfo;
import member.model.vo.Member;
import messenger.model.dao.MessengerDao;
import messenger.model.vo.Messenger;

import static common.JDBCTemplate.*;

public class MessengerService {
	
	private MessengerDao messengerDao = new MessengerDao();

	public Map<String, Object> selectList(int page) {
		Connection conn = getConnection();
		
		// 게시글 총 개수
		int listCount = messengerDao.getListCount(conn);
		
		// 페이징 처리할 객체
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// 페이징 처리 된 게시글 목록 조회
		List<Messenger> messengerList = messengerDao.selectList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("messengerList", messengerList);
		
		close(conn);
			
		return returnMap;
	}

	public Messenger selectMessage(int msgNo) {
		Connection conn = getConnection();
		
		Messenger messenger = messengerDao.selectMessage(conn, msgNo);
		
		close(conn);

		return messenger;
	}

	public int modifyMessenger(Messenger messenger) {
		Connection conn = getConnection();
		
		int result = messengerDao.modifyMessenger(conn, messenger);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
