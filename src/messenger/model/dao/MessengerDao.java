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

	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = messengerQuery.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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

	public List<Messenger> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = messengerQuery.getProperty("selectList");
		List<Messenger> messengerList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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

	public Messenger selectMessage(Connection conn, int msgNo) {
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

}
