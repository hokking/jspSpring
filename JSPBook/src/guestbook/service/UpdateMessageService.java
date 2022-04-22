package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import dto.GuestbookMessage;
import guestbook.dao.MessageDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class UpdateMessageService {
	private static UpdateMessageService instance = 
				new UpdateMessageService();
	public static UpdateMessageService getInstance() {
		return instance;
	}
	private UpdateMessageService() {}
	
	// 메시지를 update하는 비즈니스 로직
	public int update(GuestbookMessage message) throws SQLException {
		Connection conn = null;
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();
			// DAO 객체 생성
			MessageDao messageDao = MessageDao.getInstance();
			result = messageDao.update(conn, message);
		} catch (SQLException e) {
			throw new ServiceException("메시지 수정 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
		return result;
	}
}
