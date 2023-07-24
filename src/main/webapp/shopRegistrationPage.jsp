<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.sql.Select"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
</head>
<style>
.card {
	background-color: white;
	box-shadow: 0 3px 10px rgb(0 0 0/ 0.2);
}
</style>
<script type="text/javascript">
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			document.getElementById("latitude").value = "Geolocation not supported.";
			document.getElementById("longitude").value = "Geolocation not supported."
		}
	}
	function showPosition(position) {
		document.getElementById("latitude").value = position.coords.latitude;
		document.getElementById("longitude").value = position.coords.longitude;
	}

	function signInValidation() {
		var shName = document.getElementById("shopName").value;
		var shCity = document.getElementById("shopCity").value;
		var shlat = document.getElementById("latitude").value;
		var shAddress = document.getElementById("addressLine").value;
		var shPrimaryNumber = document.getElementById("phnNumber").value;
		var phnPattern = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;
		var shSecondaryNumber = document.getElementById("shopPhnNumber").value;
		var shOwnerNumber = document.getElementById("ownerNumber").value;
		var shOwnerName = document.getElementById("ownerName").value;
		var shOwnerEmail = document.getElementById("ownerEmailID").value;
		var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var district = document.getElementById("item").value;
		var ownerLastName = document.getElementById("ownerLastName").value;
		var shZip = document.getElementById("shopZip").value;
		var shPassword=document.getElementById("shopPassword").value;
		var passwordPattern=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*()-])/;
		var confirmShPassword=document.getElementById("conShopPassword").value;
		var shZipPattern=/^[1-9]{1}\d{2}\s?\d{3}$/;

		if (shName == "") {
			alert("Please enter shop name");
			document.getElementById("shopName").focus();
			return false;
		}
		if (district == "") {
			alert("Please enter district");
			document.getElementById("item").focus();
			return false;
		}
		if (shCity == "") {
			alert("Please enter shop city");
			document.getElementById("shopCity").focus();
			return false;
		}
		if (shZip == "") {
			alert("Please enter zip code");
			document.getElementById("shopZip").focus();
			return false;
		}
		if(!shZipPattern.test(shZip)){
			alert("Invalid zip code");
			document.getElementById("shopZip").focus();
			return false;
		}
		if (shAddress == "") {
			alert("Enter shop address line");
			document.getElementById("addressLine").focus();
			return false;
		}
		if (shlat == "") {
			alert("Please find your location");
			document.getElementById("latitude").focus();
			return false;
		}
		if (shPrimaryNumber == "") {
			alert("Please enter phone number");
			document.getElementById("phnNumber").focus();
			return false;
		}
		if (!phnPattern.test(shPrimaryNumber)) {
			alert("Invalid phone number");
			document.getElementById("phnNumber").focus();
			return false;
		}
		if (shSecondaryNumber == "") {
			alert("Please enter phone number")
			document.getElementById("shopPhnNumber").focus();
			return false;
		}
		if (!phnPattern.test(shSecondaryNumber)) {
			alert("Invalid phone number");
			document.getElementById("shopPhnNumber").focus();
			return false;
		}
		if (shOwnerNumber == "") {
			alert("Please enter phone number");
			document.getElementById("ownerNumber").focus();
			return false;
		}
		if (!phnPattern.test(shOwnerNumber)) {
			alert("Invalid phone number");
			document.getElementById("ownerNumber").focus();
			return false;
		}
		if (shOwnerName == "") {
			alert("Please enter name");
			document.getElementById("ownerName").focus();
			return false;
		}
		if (ownerLastName == "") {
			alert("Please enter last name");
			document.getElementById("ownerLastName").focus();
			return false;
		}
		if (shOwnerEmail == "") {
			alert("Please enter email");
			document.getElementById("ownerEmailID").focus();
			return false;
		}
		if (!emailPattern.test(shOwnerEmail)) {
			alert("Invalid email");
			document.getElementById("ownerEmailID").focus();
			return false;
		}
		if(shPassword==""){
			alert("Please enter password");
			document.getElementById("shopPassword").focus();
			return false;
		}
		if(!passwordPattern.test(shPassword)){
			alert("Upper case, Lower case, Special character and numeric letter are required");
			document.getElementById("shopPassword").focus();
			return false;
		}
		if(confirmShPassword==""){
			alert("Please retype your password");
			document.getElementById("conShopPassword").focus();
			return false;
		}
		if(confirmShPassword!=shPassword){
			alert("Passwords must be same");
			document.getElementById("conShopPassword").focus();
			return false;
		}

		return true;
	}
</script>
<body>
	<%
	out.print(session.getAttribute("userData"));
	if (session == null || session.getAttribute("userData") == null) {
		response.sendRedirect("signInPage.jsp");
	}
	%>
	<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/dialee";
	String userName = "root";
	String passWord = "";
	%>

	<header class="header">
		<div class="navbar-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand"> <img
								src="assets/images/DialeeLogo.png" alt="" width="180"
								height="28.3" />
							</a>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>

	<section>
		<br>
		<div id="mainSection">
			<br>
			<div class="container"></div>
			<div class="col" id="shopInformation">
				<form action="shopRegistrationProcessingPage.jsp" method="post"
					onsubmit="return signInValidation()">
					<h2 align="left">Shop Information</h2>
					<div id="shopNameAndCategory">
						<div class="card">
							<div class="card-body">
								<h3 class="card-title">Shop details</h3>
								<div id="shopNameCard">
									<label for="shopName">Shop name</label> <input
										class="form-control" type="text" id="shopName" name="shopName"
										placeholder="Enter your shop name"> <br> <label
										for="shopCategory">Shop category</label>
									<%
									try {
										Class.forName(driver);
										Connection conn = DriverManager.getConnection(connectionUrl, userName, passWord);
									%>
									<%
									String sql2 = "SELECT shopCategory FROM shopTypes";
									Statement stmt2 = conn.createStatement();
									ResultSet rs2 = stmt2.executeQuery(sql2);
									%>

									<div class="row">
										<div class="col input-group mb-3" id="categorySelect">
											<select name="shopCategoryOptions" class="form-select"
												id="shopCategoryOptions">
												<%
												while (rs2.next()) {
												%>
												<option value="<%=rs2.getString("shopCategory")%>">
													<%=rs2.getString("shopCategory")%>
												</option>
												<%
												}
												%>
											</select>
										</div>
									</div>
									<%
									conn.close();
									} catch (Exception e) {
									e.printStackTrace();

									}
									%>
									<br>
									<div class="row g-3" id="shopAddress">
										<div class="col-sm">
											<label for="stateSelect">State</label>
											<%
											try {
												Class.forName(driver);
												Connection conn = DriverManager.getConnection(connectionUrl, userName, passWord);
											%>
											<%
											String sql = "SELECT state FROM category";
											Statement stmt = conn.createStatement();
											ResultSet rs = stmt.executeQuery(sql);
											%>

											<div class="row">
												<div class="col input-group mb-3" id="stateSelect">
													<select name="stateOptions" class="form-select">
														<%
														while (rs.next()) {
														%>
														<option value="<%=rs.getString("state")%>">
															<%=rs.getString("state")%>
														</option>
														<%
														}
														%>
													</select>
												</div>
											</div>

											<%
											String selected = request.getParameter("stateOptions");
											%>

											<%
											conn.close();
											} catch (Exception e) {
											e.printStackTrace();

											}
											%>


										</div>

										<div class="col-sm">
											<!-- district -->
											<label>District</label>
											<%
											Connection connd = null;
											ArrayList<String> items = new ArrayList<String>();
											try {
												Class.forName(driver);
												connd = DriverManager.getConnection(connectionUrl, userName, passWord);
												String sql = "SELECT stateDistricts from districts";
												PreparedStatement stmt = connd.prepareStatement(sql);
												ResultSet rs = stmt.executeQuery(sql);
												while (rs.next()) {
													items.add(rs.getString("stateDistricts"));

												}
											} catch (Exception e) {
												e.printStackTrace();
											} finally {
												if (connd != null) {
													try {
												connd.close();
													} catch (SQLException e) {
												e.printStackTrace();
													}
												}
											}
											%>
											<input type="text" class="form-control" id="item" name="item"
												list="items" placeholder="Select district" />
											<datalist id="items">
												<%
												for (String item : items) {
													out.println("<option value=\"" + item + "\">");
												}
												%>
											</datalist>
										</div>
										<div class="col-sm">
											<label for="shopCity">City</label> <input type="text"
												id="shopCity" name="shopCity" class="form-control"
												placeholder="Enter City">
										</div>
										<div class="col-sm">
											<label for="shopZip">Zip Code</label> <input type="number"
												id="shopZip" name="shopZip" placeholder="Enter Zip Code"
												class="form-control">

										</div>
									</div>
								</div>
								<br>
								<div id="shopAddressLineSection">
									<label for="addressLine">Address Line</label> <input
										type="text" class="form-control" id="addressLine"
										name="addressLine">
								</div>
								<br>
								<div id="locationShop">
									<h3 class="card-title">Location</h3>

									<button type="button" class="btn btn-outline-secondary"
										id="locateButton" name="locateButton" onclick="getLocation()">Find
										my coordinates</button>
								</div>
								<br>
								<div class="row">
									<div class="col-md-6">
										<label for="latitude">Latitude</label> <input type="text"
											readonly class="form-control" id="latitude" name="latitude">
									</div>
									<div class="col-md-6">
										<label for="longitude">Longitude</label> <input type="text"
											readonly class="form-control" id="longitude" name="longitude">
									</div>

								</div>
							</div>
						</div>
						<br>
						<div class="card">
							<div class="card-body">
								<h3 class="card-title">Contact number</h3>
								<br>
								<div class="row g-3" id="shopContactnumber">
									<div class="col-sm-7" id="contactSection">
										<label for="phnNumber">Primary contact number</label> <input
											type="text" id="phnNumber" name="phnNumber"
											class="form-control" placeholder="Mobile number">
									</div>

								</div>
								<br>
								<div class="row g-3" id="shopContact number">
									<div class="col-sm-7">
										<label for="shopPhnNumber">Secondary contact number</label> <input
											type="text" id="shopPhnNumber" name="shopPhnNumber"
											class="form-control" placeholder="Mobile number">
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="card">
							<div class="card-body">
								<h3 class="card-title">Shop owner details</h3>
								<br>
								<div class="row g-3" id="OwnerNumber">
									<div class="col-sm-7" id="contactSectionOwner">
										<label for="ownerNumber">Contact number</label> <input
											type="text" class="form-control" placeholder="Mobile number"
											id="ownerNumber" name="ownerNumber">
									</div>
								</div>
								<br>
								<div class="row g-3" id="ownerNameSection">
									<div class="col">
										<label for="ownerName">Owner name</label> <input type="text"
											class="form-control" placeholder="First name" id="ownerName"
											name="ownerName">
									</div>
									<div class="col">
										<br> <input type="text" class="form-control"
											placeholder="Middle name -optional" id="ownerMiddleName"
											name="ownerMiddleName">
									</div>
									<div class="col">
										<br> <input type="text" class="form-control"
											placeholder="Last name" id="ownerLastName"
											name="ownerLastName">
									</div>
								</div>
								<br>
								<div id="ownerEmail">
									<label for="ownerEmailID">Email address</label><input
										type="email" class="form-control" placeholder="abc@gmail.com"
										id="ownerEmailID" name="ownerEmailID">
								</div>
								<br>
								<div class="row g-3" id="passwordSection">
									<div class="col">
										<label for="shopPassword">Password</label> <input
											type="password" class="form-control" placeholder="Password"
											id="shopPassword" name="shopPassword">
									</div>
									<div class="col">
										<br>
										<input type="password" class="form-control"
											placeholder="Retype Password" id="conShopPassword"
											name="conShopPassword">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="d-grid gap-2 col-6 mx-auto" id="registerButton">
						<input type="submit" value=" Register"
							class="main-btn btn-hover wow fadeInUp" data-wow-delay=".6s">
					</div>
					<br>
				</form>
			</div>
		</div>
	</section>
	<br>
	<footer id="footer" class="footer pt-100 pb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-widget wow fadeInUp" data-wow-delay=".2s">
						<div class="logo">
							<br> <a href="index.jsp"><img
								src="assets/images/DialeeLogoFooter.png" alt="" width="180"
								height="30.3"></a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</footer>
	<a href="#" class="scroll-top btn-hover"> <i
		class="fa fa-chevron-up"></i>
	</a>

</body>
</html>