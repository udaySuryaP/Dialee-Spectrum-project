<%@page import="dao.OwnerSignInPageDAO"%>
<jsp:useBean id="OwnerSignIn" class="bean.OwnerSignIn"></jsp:useBean>
<jsp:setProperty property="*" name="OwnerSignIn"/>

<%
boolean status=OwnerSignInPageDAO.validate(OwnerSignIn);
if(status){
	String udata=request.getParameter("userNameInput");
	if(udata!=null){
		session.setAttribute("ownerData", udata);
		response.sendRedirect("adminPage.jsp");
	}
	session.setAttribute("session", "TRUE");
}else{
	out.print("User not found");
%>
<jsp:include page="registeredAlreadySignIn.jsp"></jsp:include>
<%
}
%>