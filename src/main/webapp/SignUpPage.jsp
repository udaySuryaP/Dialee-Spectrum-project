<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Array"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
<script type="text/javascript">
	function registrationValidate() {
		var uname = document.getElementById("userNameInput").value;
		var unamePattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var pswd = document.getElementById("passWordInput").value;
		var passPattern = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*()-])/;
		var cpswd = document.getElementById("conPassWordInput").value;
		var phn = document.getElementById("phnInput").value;
		var phnPattern = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;
		if (uname == "") {
			alert("Please enter user email");
			document.getElementById("userNameInput").focus();
			return false;
		}
		if (!unamePattern.test(uname)) {
			alert("Invalid email");
			document.getElementById("userNameInput").focus();
			return false;
		}
		if (pswd == "") {
			alert("Please enter password");
			document.getELementById("passWordInput").focus();
			return false;
		}
		if (!passPattern.test(pswd)) {
			alert("Upper case, Lower case, Special character and numeric letter are required");
			document.getElementById("passWordInput").focus();
			return false;
		}
		if (cpswd == "") {
			alert("Please retype password");
			document.getElementById("conPassWordInput").focus();
			return false;
		}
		if (pswd != cpswd) {
			alert("Password mismatch");
			document.getElementById("conPassWordInput").focus();
			return false;
		}
		if (phn == "") {
			alert("Please enter phone number");
			document.getElementById("phnInput").focus();
			return false;
		}
		if (!phnPattern.test(phn)) {
			alert("Invalid phone number");
			document.getElementById("phnInput").focus();
			return false;
		}
		return true;
	}
</script>
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
		<div id="signUpSection">
			<div class="container">
				<div class="row">
					<div class="col">
						<img src="assets/images/signUpPage/signUp.jpg" alt="..."
							width="700">
					</div>
					<div class="col">
						<form action="registerSignUpPage.jsp" method="post"
							onsubmit=" return registrationValidate()">
							<h3 align="left">Sign Up</h3>
							<div id="signInForm">
								<br> <label for="userNameInput" class="form-label">Email</label>
								<input type="email" class="form-control" id="userNameInput"
									name="userNameInput" placeholder="abc@gmail.com"> <br>
								<label for="passWordInput" class="form-label">Password</label> <input
									type="password" class="form-control" id="passWordInput"
									name="passWordInput"><br> <label
									for="conPassWordInput" class="form-label">Confirm
									Password</label> <input type="password" class="form-control"
									id="conPassWordInput" name="conPassWordInput"><br>
								<div id="phn" class="row">
									<div class="col">
										<label for="phnInput" class="form-label">Phone Number</label>
										<input type="text" class="form-control" id="phnInput"
											name="phnInput"><br>
									</div>

								</div>
								<br>
								<div id="signInButton">
									<input type="submit" value="Sign up"
										class="main-btn btn-hover wow fadeInUp" data-wow-delay=".6s">

								</div>
								
							</div>
						</form>
					</div>
				</div>
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