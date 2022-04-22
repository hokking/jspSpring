package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 커넥션을 제공해주는 클래스
public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
	}
}
