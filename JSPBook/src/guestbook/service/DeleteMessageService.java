package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import dto.GuestbookMessage;
import guestbook.dao.MessageDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance() {
		return instance;
	}
	private DeleteMessageService() {}
	
	// 데이터 삭제
	public int delete(GuestbookMessage message) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao messageDao = MessageDao.getInstance();
			
			int result = messageDao.delete(conn, message);
			return result;
		} catch (SQLException e) {
			// 삭제 시 문제가 발생되면 롤백 처리
			// DC(control)L : commit, rollback(마지막 커밋 시점으로 돌아감)
			// -> 트랜잭션이 종료가 되는 동시에 새로운 트랜잭션이 시작
			// -> 트랜잭션 : DB를 변경하기 위해 수행되어야 할 논리적 단위(여러개의 sql로 구성)
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패", e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
