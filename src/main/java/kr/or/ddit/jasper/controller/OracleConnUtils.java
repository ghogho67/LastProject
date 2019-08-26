package kr.or.ddit.jasper.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnUtils {

	public static Connection getOracleConnection() throws ClassNotFoundException, SQLException {

		String hostName = "112.220.114.130";
		String sid = "xe";
		String userName = "team3_201901F";
		String password = "java";

		return getOracleConnection(hostName, sid, userName, password);

	}

	public static Connection getOracleConnection(String hostName, String sid, String userName, String password)
			throws ClassNotFoundException, SQLException {

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String connectionURL = "jdbc:oracle:thin:@" + hostName + ":1521:" + sid;

		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
		return conn;
	}

}
