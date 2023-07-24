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
<title>Dialee</title>
</head>
<body>
	<%
	if (session == null || session.getAttribute("userData") == null) {
		response.sendRedirect("signInPage.jsp");
	} else {
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
									<img src="assets/images/AddShop/registerPage.jpg" alt="..."
										width="700">
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div id="regShopButtons">
							<h3 align="center">Register your store on Dialee</h3>
							<br> <br> <br>
							<div id="regShops" align="center">
								<div class="row" id="RegButton">
									<a href="shopRegistrationPage.jsp" rel="nofollow"
										class="main-btn btn-hover wow fadeInUp" data-wow-delay=".6s">Register
										your shop</a>
								</div>
								<br> <br>
								<div class="row" id="RegInButton">
									<a href="registeredAlreadySignIn.jsp" rel="nofollow"
										class="main-btn btn-hover wow fadeInUp" data-wow-delay=".6s">Registered
										already? Sign in</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>

	<footer id="footer" class="footer pt-100 pb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-widget wow fadeInUp" data-wow-delay=".2s">
						<div class="logo">
							<br> <a><img
								src="assets/images/DialeeLogoFooter.png" alt="" width="180"
								height="30.3"></a>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<br>
					<br>
					<br>
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

	<%
	}
	%>
</body>
</html>