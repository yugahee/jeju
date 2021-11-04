package admin.model.service;

import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import admin.model.vo.PageInfo;
import admin.model.vo.Search;

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
/*
	public Map<String, Object> selectUserList(int page, int chkval, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, chkval);
		
		List<Member> MemberList = adminDao.selectList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();

		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("MemberList", MemberList);
		
		close(conn);
		
		return returnMap;
	}
*/
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
		System.out.println("service" + result);
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
}
