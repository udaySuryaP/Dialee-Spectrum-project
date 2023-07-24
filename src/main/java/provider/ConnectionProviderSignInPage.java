package provider;

import java.sql.*;

public class ConnectionProviderSignInPage implements DataBaseConnectionProvider {
	private static Connection con=null;
	static {
		try {
			Class.forName(DataBaseConnectionProvider.driver);
			con=DriverManager.getConnection(connectionUrl, userName, passWord);
		} catch (Exception e) {
			System.out.println("Error");
		}
	}
	public static Connection getCon() {
		return con;
		
	}

}
