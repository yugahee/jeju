package admin.model.service;

import member.model.vo.Member;
import messenger.model.vo.Messenger;
import recommendation.model.vo.Reco_Review;
import recommendation.model.vo.Recommendation;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import admin.model.vo.PageInfo;
import admin.model.vo.Search;
import common.model.vo.RoomReview;
import host.model.vo.Rooms;
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
		
		List<Recommendation> RecList = adminDao.selectRecList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
	
		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("RecList", RecList);
		
		close(conn);
		
		return returnMap;
	}

	public Recommendation selectReco(int recoNo) {
		Connection conn = getConnection();		
		Recommendation reco = adminDao.selectReco(conn, recoNo);
		
		close(conn);
		return reco;
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

	public int updateRecoPhoto(Recommendation rec) {
		Connection conn = getConnection();
		
		int recoResult = adminDao.modifyReco(conn, rec);
		int updateImgResult = 0;
		int updateImgCount = 0;
		
		updateImgResult += adminDao.modifyImg(conn, rec.getImageName(), rec.getRecoNo());
		updateImgCount++;
		
		int result = 0;
		if(recoResult > 0 && updateImgResult == updateImgCount) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}	


	public Reservation reserveDetail(int reserveNo) {
		Connection conn = getConnection();
		
		Reservation reserve = adminDao.reserveDetail(conn, reserveNo);
		
		close(conn);
		
		return reserve;
	}


	public int insertRecoPhoto(Recommendation rec) {
		Connection conn = getConnection();		
		int recoResult = adminDao.insertReco(conn, rec);
		if(recoResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return recoResult;
	}

	public int deleteReco(String[] arr) {
		Connection conn = getConnection();		
		int result = adminDao.deleteRec(conn, arr);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int pwdReset(String checkKey, String to_email) {
		Connection conn = getConnection();		
		int result = adminDao.pwdReset(conn, checkKey, to_email);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Map<String, Object> selectMsgList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getMsgListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Messenger> msgList = adminDao.selectMsgList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();

		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("msgList", msgList);
		
		close(conn);
		
		return returnMap;
	}

	public Messenger msgDetail(int msgNo) {
		Connection conn = getConnection();
		
		Messenger msg = adminDao.msgDetail(conn, msgNo);	
		commit(conn);	// ?????? ?????? ??????
		close(conn);
		
		return msg;
	}
	public int reserveUpdate(int reserveNo, String reserveState) {
		Connection conn = getConnection();
		
		int result = adminDao.reserveUpdate(conn, reserveNo, reserveState);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int modifyMsg(Messenger msg, String mVal, String firstcVal, String cVal) {
		Connection conn = getConnection();		
		int result = adminDao.modifyMsg(conn, msg, mVal, firstcVal, cVal);
		System.out.println(firstcVal.equals(""));
		if(firstcVal.equals("")) {	// ?????? ????????? ?????? ?????? ?????? ??? ???
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Map<String, Object> selectRoomReview(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getrReviewListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<RoomReview> reviewList = adminDao.selectRreviewList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();

		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("reviewList", reviewList);
		
		close(conn);
		
		return returnMap;
	}

	public RoomReview roomReviewDetail(int reviewNo) {
		Connection conn = getConnection();
		
		RoomReview review = adminDao.roomReviewDetail(conn, reviewNo);
		
		close(conn);
		
		return review;
	}

	public int roomReviewUpdate(int reviewNo, String reviewState) {
		Connection conn = getConnection();
		
		int result = adminDao.roomReviewUpdate(conn, reviewNo, reviewState);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Map<String, Object> selectRRList(int page, Search search) {
		Connection conn = getConnection();
		
		int listCount = adminDao.getRRListCount(conn, search);
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		
		List<Reco_Review> RRList = adminDao.selectRRList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
	
		returnMap.put("listCount", listCount);
		returnMap.put("pi", pi);
		returnMap.put("RRList", RRList);
		
		close(conn);
		
		return returnMap;
	}

	public Reco_Review RRDetail(int rno) {
		Connection conn = getConnection();
		Reco_Review RR = adminDao.RRDetail(conn, rno);
		close(conn);
		
		return RR;
	}


	public int RRModify(int rno, String reviewState) {
		Connection conn = getConnection();
		
		int result = adminDao.RRModify(conn, rno, reviewState);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public List<Messenger> selectReport(String userId) {
		Connection conn = getConnection();
		List<Messenger> msgList = adminDao.reportMsg(conn, userId);		
		close(conn);
		
		return msgList;
	}

	public int modifyMember(Member member, String idVal, String statusVal, int rcount) {
		Connection conn = getConnection();		
		int result = adminDao.modifyMember(conn, member, idVal, statusVal, rcount);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
