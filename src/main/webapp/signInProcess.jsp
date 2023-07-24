<%@page import="dao.SignInPageDAO"%>
<jsp:useBean id="signInBean" class="bean.SignInPage"/>
<jsp:setProperty property="*" name="signInBean"/>

<%
boolean status=SignInPageDAO.validate(signInBean);
if(status){
	String udata=request.getParameter("userNameInput");
	if(udata!=null){
		session.setAttribute("userData", udata);
		response.sendRedirect("signedInPage.jsp");
	}
session.setAttribute("session","TRUE");
}else{
	out.print("User not found");
%>
<jsp:include page="signInPage.jsp"></jsp:include>
<%
}
%> 