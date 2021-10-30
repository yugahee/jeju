package common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	public static Connection getConnection() {
		Connection conn = null;
		Properties driver = new Properties();
		String fileName = JDBCTemplate.class.getResource("/sql/driver.properties").getPath();
		
		// System.out.println(fileName);
		
		try {
			 driver.load(new FileReader(fileName));
			 
			 // 1. OracleDriver 등록
			 Class.forName(driver.getProperty("driver"));
			 
			 // 2. DBMS와 연결
			 conn = DriverManager.getConnection(driver.getProperty("url"),driver.getProperty("user"),driver.getProperty("password"));
			 
			 // 3. 트랜잭션 관리는 application에서 수행하기 위해 자동 commit 방지
			 conn.setAutoCommit(false);
			 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;		
	}
	
	// 사용 객체 반환 메소드(Connection, Statement, ResultSet)
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
