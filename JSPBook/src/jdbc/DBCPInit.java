package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

//서블릿 클래스
public class DBCPInit extends HttpServlet {
	@Override
	public void init() throws ServletException{
		//JDBC Driver를 로딩
		loadJDBCDriver();
		
		//커넥션풀을 초기화
		initConnectionPool();
	}
	
	//JDBC Driver를 로딩
	private void loadJDBCDriver() {
		try {
			//커넥션풀이 내부에서 사용할 JDBC Driver를 로딩함
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}
	
	//커넥션풀을 초기화
	private void initConnectionPool() {
		try {
			//의국     에서 새로운 외과 의사를 생성할 때 필요한 외과가             있어야 함
			//커넥션풀에서 새로운 커넥션   을 생성할 때 사용할 커넥션 펙토리를 생성
			ConnectionFactory connFactory = 
					new DriverManagerConnectionFactory(
							"jdbc:oracle:thin:@localhost:1521:xe"
							,"jspexam"
							,"java"
							);
			//DBCP는 커넥션풀에 커넥션을 보관할 때 PoolableConnection을 사용
			//이 Class는 내부적으로 실제 Connection을 담고 있음
			//커넥션 풀을 관리
			PoolableConnectionFactory poolableConnFactory =
					new PoolableConnectionFactory(connFactory, null);
			
			//커넥션이 유효한지 여부 검사 시 사용할 쿼리
			poolableConnFactory.setValidationQuery("select 1");
			
			//커넥션 풀의 설정 정보 생성
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			
			//유휴 커넥션 검사 주기(1/1000초)
			//놀고 있는 커넥션을 풀에서 제거하는 시간 기준(5분)
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			
			//풀에 보관중인 커넥션이 유효한지 검사할지 여부
			poolConfig.setTestWhileIdle(true);
			
			//커넥션 최소 개수
			poolConfig.setMinIdle(4);
			
			//커넥션 최대 개수
			poolConfig.setMaxTotal(50);
			
			//커넥션풀의 설정 정보를 생성. 팩토리와 커넥션풀 설정을 파라미터로 받음
			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			
			//풀러불커넥션팩토리에도 생성이된 커넥션 풀을 연결
			poolableConnFactory.setPool(connectionPool);;
			
			//커넥션 풀을 제공하는 JDBC 드라이버를 등록함
			//oracle.jdbc.driver.OracleDriver
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = 
					(PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			//커넥션 풀 드라이버에 생성된 커넥션 풀을 등록
			//jdbc:apache:commons:dbcp:ddit
			driver.registerPool("ddit", connectionPool);
		}catch(Exception e) {
			throw new RuntimeException(e);
		}//end try
	}//end initConnectionPool()
}










