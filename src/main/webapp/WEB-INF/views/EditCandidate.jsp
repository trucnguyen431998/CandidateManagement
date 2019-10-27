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
<script type="text/javascript">
	$(document).ready(function() {
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').toggleClass('active');
		});
	});
	/* Calendar */

	/* Combobox */
	$(document).ready(function() {
		// convert selects already on the page at dom load
		$('select.form-control').combobox();

		$('#it').click(function(e) {
			$('ul.dropdown-menu').toggle();
		});

		//  $('input').focus(function(e){
		//    $('ul.dropdown-menu').toggle();
		//  });

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

.card-header h6 {
	font-size: 17px;
	color: blue;
}

.card-header p {
	font-size: 15px;
	color: #000;
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
				<li><a href="Dashboard" data-toggle="collapse"> <i
						class="fas fa-desktop" style="color: #5DADE2"></i>Dashboard
				</a></li>
				<li class="active"><a href="candidate"> <i
						class="far fa-user-circle" style="color: #F4D03F"></i>Candidate
				</a></li>
				<li><a href="#pageSubmenu" data-toggle="collapse"> <i
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
						<a href="#">EDIT CANDIDATE</a>
					</div>
					<div class="navbar-body">
						<div class="col offset-11">
							<!-- <div class="d-flex justify-content-center h-100">
								<div class="searchbar ">
									<input class="search_input" type="text" name=""
										placeholder="Search..."> <a href="#"
										class="search_icon"><i class="fas fa-search p-2"></i></a>
								</div>
							</div> -->
						</div>
					</div>
					<div class="navbar-footer">
						<c:out value="${username}">
						</c:out>
						<a href="logout"> Logout</a>
					</div>
				</div>
			</nav>

			<form:form method="POST" action="passUpdateCandidate"
				modelAttribute="updatedata">
				<div class="container-fluid">
					<div class="row py-2">
						<div class="card card-stats col-5 offset-1">
							<div class="card-header bg-white border-bottom-0">
								<div class="row">
									<h6 class="card-title">Basic Information</h6>
								</div>
								<form:hidden path="candidate_code"/>
								<div class="row">
									<div class="col-3 mt-2">
										<p>Name:</p>
									</div>
									<div class="col">
										<form:input path="name" type="text" class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 mt-2">
										<p>Birthday:</p>
									</div>
									<div class="col">
										<form:input path="dob" type="text" class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 mt-2">
										<p>Email:</p>
									</div>
									<div class="col">
										<form:input path="e_mail" type="email" class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 mt-2">
										<p>Gender:</p>
									</div>
									<div class="col py-2">
										<%-- <form:input path="gender" type="text" class="form-control" /> --%>
										<form:select path="gender" class="form-control dropdownschool">
											<form:option value="Female" />
											<form:option value="Male" />
											
										</form:select>
										
									</div>
								</div>
								<div class="row">
									<div class="col-3 mt-2">
										<p>Phone:</p>
									</div>
									<div class="col">
										<form:input path="phone" type="text" class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 mt-2">
										<p>Facebook:</p>
									</div>
									<div class="col">
										<form:input path="facebook" type="text" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="card card-stats col-5 ml-1">
							<div class="card-header bg-white border-bottom-0">
								<div class="row">
									<h6 class="card-title">Rate</h6>
								</div>
								<div class="row">
									<div class="col-5 mt-2">
										<p>Full time working date:</p>
									</div>
									<div class="col">
										<form:input path="full_time_working" type="text"
											class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-5 mt-2">
										<p>Status:</p>
									</div>
									<div class="col">
										<%-- <form:input path="status" type="text" class="form-control"/> --%>
										<form:select path="status" class="form-control dropdownschool">
											<form:option value="Active" />
											<form:option value="Cancel" />
											<form:option value="Done" />
											<form:option value="Drop-Out" />
											<form:option value="Fail" />
											<form:option value="Pass" />
										</form:select>

									</div>
								</div>
								<div class="row">
									<div class="col-5 mt-2">
										<p>Final Grade:</p>
									</div>
									<div class="col">
										<form:input path="final_grade" type="text"
											class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-5 mt-2">
										<p>Completion level:</p>
									</div>
									<div class="col">
										<form:input path="completion_level" type="text"
											class="form-control" />
									</div>
								</div>
								<div class="row">
									<div class="col-5 mt-2">
										<p>Certificate:</p>
									</div>
									<div class="col">
										<form:input path="certificate_id" type="text"
											class="form-control" />
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-5 mt-2">
										<p>GPA:</p>
									</div>
									<div class="col">
										<form:input path="gpa" type="text" class="form-control" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="card card-stats col-5 offset-1">
							<div class="card-header bg-white border-bottom-0">
								<div class="row">
									<h6 class="card-title">Education</h6>
								</div>
								<div class="row">
									<div class="col-3 mt-2">
										<p>University:</p>
									</div>
									<div class="col">
										<div class="">
											<form:select path="university_code.university_code" class="form-control dropdownschool">
												<c:forEach items="${universitydata}" var="unitInfo">
													<form:option value="${unitInfo.university_code}"
														label="${unitInfo.university_name}" />
												</c:forEach>
											</form:select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4 mt-2">
										<p>Faculty:</p>
									</div>
									<div class="col">
										<form:select path="faculty_code.faculty_code" class="form-control dropdownschool">
											<c:forEach items="${facultydata}" var="facultytInfo">
												<form:option value="${facultytInfo.faculty_code}"
													label="${facultytInfo.faculty_name}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="row">
									<div class="col-4 mt-2">
										<p>Graduation date:</p>
									</div>
									<div class="col">
										<form:input path="university_graduation_date" type="text"
											class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="card card-stats col-5 ml-1">
							<div class="card-header bg-white border-bottom-0">
								<div class="row">
									<h6 class="card-title">Experiences</h6>
								</div>
								<div class="row">
									<div class="col-4 mt-2">
										<p>Campuslink:</p>
									</div>
									<div class="col">
										<form:select path="campuslink_code.campuslink_code" class="form-control dropdownschool">
											<c:forEach items="${campuslinkdata}" var="camtInfo">
												<form:option value="${camtInfo.campuslink_code}"
													label="${camtInfo.campuslink_name}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="row">
									<div class="col-4 mt-2">
										<p>Sub-Subject type:</p>
									</div>
									<div class="col">
										<form:select path="sub_subject_type_code.sub_subject_code" class="form-control dropdownschool">
											<c:forEach items="${subdata}" var="subtInfo">
												<form:option value="${subtInfo.sub_subject_code}"
													label="${subtInfo.sub_subject_type_name}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col text-center ml-4 mt-3">
							<p>
								<button type="submit" class="btn btn-primary">Save</button>
								<button type="reset" class="btn btn-secondary">Cancel</button>
							</p>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>