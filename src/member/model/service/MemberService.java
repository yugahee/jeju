package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();

	public Member loginMember(String user_id, String user_pwd) {
		Connection conn = getConnection();
		
		Member loginMember = memberDao.loginMember(conn, user_id, user_pwd);
		
		close(conn);
		
		return loginMember;
	}

}
