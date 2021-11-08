package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDao {
	
	private Properties memberQuery = new Properties();
	
	public MemberDao() {
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
	

	public Member selectMember(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member updatedMember = new Member();
		String sql = memberQuery.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				updatedMember.setUser_id(rset.getString("user_id"));
				updatedMember.setUser_pwd(rset.getString("user_pwd"));
				updatedMember.setUser_name(rset.getString("user_name"));
				updatedMember.setEmail(rset.getString("email"));
				updatedMember.setPhone(rset.getString("phone"));
				updatedMember.setPoint(rset.getInt("point"));
				updatedMember.setUser_type(rset.getString("user_type"));
				updatedMember.setEnroll_date(rset.getDate("enroll_date"));
				updatedMember.setModify_date(rset.getDate("modify_date"));
				updatedMember.setReport_count(rset.getInt("report_count"));
				updatedMember.setStatus(rset.getString("status"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return updatedMember;
	}
	
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getUser_name());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getUser_id());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMail(Connection conn, String user_id, String user_mail, String newMail) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("updateMail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newMail);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_mail);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkId(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = memberQuery.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				// 결과가 0명인지 1명인지 카운트한 값 = 첫 번째 컬럼의 인덱스를 가져옴
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_pwd());
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getUser_type());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String findId(Connection conn, String userName, String userMail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = "";
		String sql = memberQuery.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, userMail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString("user_id");
			} else { 
				// 쿼리문 조회 실패 시 null값 넣어줘서 오류 잡기
				userId = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}

	public int updatePwd(Connection conn, String userId, String userMail, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userMail);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAccount(Connection conn, String userId, String reason) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("deleteAcount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reason);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkEmail(Connection conn, String to_email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = memberQuery.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, to_email);			
			rset = pstmt.executeQuery();			
			if(rset.next()) {
				result = rset.getInt(1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
}
