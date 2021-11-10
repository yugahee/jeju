package messenger.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.model.vo.PageInfo;
import messenger.model.dao.MessengerDao;
import messenger.model.vo.Messenger;

import static common.JDBCTemplate.*;

public class MessengerService {
	
	private MessengerDao messengerDao = new MessengerDao();

	public Map<String, Object> selectSentList(int page, String fromUser) {
		Connection conn = getConnection();
		
		// 게시글 총 개수
		int listCount = messengerDao.getSentListCount(conn, fromUser);
		
		// 페이징 처리할 객체
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		
		// 페이징 처리 된 게시글 목록 조회
		List<Messenger> messengerList = messengerDao.selectSentList(conn, pi, fromUser);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("messengerList", messengerList);
		
		close(conn);
			
		return returnMap;
	}
	
	
	public Map<String, Object> selectReceiveList(int page, String toUser) {
		Connection conn = getConnection();
		
		// 게시글 총 개수
		int listCount = messengerDao.getReceiveListCount(conn, toUser);
		
		// 페이징 처리할 객체
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		
		// 페이징 처리 된 게시글 목록 조회
		List<Messenger> messengerList = messengerDao.selectReceiveList(conn, pi, toUser);
		
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
