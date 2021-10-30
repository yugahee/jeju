package payment.model.vo;

import java.util.Date;

public class Payment {
	private int recepNo;		// 예약 번호
	private String payDivi;		// 환불인지 결제인지 구분
	private int price;			// 금액
	private Date payDate;		// 날짜
	
	public Payment() {}
	
	public Payment(int recepNo, String payDivi, int price, Date payDate) {
		super();
		this.recepNo = recepNo;
		this.payDivi = payDivi;
		this.price = price;
		this.payDate = payDate;
	}

	public int getRecepNo() {
		return recepNo;
	}

	public void setRecepNo(int recepNo) {
		this.recepNo = recepNo;
	}

	public String getPayDivi() {
		return payDivi;
	}

	public void setPayDivi(String payDivi) {
		this.payDivi = payDivi;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "Payment [recepNo=" + recepNo + ", payDivi=" + payDivi + ", price=" + price + ", payDate=" + payDate
				+ "]";
	}
		
}
