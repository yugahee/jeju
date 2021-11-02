package reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int room_reserve;          // 예약번호
	private Date start_date;		   // 시작일
	private Date end_date;			   // 종료일
	private String person_reserve;     // 예약자명 
	private String pone;			   // 전화번호
	private String reserve_state;      // 예약상태
	private int reserve_num;		   // 예약인원
	private String guest;			   // 게스트ID
	private int room_no;			   // 숙소번호
	
	public Reservation() {}

	public Reservation(int room_reserve, Date start_date, Date end_date, String person_reserve, String pone,
			String reserve_state, int reserve_num, String guest, int room_no) {
		super();
		this.room_reserve = room_reserve;
		this.start_date = start_date;
		this.end_date = end_date;
		this.person_reserve = person_reserve;
		this.pone = pone;
		this.reserve_state = reserve_state;
		this.reserve_num = reserve_num;
		this.guest = guest;
		this.room_no = room_no;
	}

	public int getRoom_reserve() {
		return room_reserve;
	}

	public void setRoom_reserve(int room_reserve) {
		this.room_reserve = room_reserve;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getPerson_reserve() {
		return person_reserve;
	}

	public void setPerson_reserve(String person_reserve) {
		this.person_reserve = person_reserve;
	}

	public String getPone() {
		return pone;
	}

	public void setPone(String pone) {
		this.pone = pone;
	}

	public String getReserve_state() {
		return reserve_state;
	}

	public void setReserve_state(String reserve_state) {
		this.reserve_state = reserve_state;
	}

	public int getReserve_num() {
		return reserve_num;
	}

	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}

	public String getGuest() {
		return guest;
	}

	public void setGuest(String guest) {
		this.guest = guest;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	@Override
	public String toString() {
		return "Reservation [room_reserve=" + room_reserve + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", person_reserve=" + person_reserve + ", pone=" + pone + ", reserve_state=" + reserve_state
				+ ", reserve_num=" + reserve_num + ", guest=" + guest + ", room_no=" + room_no + "]";
	}
	
	

}
