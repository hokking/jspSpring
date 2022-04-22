package guestbook.service;

public class ServiceException extends RuntimeException {
	// 생성자
	public ServiceException(String message, Exception cause) {
		super(message, cause);
	}
	
	// 생성자
	public ServiceException(String message) {
		super(message);
	}
}
