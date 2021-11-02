package host.model.vo;

import java.sql.Date;

public class PeakSeason {
	private int roomNo;         // 숙소번호
	private Date peakStart;     // 성수기시작날짜
	private Date peakEnd;       // 성수기종료날짜
	private int peakPrice;      // 성수기가격(1박기준)
	
	/* ROOM_NO	NUMBER
	PEAK_START	DATE
	PEAK_END	DATE
	PEAK_PRICE	NUMBER*/
	
	public PeakSeason() {}

	public PeakSeason(int roomNo, Date peakStart, Date peakEnd, int peakPrice) {
		super();
		this.roomNo = roomNo;
		this.peakStart = peakStart;
		this.peakEnd = peakEnd;
		this.peakPrice = peakPrice;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public Date getPeakStart() {
		return peakStart;
	}

	public void setPeakStart(Date peakStart) {
		this.peakStart = peakStart;
	}

	public Date getPeakEnd() {
		return peakEnd;
	}

	public void setPeakEnd(Date peakEnd) {
		this.peakEnd = peakEnd;
	}

	public int getPeakPrice() {
		return peakPrice;
	}

	public void setPeakPrice(int peakPrice) {
		this.peakPrice = peakPrice;
	}

	@Override
	public String toString() {
		return "PeakSeason [roomNo=" + roomNo + ", peakStart=" + peakStart + ", peakEnd=" + peakEnd + ", peakPrice="
				+ peakPrice + "]";
	}
	
	
	
}
