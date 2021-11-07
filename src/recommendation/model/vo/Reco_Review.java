package recommendation.model.vo;

import java.util.Date;

public class Reco_Review {
	
	private int recoReviewNo;		// 리뷰번호
	private int score;				// 별점
	private String sComment;		// 한줄평
	private Date writeTime;			// 작성시간
	private int recoNo;				// 추천장소번호
	private String userId;			// 아이디
	
	
	/*
	  RECO_REVIEW_NO NUMBER
	  SCORE	NUMBER
	  S_COMMENT	VARCHAR2(150 BYTE)
	  WRITE_TIME	DATE
	  RECO_NO	NUMBER
	  USER_ID	VARCHAR2(20 BYTE)
	 */

	public Reco_Review() {
		
	}


	public Reco_Review(int recoReviewNo, int score, String sComment, Date writeTime, int recoNo, String userId) {
		super();
		this.recoReviewNo = recoReviewNo;
		this.score = score;
		this.sComment = sComment;
		this.writeTime = writeTime;
		this.recoNo = recoNo;
		this.userId = userId;
	}


	public int getRecoReviewNo() {
		return recoReviewNo;
	}


	public void setRecoReviewNo(int recoReviewNo) {
		this.recoReviewNo = recoReviewNo;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getsComment() {
		return sComment;
	}


	public void setsComment(String sComment) {
		this.sComment = sComment;
	}


	public Date getWriteTime() {
		return writeTime;
	}


	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}


	public int getRecoNo() {
		return recoNo;
	}


	public void setRecoNo(int recoNo) {
		this.recoNo = recoNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Reco_Review [recoReviewNo=" + recoReviewNo + ", score=" + score + ", sComment=" + sComment
				+ ", writeTime=" + writeTime + ", recoNo=" + recoNo + ", userId=" + userId + "]";
	}
	
}
