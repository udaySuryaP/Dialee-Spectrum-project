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
<title>Insert title here</title>
<style>
ul.links {
	list-style-type: none;
	width: 230px;
}

li a {
	display: block;
	color: #000;
	text-decoration: none;
	height: 55px;
	background-color: white;
}

li a.active {
	background-color: white;
	color: #E8505B;
}

li a:hover:not(.active) {
	background-color: white;
	color: #E8505B;
}

i {
	padding: 10px;
	padding-top: 2px;
}

#dashboard, #catalogue, #inventory, #media, #editStoreInfo,
	#editOwnerInfo, #customerReviews {
	margin: auto;
	padding: 25px;
}

#dashboardBody {
	padding: 10px;
}

#catalogueBody, #inventoryBody, #mediaBody, #editStoreInfoBody,
	#editOwnerInfoBody, #customerReviewsBody {
	padding: 25px;
}
</style>
</head>
<body>
	<%
	out.print(session.getAttribute("ownerData"));
	if (session == null || session.getAttribute("ownerData") == null) {
		response.sendRedirect("AddShopPage.jsp");
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
							</a> <br>
							<div
								class="collapse navbar-collapse sub-menu-bar nav justify-content-end"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ml-auto">
									<li><a class="dropdown-item" href="loggedOutSession.jsp"> <i
											class="material-symbols-outlined">logout</i>
									</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>
	<br>
	<div class="row">
		<section>
			<br> <br>
		</section>
	</div>
	<div class="container-scroll">

		<section id="firstSection">
			<br>

			<div class="row">
				<div class="col-md-2">
					<div class="row">
						<ul class="links">
							<li class="nav-item active"><a class="nav-link"
								href="#dashboard"><i class="material-symbols-outlined">
										space_dashboard</i><strong> DashBoard</strong></a></li>
							<li class="nav-item"><a class="nav-link" href="#catalogue"><i
									class="material-symbols-outlined"> list </i><strong>
										Catalogue</strong></a></li>
							<li class="nav-item"><a class="nav-link" href="#inventory"><i
									class="material-symbols-outlined"> inventory </i><strong>
										Inventory</strong></a></li>
							<li class="nav-item"><a class="nav-link" href="#media"><i
									class="material-symbols-outlined"> perm_media </i><strong>Media</strong></a></li>
							<li class="nav-item"><a class="nav-link"
								href="#editStoreInfo"><i class="material-symbols-outlined">
										store </i><strong>Edit Store Info</strong></a></li>
							<li class="nav-item"><a class="nav-link"
								href="#editOwnerInfo"><i class="material-symbols-outlined">
										person </i><strong>Edit owner Info</strong></a></li>
							<li class="nav-item"><a class="nav-link"
								href="#customerReviews"><i class="material-symbols-outlined">
										reviews </i><strong>Customer Reviews</strong></a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-10 main-panel">
					<section id="dashboard">
						<h3 style="color: #E8505B">DashBoard</h3>
						<br>
						<div class="card" id="dashboardBody">
							<div class="card-body">
								<h3 class="card-title">Shop Name</h3>
								<p>
									Shop unique ID:<br>Shop password:
								</p>
							</div>
						</div>
					</section>
				</div>
			</div>
		</section>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<section id="catalogue">
					<h3 style="color: #E8505B">Catalogue</h3>
					<br>
					<div class="card" id="shopCatalogue">
						<div class="card-body" id="catalogueBody">
							<h4 class="card-title">List of items</h4>

						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<section id="inventory">
					<h3 style="color: #E8505B">Inventory</h3>
					<br>
					<div class="card" id="shopInventory">
						<div class="card-body" id="inventoryBody">
							<h4 class="card-title">List of items</h4>
							<h4 class="card-title">List of sub categories</h4>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<section id="media">
					<h3 style="color: #E8505B">Media</h3>
					<br>
					<div class="card" id="shopMedia">
						<div class="card-body" id="mediaBody">
							<h4 class="card-title">Image upload about shops</h4>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<section id="editStoreInfo">
					<h3 style="color: #E8505B">Edit Store Info</h3>
					<br>
					<div class="card" id="shopEditStoreInfo">
						<div class="card-body" id="editStoreInfoBody">
							<h4 class="card-title">Edit shop info</h4>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<section id="editOwnerInfo">
					<h3 style="color: #E8505B">Edit Owner Info</h3>
					<br>
					<div class="card" id="shopEditOwnerInfo">
						<div class="card-body" id="editOwnerInfoBody">
							<h4 class="card-title">Edit Owner info</h4>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<section id="customerReviews">
					<h3 style="color: #E8505B">Customer Reviews</h3>
					<br>
					<div class="card" id="shopCustomerReviews">
						<div class="card-body" id="customerReviewsBody">
							<h4 class="card-title">Recent reviews and all</h4>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>



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
			</div>
		</div>
	</footer>

	<a href="#" class="scroll-top btn-hover"> <i
		class="fa fa-chevron-up"></i>
	</a>
	<%
	}
	%>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
	</div>
	<!-- container scroll -->
</body>
</html>