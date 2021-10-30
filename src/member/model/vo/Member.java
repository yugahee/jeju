package member.model.vo;

import java.sql.Date;

public class Member {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String phone;
	private String email;
	private String user_type;
	private int point;
	private Date enroll_date;
	private Date modify_date;
	private String status;
	private int report_count;
	
	public Member() {}

	public Member(String user_id, String user_pwd, String user_name, String phone, String email, String user_type,
			int point, Date enroll_date, Date modify_date, String status, int report_count) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.phone = phone;
		this.email = email;
		this.user_type = user_type;
		this.point = point;
		this.enroll_date = enroll_date;
		this.modify_date = modify_date;
		this.status = status;
		this.report_count = report_count;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", phone=" + phone
				+ ", email=" + email + ", user_type=" + user_type + ", point=" + point + ", enroll_date=" + enroll_date
				+ ", modify_date=" + modify_date + ", status=" + status + ", report_count=" + report_count + "]";
	}
	
	
}
