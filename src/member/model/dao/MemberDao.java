package member.model.dao;

import static common.JDBCTemplate.close;

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
import admin.model.vo.Search;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public List<Member> selectList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("searchMember");
		List<Member> MemberList = new ArrayList<>();

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = memberQuery.getProperty("searchMemberAllId");
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = memberQuery.getProperty("searchMemberAllName");
				}
			}else if((search.getSearchCondition().equals("호스트") || search.getSearchCondition().equals("게스트")) && search.getSearchValue() != null) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = memberQuery.getProperty("searchMemberId");					
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = memberQuery.getProperty("searchMemberName");					
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			 
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;	
			if((sql == memberQuery.getProperty("searchMemberAllId")) || (sql == memberQuery.getProperty("searchMemberAllName"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == memberQuery.getProperty("searchMemberId")) || (sql == memberQuery.getProperty("searchMemberName"))) {
				pstmt.setString(index++, search.getSearchCondition());
				pstmt.setString(index++, search.getSearchValue());
			}
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);

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

	public int getListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = memberQuery.getProperty("getListCount");

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = memberQuery.getProperty("getListCountAllId");
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = memberQuery.getProperty("getListCountAllName");
				}
			}else if((search.getSearchCondition().equals("호스트") || search.getSearchCondition().equals("게스트")) && search.getSearchValue() != null) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = memberQuery.getProperty("getListCountMemberId");					
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = memberQuery.getProperty("getListCountMemberName");					
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			if((sql == memberQuery.getProperty("getListCountAllId")) || (sql == memberQuery.getProperty("getListCountAllName"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == memberQuery.getProperty("getListCountMemberId")) || (sql == memberQuery.getProperty("getListCountMemberName"))) {
				pstmt.setString(index++, search.getSearchCondition());
				pstmt.setString(index++, search.getSearchValue());
			}
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public int modifyMember(Connection conn, Member member, String idVal, String statusVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("updateMemberStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, statusVal);
			pstmt.setString(2, idVal);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String idVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("deleteMemberStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idVal);
			
			result = pstmt.executeUpdate();
			
			System.out.println("dao" + result);
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


}
