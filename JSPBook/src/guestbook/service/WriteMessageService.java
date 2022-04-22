package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import dto.GuestbookMessage;
import guestbook.dao.MessageDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

// ***Service.java => 비즈니스(기능) 로직
public class WriteMessageService {
	// 싱글톤 패턴 적용
	private static WriteMessageService instance = new WriteMessageService();
	public static WriteMessageService getInstance() {
		return instance;
	}
	private WriteMessageService() {}
	
	// 방명록 insert
	public void write(GuestbookMessage message) {
		// 커넥션 객체를 선언(DBCP에서 가져온 커넥션)
		Connection conn = null;
		try {
			// DBCP 커넥션 객체를 생성
			conn = ConnectionProvider.getConnection();
			
			// guestbook_message 테이블로 insert => Data Access Object 영역
			MessageDao messageDao = MessageDao.getInstance();
			int result = messageDao.insert(conn, message);
		} catch (SQLException e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
