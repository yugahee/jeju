package room.model.vo;

import java.sql.Date;

public class Room {
	private int room_no;       		// 숙소번호
	private String user_id;    		// 호스트ID
	private String address;	   		// 주소
	private String location;  		// 지역
	private String room_name; 		// 숙소명
	private String room_title; 		// 숙소제목
	private String room_des;   		// 숙소소개
	private String room_type; 		// 숙소종류
	private String room_fac;  		// 숙소시설
	private int price;        		// 가격(1박기준)
	private int min_people;    		// 기준인원
	private int max_people;    		// 최대인원
	private String start_time; 		// 입실시간
	private String end_time;   		// 퇴실시간
	private Date create_date;  		// 생성날짜
	private Date modify_data; 		// 수정날짜
	private Date enroll_date;  		// 승인날짜
	private String enroll_status;   // 등록상태
	private int room; 				// 방 개수
	private int bed; 				// 침대 개수
	private int bath; 				// 욕실 개수
	private String building_type;   // 건물유형
	private String room_size;       // 건물평수
	private int min_stay;           // 최소 숙박일수
	private int max_stay;           // 최대 숙박일수
	private String status;          // 상태
	private String room_link;       // 유튜브 주소
	private int extra_cost;         // 추가 인원 금액
	private int star; 		        // 별점(숙소리뷰 테이블 참조)
	
	public Room() {}

	public Room(int room_no, String user_id, String address, String location, String room_name, String room_title,
			String room_des, String room_type, String room_fac, int price, int min_people, int max_people,
			String start_time, String end_time, Date create_date, Date modify_data, Date enroll_date,
			String enroll_status, int room, int bed, int bath, String building_type, String room_size, int min_stay,
			int max_stay, String status, String room_link, int extra_cost, int star) {
		super();
		this.room_no = room_no;
		this.user_id = user_id;
		this.address = address;
		this.location = location;
		this.room_name = room_name;
		this.room_title = room_title;
		this.room_des = room_des;
		this.room_type = room_type;
		this.room_fac = room_fac;
		this.price = price;
		this.min_people = min_people;
		this.max_people = max_people;
		this.start_time = start_time;
		this.end_time = end_time;
		this.create_date = create_date;
		this.modify_data = modify_data;
		this.enroll_date = enroll_date;
		this.enroll_status = enroll_status;
		this.room = room;
		this.bed = bed;
		this.bath = bath;
		this.building_type = building_type;
		this.room_size = room_size;
		this.min_stay = min_stay;
		this.max_stay = max_stay;
		this.status = status;
		this.room_link = room_link;
		this.extra_cost = extra_cost;
		this.star = star;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_title() {
		return room_title;
	}

	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}

	public String getRoom_des() {
		return room_des;
	}

	public void setRoom_des(String room_des) {
		this.room_des = room_des;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRoom_fac() {
		return room_fac;
	}

	public void setRoom_fac(String room_fac) {
		this.room_fac = room_fac;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMin_people() {
		return min_people;
	}

	public void setMin_people(int min_people) {
		this.min_people = min_people;
	}

	public int getMax_people() {
		return max_people;
	}

	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getModify_data() {
		return modify_data;
	}

	public void setModify_data(Date modify_data) {
		this.modify_data = modify_data;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getEnroll_status() {
		return enroll_status;
	}

	public void setEnroll_status(String enroll_status) {
		this.enroll_status = enroll_status;
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

	public String getBuilding_type() {
		return building_type;
	}

	public void setBuilding_type(String building_type) {
		this.building_type = building_type;
	}

	public String getRoom_size() {
		return room_size;
	}

	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}

	public int getMin_stay() {
		return min_stay;
	}

	public void setMin_stay(int min_stay) {
		this.min_stay = min_stay;
	}

	public int getMax_stay() {
		return max_stay;
	}

	public void setMax_stay(int max_stay) {
		this.max_stay = max_stay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRoom_link() {
		return room_link;
	}

	public void setRoom_link(String room_link) {
		this.room_link = room_link;
	}

	public int getExtra_cost() {
		return extra_cost;
	}

	public void setExtra_cost(int extra_cost) {
		this.extra_cost = extra_cost;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", user_id=" + user_id + ", address=" + address + ", location=" + location
				+ ", room_name=" + room_name + ", room_title=" + room_title + ", room_des=" + room_des + ", room_type="
				+ room_type + ", room_fac=" + room_fac + ", price=" + price + ", min_people=" + min_people
				+ ", max_people=" + max_people + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", create_date=" + create_date + ", modify_data=" + modify_data + ", enroll_date=" + enroll_date
				+ ", enroll_status=" + enroll_status + ", room=" + room + ", bed=" + bed + ", bath=" + bath
				+ ", building_type=" + building_type + ", room_size=" + room_size + ", min_stay=" + min_stay
				+ ", max_stay=" + max_stay + ", status=" + status + ", room_link=" + room_link + ", extra_cost="
				+ extra_cost + ", star=" + star + "]";
	}
	
	

}
