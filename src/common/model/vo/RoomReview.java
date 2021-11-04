package common.model.vo;

import java.sql.Date;

public class RoomReview {
	private int reviewNo;        // 리뷰번호
	private String roomName;     // 숙소이름
	private double star;         // 리뷰 별점
	private String review;       // 리뷰 내용
	private int roomNo;          // 숙소번호
	private Date reviewDate;     // 리뷰작성일
	private String userId;       // 리뷰작성자
	
/*REVIEW_NO	NUMBER
STAR	NUMBER
REVIEW	VARCHAR2(100 BYTE)
ROOM_NO	NUMBER
REVIEW_DATE	DATE
USER_ID	VARCHAR2(20 BYTE)*/
	
	public RoomReview() {}


	public RoomReview(int reviewNo, String roomName, double star, String review, int roomNo, Date reviewDate,
		String userId) {
		super();
		this.reviewNo = reviewNo;
		this.roomName = roomName;
		this.star = star;
		this.review = review;
		this.roomNo = roomNo;
		this.reviewDate = reviewDate;
		this.userId = userId;
	}


	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	

	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	@Override
	public String toString() {
		return "RoomReview [reviewNo=" + reviewNo + ", roomName=" + roomName + ", star=" + star + ", review=" + review
				+ ", roomNo=" + roomNo + ", reviewDate=" + reviewDate + ", userId=" + userId + "]";
	}

	
}
