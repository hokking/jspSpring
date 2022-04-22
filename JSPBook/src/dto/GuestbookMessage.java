package dto;

// 자바빈 클래스
public class GuestbookMessage {
	private int messageId;
	private String guestName;
	private String password;
	private String message;
	// 기본 생성자(Constructor)
	public GuestbookMessage() {
		super();
	}
	
	// 생성자
	public GuestbookMessage(int messageId, String guestName, String password, String message) {
		super();
		this.messageId = messageId;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "GuestbookMessage [messageId=" + messageId + ", guestName=" + guestName + ", password=" + password
				+ ", message=" + message + "]";
	}

}
