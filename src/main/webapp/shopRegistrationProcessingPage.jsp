<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="bean.ShopRegistration"%>
<%@page import="dao.ShopRegistrationDAO"%>
<jsp:useBean id="shreg" class="bean.ShopRegistration"></jsp:useBean>
<jsp:setProperty property="*" name="shreg" />
<%
int i = ShopRegistrationDAO.registerShop(shreg);
if (i > 0) {
	request.getRequestDispatcher("adminPage.jsp").forward(request, response);

}
%>