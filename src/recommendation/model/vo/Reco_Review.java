package recommendation.model.vo;

import java.util.Date;

public class Reco_Review {
	
	private int recoReviewNo;		// 리뷰번호
	private int score;				// 별점
	private String sComment;		// 한줄평
	private Date writeTime;			// 작성시간
	private int recoNo;				// 추천장소번호
	private String userId;			// 아이디
	
	private String publicYn;		// 노출여부
	
	// 관리자에서 필요함
	private String rName;		// 이름
	private int rArea;			// 지역(1='동부', 2='서부', 3='남부', 4='북부')
	private int rCate;		// 카테고리(1='관광지', 2='식당', 3='카페')
	
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

	public Reco_Review(int recoReviewNo, int score, String sComment, Date writeTime, int recoNo, String userId,
			String publicYn) {
		super();
		this.recoReviewNo = recoReviewNo;
		this.score = score;
		this.sComment = sComment;
		this.writeTime = writeTime;
		this.recoNo = recoNo;
		this.userId = userId;
		this.publicYn = publicYn;
	}
	
	public Reco_Review(int recoReviewNo, int score, String sComment, Date writeTime, int recoNo, String userId,
			String publicYn, String rName, int rArea, int rCate) {
		super();
		this.recoReviewNo = recoReviewNo;
		this.score = score;
		this.sComment = sComment;
		this.writeTime = writeTime;
		this.recoNo = recoNo;
		this.userId = userId;
		this.publicYn = publicYn;
		this.rName = rName;
		this.rArea = rArea;
		this.rCate = rCate;
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

	public String getPublicYn() {
		return publicYn;
	}

	public void setPublicYn(String publicYn) {
		this.publicYn = publicYn;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getrArea() {
		return rArea;
	}

	public void setrArea(int rArea) {
		this.rArea = rArea;
	}

	public int getrCate() {
		return rCate;
	}

	public void setrCate(int rCate) {
		this.rCate = rCate;
	}

	@Override
	public String toString() {
		return "Reco_Review [recoReviewNo=" + recoReviewNo + ", score=" + score + ", sComment=" + sComment
				+ ", writeTime=" + writeTime + ", recoNo=" + recoNo + ", userId=" + userId + ", publicYn=" + publicYn
				+ ", rName=" + rName + ", rArea=" + rArea + ", rCate=" + rCate + "]";
	}
}
