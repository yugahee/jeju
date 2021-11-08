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

	public Member updateMail(String user_id, String user_mail, String newMail) {
		Connection conn = getConnection();
		Member updatedMember = null;
		
		int result = memberDao.updateMail(conn, user_id, user_mail, newMail);
		
		if(result > 0) {
			updatedMember = memberDao.selectMember(conn, user_id);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updatedMember;
	}

	public String findId(String userName, String userMail) {
		Connection conn = getConnection();
		String userId= memberDao.findId(conn, userName, userMail);
		
		close(conn);
		
		return userId;
	}

	public Member updatePwd(String userId, String userMail, String newPwd) {
		Connection conn = getConnection();
		Member updatedMember = null;		

		int result = memberDao.updatePwd(conn, userId, userMail, newPwd);
		
		if(result > 0) {
			updatedMember = memberDao.selectMember(conn, userId);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		// 수정된 멤버 정보 리턴
		return updatedMember;
	}

	public int deleteAccount(String userId, String reason) {
		Connection conn = getConnection();
		
		int result = memberDao.deleteAccount(conn, userId, reason);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int checkEmail(String to_email) {
		Connection conn = getConnection();
		
		int result = memberDao.checkEmail(conn, to_email);
		
		close(conn);
		
		return result;
	}
}
