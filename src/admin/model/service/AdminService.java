package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import admin.model.vo.PageInfo;
import admin.model.vo.Search;
import host.model.vo.Rooms;
import member.model.vo.Member;
import reservation.model.vo.Reservation;

public class AdminService{
	
	private AdminDao adminDao = new AdminDao();
	
	public Map<String, Object> selectUserList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getUserListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Member> MemberList = adminDao.selectList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();

		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("MemberList", MemberList);
		
		close(conn);
		
		return returnMap;
	}

	public Map<String, Object> selectUserList(int page, int chkval, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getUserListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, chkval);
		
		List<Member> MemberList = adminDao.selectList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();

		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("MemberList", MemberList);
		
		close(conn);
		
		return returnMap;
	}
	
	public Member selectMemberDetail(String userId) {
		Connection conn = getConnection();
		
		Member user = adminDao.selectMemberDetail(conn, userId);		
		close(conn);
		
		return user;
	}
	public int modifyMember(Member member ,String idVal, String statusVal) {
		Connection conn = getConnection();		
		int result = adminDao.modifyMember(conn, member, idVal, statusVal);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteMember(String idVal) {
		Connection conn = getConnection();		
		int result = adminDao.deleteMember(conn, idVal);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Map<String, Object> selectBlackList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getBlackListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Member> MemberList = adminDao.selectBlackList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();

		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("MemberList", MemberList);
		
		close(conn);
		
		return returnMap;
	}
	
	public Map<String, Object> selectRoomList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getRoomListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Rooms> RoomList = adminDao.selectRoomList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
	
		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("RoomList", RoomList);
		
		close(conn);
		
		return returnMap;
	}

	public Rooms selectRoomDetail(int roomNo) {
		Connection conn = getConnection();
		
		Rooms room = adminDao.selectRoomDetail(conn, roomNo);		
		close(conn);
		
		return room;
	}

	public int modifyRoom(Rooms room, String rVal, String statusVal, String firstcVal, String cVal) {
		Connection conn = getConnection();		
		int result = adminDao.modifyRoom(conn, room, rVal, statusVal, firstcVal, cVal);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int modifyAdmin(String adminName, String newUmail, String adminPhone, String newPwd) {
		Connection conn = getConnection();		
		int result = adminDao.modifyAdmin(conn, adminName, newUmail, adminPhone, newPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Map<String, Object> selectRecList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getRecListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Rooms> RecList = adminDao.selectRecList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
	
		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("RecList", RecList);
		
		close(conn);
		
		return returnMap;
	}

	public Map<String, Object> selectReserveList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getReserveListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Reservation> reserveList = adminDao.selectReserveList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("reserveList", reserveList);
		
		close(conn);
		
		return returnMap;
	}
	
	

}
