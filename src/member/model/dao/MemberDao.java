package member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import static common.JDBCTemplate.*;

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
	

	public List<Member> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("searchMember");
		List<Member> MemberList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUser_id(rset.getString("user_id"));
				member.setUser_name(rset.getString("user_name"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setPoint(rset.getInt("point"));
				member.setUser_type(rset.getString("user_type"));
				member.setEnroll_date(rset.getDate("enroll_date"));
				member.setModify_date(rset.getDate("modify_date"));
				member.setReport_count(rset.getInt("report_count"));
				member.setStatus(rset.getString("status"));
				MemberList.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return MemberList;
	}

	public Member selectMemberDetail(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = new Member();
		String sql = memberQuery.getProperty("searchMemberDetail");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {			
				member.setUser_id(rset.getString("user_id"));
				member.setUser_pwd(rset.getString("user_pwd"));
				member.setUser_name(rset.getString("user_name"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setPoint(rset.getInt("point"));
				member.setUser_type(rset.getString("user_type"));
				member.setEnroll_date(rset.getDate("enroll_date"));
				member.setModify_date(rset.getDate("modify_date"));
				member.setReport_count(rset.getInt("report_count"));
				member.setStatus(rset.getString("status"));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return member;
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

}
