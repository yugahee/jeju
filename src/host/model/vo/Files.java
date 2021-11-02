package host.model.vo;

public class Files {
	private int fileNo;
	private String changeName;
	private int roomNo;
	private String filePath;
	private int fileLevel;       // 0:메인, 1:서브
	private String status;
	
	/*FILE_NO	NUMBER
CHANGE_NAME	VARCHAR2(200 BYTE)
ROOM_NO	NUMBER
FILE_PATH	VARCHAR2(1000 BYTE)
FILE_LEVEL	NUMBER
STATUS	VARCHAR2(1 BYTE)*/
	
	public Files() {}

	public Files(int fileNo, String changeName, int roomNo, String filePath, int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.changeName = changeName;
		this.roomNo = roomNo;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Files [fileNo=" + fileNo + ", changeName=" + changeName + ", roomNo=" + roomNo + ", filePath="
				+ filePath + ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}
	
	

}
