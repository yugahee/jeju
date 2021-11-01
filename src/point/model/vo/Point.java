package point.model.vo;

import java.util.Date;

public class Point {
	private int pointNo; 			// point 넘버
	private Date pointDate;			// point 날짜
	private String pointDivi;		// point 적립 혹은 사용 구분
	private int point;				// 포인트
	private String puserId;			// 유저 아이디
	private int recepNum;			// 예약 번호
	
	public Point() {}

	public Point(int pointNo, Date pointDate, String pointDivi, int point, String puserId, int recepNum) {
		super();
		this.pointNo = pointNo;
		this.pointDate = pointDate;
		this.pointDivi = pointDivi;
		this.point = point;
		this.puserId = puserId;
		this.recepNum = recepNum;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public String getPointDivi() {
		return pointDivi;
	}

	public void setPointDivi(String pointDivi) {
		this.pointDivi = pointDivi;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPuserId() {
		return puserId;
	}

	public void setPuserId(String puserId) {
		this.puserId = puserId;
	}

	public int getRecepNum() {
		return recepNum;
	}

	public void setRecepNum(int recepNum) {
		this.recepNum = recepNum;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", pointDate=" + pointDate + ", pointDivi=" + pointDivi + ", point="
				+ point + ", puserId=" + puserId + ", recepNum=" + recepNum + "]";
	}
	
	
}

