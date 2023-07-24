<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="indexStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<div class="navbar-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="index.jsp"> <img
								src="assets/images/DialeeLogo.png" alt="" width="180"
								height="28.3" />
								<h5>Locate Store</h5>
							</a>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<section id="locateSectionPiece">
		<form action="index.jsp" method="post" id="main">
			<%
			String driver = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/dialee";
			String userName = "root";
			String passWord = "";
			try {
				Class.forName(driver);
				Connection conn = DriverManager.getConnection(connectionUrl, userName, passWord);
			%>
			<%
			String sqlC = "SELECT shopCategory FROM shopTypes";
			Statement stmtC = conn.createStatement();
			ResultSet rsC = stmtC.executeQuery(sqlC);
			%>
			<div class="row">
				<div class="col" id="locateInput">
					<%
					String sql = "SELECT state FROM category";
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					%>
					<label for="stateOptions">Shop State</label> <select
						name="stateOptions" class="form-select">
						<%
						while (rs.next()) {
						%>
						<option value="<%=rs.getString("state")%>">
							<%=rs.getString("state")%>
							<%
							}
							%>
						</option>
					</select>
				</div>
				<div class="col" id="zipCode">
					<br>
					<%
					String sqlz = "SELECT shopZip FROM registeredshops";
					Statement stmtz = conn.createStatement();
					ResultSet rsz = stmtz.executeQuery(sqlz);
					%>
					<label for="zipOptions">Shop Zipcode</label> <select
						name="zipOptions" id="zipOptions" class="form-control">
						<%
						while (rsz.next()) {
						%>
						<option value="<%=rsz.getInt("shopZip")%>">
							<%=rsz.getInt("shopZip")%>
							<%
							}
							%>
						
					</select>
				</div>
				<div class="col" id="categorySelect">
					<br> <label for="shopCategoryOptions">Shop Category</label> <select
						name="shopCategoryOptions" class="form-select"
						id="shopCategoryOptions">
						<%
						while (rsC.next()) {
						%>
						<option value="<%=rsC.getString("shopCategory")%>">
							<%=rsC.getString("shopCategory")%>
						</option>
						<%
						}
						%>
					</select>
				</div>
			</div>
			<div class="d-grid gap-2 col-12 mx-auto" id="searchButton">
				<input type="submit" value="Search"
					class="main-btn btn-hover wow fadeInUp" data-wow-delay=".6s">
			</div>
			<hr>
			<%
			/* conn.close(); */
			} catch (Exception e) {
			e.printStackTrace();

			}
			%>
		</form>
	</section>
	<%
	String selected = request.getParameter("stateOptions");
	String selectedCategory = request.getParameter("shopCategoryOptions");
	String selectedZip = request.getParameter("zipOptions");

	String url = "jdbc:mysql://localhost:3306/dialee";
	String username = "root";
	String password = "";
	Connection connts = DriverManager.getConnection(url, username, password);

	String sqlst = "SELECT*FROM registeredshops WHERE stateOptions=? AND shopCategoryOptions=? AND shopZip=?";
	PreparedStatement stmts = connts.prepareStatement(sqlst);
	stmts.setString(1, selected);
	stmts.setString(2, selectedCategory);
	stmts.setString(3, selectedZip);

	ResultSet rsts = stmts.executeQuery();

	while (rsts.next()) {
	%>
	<div class="card" style="padding-left: 30px;">
		<div class="row">
			<div class="col-sm-1">
				<p>Shop Name:</p>
			</div>
			<div class="col-sm-3">
				<h4><%=rsts.getString("shopName")%></h4>
			</div>
		</div>
		<p>
			Type:
			<%=rsts.getString("shopCategoryOptions")%></p>

		<h5>
			<br>Location
		</h5>
		<div class="row">
			<div class="col-sm-2">
				<p>
					State:
					<%=rsts.getString("stateOptions")%></p>
			</div>
			<div class="col-sm-2">
				<p>
					District:
					<%=rsts.getString("item")%></p>
			</div>
			<div class="col-sm-2">
				<p>
					City:
					<%=rsts.getString("shopCity")%></p>
			</div>
			<div class="col-sm-2">
				<p>
					Zip Code:
					<%=rsts.getString("shopZip")%></p>
			</div>
		</div>
		<p>
			Address:
			<%=rsts.getString("addressLine")%>
		<div class="row">
			<div class="col-sm-2">
				<p>
					Latitude:
					<%=rsts.getFloat("latitude")%></p>
			</div>
			<div class="col-sm-2">
				<p>
					Longitude:
					<%=rsts.getFloat("longitude")%></p>
			</div>
		</div>
		<h5>
			<br>Contact Details:
		</h5>
		<div class="row">
			<div class="col-sm-3">
				<p>
					Primary Contact:
					<%=rsts.getString("phnNumber")%></p>
			</div>
			<div class="col-sm-3">
				<p>
					Alternate Contact:
					<%=rsts.getString("shopPhnNumber")%></p>
			</div>
		</div>
		<h5>
			<br>Owner Details:
		</h5>
		<div class="row">
			<div class="col-sm-2">
				<p>
					First Name:
					<%=rsts.getString("ownerName")%></p>
			</div>
			<div class="col-sm-2">
				<p>
					Middle Name:
					<%=rsts.getString("ownerMiddleName")%></p>
			</div>
			<div class="col-sm-2">
				<p>
					Last Name:
					<%=rsts.getString("ownerLastName")%></p>
			</div>
		</div>
		<h5>
			<br>Contact Details:
		</h5>
		<div class="row">
			<div class="col-sm-2">
				<p>
					Phone number:
					<%=rsts.getString("ownerNumber")%></p>
			</div>
			<div class="col-sm">
				<p>
					Email ID:
					<%=rsts.getString("ownerEmailID")%></p>
			</div>
		</div>
	</div>
	<hr>
	<%
	}
	rsts.close();
	stmts.close();
	connts.close();
	%>



	<a href="#" class="scroll-top btn-hover"> <i
		class="fa fa-chevron-up"></i>
	</a>



	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
</body>
</html>