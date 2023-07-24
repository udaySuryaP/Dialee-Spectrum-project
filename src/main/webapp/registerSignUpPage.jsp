<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="bean.SignUpPage"%>
<%@page import="dao.SignUpPageDAO"%>

<jsp:useBean id="sup" class="bean.SignUpPage"></jsp:useBean>
<jsp:setProperty property="*" name="sup" />

<%
boolean status = false;
String username = (String) request.getParameter("userNameInput");
String password = request.getParameter("passWordInput");
String phnInput = request.getParameter("phnInput");

List<String> dataList = new ArrayList<String>();

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dialee", "root", "");
	stmt = con.prepareStatement("SELECT userNameInput FROM usersignup");
	rs = stmt.executeQuery();

	while (rs.next()) {
		String data = rs.getString("userNameInput");
		dataList.add(data);
	}

	for (String data : dataList) {
		if (data.equals(username)) {
			status = true;
			break;
		}
	}

	if (status) {
		out.println("<script>alert('User email already exists!');history.back();</script>");
	} else {
		int i = SignUpPageDAO.register(sup);
		if (i > 0) {
			request.getRequestDispatcher("adminPage.jsp").forward(request, response);
		}
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (rs != null)
	rs.close();
		if (stmt != null)
	stmt.close();
		if (con != null)
	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
