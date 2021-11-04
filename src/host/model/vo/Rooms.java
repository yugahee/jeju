package host.model.vo;

import java.util.Date;
import java.util.List;

import common.model.vo.RoomReview;

public class Rooms {
	private int roomNo;
	private String userId;        // 호스트아이디
	private String address;       // 주소
	private String location;      // 지역(중부, 동부, 서부, 남부, 북부)
	private String roomName;      // 숙소이름
	private String roomTitle;     // 숙소제목
	private String roomDes;       // 숙소소개
	private String roomType;      // 숙소종류(원룸, 투룸, 쓰리룸이상, 복층)
	private String roomFac;       // 숙소시설
	private int price;            // 가격
	private int extraCost;        // 추가인원가격
	private int minPeople;        // 최소인원
	private int maxPeople;        // 최대인원
	private String startTime;     // 입실시간
	private String endTime;       // 퇴실시간
	private Date createDate;      // 생성날짜
	private Date modifyDate;      // 수정날짜
	private Date enrollDate;      // 승인날짜
	private String enrollStatus;  // 등록상태
	private int room;             // 방 수
 	private int bed;              // 침대 수
	private int bath;             // 화장실 수
	private String buildingType;  // 건물유형(원룸, 빌라, 펜션 ..)
	private String roomSize;      // 건물평수(5평, 6~10평 ..)
	private int minStay;          // 최소숙박일수
	private int maxStay;          // 최대숙박일수
	private String roomLink;      // 유튜브링크주소
	private String status;        // 상태 (삭제 : N)
	
	private PeakSeason peak;      // 성수기 객체
	private List<Files> fileList;    // 파일 리스트
	private double star; //숙소리뷰테이블의 별점 
	
	private List<RoomReview> reviewList;   // 숙소리뷰 리스트
	
	/*ROOM_NO	NUMBER
USER_ID	VARCHAR2(20 BYTE)
ADDRESS	VARCHAR2(100 BYTE)
LOCATION	VARCHAR2(10 BYTE)
ROOM_NAME	VARCHAR2(100 BYTE)
ROOM_TITLE	VARCHAR2(200 BYTE)
ROOM_DES	VARCHAR2(3000 BYTE)
ROOM_TYPE	VARCHAR2(20 BYTE)
ROOM_FAC	VARCHAR2(1000 BYTE)
PRICE	NUMBER
MIN_PEOPLE	NUMBER
MAX_PEOPLE	NUMBER
START_TIME	VARCHAR2(10 BYTE)
END_TIME	VARCHAR2(10 BYTE)
CREATE_DATE	DATE
MODIFY_DATE	DATE
ENROLL_DATE	DATE
ENROLL_STATUS	VARCHAR2(50 BYTE)
ROOM	NUMBER
BED	NUMBER
BATH	NUMBER
BUILDING_TYPE	VARCHAR2(50 BYTE)
ROOM_SIZE	VARCHAR2(50 BYTE)
MIN_STAY	NUMBER
MAX_STAY	NUMBER
STATUS	VARCHAR2(1 BYTE)*/
	
	public Rooms() {}

	public Rooms(int roomNo, String userId, String address, String location, String roomName, String roomTitle,
			String roomDes, String roomType, String roomFac, int price, int extraCost, int minPeople, int maxPeople,
			String startTime, String endTime, Date createDate, Date modifyDate, Date enrollDate, String enrollStatus,
			int room, int bed, int bath, String buildingType, String roomSize, int minStay, int maxStay,
			String roomLink, String status, PeakSeason peak, List<Files> fileList, double star,
			List<RoomReview> reviewList) {
		super();
		this.roomNo = roomNo;
		this.userId = userId;
		this.address = address;
		this.location = location;
		this.roomName = roomName;
		this.roomTitle = roomTitle;
		this.roomDes = roomDes;
		this.roomType = roomType;
		this.roomFac = roomFac;
		this.price = price;
		this.extraCost = extraCost;
		this.minPeople = minPeople;
		this.maxPeople = maxPeople;
		this.startTime = startTime;
		this.endTime = endTime;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.enrollDate = enrollDate;
		this.enrollStatus = enrollStatus;
		this.room = room;
		this.bed = bed;
		this.bath = bath;
		this.buildingType = buildingType;
		this.roomSize = roomSize;
		this.minStay = minStay;
		this.maxStay = maxStay;
		this.roomLink = roomLink;
		this.status = status;
		this.peak = peak;
		this.fileList = fileList;
		this.star = star;
		this.reviewList = reviewList;
	}


	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomTitle() {
		return roomTitle;
	}

	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}

	public String getRoomDes() {
		return roomDes;
	}

	public void setRoomDes(String roomDes) {
		this.roomDes = roomDes;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomFac() {
		return roomFac;
	}

	public void setRoomFac(String roomFac) {
		this.roomFac = roomFac;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMinPeople() {
		return minPeople;
	}

	public void setMinPeople(int minPeople) {
		this.minPeople = minPeople;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getEnrollStatus() {
		return enrollStatus;
	}

	public void setEnrollStatus(String enrollStatus) {
		this.enrollStatus = enrollStatus;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getBath() {
		return bath;
	}

	public void setBath(int bath) {
		this.bath = bath;
	}

	public String getBuildingType() {
		return buildingType;
	}

	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}

	public int getMinStay() {
		return minStay;
	}

	public void setMinStay(int minStay) {
		this.minStay = minStay;
	}

	public int getMaxStay() {
		return maxStay;
	}

	public void setMaxStay(int maxStay) {
		this.maxStay = maxStay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	public int getExtraCost() {
		return extraCost;
	}

	public void setExtraCost(int extraCost) {
		this.extraCost = extraCost;
	}

	public String getRoomLink() {
		return roomLink;
	}

	public void setRoomLink(String roomLink) {
		this.roomLink = roomLink;
	}


	public PeakSeason getPeak() {
		return peak;
	}

	public void setPeak(PeakSeason peak) {
		this.peak = peak;
	}
	

	public List<Files> getFileList() {
		return fileList;
	}


	public void setFileList(List<Files> fileList) {
		this.fileList = fileList;
	}


	public double getStar() {
		return star;
	}


	public void setStar(double star) {
		this.star = star;
	}
	

	public List<RoomReview> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<RoomReview> reviewList) {
		this.reviewList = reviewList;
	}

	@Override
	public String toString() {
		return "Rooms [roomNo=" + roomNo + ", userId=" + userId + ", address=" + address + ", location=" + location
				+ ", roomName=" + roomName + ", roomTitle=" + roomTitle + ", roomDes=" + roomDes + ", roomType="
				+ roomType + ", roomFac=" + roomFac + ", price=" + price + ", extraCost=" + extraCost + ", minPeople="
				+ minPeople + ", maxPeople=" + maxPeople + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", enrollDate=" + enrollDate
				+ ", enrollStatus=" + enrollStatus + ", room=" + room + ", bed=" + bed + ", bath=" + bath
				+ ", buildingType=" + buildingType + ", roomSize=" + roomSize + ", minStay=" + minStay + ", maxStay="
				+ maxStay + ", roomLink=" + roomLink + ", status=" + status + ", peak=" + peak + ", fileList="
				+ fileList + ", star=" + star + ", reviewList=" + reviewList + "]";
	}

	

}
