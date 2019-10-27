
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#sidebarCollapse').on('click', function() {
                $('#sidebar').toggleClass('active');
            });
        });
        /* Calendar */

        /* Combobox */
        $(document).ready(function() {
            dropdownschool = $('.dropdownschool');;
            dropdownschool.prop('selectedIndex', 0);
            $.getJSON('getAllSchool', function (data) {
                console.log(data);
                dropdownschool.empty();
                $.each(data, function (key, value) {
                    dropdownschool.append($('<option></option>').attr('value', value.university_code).text(value.university_name));
                    dropdownschool.prop('selectedIndex', 0);
                })
            });
            dropdowncampus = $('.dropdowncampus');;
            dropdowncampus.prop('selectedIndex', 0);
            $.getJSON('getAllCampusLink', function (data) {
                console.log(data);
                dropdowncampus.empty();
                $.each(data, function (key, value) {
                    dropdowncampus.append($('<option></option>').attr('value', value.campuslink_code).text(value.campuslink_name));
                    dropdowncampus.prop('selectedIndex', 0);
                })
            });
            dropdownsubjecttype = $('.dropdownsubjecttype');;
            dropdownsubjecttype.prop('selectedIndex', 0);
            $.getJSON('getAllSubjectType', function (data) {
                console.log(data);
                dropdownsubjecttype.empty();
                $.each(data, function (key, value) {
                    dropdownsubjecttype.append($('<option></option>').attr('value', value.sub_subject_type_code).text(value.sub_subject_type_name));
                    dropdownsubjecttype.prop('selectedIndex', 0);
                })
            });
            dropdownevent = $('.dropdownevent');;
            dropdownevent.prop('selectedIndex', 0);
            $.getJSON('getAllEvent', function (data) {
                console.log(data);
                dropdownevent.empty();
                $.each(data, function (key, value) {
                    dropdownevent.append($('<option></option>').attr('value', value.course_name).text(value.course_code));
                    dropdownevent.prop('selectedIndex', 0);
                })
            });
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

        .card-header h5 {
            font-size: 13px;
            font-weight: bold;
        }

        .card-header h6 {
            font-size: 13px;
            font-weight: normal;
            color: gray;
        }

        .card-header p {
            font-size: 13px;
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

        .status-passed {
            margin-bottom: auto;
            margin-top: auto;
            height: 40px;
            border-radius: 40px;
            padding: 5px;
            color: #4DFF00;
            border: 2px solid #4DFF00;
            text-align: center;
            font-weight: bold;
        }

        .status-failed {
            margin-bottom: auto;
            margin-top: auto;
            height: 40px;
            border-radius: 40px;
            padding: 5px;
            color: #E74C3C;
            border: 2px solid #E74C3C;
            text-align: center;
            font-weight: bold;
        }

        .status-dropout {
            margin-bottom: auto;
            margin-top: auto;
            width: 90px;
            height: 40px;
            border-radius: 40px;
            padding: 5px;
            color: #F39C12;
            border: 2px solid #F39C12;
            text-align: center;
            font-weight: bold;
            font-size: 15px;
            height: 40px;
        }

        .status-cancel {
            margin-bottom: auto;
            margin-top: auto;
            height: 40px;
            border-radius: 40px;
            padding: 5px;
            color: #DAEC06;
            border: 2px solid #DAEC06;
            text-align: center;
            font-weight: bold;
        }

        .status-active {
            margin-bottom: auto;
            margin-top: auto;
            height: 40px;
            border-radius: 40px;
            padding: 5px;
            color: #3498DB;
            border: 2px solid #3498DB;
            text-align: center;
            font-weight: bold;
        }

        .checkbox {
            margin-top: 14px;

        }

    </style>
    
    
    
</head>
<body>



<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <span style="color: #1682E8"><h3>FRESHER REPORT</h3></span>
        </div>

        <ul class="list-unstyled components">
            <li><a href="Dashboard" data-toggle="collapse"> <i
                    class="fas fa-desktop" style="color: #5DADE2"></i>Dashboard
            </a></li>
            <li><a href="candidate"> <i
                    class="far fa-user-circle" style="color: #F4D03F"></i>Candidate
            </a></li>
            <li class="active"><a href="#" data-toggle="collapse"> <i
                    class="far fa-calendar-alt" style="color: #2ECC71"></i> Event
            </a></li>
            <li><a href="Statistic"> <i class="fas fa-chart-pie"
                                style="color: #E74C3C"></i> Statistic
            </a></li>
            
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
                    <a href="#">EVENT</a>
                </div>
              
                <div class="navbar-footer"><c:out value="${username}"></c:out><a href="logout">  Logout</a></div>
            </div>
        </nav>
        
        <form:form method="POST" modelAttribute="filterEvent">
        <div class="container-fluid">
            <div class="card card-stats mb-4 mb-xl-0">
  <!--               <div class="row">
                    <div class="col-5 mt-3">
                        <div class="container">
                            <div class="row">
                            <div class="col-4 mt-2 offset-1 text-right">
                                <h6 class="">Start date:</h6>

                            </div>
                        <div class="col">
                            <input type="date" class="form-control"/>

                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-5 mt-3">
                        <div class="container">
                            <div class="row">
                                <div class="col-3 mt-2 text-right offset-1">
                                    <h6>End date:</h6>

                                </div>
                                <div class="col-8">
                                    <input type="date" class="form-control"/>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <p class="offset-1 text-center">
                            <button type="button" class="btn btn-warning mt-3"
                                    onclick="location.href='#';">
                                <i class="fas fa-broom"></i> Clear
                            </button>
                        </p>
                    </div>
                </div> -->
                 <div class="col-4 mt-2">
						<button onclick="location.href='AddEvent'" type="button"
                                class="btn btn-primary">Create new</button>
					</div>
                <div class="row">
                    <!-- <div class="col-1 text-center mt-4">
                        <input type="checkbox">
                    </div> -->
                   
                    <div class="col-2 mt-3 ">
                        <div class="container offset-1">

                            <div class="row">
                                <form:select id="sub" path="sub_subject_type_code.sub_subject_code" class="form-control">
									<c:forEach items="${subdata}" var="subtInfo">
										<form:option  value="${subtInfo.sub_subject_code}" label="${subtInfo.sub_subject_code}" />
									</c:forEach>
								</form:select>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 mt-3">
                        <div class="container">
                            <div class="row">
                                <form:select id="university" path="university_code.university_code" class="form-control ">
									<c:forEach items="${universitydata}" var="unitInfo">
										<form:option value="${unitInfo.university_code}" label="${unitInfo.university_name}" />
									</c:forEach>
								</form:select>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 mt-3">
                        <div class="container">
                            <div class="row">
                                <form:select path="course_name.campuslink_code" class="form-control">
									<c:forEach items="${campuslinkdata}" var="camtInfo">
										<form:option  value="${camtInfo.campuslink_code}" label="${camtInfo.campuslink_code}" />
									</c:forEach>
								</form:select>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 mt-3">
                        <div class="container">
                            <div class="row">
                                <form:select path="course_code" class="form-control">
									<c:forEach items="${listEvent}" var="eventInfo">
										<form:option  value="${eventInfo.course_code}" label="${eventInfo.course_code}" />
									</c:forEach>
								</form:select>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <p class="offset-0 text-center">
                            <button type="button" class="btn btn-warning mt-3"
                                    onclick="location.href='#';">
                                <i class="fas fa-broom"></i> Clear
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </div>      
       </form:form>
 
     <c:forEach var="Event" items="${listEvent}" varStatus="status">
        <div class="container-fluid">
            <div class="card card-stats mb-4 mb-xl-0">
                <div class="row">
                 
                    <div class="col-1 text-center mt-4">
                        <input type="checkbox" class="checkbox">
                    </div>
                    <div class="col-3 mt-2">
                        <div class="row">
                            <div class="card-header bg-white border-bottom-0">
                                <div class="col">
                                    <h5 class="card-title">${Event.course_code }</h5>
                                </div>
                                <div class="col">
                                    <h6 class="card-title">${Event.course_name.campuslink_name }</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 mt-2">
                        <div class="row">
                            <div class="card-header bg-white border-bottom-0">
                                <div class="col">
                                    <h6 class="card-title">${Event.university_code.university_name}</h6>
                                </div>
                                <div class="col">
                                    <h6 class="card-title">${Event.sub_subject_type_code.sub_subject_type_name}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 mt-2">
                        <div class="card-header bg-white border-bottom-0">
                            <div class="col">
                                <h6 class="card-title">${Event.planned_start_date}</h6>
                            </div>
                            <div class="col">
                                <h6 class="card-title">${Event.planned_end_date}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 mt-2">
                        <div class="card-header bg-white border-bottom-0">
                            <div class="col">
                                <h6 class="card-title">${Event.actual_start_date}</h6>
                            </div>
                            <div class="col">
                                <h6 class="card-title">${Event.actual_end_date}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 mt-4">
                        <p>
                            <a href="ViewEvent?id=${Event.event_code }" class="navbar-toggler  main-actor"
                               class="btn btn-light"> <i class="far fa-eye"
                                                         style="color: #000;"></i>
                            </a> <a href="EditEvent?id=${Event.event_code }" class="navbar-toggler  main-actor"
                                    class="btn btn-light"> <i class="far fa-edit"
                                                              style="color: #000;"></i>
                        </a> <a href="deleteEvent?id=${Event.event_code }" class="navbar-toggler  main-actor"
                                class="btn btn-light" onclick="return confirm('Delete it?')" > <i class="fas fa-trash"
                                                          style="color: #000;"></i>
                        </a>
                        </p>
                    </div>
                 
                </div>
			
            </div>
        </div>

     </c:forEach>
     <!-- <div class="container-fluid">
            <div class="row">
                <div class="col text-center ml-1 mt-3">
                    <p>
                        <button onclick="location.href='#'" type="submit"
                                class="btn btn-warning">Upload history</button>
                        <button onclick="location.href='#'" type="button"
                                class="btn btn-success">Export</button>
                    </p>
                </div>
            </div>
        </div> -->
    </div>
</div>
</body>
</html>
