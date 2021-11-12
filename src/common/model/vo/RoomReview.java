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
	private String userName;     // member테이블 참조값 
	private int reserveNo;		 // 예약번호
	private String reviewStatus; // 리뷰상태
	private int starPoint;       // 리뷰별점 1,2,3,4,5점
/*REVIEW_NO	NUMBER
STAR	NUMBER
REVIEW	VARCHAR2(100 BYTE)
ROOM_NO	NUMBER
REVIEW_DATE	DATE
USER_ID	VARCHAR2(20 BYTE)*/
	
	public RoomReview() {}
	
	

	public RoomReview(int reviewNo, String roomName, double star, String review, int roomNo, Date reviewDate,
			String userId, String userName, int reserveNo, String reviewStatus, int starPoint) {
		super();
		this.reviewNo = reviewNo;
		this.roomName = roomName;
		this.star = star;
		this.review = review;
		this.roomNo = roomNo;
		this.reviewDate = reviewDate;
		this.userId = userId;
		this.userName = userName;
		this.reserveNo = reserveNo;
		this.reviewStatus = reviewStatus;
		this.starPoint = starPoint;
	}



	public RoomReview(int reviewNo, String roomName, double star, String review, int roomNo, Date reviewDate, String userId,
		String userName, int reserveNo) {
	super();
	this.reviewNo = reviewNo;
	this.roomName = roomName;
	this.star = star;
	this.review = review;
	this.roomNo = roomNo;
	this.reviewDate = reviewDate;
	this.userId = userId;
	this.userName = userName;
	this.reserveNo = reserveNo;
	}

	// 추가한 starPoint 포함 매개변수 생성자
	public RoomReview(int reviewNo, String roomName, double star, String review, int roomNo, Date reviewDate,
			String userId, String userName, int reserveNo, int starPoint) {
		super();
		this.reviewNo = reviewNo;
		this.roomName = roomName;
		this.star = star;
		this.review = review;
		this.roomNo = roomNo;
		this.reviewDate = reviewDate;
		this.userId = userId;
		this.userName = userName;
		this.reserveNo = reserveNo;
		this.starPoint = starPoint;
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
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	

	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	
	

	public String getReviewStatus() {
		return reviewStatus;
	}



	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}



	@Override
	public String toString() {
		return "RoomReview [reviewNo=" + reviewNo + ", roomName=" + roomName + ", star=" + star + ", review=" + review
				+ ", roomNo=" + roomNo + ", reviewDate=" + reviewDate + ", userId=" + userId + ", userName=" + userName
				+ ", reserveNo=" + reserveNo + ", reviewStatus=" + reviewStatus + ", starPoint=" + starPoint + "]";
	}

	
	
}
