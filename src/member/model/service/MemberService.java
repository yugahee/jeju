package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();

	public Member loginMember(String user_id, String user_pwd) {
		Connection conn = getConnection();
		
		Member loginMember = memberDao.loginMember(conn, user_id, user_pwd);
		
		close(conn);
		
		return loginMember;
	}

	public Map<String, Object> selectList() {
		Connection conn = getConnection();
		
		List<Member> MemberList = MemberDao.selectList(conn);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("MemberList", MemberList);
		
		close(conn);
		
		return returnMap;
	}

}
