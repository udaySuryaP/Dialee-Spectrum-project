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
function signInValidation(){
	var uname=document.getElementById("userNameInput").value;
	var namePattern=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	var pswd=document.getElementById("passWordInput").value;
	var passPattern=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*()-])/;
	if(uname==''){
		alert('Please enter user email');
		document.getElementById("userNameInput").focus();
		return false;
	}
	if(!namePattern.test(uname)){
		alert('Please enter a valid user email');
		document.getElementById("userNameInput").focus();
		return false;
	}
	if(pswd==''){
		alert('Please enter password');
		document.getElementById("passWordInput").focus();
		return false;
	}
	if(!passPattern.test(pswd)){
		alert('Upper case, Lower case, Special character and numeric letter are required');
		document.getElementById("passWordInput").focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
String user=(String)request.getParameter("userNameInput");
%>
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
		<div id="signInSection">
			<div class="container">
				<div class="row">
					<div class="col">
						<div id="carouselExampleAutoplaying" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="assets/images/signIn/c02.jpg" class="d-block w-100"
										alt="...">
								</div>
								<div class="carousel-item">
									<img src="assets/images/signIn/c03.jpg" class="d-block w-100"
										alt="...">
								</div>
								<div class="carousel-item">
									<img src="assets/images/signIn/c04.jpg" class="d-block w-100"
										alt="...">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleAutoplaying"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleAutoplaying"
								data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>

					<div class="col">
						<form action="signInProcess.jsp" method="post" onsubmit="return signInValidation()">
							<h3 align="left">Sign In</h3>
							<div id="signInForm">
								<br> <label for="userNameInput" class="form-label">Email</label> <input type="text" class="form-control"
									id="userNameInput" placeholder="abc@gmail.com" name="userNameInput"> <br>
								<label for="passWordInput" class="form-label">Password</label> <input
									type="password" class="form-control" id="passWordInput" name="passWordInput"><br>
								<div id="createOne">
									<p>
										Don't have an account? <a href="SignUpPage.jsp">Create
											one.</a>
									</p>
								</div>
								<br>
								<div id="signInButton">
									<input type="submit" value="Sign in"
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