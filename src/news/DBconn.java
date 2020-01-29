package news;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconn {
	final private String url="jdbc:mysql://localhost:3306/tb_news?"+
			"serverTimezone=UTC&useSSL=false&characterEncoding=utf-8";
	final private String user = "root";
	final private String pwd = "123456";
	final private String driver = "com.mysql.cj.jdbc.Driver";
	ResultSet rs;
	Connection conn;
	
	public DBconn() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 *  ���ݲ�ѯ�ķ����������ؿɹ����Ľ����
	 * @param sql
	 * @return
	 */
	public ResultSet Querysimple(String sql) {
		rs = null;
		Statement stmt;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * ���ݲ�ѯ�ķ������ɷ��ؿɹ����Ľ����
	 * @param sql
	 * @return
	 */
	public ResultSet executeQuery(String sql) {
		rs = null;
		Statement stmt;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * �����޸ĵķ���
	 * @param sql
	 * @return
	 */
	public int executeUpdate(String sql) {
		int i = 0;
		Statement stmt;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			stmt = conn.createStatement();
			i = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * �رն���
	 */
	public void close() {
		
		try {
			if(rs != null) {
				rs.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
