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
import common.model.vo.RoomReview;
import host.model.vo.Rooms;
import member.model.vo.Member;
import messenger.model.vo.Messenger;
import payment.model.vo.Payment;
import reservation.model.vo.Reservation;
import recommendation.model.vo.Reco_Review;
import recommendation.model.vo.Recommendation;

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

		if(!newUmail.equals("") && newPwd.equals("")) {
			sql = adminQuery.getProperty("updateAdminMail");
		}else if(newUmail.equals("") && !newPwd.equals("")) {
			sql = adminQuery.getProperty("updateAdminPwd");
		}else if(!newUmail.equals("") && !newPwd.equals("")) {
			sql = adminQuery.getProperty("updateAdminAll");
		}
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

	public int getRecListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		int cata_value = 0;
		
		String sql = adminQuery.getProperty("getRecListCount");
		
		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("관광지")) {
				cata_value = 1;
			}
			if(search.getSearchCondition().equals("식당")) {
				cata_value = 2;
			}
			if(search.getSearchCondition().equals("카페")) {
				cata_value = 3;
			}
			if(!search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("getRecListCountStatusName");				
				}else {
					sql = adminQuery.getProperty("getRecListCountStatusKW");	
				}
			}else {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("getRecListCountStatusNameAll");				
				}else {
					sql = adminQuery.getProperty("getRecListCountStatusKWAll");	
				}				
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);

			int index = 1;
			if(sql == adminQuery.getProperty("getRecListCountStatusName") || sql == adminQuery.getProperty("getRecListCountStatusKW") ) {
				pstmt.setInt(index++, cata_value);
			}
			if(sql != adminQuery.getProperty("getRecListCount")) {
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

	
	public List<Recommendation> selectRecList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cata_value = 0;
		String sql = adminQuery.getProperty("searchRecList");
		List<Recommendation> RecList = new ArrayList<>();

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("관광지")) {
				cata_value = 1;
			}
			if(search.getSearchCondition().equals("식당")) {
				cata_value = 2;
			}
			if(search.getSearchCondition().equals("카페")) {
				cata_value = 3;
			}
			if(!search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("searchRecListName");				
				}else {
					sql = adminQuery.getProperty("searchRecListKW");	
				}
			}else {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("searchRecListNameAll");				
				}else {
					sql = adminQuery.getProperty("searchRecListKWAll");	
				}				
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;	
			if(sql == adminQuery.getProperty("searchRecListName") || sql == adminQuery.getProperty("searchRecListKW")) {
				pstmt.setInt(index++, cata_value);		
			}
			if(sql != adminQuery.getProperty("searchRecList")) {
				pstmt.setString(index++, search.getSearchValue());		
			}
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Recommendation rec = new Recommendation();
				rec.setRecoNo(rset.getInt("reco_no"));					// 추천장소번호
				rec.setRecoCategory(rset.getInt("reco_category"));		// 카테고리
				rec.setRecoArea(rset.getInt("reco_area"));				// 지역
				rec.setRecoName(rset.getString("reco_name"));			// 이름
				rec.setRecoKeyword(rset.getString("reco_keyword"));		// 키워드
				rec.setLikeCount(rset.getInt("like_count"));			// 좋아요
				rec.setScore(rset.getDouble("score"));					// 평점
				rec.setPublicYn(rset.getString("public_yn"));			// 상태
				RecList.add(rec);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return RecList;
	}

	public Recommendation selectReco(Connection conn, int recoNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Recommendation reco = null;
		String sql = adminQuery.getProperty("selectReco");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recoNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reco = new Recommendation();
				reco.setRecoNo(rset.getInt("reco_no"));
				reco.setPublicYn(rset.getString("public_yn"));
				reco.setRecoArea(rset.getInt("reco_area"));
				reco.setRecoAddress(rset.getString("reco_address"));
				reco.setRecoCategory(rset.getInt("reco_category"));
				reco.setRecoExpl(rset.getString("reco_expl"));
				reco.setRecoKeyword(rset.getString("reco_keyword"));
				reco.setRecoName(rset.getString("reco_name"));
				reco.setNaverMap(rset.getString("naver_map"));
				reco.setKakaoMap(rset.getString("kakao_map"));
				reco.setRecoImage(rset.getString("reco_image"));
				reco.setImageName(rset.getString("image_name"));
				reco.setRecoArea(rset.getInt("reco_area"));
				reco.setScore(rset.getDouble("score"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reco;
	}

	public int modifyImg(Connection conn, String imageName, int recoNo) {PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("updateImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imageName);
			pstmt.setInt(2, recoNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	

	public int getReserveListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;		
		String sql = adminQuery.getProperty("reserveCount");
		
		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("예약번호")) {
					sql = adminQuery.getProperty("searchAllReserveNoCount");
				}else if(search.getSearchCondition2().equals("호스트ID")) {
					sql = adminQuery.getProperty("searchAllReserveHostCount");
				}else if(search.getSearchCondition2().equals("게스트ID")) {
					sql = adminQuery.getProperty("searchAllReserveGuestCount");
				}
			}else if(search.getSearchCondition().equals("예약신청") || search.getSearchCondition().equals("결제대기") || search.getSearchCondition().equals("예약완료") || search.getSearchCondition().equals("예약취소") || search.getSearchCondition().equals("숙박완료")){
				if(search.getSearchCondition2().equals("예약번호")) {
					sql = adminQuery.getProperty("searchReserveNoCount");					
				}else if(search.getSearchCondition2().equals("호스트ID")) {
					sql = adminQuery.getProperty("searchReserveHostCount");
				}else if(search.getSearchCondition2().equals("게스트ID")) {
					sql = adminQuery.getProperty("searchReserveGuestCount");
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;							
			
			if((sql == adminQuery.getProperty("searchAllReserveNoCount")) || (sql == adminQuery.getProperty("searchAllReserveHostCount")) || (sql == adminQuery.getProperty("searchAllReserveGuestCount"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("searchReserveNoCount")) || (sql == adminQuery.getProperty("searchReserveHostCount")) || (sql == adminQuery.getProperty("searchReserveGuestCount"))){
				pstmt.setString(index++, search.getSearchValue());
				pstmt.setString(index++, search.getSearchCondition());
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return listCount;
	}

	public List<Reservation> selectReserveList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		List<Reservation> reserveList = new ArrayList<>();
		ResultSet rset = null;
		String sql = adminQuery.getProperty("reserveList");
		
		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("예약번호")) {
					sql = adminQuery.getProperty("searchAllReserveNo");
				}else if(search.getSearchCondition2().equals("호스트ID")) {
					sql = adminQuery.getProperty("searchAllReserveHost");
				}else if(search.getSearchCondition2().equals("게스트ID")) {
					sql = adminQuery.getProperty("searchAllReserveGuest");
				}
			}else if(search.getSearchCondition().equals("예약신청") || search.getSearchCondition().equals("결제대기") || search.getSearchCondition().equals("예약완료") || search.getSearchCondition().equals("예약취소") || search.getSearchCondition().equals("숙박완료")){
				if(search.getSearchCondition2().equals("예약번호")) {
					sql = adminQuery.getProperty("searchReserveNo");					
				}else if(search.getSearchCondition2().equals("호스트ID")) {
					sql = adminQuery.getProperty("searchReserveHost");
				}else if(search.getSearchCondition2().equals("게스트ID")) {
					sql = adminQuery.getProperty("searchReserveGuest");
				}
			}
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;							
			
			if((sql == adminQuery.getProperty("searchAllReserveNo")) || (sql == adminQuery.getProperty("searchAllReserveHost")) || (sql == adminQuery.getProperty("searchAllReserveGuest"))) {
				pstmt.setString(index++, search.getSearchValue());
			}else if((sql == adminQuery.getProperty("searchReserveNo")) || (sql == adminQuery.getProperty("searchReserveHost")) || (sql == adminQuery.getProperty("searchReserveGuest"))){
				pstmt.setString(index++, search.getSearchValue());
				pstmt.setString(index++, search.getSearchCondition());
			}
			
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation reserve = new Reservation();
				reserve.setRoom_reserve(rset.getInt("room_reserve"));
				reserve.setReserve_state(rset.getString("reserve_state"));
				reserve.setReserve_num(rset.getInt("reserve_num"));
				reserve.setGuest(rset.getString("guest"));
				reserve.setPone(rset.getString("pone"));
				
				Rooms room = new Rooms();
				room.setRoomName(rset.getString("room_name"));
				room.setUserId(rset.getString("user_id"));
				reserve.setRoom_info(room);
				
				Payment pay = new Payment();
				pay.setPrice(rset.getInt("price"));
				pay.setPayDate(rset.getTimestamp("pay_date"));
				reserve.setPayment_info(pay);
				
				reserveList.add(reserve);
			}
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return reserveList;
	}

	public int insertReco(Connection conn, Recommendation rec) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("InsertRecoImg");

		try {
			pstmt = conn.prepareStatement(sql);
			/*
			노출여부 			지역			주소			카테고리			설명
			키워드			이름			네이버맵		카카오맵			이미지 명
			api
			*/
			pstmt.setString(1, rec.getPublicYn());
			pstmt.setInt(2, rec.getRecoArea());
			pstmt.setString(3, rec.getRecoAddress());
			pstmt.setInt(4, rec.getRecoCategory());
			pstmt.setString(5, rec.getRecoExpl());
			pstmt.setString(6, rec.getRecoKeyword());
			pstmt.setString(7, rec.getRecoName());
			pstmt.setString(8, rec.getNaverMap());
			pstmt.setString(9, rec.getKakaoMap());
			pstmt.setString(10, rec.getRecoImage());
			pstmt.setString(11, rec.getImageName());
			pstmt.setString(12, rec.getCoordinate());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int modifyReco(Connection conn, Recommendation rec) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("modifyRecoImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rec.getRecoName());
			pstmt.setString(2, rec.getPublicYn());
			pstmt.setInt(3, rec.getRecoArea());
			pstmt.setInt(4, rec.getRecoCategory());
			pstmt.setString(5, rec.getRecoAddress());
			pstmt.setString(6, rec.getNaverMap());
			pstmt.setString(7, rec.getKakaoMap());
			pstmt.setString(8, rec.getRecoKeyword());
			pstmt.setString(9, rec.getRecoExpl());
			pstmt.setString(10, rec.getImageName());
			pstmt.setInt(11, rec.getRecoNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	public Reservation reserveDetail(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;		
		ResultSet rset = null;
		Reservation reserve = new Reservation();
		String sql = adminQuery.getProperty("reserveDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reserve.setRoom_reserve(reserveNo);
				reserve.setGuest(rset.getString("guest"));
				reserve.setReserve_state(rset.getString("reserve_state"));
				
				Rooms room = new Rooms();
				room.setRoomName(rset.getString("room_name"));
				reserve.setRoom_info(room);
				
				Payment pay = new Payment();
				pay.setPrice(rset.getInt("price"));
				pay.setPayDate(rset.getTimestamp("pay_date"));
				reserve.setPayment_info(pay);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
					
		
		return reserve;
	}

	public int deleteRec(Connection conn, String[] arr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("deleteReco");
		

		for (int i = 0; i < arr.length; i++) {

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, arr[i]);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {			
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}

	public int pwdReset(Connection conn, String checkKey, String to_email) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("resetPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, checkKey);
			pstmt.setString(2, to_email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getMsgListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String chk = "";
		String sql = adminQuery.getProperty("getMsgListCountAll");

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition2().equals("미답변")) {
				chk = "N";
			}else if(search.getSearchCondition2().equals("답변완료")) {
				chk = "Y";
			}
			if(!(search.getStartDate().equals("") && search.getEndDate().equals(""))) {
				sql = adminQuery.getProperty("getMsgListCountDate");
				if(!search.getSearchCondition().equals("전체")) {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("getMsgListCountStatusChkDate");
					}else {
						sql = adminQuery.getProperty("getMsgListCountStatusDate");
					}
				}else {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("getMsgListCountChkDate");
					}
				}
			}else {
				if(!search.getSearchCondition().equals("전체")) {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("getMsgListCountStatusChk");
					}else {
						sql = adminQuery.getProperty("getMsgListCountStatus");
					}
				}else {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("getMsgListCountChk");
					}else {
						sql = adminQuery.getProperty("getMsgListCount");
					}
				}
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			int index = 1;							
			if(sql != adminQuery.getProperty("getMsgListCountAll")) {
				pstmt.setString(index++, search.getSearchValue());

				if(!(search.getStartDate().equals("") && search.getEndDate().equals(""))) {
					sql = adminQuery.getProperty("getMsgListCountDate");
					if(!search.getSearchCondition().equals("전체")) {
						if(!search.getSearchCondition2().equals("전체")) {
							sql = adminQuery.getProperty("getMsgListCountStatusChkDate");
							pstmt.setString(index++, search.getSearchCondition());
							pstmt.setString(index++, chk);
						}else {
							sql = adminQuery.getProperty("getMsgListCountStatusDate");
							pstmt.setString(index++, search.getSearchCondition());
						}
					}else {
						if(!search.getSearchCondition2().equals("전체")) {
							sql = adminQuery.getProperty("getMsgListCountChkDate");
							pstmt.setString(index++, chk);
						}
					}
					pstmt.setString(index++, search.getStartDate());
					pstmt.setString(index++, search.getEndDate());
				}else {
					if(sql == adminQuery.getProperty("getMsgListCountStatusChk")) {
						pstmt.setString(index++, search.getSearchCondition());
						pstmt.setString(index++, chk);
					}else if(sql == adminQuery.getProperty("getMsgListCountStatus")) {
						pstmt.setString(index++, search.getSearchCondition());
					}else if(sql == adminQuery.getProperty("getMsgListCountChk")) {
						pstmt.setString(index++, chk);
					}
				}
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

	public List<Messenger> selectMsgList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = adminQuery.getProperty("searchMsg");
		List<Messenger> msgList = new ArrayList<>();
		String chk = "";

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition2().equals("미답변")) {
				chk = "N";
			}else if(search.getSearchCondition2().equals("답변완료")) {
				chk = "Y";
			}
			if(!(search.getStartDate().equals("") && search.getEndDate().equals(""))) {
				sql = adminQuery.getProperty("searchMsgDate");
				if(!search.getSearchCondition().equals("전체")) {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("searchMsgStatusChkDate");
					}else {
						sql = adminQuery.getProperty("searchMsgStatusDate");
					}
				}else {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("searchMsgChkDate");
					}
				}
			}else {
				if(!search.getSearchCondition().equals("전체")) {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("searchMsgStatusChk");
					}else {
						sql = adminQuery.getProperty("searchMsgStatus");
					}
				}else {
					if(!search.getSearchCondition2().equals("전체")) {
						sql = adminQuery.getProperty("searchMsgChk");
					}else {
						sql = adminQuery.getProperty("searchMsgAll");
					}
				}
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			 
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			int index = 1;							
			if(sql != adminQuery.getProperty("searchMsg")) {
				pstmt.setString(index++, search.getSearchValue());

				if(!(search.getStartDate().equals("") && search.getEndDate().equals(""))) {
					sql = adminQuery.getProperty("searchMsgDate");
					if(!search.getSearchCondition().equals("전체")) {
						if(!search.getSearchCondition2().equals("전체")) {
							sql = adminQuery.getProperty("searchMsgStatusChkDate");
							pstmt.setString(index++, search.getSearchCondition());
							pstmt.setString(index++, chk);
						}else {
							sql = adminQuery.getProperty("searchMsgStatusDate");
							pstmt.setString(index++, search.getSearchCondition());
						}
					}else {
						if(!search.getSearchCondition2().equals("전체")) {
							sql = adminQuery.getProperty("searchMsgChkDate");
							pstmt.setString(index++, chk);
						}
					}
					pstmt.setString(index++, search.getStartDate());
					pstmt.setString(index++, search.getEndDate());
				}else {
					if(sql == adminQuery.getProperty("searchMsgStatusChk")) {
						pstmt.setString(index++, search.getSearchCondition());
						pstmt.setString(index++, chk);
					}else if(sql == adminQuery.getProperty("searchMsgStatus")) {
						pstmt.setString(index++, search.getSearchCondition());
					}else if(sql == adminQuery.getProperty("searchMsgChk")) {
						pstmt.setString(index++, chk);
					}
				}
			}
			
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Messenger msg = new Messenger();
				msg.setMsg_no(rset.getInt("msg_no"));
				msg.setMsg_cate(rset.getString("msg_cate"));
				msg.setMsg_content(rset.getString("msg_content"));
				msg.setChk_status(rset.getString("chk_status"));
				msg.setReply_status(rset.getString("reply_status"));
				msg.setMsg_date(rset.getTimestamp("msg_date"));
				msg.setReply_date(rset.getTimestamp("reply_date"));
				msg.setReply_content(rset.getString("reply_content"));
				msg.setFrom_user(rset.getString("from_user"));
				msg.setTo_user(rset.getString("to_user"));
				msg.setMsg_status(rset.getString("msg_status"));
				msg.setModify_date(rset.getTimestamp("modify_date"));
				msg.setReport_user(rset.getString("report_user"));
				msgList.add(msg);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return msgList;
	}

	public Messenger msgDetail(Connection conn, int msgNo) {
		PreparedStatement pstmt2 = null;
		ResultSet rset2 = null;
		Messenger msg = new Messenger();
		String sql2 = adminQuery.getProperty("msgDetailChk");
		// 읽음상태 업데이트
		try {
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, msgNo);
			pstmt2.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(rset2);
			close(pstmt2);
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = adminQuery.getProperty("msgDetail");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, msgNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {			
				msg.setMsg_no(rset.getInt("msg_no"));
				msg.setMsg_cate(rset.getString("msg_cate"));
				msg.setMsg_content(rset.getString("msg_content"));
				msg.setChk_status(rset.getString("chk_status"));
				msg.setReply_status(rset.getString("reply_status"));
				msg.setMsg_date(rset.getTimestamp("msg_date"));
				msg.setReply_date(rset.getTimestamp("reply_date"));
				msg.setReply_content(rset.getString("reply_content"));
				msg.setFrom_user(rset.getString("from_user"));
				msg.setTo_user(rset.getString("to_user"));
				msg.setMsg_status(rset.getString("msg_status"));
				msg.setModify_date(rset.getTimestamp("modify_date"));
				msg.setReport_user(rset.getString("report_user"));			
			}
			System.out.println(msg);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return msg;
	}
  
	public int reserveUpdate(Connection conn, int reserveNo, String reserveState) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("reserveUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reserveState);
			pstmt.setInt(2, reserveNo);
			
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public int modifyMsg(Connection conn, Messenger msg, String mVal, String firstcVal, String cVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("updateMsgReply");

		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			int count = 1;
			pstmt.setString(count++, cVal);
			pstmt.setString(count, mVal);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	public int getrReviewListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = adminQuery.getProperty("rReviewListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		
		return result;
	}

	public List<RoomReview> selectRreviewList(Connection conn, PageInfo pi, Search search) {		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<RoomReview> reviewList = new ArrayList<>();
		String sql = adminQuery.getProperty("getRreviewList");
		
		try {
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RoomReview rr = new RoomReview();
				rr.setReviewNo(rset.getInt("review_no"));
				rr.setStarPoint(rset.getInt("star"));
				rr.setReview(rset.getString("review"));
				rr.setRoomNo(rset.getInt("room_no"));
				rr.setReviewDate(rset.getDate("review_date"));
				rr.setUserId(rset.getString("user_id"));
				rr.setReserveNo(rset.getInt("recep_no"));
				rr.setReviewStatus(rset.getString("review_status"));
				rr.setRoomName(rset.getString("room_name"));
				
				reviewList.add(rr);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return reviewList;
	}

	public RoomReview roomReviewDetail(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		RoomReview rr = new RoomReview();
		String sql = adminQuery.getProperty("roomReviewDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rr.setReviewNo(rset.getInt("review_no"));
				rr.setStarPoint(rset.getInt("star"));
				rr.setReview(rset.getString("review"));
				rr.setRoomNo(rset.getInt("room_no"));
				rr.setReviewDate(rset.getDate("review_date"));
				rr.setUserId(rset.getString("user_id"));
				rr.setReserveNo(rset.getInt("recep_no"));
				rr.setReviewStatus(rset.getString("review_status"));
				rr.setRoomName(rset.getString("room_name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rr;
	}

	public int roomReviewUpdate(Connection conn, int reviewNo, String reviewState) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = adminQuery.getProperty("roomReviewUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewState);
			pstmt.setInt(2, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public int getRRListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		int cate = 0;
		
		String sql = adminQuery.getProperty("getRRListCount");

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("관광지")) {
				cate = 1;
			}else if(search.getSearchCondition().equals("식당")) {
				cate = 2;
			}else if(search.getSearchCondition().equals("카페")) {
				cate = 3;
			}
			if(!search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("getRRListCountCateLc");
				}else if(search.getSearchCondition2().equals("ID")) {
					sql = adminQuery.getProperty("getRRListCountCateId");
				}
			}else {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("getRRListCountLc");
				}else if(search.getSearchCondition2().equals("ID")) {
					sql = adminQuery.getProperty("getRRListCountId");
				}
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			if(sql == adminQuery.getProperty("getRRListCountCateLc") || sql == adminQuery.getProperty("getRRListCountCateId")) {
				pstmt.setInt(index++, cate);
				pstmt.setString(index++, search.getSearchValue());
			}else if(sql == adminQuery.getProperty("getRRListCountLc") || sql == adminQuery.getProperty("getRRListCountId")) {
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

	public List<Reco_Review> selectRRList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cate = 0;
		String sql = adminQuery.getProperty("searchRR");
		List<Reco_Review> RRList = new ArrayList<>();

		if(search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("관광지")) {
				cate = 1;
			}else if(search.getSearchCondition().equals("식당")) {
				cate = 2;
			}else if(search.getSearchCondition().equals("카페")) {
				cate = 3;
			}
			if(!search.getSearchCondition().equals("전체")) {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("getRRListCountCateLc");
				}else if(search.getSearchCondition2().equals("ID")) {
					sql = adminQuery.getProperty("getRRListCountCateId");
				}
			}else {
				if(search.getSearchCondition2().equals("장소명")) {
					sql = adminQuery.getProperty("getRRListCountLc");
				}else if(search.getSearchCondition2().equals("ID")) {
					sql = adminQuery.getProperty("getRRListCountId");
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
				Reco_Review rr = new Reco_Review();
				rr.setRecoNo(recoNo);
				rr.setrCate(rCate);
				rr.setrArea(rArea);
				rr.setrName(rName);
				rr.setUserId(userId);
				rr.setScore(score);
				rr.setWriteTime(writeTime);
				rr.setPublicYn(publicYn);
				RRList.add(rr);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return RRList;
	}
	
	
	
	
	
}
