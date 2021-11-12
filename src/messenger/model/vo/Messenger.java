package messenger.model.vo;

//시,분,초까지 가져오기 위해 sql.Date가 아닌 util.Date를 임포트
import java.util.Date;

public class Messenger {
	private int msg_no;					// 메시지 번호
	private String msg_cate;			// 메시지 카테고리
	private String msg_content;			// 메시지 내용
	private String chk_status;			// 받는 회원 읽음 여부 확인
	private String reply_status;		// 답변 여부 확인
	private Date msg_date;				// 작성 시간
	private Date reply_date;			// 답변 시간
	private String reply_content;		// 답변 내용
	private String from_user;			// 보낸 회원
	private String to_user;				// 받는 회원
	private String msg_status;			// 메시지 상태(삭제 시 'N')
	private Date modify_date;			// 수정 시간(받은 이가 읽기 전까지 수정 가능)
	private String report_user;			// 피신고인

	public Messenger() {}
	
	public Messenger(int msg_no, String msg_cate, String msg_content, String chk_status, String reply_status,
			Date msg_date, Date reply_date, String reply_content, String from_user, String to_user, String msg_status,
			Date modify_date, String report_user) {
		super();
		this.msg_no = msg_no;
		this.msg_cate = msg_cate;
		this.msg_content = msg_content;
		this.chk_status = chk_status;
		this.reply_status = reply_status;
		this.msg_date = msg_date;
		this.reply_date = reply_date;
		this.reply_content = reply_content;
		this.from_user = from_user;
		this.to_user = to_user;
		this.msg_status = msg_status;
		this.modify_date = modify_date;
		this.report_user = report_user;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getMsg_cate() {
		return msg_cate;
	}

	public void setMsg_cate(String msg_cate) {
		this.msg_cate = msg_cate;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getChk_status() {
		return chk_status;
	}

	public void setChk_status(String chk_status) {
		this.chk_status = chk_status;
	}

	public String getReply_status() {
		return reply_status;
	}

	public void setReply_status(String reply_status) {
		this.reply_status = reply_status;
	}

	public Date getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getFrom_user() {
		return from_user;
	}

	public void setFrom_user(String from_user) {
		this.from_user = from_user;
	}

	public String getTo_user() {
		return to_user;
	}

	public void setTo_user(String to_user) {
		this.to_user = to_user;
	}

	public String getMsg_status() {
		return msg_status;
	}

	public void setMsg_status(String msg_status) {
		this.msg_status = msg_status;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getReport_user() {
		return report_user;
	}

	public void setReport_user(String report_user) {
		this.report_user = report_user;
	}

	@Override
	public String toString() {
		return "Messenger [msg_no=" + msg_no + ", msg_cate=" + msg_cate + ", msg_content=" + msg_content
				+ ", chk_status=" + chk_status + ", reply_status=" + reply_status + ", msg_date=" + msg_date
				+ ", reply_date=" + reply_date + ", reply_content=" + reply_content + ", from_user=" + from_user
				+ ", to_user=" + to_user + ", msg_status=" + msg_status + ", modify_date=" + modify_date
				+ ", report_user=" + report_user + "]";
	}
	
}
