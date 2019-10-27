<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6631cf4e8b.js"></script>
<script src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').toggleClass('active');
		});
	});
</script>
<style type="text/css">

/* Copy in https://bootstrapious.com/p/bootstrap-sidebar */
/*
    DEMO STYLE
*/
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1.7em;
	color: #999;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.navbar {
	padding: 15px 0px;
	background: #3E6FEA;
	border: none;
	border-radius: 0;
	margin-bottom: 40px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
	color: #fff;
}

.navbar-btn {
	box-shadow: none;
	outline: none !important;
	border: none;
}

.navbar-toggler {
	box-shadow: none;
	outline: none !important;
	border: none;
	color: #fff;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed #ddd;
	margin: 40px 0;
}

i, span {
	display: inline-block;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
.wrapper {
	display: flex;
	align-items: stretch;
}

#sidebar {
	min-width: 250px;
	max-width: 250px;
	background: #fff;
	color: #95A5A6;
	transition: all 0.3s;
}
.sidebar-header h3{
font-size: 1.5em;

}

#sidebar.active {
	min-width: 95px;
	max-width: 95px;
	text-align: center;
}

#sidebar.active .sidebar-header h3, #sidebar.active .CTAs {
	display: none;
}

#sidebar.active .sidebar-header strong {
	display: block;
}

#sidebar ul li a {
	text-align: left;
}

#sidebar.active ul li a {
	padding: 20px 10px;
	text-align: center;
	font-size: 0.85em;
}

#sidebar.active ul li a i {
	margin-right: 0;
	display: block;
	font-size: 1.8em;
	margin-bottom: 5px;
}

#sidebar.active ul ul a {
	padding: 10px !important;
}

#sidebar.active a[aria-expanded="false"]::before, #sidebar.active a[aria-expanded="true"]::before
	{
	top: auto;
	bottom: 5px;
	right: 50%;
	-webkit-transform: translateX(50%);
	-ms-transform: translateX(50%);
	transform: translateX(50%);
}

#sidebar .sidebar-header {
	padding: 20px;
	padding-left: 30px;
	background: #fff;
	height: 60px;
}

#sidebar .sidebar-header strong {
	display: none;
	font-size: 1.8em;
}

#sidebar ul.components {
	padding: 20px 0;
}

#sidebar ul li a {
	padding: 10px;
	font-size: 1.1em;
	display: block;
}

#sidebar ul li a:hover {
	color: #000;
	background: none;
}

#sidebar ul li a i {
	margin-right: 10px;
}

#sidebar ul li.active>a, a[aria-expanded="true"] {
	color: #000;
	background: none;
}

a[data-toggle="collapse"] {
	position: relative;
}

a[aria-expanded="false"]::before, a[aria-expanded="true"]::before {
	content: '\e259';
	display: block;
	position: absolute;
	right: 20px;
	font-family: 'Glyphicons Halflings';
	font-size: 0.6em;
}

a[aria-expanded="true"]::before {
	content: '\e260';
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
	background: #6d7fcc;
}

ul.CTAs {
	padding: 20px;
}

ul.CTAs a {
	text-align: center;
	font-size: 0.9em !important;
	display: block;
	border-radius: 5px;
	margin-bottom: 5px;
}

a.download {
	background: #fff;
	color: #7386D5;
}

a.article, a.article:hover {
	background: #6d7fcc !important;
	color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
	min-height: 100vh;
	transition: all 0.3s;
	width: 100%;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
	#sidebar {
		min-width: 90px;
		max-width: 90px;
		text-align: center;
		margin-left: -80px !important;
	}
	a[aria-expanded="false"]::before, a[aria-expanded="true"]::before {
		top: auto;
		bottom: 5px;
		right: 50%;
		-webkit-transform: translateX(50%);
		-ms-transform: translateX(50%);
		transform: translateX(50%);
	}
	#sidebar.active {
		margin-left: 0 !important;
	}
	#sidebar .sidebar-header h3, #sidebar .CTAs {
		display: none;
	}
	#sidebar .sidebar-header strong {
		display: block;
	}
	#sidebar ul li a {
		padding: 20px 10px;
	}
	#sidebar ul li a span {
		font-size: 0.85em;
	}
	#sidebar ul li a i {
		margin-right: 0;
		display: block;
	}
	#sidebar ul ul a {
		padding: 10px !important;
	}
	#sidebar ul li a i {
		font-size: 1.3em;
	}
	#sidebar {
		margin-left: 0;
	}
	#sidebarCollapse span {
		display: none;
	}
}

;

/* Search Box */
.fixed {
	position: fixed;
}

.searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 50px;
	background-color: #3E6FEA;
	border-radius: 30px;
	padding: 5px;
	color: #D0D3D4;
	border: 2px solid #D0D3D4;
}

.search_input {
	border: 0;
	outline: 0;
	background: none;
	width: 250px;
	caret-color: transparent;
	line-height: 40px;
	caret-color: #D0D3D4;
	color: #D0D3D4;
}

::placeholder {
	color: #D0D3D4;
}
}
</style>


<!-- <script type="text/javascript">
		$(function(){
			
			if(localStorage.chkbox && localStorage.chkbox != ''){
				$('#customCheckLogin').attr('checked', 'checked');
				$('#email').val(localStorage.email);
				$('#password').val(localStorage.password);
			}else{
				$('#customCheckLogin').removeAttr('checked');
				$('#email').val('');
				$('#password').val('');
			}
			
			$('#customCheckLogin').click(function() {
				if($('#customCheckLogin').is(':checked')){
					
					localStorage.email = $('#email').val();
					localStorage.password = $('#password').val();
					localStorage.chkbox = $('#customCheckLogin').val();
					console.log(localStorage.email);
				}else{
					localStorage.email ='';
					localStorage.password = '';
					localStorage.chkbox = '';
				}
			});
		});
	</script>
 -->
</head>
<body>



	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<span style="color: #1682E8"><h3>FRESHER REPORT</h3></span> <strong></strong>
			</div>

			<ul class="list-unstyled components">
				<li><a href="#Dashboard"
					data-toggle="collapse"> <i class="fas fa-desktop"
						style="color: #5DADE2"></i>Dashboard
				</a></li>
				<li><a href="#"> <i class="far fa-user-circle"
						style="color: #F4D03F"></i>Candidate
				</a> <a href="#pageSubmenu" data-toggle="collapse"> <i
						class="far fa-calendar-alt" style="color: #2ECC71"></i> Event
				</a></li>
				<li><a href="#"> <i class="fas fa-chart-pie"
						style="color: #E74C3C"></i> Statistic
				</a></li>
				<!-- <li><a href="#"> <i class="glyphicon glyphicon-send"></i>
						Contact
				</a></li> -->
			</ul>

		</nav>

		<!-- Page Content Holder -->
		<div id="content">
			<nav class="navbar navbar-default">
				<div class="container-fluid">

					<div class="navbar-header">
						<button class="navbar-toggler  main-actor" type="button"
							id="sidebarCollapse" class="btn btn-light">
							<i class="fas fa-bars"></i>
						</button>
						<a href="#">LOGIN PAGE</a>
					</div>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="container mt-8 pb-5">
					<div class="row justify-content-center">
						<div class="col-lg-5 col-md-7">
							<div class="card shadow border-0">

								<div class="card-body px-lg-5 py-lg-5">
									<img
										src="data:image/png;base64,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"
										class="rounded mx-auto d-block mb-3" alt="Responsive image">
										
										
										<nav class="offset-0" style="text-align: center;" >
											<c:if test="${param.error != null}">
												<div class="alert alert-danger">Invalid Email and password.</div>
											</c:if>
								
											<c:if test="${param.logout != null}">
												<div class="alert alert-warning">You have been logged out.</div>
											</c:if>
											
										</nav>
										
									<form:form method="POST" action="passLogin" modelAttribute="logindata">
										<div class="form-group mb-3">
											<div class="input-group input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="fas fa-envelope"></i></span>
												</div>
												<form:input  path="username" class="form-control" placeholder="Email" type="email" required="required" id="email" />
											</div>
											
										</div>
										<div class="form-group">
											<div class="input-group input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="fas fa-lock"></i></span>
												</div>
												<form:input path="password" class="form-control" placeholder="Password" type="password" required="required" id="password" />
											</div>
										</div>
										<!-- <div class="custom-control custom-control-alternative custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="customCheckLogin"
												name="remember-me"> <label class="custom-control-label"
												for=" customCheckLogin"> <span class="text-muted">Remember
													me</span>
											</label>
										</div> -->
										<div class="text-center">
											<button type="submit" class="btn btn-primary my-4 col">SIGN IN</button>
										</div>
										<div class="row mt-3">
											
										</div>
									</form:form>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>