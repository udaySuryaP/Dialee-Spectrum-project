package dao;

import bean.OwnerSignIn;
import provider.ConnectionProviderSignInPage;

import java.sql.*;
public class OwnerSignInPageDAO {
	public static boolean validate(OwnerSignIn ownerSignIn) {
		boolean status=false;
		try {
			Connection con=ConnectionProviderSignInPage.getCon();
			PreparedStatement smt=con.prepareStatement("SELECT*from registeredshops where ownerEmailID=? and shopPassword=?");
			smt.setString(1,ownerSignIn.getUserNameInput());
			smt.setString(2,ownerSignIn.getPassWordInput());
			
			ResultSet rs=smt.executeQuery();
			status=rs.next();
		}catch(Exception e) {
			System.out.println("ConError");
		}
		return status;
		
	}

}
