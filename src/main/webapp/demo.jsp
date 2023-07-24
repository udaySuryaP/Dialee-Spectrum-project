<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dialee","root","");

Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT userNameInput FROM usersignup");

List<String> dataList=new ArrayList<String>();

while(rs.next()){
	String data=rs.getString("userNameInput");
	dataList.add(data);
}
rs.close();
stmt.close();
con.close();
%>
<%
String username="uday@gmail.com";
boolean found=false;

for(String data:dataList){
	if(data.equals(username)){
		found=true;
		break;
	}
}
if(found){
	out.println("Username "+ username+" is in the list");
}else{
	out.println("Username "+ username+" is not in the list");
}
%>
</body>
</html>