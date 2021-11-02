package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberService{
	
	private MemberDao memberDao = new MemberDao();

	public Member loginMember(String user_id, String user_pwd) {
		Connection conn = getConnection();
		
		Member loginMember = memberDao.loginMember(conn, user_id, user_pwd);
		
		close(conn);
		
		return loginMember;
	}

	public Map<String, Object> selectList() {
		Connection conn = getConnection();
		
		List<Member> MemberList = memberDao.selectList(conn);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("MemberList", MemberList);
		
		close(conn);
		
		return returnMap;
	}

	public Member selectMemberDetail(String userId) {
		Connection conn = getConnection();
		
		Member user = memberDao.selectMemberDetail(conn, userId);		
		close(conn);
		
		return user;
	}

	public int checkId(String userId) {
		Connection conn = getConnection();
		
		int result = memberDao.checkId(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = memberDao.insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
