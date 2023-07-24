package dao;

import java.sql.*;
import bean.SignInPage;
import provider.ConnectionProviderSignInPage;
public class SignInPageDAO {
	public static boolean validate(SignInPage signInBean) {
		boolean status=false;
		try {
			Connection con=ConnectionProviderSignInPage.getCon();
			PreparedStatement smt=con.prepareStatement("select*from usersignup where userNameInput=? and passWordInput=?");
			smt.setString(1,signInBean.getUserNameInput());
			smt.setString(2,signInBean.getPassWordInput());
			
			ResultSet rs= smt.executeQuery();
			status=rs.next();
			
		}catch (Exception e) {
			System.out.println("ConError");
		}
		return status;
	}

}
