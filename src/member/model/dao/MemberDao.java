package member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.*;

import member.model.vo.Member;

public class MemberDao {
	
	private Properties memberQuery;
	
	public MemberDao() {
		memberQuery = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();
		try {
			memberQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String user_id, String user_pwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		String sql = memberQuery.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pwd);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginUser = new Member(rset.getString("user_id")
									  , rset.getString("user_pwd")
									  , rset.getString("user_name")
									  , rset.getString("phone")
									  , rset.getString("email")
									  , rset.getString("user_type")
									  , rset.getInt("point")
									  , rset.getDate("enroll_date")
									  , rset.getDate("modify_date")
									  , rset.getString("status")
									  , rset.getInt("report_count"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

}
