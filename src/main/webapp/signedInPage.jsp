<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.vividsolutions.jts.util.CollectionUtil.Function"%>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Dialee</title>
</head>
<body>
	<%
	out.print(session.getAttribute("userData"));
	if (session == null || session.getAttribute("userData") == null) {
		response.sendRedirect("signInPage.jsp");
	}
	%>
	<script type="text/javascript">
	
	</script>

	<header class="header">
		<div class="navbar-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="#"> <img
								src="assets/images/DialeeLogo.png" alt="" width="180"
								height="28.3" />
							</a>

							<div
								class="collapse navbar-collapse sub-menu-bar nav justify-content-end"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ml-auto">
									<li class="nav-item"><a class="page-scroll" href="#homeS2">Home</a>
									</li>
									<li class="nav-item"><a class="page-scroll"
										href="AddShopPage.jsp">Add Shop</a></li>
									<li class="nav-item"><a class="page-scroll"
										href="#locateSectionPieceS2">Locate Store</a></li>
									<li class="nav-item"><a class="page-scroll"
										href="#categories2">Categories</a></li>
									<li class="nav-item"><a class="page-scroll"
										href="#aboutSection2">About</a></li>
									<li class="nav-item"><a href="loggedOutSession.jsp"><i
											class="material-symbols-outlined">logout</i></a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>


	<section id="homeS2" class="hero-section">
		
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="hero-content">
						<h1 class="wow fadeInUp" data-wow-delay=".2s">
							Welcome, <br>
						</h1>
						<p class="wow fadeInUp" data-wow-delay=".4s">
							A new arrival to the city or a seasoned urbanite, <strong>Dialee</strong>
							has something for you. Start exploring today and see how we can
							make your city experience even better!
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="hero-img wow fadeInUp" data-wow-delay=".5s">
						<img src="assets/images/heroSection.jpg" alt="" width="848">
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<hr>
	<section id="locateSectionPieceS2">
		<div id="locateSection" class="row align-items-center">
			<h3 class="card-title" align="center">Locate Store</h3>
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
			String sql = "SELECT state FROM category";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			%>
			<form action="signedInPage.jsp" method="post">
				<div class="row">
					<div class="col input-group mb-3" id="locateInput">
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
				<div class="d-grid gap-2 col-6 mx-auto" id="searchButton">
					<input type="submit" value="Search"
						class="main-btn btn-hover wow fadeInUp" data-wow-delay=".6s">
				</div>
			</form>
			<%
			String selected = request.getParameter("stateOptions");
			%>
			<%-- <p>
				Selected state:<%=selected%></p> --%>
			<%
			conn.close();
			} catch (Exception e) {
			e.printStackTrace();

			}
			%>
		</div>
	</section>
	<br>
	<hr>

	<section id="categories2" class="service-section pt-150">
		<br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6 col-lg-8">
					<div class="section-title text-center mb-70">
						<h1 class="wow fadeInUp" data-wow-delay=".4s">All Essentials
							You Need</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-delay=".2s">
						<div class="icon">
							<a href="" style="color: #676F73"><span
								class="material-symbols-outlined" style="font-size: 100px">
									kitchen </span></a>
						</div>
						<br>
						<div class="content">
							<h3>Grocery</h3>
							<p>Fresh finds for your daily needs at your neighborhood
								grocery store.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-delay=".4s">
						<div class="icon">
							<a href="" style="color: #676F73"><span
								class="material-symbols-outlined" style="font-size: 100px">styler</span></a>
						</div>
						<br>
						<div class="content">
							<h3>Clothes</h3>
							<p>Find your next fashion statement at trendy clothing
								stores.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-delay=".6s">
						<div class="icon">
							<a href="" style="color: #676F73"><span
								class="material-symbols-outlined" style="font-size: 100px">
									chair </span></a>
						</div>
						<br>
						<div class="content">
							<h3>Furniture</h3>
							<p>Transform your space with stylish and functional furniture
								from wide verity of shops.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-delay=".2s">
						<div class="icon">
							<a href="" style="color: #676F73"><span
								class="material-symbols-outlined" style="font-size: 100px">
									vaccines </span></a>
						</div>
						<br>
						<div class="content">
							<h3>Medicine</h3>
							<p>Your one-stop shop for all your health and wellness needs.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-delay=".4s">
						<div class="icon">
							<a href="" style="color: #676F73"><span
								class="material-symbols-outlined" style="font-size: 100px">
									cable </span></a>
						</div>
						<br>
						<div class="content">
							<h3>Electronics</h3>
							<p>Stay connected with the latest technology from trusted
								electronics shops.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-delay=".6s">
						<div class="icon">
							<a href="" style="color: #676F73"><span
								class="material-symbols-outlined" style="font-size: 100px">all_inclusive
							</span></a>
						</div>
						<br>
						<div class="content">
							<h3>Others</h3>
							<p>Discover a world of possibilities at our diverse shopping
								destinations.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section id="aboutSection2"
		class="about-section received-section pt-150">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="about-img received-img wow fadeInUp"
						data-wow-delay=".5s">
						<img src="assets/images/aboutUs.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="about-content received-content">
						<div class="section-title">
							<h1 class="mb-25 wow fadeInUp" data-wow-delay=".4s">Access
								the wide range.</h1>
							<p class="wow fadeInUp" data-wow-delay=".6s">A website that
								connects all the shops in an area. It aims to bring together a
								variety of stores, shops, and other businesses in a specific
								location and provide a platform for customers to browse and
								purchase products and services from these businesses. The
								website typically features a directory of businesses in the
								area, including information on products and services offered,
								hours of operation, and contact information, making it easy for
								customers to shop and transact with local businesses.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
					<div class="footer-widget wow fadeInUp" data-wow-delay=".4s">
						<h3>About Us</h3>
						<ul class="links">
							<li><a href="#homeS2">Home</a></li>
							<li><a href="#locateSectionPieceS2">Locate Store</a></li>
							<li><a href="#categories2">Categories</a></li>
							<li><a href="#aboutSection2">About Us</a></li>
						</ul>
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