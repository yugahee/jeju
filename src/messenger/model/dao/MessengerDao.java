package messenger.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import admin.model.vo.PageInfo;
import messenger.model.vo.Messenger;

import static common.JDBCTemplate.close;

public class MessengerDao {
	
private Properties messengerQuery = new Properties();
	
	public MessengerDao() {
		String fileName = MessengerDao.class.getResource("/sql/messenger/messenger-query.xml").getPath();
		
		try {
			messengerQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getSentListCount(Connection conn, String fromUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = messengerQuery.getProperty("getSentListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromUser);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				// count(*)의 결과만 가져오기 위해 1번 행의 값을 가져온다는 뜻으로 getInt(1)
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Messenger> selectSentList(Connection conn, PageInfo pi, String fromUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = messengerQuery.getProperty("selectSentList");
		List<Messenger> messengerList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, fromUser); // 보낸 메시지 페이징 처리를 위한 조건
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Messenger messenger = new Messenger();
				messenger.setMsg_no(rset.getInt("msg_no"));
				messenger.setMsg_cate(rset.getString("msg_cate"));
				messenger.setMsg_content(rset.getString("msg_content"));
				messenger.setChk_status(rset.getString("chk_status"));
				messenger.setReply_status(rset.getString("reply_status"));
				messenger.setMsg_date(rset.getTimestamp("msg_date"));
				messenger.setReply_date(rset.getTimestamp("reply_date"));
				messenger.setReply_content(rset.getString("reply_content"));
				messenger.setFrom_user(rset.getString("from_user"));
				messenger.setTo_user(rset.getString("to_user"));
				messenger.setMsg_status(rset.getString("msg_status"));
				messenger.setModify_date(rset.getTimestamp("modify_date"));
				messenger.setReport_user(rset.getString("report_user"));
				
				messengerList.add(messenger);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return messengerList;
	}


	public int getReceiveListCount(Connection conn, String toUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = messengerQuery.getProperty("getReceiveListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, toUser);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				// count(*)의 결과만 가져오기 위해 1번 행의 값을 가져온다는 뜻으로 getInt(1)
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Messenger> selectReceiveList(Connection conn, PageInfo pi, String toUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = messengerQuery.getProperty("selectReceiveList");
		List<Messenger> messengerList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, toUser); // 보낸 메시지 페이징 처리를 위한 조건
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Messenger messenger = new Messenger();
				messenger.setMsg_no(rset.getInt("msg_no"));
				messenger.setMsg_cate(rset.getString("msg_cate"));
				messenger.setMsg_content(rset.getString("msg_content"));
				messenger.setChk_status(rset.getString("chk_status"));
				messenger.setReply_status(rset.getString("reply_status"));
				messenger.setMsg_date(rset.getTimestamp("msg_date"));
				messenger.setReply_date(rset.getTimestamp("reply_date"));
				messenger.setReply_content(rset.getString("reply_content"));
				messenger.setFrom_user(rset.getString("from_user"));
				messenger.setTo_user(rset.getString("to_user"));
				messenger.setMsg_status(rset.getString("msg_status"));
				messenger.setModify_date(rset.getTimestamp("modify_date"));
				messenger.setReport_user(rset.getString("report_user"));
				
				messengerList.add(messenger);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return messengerList;
	}

	
	public Messenger selectMessage(Connection conn, int msgNo, String loginUser) {

		// 메시지 상세 보기 시 읽음 표시 'Y' 처리 
		PreparedStatement pstmt1 = null; 
		String sql1 =  messengerQuery.getProperty("statusMessenger");
		
		try { 
			pstmt1 = conn.prepareStatement(sql1);
		  
		    pstmt1.setInt(1, msgNo);
		    pstmt1.setString(2, loginUser);
		  
		    pstmt1.executeUpdate();
		    
		  
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally { 
			  close(pstmt1); 
		  }
		 	

		// 메시지 상세 보기
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Messenger messenger = null;
		String sql = messengerQuery.getProperty("selectMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, msgNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				messenger = new Messenger();
				messenger.setMsg_no(rset.getInt("msg_no"));
				messenger.setMsg_cate(rset.getString("msg_cate"));
				messenger.setMsg_content(rset.getString("msg_content"));
				messenger.setChk_status(rset.getString("chk_status"));
				messenger.setReply_status(rset.getString("reply_status"));
				messenger.setMsg_date(rset.getTimestamp("msg_date"));
				messenger.setReply_date(rset.getTimestamp("reply_date"));
				messenger.setReply_content(rset.getString("reply_content"));
				messenger.setFrom_user(rset.getString("from_user"));
				messenger.setTo_user(rset.getString("to_user"));
				messenger.setMsg_status(rset.getString("msg_status"));
				messenger.setModify_date(rset.getTimestamp("modify_date"));
				messenger.setReport_user(rset.getString("report_user"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return messenger;
	}
	
	
	public int modifyMessenger(Connection conn, Messenger messenger) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = messengerQuery.getProperty("modifyMessenger");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, messenger.getMsg_content());
			pstmt.setString(2, messenger.getReport_user());
			pstmt.setInt(3, messenger.getMsg_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	public int modifyReMessenger(Connection conn, Messenger messenger) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = messengerQuery.getProperty("modifyReMessenger");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, messenger.getReply_content());
			pstmt.setInt(2, messenger.getMsg_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int deleteMessage(Connection conn, int msgNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = messengerQuery.getProperty("deleteMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, msgNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertMessenger(Connection conn, Messenger messenger) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = messengerQuery.getProperty("insertMessenger");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, messenger.getMsg_cate());
			pstmt.setString(2, messenger.getMsg_content());
			pstmt.setString(3, messenger.getFrom_user());
			pstmt.setString(4, messenger.getTo_user());
			pstmt.setString(5, messenger.getReport_user());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int replyMessenger(Connection conn, Messenger messenger) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = messengerQuery.getProperty("replyMessenger");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, messenger.getReply_content());
			pstmt.setString(2, messenger.getFrom_user());
			pstmt.setString(3, messenger.getTo_user());
			pstmt.setInt(4, messenger.getMsg_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	
}
