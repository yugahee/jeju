package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService{
	
	private MemberDao memberDao = new MemberDao();

	public Member loginMember(String user_id, String user_pwd) {
		Connection conn = getConnection();
		
		Member loginMember = memberDao.loginMember(conn, user_id, user_pwd);
		
		close(conn);
		
		return loginMember;
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

	public Member updateMember(Member member) {
		Connection conn = getConnection();
		Member updatedMember = null;
		
		int result = memberDao.updateMember(conn, member);
		
		if(result > 0) {
			updatedMember = memberDao.selectMember(conn, member.getUser_id());
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		// 수정된 멤버 정보 리턴
		return updatedMember;
	}
}
