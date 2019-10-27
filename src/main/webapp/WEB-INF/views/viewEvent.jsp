
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').toggleClass('active');
		});
	});
	/* Calendar */

	/* Combobox */
	$(document).ready(
			function() {
				dropdownschool = $('.dropdownschool');
				;
				dropdownschool.prop('selectedIndex', 0);
				$.getJSON('getAllSchool', function(data) {
					console.log(data);
					dropdownschool.empty();
					$.each(data, function(key, value) {
						dropdownschool.append($('<option></option>').attr(
								'value', value.university_code).text(
								value.university_name));
						dropdownschool.prop('selectedIndex', 0);
					})
				});
				dropdowncampus = $('.dropdowncampus');
				;
				dropdowncampus.prop('selectedIndex', 0);
				$.getJSON('getAllCampusLink', function(data) {
					console.log(data);
					dropdowncampus.empty();
					$.each(data, function(key, value) {
						dropdowncampus.append($('<option></option>').attr(
								'value', value.campuslink_code).text(
								value.campuslink_name));
						dropdowncampus.prop('selectedIndex', 0);
					})
				});
				dropdownsubjecttype = $('.dropdownsubjecttype');
				;
				dropdownsubjecttype.prop('selectedIndex', 0);
				$.getJSON('getAllSubjectType', function(data) {
					console.log(data);
					dropdownsubjecttype.empty();
					$.each(data, function(key, value) {
						dropdownsubjecttype.append($('<option></option>').attr(
								'value', value.sub_subject_type_code).text(
								value.sub_subject_type_name));
						dropdownsubjecttype.prop('selectedIndex', 0);
					})
				});
				dropdownevent = $('.dropdownevent');
				;
				dropdownevent.prop('selectedIndex', 0);
				$.getJSON('getAllEvent', function(data) {
					console.log(data);
					dropdownevent.empty();
					$.each(data, function(key, value) {
						dropdownevent.append($('<option></option>').attr(
								'value', value.course_name).text(
								value.course_code));
						dropdownevent.prop('selectedIndex', 0);
					})
				});
				// convert selects already on the page at dom load
				$('select.form-control').combobox();

				$('#it').click(function(e) {
					$('ul.dropdown-menu').toggle();
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

.sidebar-header h3 {
	font-size: 1.5em;
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

.card-header h1 {
	font-size: 17px;
	color: blue;
}

.card-header p {
	font-size: 12px;
	color: #000;
}

.card-header h2 {
	font-size: 12px;
	color: #000;
	font-weight: bold;
}

.card-header h3 {
	font-size: 12px;
	color: #000;
	font-weight: normal;
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
	color: white;
}

::placeholder {
	color: #D0D3D4;
}

;

/* Combobox */
@media ( min-width : 768px) {
	.form-search .combobox-container, .form-inline .combobox-container {
		display: inline-block;
		margin-bottom: 0;
		vertical-align: top;
	}
	.form-search .combobox-container .input-group-addon, .form-inline .combobox-container .input-group-addon
		{
		width: auto;
	}
}

.combobox-selected .caret {
	display: none;
}

/* :not doesn't work in IE8 */
.combobox-container:not (.combobox-selected ) .glyphicon-remove {
	display: none;
}

.typeahead-long {
	max-height: 300px;
	overflow-y: auto;
}

.control-group.error .combobox-container .add-on {
	color: #B94A48;
	border-color: #B94A48;
}

.control-group.error .combobox-container .caret {
	border-top-color: #B94A48;
}

.control-group.warning .combobox-container .add-on {
	color: #C09853;
	border-color: #C09853;
}

.control-group.warning .combobox-container .caret {
	border-top-color: #C09853;
}

.control-group.success .combobox-container .add-on {
	color: #468847;
	border-color: #468847;
}

.control-group.success .combobox-container .caret {
	border-top-color: #468847;
}
</style>
</head>
<body>



	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<span style="color: #1682E8"><h3>FRESHER REPORT</h3></span> <strong></strong>
			</div>

			<ul class="list-unstyled components">
				<li><a href="#homeSubmenu" data-toggle="collapse"> <i
						class="fas fa-desktop" style="color: #5DADE2"></i>Dashboard
				</a></li>
				<li><a href="#"> <i class="far fa-user-circle"
						style="color: #F4D03F"></i>Candidate
				</a></li>
				<li class="active"><a href="#pageSubmenu"
					data-toggle="collapse"> <i class="far fa-calendar-alt"
						style="color: #2ECC71"></i> Event
				</a></li>
				<li><a href="#"> <i class="fas fa-chart-pie"
						style="color: #E74C3C"></i> Statistic
				</a></li>

			</ul>

		</nav>

		<!-- Page Content Holder -->


		<div id="content">
			<form:form method="POST" action="" modelAttribute="viewEvent">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<button class="navbar-toggler  main-actor" type="button"
								id="sidebarCollapse" class="btn btn-light">
								<i class="fas fa-bars"></i>
							</button>
							<a href="#">VIEW EVENT</a>
						</div>
						<div class="navbar-body">
							<div class="col offset-11">
								<div class="d-flex justify-content-center h-100">
									<div class="searchbar ">
										<input class="search_input" type="text" name=""
											placeholder="Search..."> <a href="#"
											class="search_icon"><i class="fas fa-search p-2"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="navbar-footer">Logout</div>
					</div>
				</nav>
				<div class="container-fluid">
					<!-- TRUYEN TEN SU KIEN NHA!!!!!!! -->
					<h4>${viewEvent.course_code }</h4>
					<div class="row mb-2">
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Candidate</h5>
											<span class="h4 font-weight-bold mb-0"><c:out
													value="${soCandidate}"></c:out></span>
										</div>
										<div class="col-auto">
											<i class="far fa-user" style="color: blue; font-size: 60px;"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Hours</h5>
											<span class="h4 font-weight-bold mb-0">${viewEvent.actual_learning_time }</span>
										</div>
										<div class="col-auto">
											<i class="far fa-clock"
												style="color: #E67E22; font-size: 60px;"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Start
												Event</h5>
											<span class="h4 font-weight-bold mb-0">${viewEvent.planned_start_date }</span>
										</div>
										<div class="col-auto">
											<i class="far fa-bell" style="color: green; font-size: 60px;"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">End
												Event</h5>
											<span class="h4 font-weight-bold mb-0">${viewEvent.planned_end_date }</span>
										</div>
										<div class="col-auto">
											<i class="far fa-bell-slash"
												style="color: green; font-size: 60px;"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="container-fluid">
            <div class="card card-stats mb-2 ">
                CALENDAR
            </div>
        </div> -->



				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-6 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-header bg-white border-bottom-0">
									<div class="row">
										<h1 class="card-title">Course Information</h1>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Site:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.site }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Course code:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.course_code }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Course name:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.course_name.campuslink_name }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Subject type:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.subject_type }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Sub-Subject type:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.sub_subject_type_code.sub_subject_type_name }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Supplier/Partner:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.university_code.university_name }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Format type:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.format_type }</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-header bg-white border-bottom-0">
									<div class="row">
										<h1 class="card-title">Training Feedback</h1>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Training feedback:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.training_feedback }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Content:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.training_feedback_content }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Teacher:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.training_feedback_teacher }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Organization:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.training_feedback_organization }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Note</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.note }</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-6 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-header bg-white border-bottom-0">
									<div class="row">
										<h1 class="card-title">Plan</h1>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Start date:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.planned_start_date }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>End date:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.planned_end_date }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Time:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.note }</p>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="card-header bg-white border-bottom-0">
									<div class="row">
										<h1 class="card-title">Actual</h1>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Start date:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.actual_start_date }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>End date:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.actual_end_date }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Time:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.actual_learning_time }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Expense</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.actual_expense }</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-header bg-white border-bottom-0">
									<div class="row">
										<h1 class="card-title">Supporting Info</h1>
									</div>
									<div class="row">
										<div class="col-4 mt-2">
											<h2>Course status:</h2>
										</div>
										<div class="col mt-1">
											<div class="container">
												<div class="row">
													<p>${viewEvent.course_status }</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col text-center ml-1 mt-3">
							<p>
								<button onclick="location.href='EditEvent?id=${viewEvent.event_code }'" type="button"
									class="btn btn-primary">Edit</button>
							</p>
						</div>
					</div>
				</div>
			</form:form>
		</div>

	</div>
</body>
</html>
