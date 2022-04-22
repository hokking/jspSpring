package guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dto.GuestbookMessage;
import jdbc.JdbcUtil;

// Data Access Object
public class MessageDao {
	// 싱글톤 패턴
	private static MessageDao instance = new MessageDao();
	public static MessageDao getInstance() {
		return instance;
	}
	private MessageDao() {}
	
	/** 
	 * guestbook_message 테이블로 insert
	 * insert, update, delete 기본 return type은 int
	 * params : 커넥션 객체, 무엇을
	**/
	public int insert(Connection conn, GuestbookMessage message) {
		// 선언
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO GUESTBOOK_MESSAGE(MESSAGE_ID,GUEST_NAME, PASSWORD, MESSAGE)" + 
					"VALUES(" + 
					"    (SELECT NVL(MAX(MESSAGE_ID), 0) + 1 FROM GUESTBOOK_MESSAGE)" + 
					"    , ?, ?, ?" + 
					")"
				);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			// 주의! 커넥션 객체는 비즈니스로직에서 닫음(Service)
			JdbcUtil.close(pstmt);
		}
	}
	
	// list.jsp의 메시지 목록
	public List<GuestbookMessage> selectList(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// select 구문
			String sql = "SELECT MESSAGE_ID"
					+ "	, GUEST_NAME"
					+ "	, PASSWORD"
					+ "	, MESSAGE"
					+ " FROM GUESTBOOK_MESSAGE"
					+ " ORDER BY MESSAGE_ID DESC";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) { // select 결과가 있음
				List<GuestbookMessage> messageList = 
						new ArrayList<GuestbookMessage>();
				do {
					GuestbookMessage vo = new GuestbookMessage();
					vo.setMessageId(rs.getInt("MESSAGE_ID"));
					vo.setGuestName(rs.getString("GUEST_NAME"));
					vo.setPassword(rs.getString("PASSWORD"));
					vo.setMessage(rs.getString("MESSAGE"));
					
					messageList.add(vo);
				} while(rs.next());
				return messageList;
			} else { // select 결과가 없음
				return Collections.emptyList();
			}
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
	}
	
	// 메시지 수정(커넥션, 무엇을)
	public int update(Connection conn, GuestbookMessage message) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE GUESTBOOK_MESSAGE" + 
					" SET GUEST_NAME = ?," + 
					"     MESSAGE = ?" + 
					" WHERE MESSAGE_ID = ?" + 
					"   AND PASSWORD = ?");
			pstmt.setString(1, message.getGuestName());
			pstmt.setNString(2, message.getMessage());
			pstmt.setInt(3, message.getMessageId());
			pstmt.setNString(4, message.getPassword());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	// 삭제
	public int delete(Connection conn, GuestbookMessage message) {
		PreparedStatement pstmt = null; 
		try {
			pstmt = conn.prepareStatement(
					"DELETE FROM GUESTBOOK_MESSAGE"
					+ " WHERE MESSAGE_ID = ?");
			pstmt.setInt(1, message.getMessageId());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
	}
}
