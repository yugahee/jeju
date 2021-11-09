package admin.model.dao;

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
import host.model.vo.Rooms;
import member.model.vo.Member;

public class AdminDao {
	
	private Properties adminQuery = new Properties();
	
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.xml").getPath();
		try {
			adminQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> selectList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = adminQuery.getProperty("searchMember");
		List<Member> MemberList = new ArrayList<>();

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("searchMemberAllId");
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("searchMemberAllName");
				}
			}else if((search.getSearchCondition().equals("호스트") || search.getSearchCondition().equals("게스트")) && search.getSearchValue() != null) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("searchMemberId");					
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("searchMemberName");					
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			 
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;	
			if((sql == adminQuery.getProperty("searchMemberAllId")) || (sql == adminQuery.getProperty("searchMemberAllName"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("searchMemberId")) || (sql == adminQuery.getProperty("searchMemberName"))) {
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
		String sql = adminQuery.getProperty("searchMemberDetail");

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

	public int getUserListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = adminQuery.getProperty("getUserListCount");

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("getListCountAllId");
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("getListCountAllName");
				}
			}else if((search.getSearchCondition().equals("호스트") || search.getSearchCondition().equals("게스트")) && search.getSearchValue() != null) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("getListCountMemberId");					
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("getListCountMemberName");					
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			if((sql == adminQuery.getProperty("getListCountAllId")) || (sql == adminQuery.getProperty("getListCountAllName"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("getListCountMemberId")) || (sql == adminQuery.getProperty("getListCountMemberName"))) {
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
		String sql = adminQuery.getProperty("updateMemberStatus");
		
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
		String sql = adminQuery.getProperty("deleteMemberStatus");
		
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
	

	public List<Member> selectBlackList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = adminQuery.getProperty("searchBlack");
		List<Member> MemberList = new ArrayList<>();

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("searchBlackAllId");
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("searchBlackAllName");
				}
			}else if((search.getSearchCondition().equals("호스트") || search.getSearchCondition().equals("게스트")) && search.getSearchValue() != null) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("searchBlackId");					
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("searchBlackName");					
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			 
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;	
			if((sql == adminQuery.getProperty("searchBlackAllId")) || (sql == adminQuery.getProperty("searchBlackAllName"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("searchBlackId")) || (sql == adminQuery.getProperty("searchBlackName"))) {
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

	public int getBlackListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = adminQuery.getProperty("getBlackListCount");

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("getBlackListCountAllId");
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("getBlackListCountAllName");
				}
			}else if((search.getSearchCondition().equals("호스트") || search.getSearchCondition().equals("게스트")) && search.getSearchValue() != null) {
				if(search.getSearchCondition2().equals("아이디")) {
					sql = adminQuery.getProperty("getBlackListCountMemberId");					
				}else if(search.getSearchCondition2().equals("이름")) {
					sql = adminQuery.getProperty("getBlackListCountMemberName");					
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			if((sql == adminQuery.getProperty("getBlackListCountAllId")) || (sql == adminQuery.getProperty("getBlackListCountAllName"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("getBlackListCountMemberId")) || (sql == adminQuery.getProperty("getBlackListCountMemberName"))) {
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

	public int getRoomListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = adminQuery.getProperty("getRoomListCount");

		if(search.getSearchValue() != null) {
			if(!search.getSearchCondition().equals("전체")) {
				sql = adminQuery.getProperty("getRoomListCountStatus");
			}else {
				sql = adminQuery.getProperty("getRoomListCountStatusAll");
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			if(sql == adminQuery.getProperty("getRoomListCountStatus")) {
				pstmt.setString(index++, search.getSearchCondition());
				pstmt.setString(index++, search.getSearchValue());
			}else if(sql == adminQuery.getProperty("getRoomListCountStatusAll")) {
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

	public List<Rooms> selectRoomList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = adminQuery.getProperty("searchRoom");
		List<Rooms> RoomList = new ArrayList<>();

		if(search.getSearchValue() != null) {
			if(!search.getSearchCondition().equals("전체")) {
				sql = adminQuery.getProperty("searchRoomStatus");
			}else {
				sql = adminQuery.getProperty("searchRoomStatusAll");
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;	
			if((sql == adminQuery.getProperty("searchRoomStatus"))) {
				pstmt.setString(index++, search.getSearchCondition());
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("searchRoomStatusAll"))) {
				pstmt.setString(index++, search.getSearchValue());				
			}
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rooms room = new Rooms();
				room.setRoomNo(rset.getInt("room_no"));					// 숙소번호
				room.setUserId(rset.getString("user_id"));				// 호스트아이디
				room.setRoomName(rset.getString("room_name"));			// 숙소이름
				room.setStar(rset.getDouble("star"));					// 평점
				room.setCreateDate(rset.getDate("create_date"));		// 생성날짜
				room.setEnrollDate(rset.getDate("enroll_date"));		// 승인날짜
				room.setEnrollStatus(rset.getString("enroll_status"));	// 승인상태
				room.setStatus(rset.getString("status"));				// 상태
				RoomList.add(room);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return RoomList;
	}

	public Rooms selectRoomDetail(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Rooms room = new Rooms();
		String sql = adminQuery.getProperty("searchRoomDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				room.setRoomNo(rset.getInt("room_no"));					// 숙소번호
				room.setUserId(rset.getString("user_id"));				// 호스트아이디
				room.setRoomName(rset.getString("room_name"));			// 숙소이름
				room.setEnrollStatus(rset.getString("enroll_status"));	// 승인상태
				room.setStatus(rset.getString("status"));				// 상태
				room.setRoomSize(rset.getString("room_size"));			// 평수
				room.setBuildingType(rset.getString("building_type"));	// 건물유형
				room.setRoom(rset.getInt("room"));						// 방 수		
				room.setAddress(rset.getString("address"));				// 주소
				room.setReturnReason(rset.getString("return_reason"));	// 반려이유
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return room;
	}

	public int modifyRoom(Connection conn, Rooms room, String rVal, String statusVal, String firstcVal, String cVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("updateRoomStatus");
		
		if(statusVal.equals("승인대기")) {
			sql = adminQuery.getProperty("updateRoomDefault");
		}else if(statusVal.equals("승인반려")) {
			sql = adminQuery.getProperty("updateRoomDefaultMsg");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int count = 1;
			pstmt.setString(count++, statusVal);
			if(sql == adminQuery.getProperty("updateRoomDefaultMsg")){
				pstmt.setString(count++, cVal);
			}
			pstmt.setString(count, rVal);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int modifyAdmin(Connection conn, String adminName, String newUmail, String adminPhone, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("updateAdminNP");

		if(!newUmail.equals("")) {
			sql = adminQuery.getProperty("updateAdminMail");
		}else if(!newPwd.equals("")) {
			sql = adminQuery.getProperty("updateAdminPwd");
		}else if(!(newUmail.equals("") && newPwd.equals(""))) {
			sql = adminQuery.getProperty("updateAdminAll");
		}
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			int count = 1;
			pstmt.setString(count++, adminName);
			pstmt.setString(count++, adminPhone);
			if(sql == adminQuery.getProperty("updateAdminMail")) {
				pstmt.setString(count++, newUmail);				
			}
			if(sql == adminQuery.getProperty("updateAdminPwd")) {
				pstmt.setString(count++, newPwd);
			}
			if(sql == adminQuery.getProperty("updateAdminAll")) {
				pstmt.setString(count++, newUmail);				
				pstmt.setString(count++, newPwd);
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
