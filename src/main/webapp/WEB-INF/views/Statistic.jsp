<%--
  Created by IntelliJ IDEA.
  User: Sang Nguyen
  Date: 05/08/2019
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Satistic</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel='stylesheet' href='resources/css/Chart.css'/>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.slim.min.js"
            integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6631cf4e8b.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="resources/css/datatables.min.css"/>

    <script type="text/javascript"
            src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
    <script src="resources/js/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"
            integrity="sha256-arMsf+3JJK2LoTGqxfnuJPFTU4hAK57MtIPdFpiHXOU=" crossorigin="anonymous"></script>
    <script src="resources/js/jspdf.debug.js"></script>
    <script src="resources/js/jspdf.plugin.autotable.js"></script>
    <style>
        /* Center the loader */
        #loader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Add animation to "page content" */
        .animate-bottom {
            position: relative;
            -webkit-animation-name: animatebottom;
            -webkit-animation-duration: 1s;
            animation-name: animatebottom;
            animation-duration: 1s
        }

        @-webkit-keyframes animatebottom {
            from {
                bottom: -100px;
                opacity: 0
            }
            to {
                bottom: 0px;
                opacity: 1
            }
        }

        @keyframes animatebottom {
            from {
                bottom: -100px;
                opacity: 0
            }
            to {
                bottom: 0;
                opacity: 1
            }
        }

        #myDiv {
            display: none;
            text-align: center;
        }
    </style>

    <script type="text/javascript">
        function exportFile() {
            //var doc = new jsPDF('p', 'pt');
            var doc = new jsPDF('l', 'pt');
            var res = doc.autoTableHtmlToJson(document.getElementById('tableResult'));
            //var res = doc.fromHTML(document.getElementById('tableResult'));
            var height = doc.internal.pageSize.height;
            doc.text("Event Report", 50, 50);
            doc.autoTable(res.columns, res.data, {
                startY: 100
            });
            // doc.autoTable(res.columns, res.data, {
            //     startY: doc.autoTableEndPosY() + 50
            // });

            // doc.autoTable(res.columns, res.data, {
            //     startY: height,
            //     afterPageContent: function(data) {
            //         doc.setFontSize(20)
            //         doc.text("Event Report", 50, height - data.settings.margin.bottom - 20);
            //     }
            // });
            doc.save('EventReport.pdf');
        }

        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
            dropdownschool = $('.dropdownschool');
            dropdownschool.prop('selectedIndex', 0);
            $.getJSON('getAllSchool', function (data) {
                //console.log(data);
                dropdownschool.empty();
                $.each(data, function (key, value) {
                    dropdownschool.append($('<option></option>').attr('value', value.university_name)); //.text(value.university_name));
                    //dropdownschool.append($('<option></option>').attr('value', value.university_code)); //.text(value.university_name));
                    dropdownschool.prop('selectedIndex', 0);
                })
            });
            dropdownevent = $('.dropdownevent');
            dropdownevent.prop('selectedIndex', 0);
            $.getJSON('getAllEvent', function (data) {
                //console.log(data);
                dropdownevent.empty();
                $.each(data, function (key, value) {
                    dropdownevent.append($('<option></option>').attr('value', value.course_code));
                    dropdownevent.prop('selectedIndex', 0);
                })
            });
            // convert selects already on the page at dom load
            //$('select.form-control').combobox();

            $('#it').click(function (e) {
                $('ul.dropdown-menu').toggle();
            });
        });

        // Code formatDate abcxyz
        function formatDate(date) {
            var yyyy = date.getFullYear();
            var dd = date.getDate();
            var mm = (date.getMonth() + 1);
            if (dd < 10)
                dd = "0" + dd;
            if (mm < 10)
                mm = "0" + mm;
            var current_day = dd + "/" + mm + "/" + yyyy;
            var hours = date.getHours()
            var minutes = date.getMinutes()
            var seconds = date.getSeconds();
            if (hours < 10)
                hours = "0" + hours;
            if (minutes < 10)
                minutes = "0" + minutes;
            if (seconds < 10)
                seconds = "0" + seconds;
            //return current_day + " " + hours + ":" + minutes;
            return current_day;
        }

        //$(document).ready(function() { loadData();  } );
        function loadData() {
            $('#showAll').hide();
            $('#showAllcan').hide();
            var date = new Date();
            date.setMonth(date.getMonth() - 1);
            document.getElementById('planstartdate').valueAsDate = date;
            document.getElementById('planenddate').valueAsDate = new Date();
            $('#tableResult').DataTable({
                ajax: "getAllEventFilter",
                destroy: true,
                columns: [
                    {"data": "site"},
                    {"data": "course_name.campuslink_code"},
                    {"data": "subject_type"},
                    {"data": "sub_subject_type_code.sub_subject_code"},
                    {"data": "planned_start_date"},
                    {"data": "planned_end_date"},
                    {"data": "actual_start_date"},
                    {"data": "actual_end_date"}
                ]
            });
            $('#tableResultCandidate').DataTable({
                ajax: "getAllCandidateFilter",
                destroy: true,
                columns: [
                    {"data": "account"},
                    {"data": "name"},
                    {"data": "phone"}
                ]
            });
        };

        function endAfterStart(start, end) {
            return new Date(start.split('/').reverse().join('/')) <
                new Date(end.split('/').reverse().join('/'));
        }

        //alert(endAfterStart('05/01/2011','09/01/2011'));
        function clearInput() {
            $('#inputdropdownschool').val('');
            $('#inputdropdownevent').val('');
            $('#inputdropdownschool').focus();
        }

        function filter() {
            var school = $('#inputdropdownschool').val();
            var course = $('#inputdropdownevent').val();
            var start = $('#planstartdate').val();
            var end = $('#planenddate').val();
            // if (!school || !course) {
            //     if (!school) $('#inputdropdownschool').focus();
            if (!course)  {
                alert("Opps.. You are missing something");
                $('#inputdropdownevent').focus();
            }else{


            if (!school) school="null";
                if (endAfterStart($('#planstartdate').val(), $('#planenddate').val())) {
                $('#showAll').show();
                // alert(school+course+start+end);
                // window.location="getEventFilter/"+school+"/"+course+"/"+start+"/"+end;
                //alert("getEventFilter/" + school + "/" + course + "/" + start + "/" + end);
                $('#tableResult').DataTable({
                    ajax: "getEventFilter/" + school + "/" + course + "/" + start + "/" + end,
                    destroy: true,
                    columns: [
                        {"data": "site"},
                        {"data": "course_name"},
                        {"data": "subject_type"},
                        {"data": "sub_subject_type_code"},
                        {"data": "planned_start_date"},
                        {"data": "planned_end_date"},
                        {"data": "actual_start_date"},
                        {"data": "actual_end_date"}
                    ]
                });
            } else {
                alert("Start date must be greater than End date.");
            }
            }

        };

        function showAll() {
            loadData();
        }

        function changeType(sel) {

            $.getJSON("getChartLabel", function (json) {
                // will generate array with ['Monday', 'Tuesday', 'Wednesday']
                var labels = json.map(function (item) {
                    return item.label;
                })
                $.getJSON("getChartData", function (json) {
                    // will generate array with ['Monday', 'Tuesday', 'Wednesday']
                    var data = json.map(function (item) {
                        return item.data;
                    });


                    var coloR = [];
                    var dynamicColors = function() {
                        var r = Math.floor(Math.random() * 255);
                        var g = Math.floor(Math.random() * 255);
                        var b = Math.floor(Math.random() * 255);
                        return "rgb(" + r + "," + g + "," + b + ")";
                    };
                    for (var i in data) {
                        coloR.push(dynamicColors());
                    }

                    var ctx = document.getElementById('myChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: sel.value,
                        data: {
                            labels: labels,
                            datasets: [{
                                label: '# event(s) joined',
                                data: data,
                                backgroundColor: coloR,
                                // backgroundColor: [
                                //     'rgba(255, 99, 132, 0.2)',
                                //     'rgba(54, 162, 235, 0.2)',
                                //     'rgba(255, 206, 86, 0.2)',
                                //     'rgba(75, 192, 192, 0.2)',
                                //     'rgba(153, 102, 255, 0.2)',
                                //     'rgba(255, 159, 64, 0.2)'
                                // ],
                                borderColor: coloR,
                                // borderColor: [
                                //     'rgba(255, 99, 132, 1)',
                                //     'rgba(54, 162, 235, 1)',
                                //     'rgba(255, 206, 86, 1)',
                                //     'rgba(75, 192, 192, 1)',
                                //     'rgba(153, 102, 255, 1)',
                                //     'rgba(255, 159, 64, 1)'
                                // ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    })
                })
            });
            //alert(sel.value);
        }
    </script>
    <style type="text/css">

        /*date table*/
        div.dataTables_wrapper {
            width: 800px;
            margin: 0 auto;
        }


        @import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

        body {
            font-family: 'Poppins', sans-serif;
            background: #fafafa;
        }

        /*p {
            font-family: 'Poppins', sans-serif;
            font-size: 1.1em;
            font-weight: 300;
            line-height: 1.7em;
            color: #999;
        }*/

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

        .sidebar-header h3 {
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

        #sidebar.active a[aria-expanded="false"]::before, #sidebar.active a[aria-expanded="true"]::before {
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

        #sidebar ul li.active > a, a[aria-expanded="true"] {
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
        @media ( max-width: 768px) {
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
    </style>

</head>
<body onload="loadData();myFunction();">


<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <span style="color: #1682E8;"><h3>FRESHER REPORT</h3></span> <strong></strong>
        </div>

        <ul class="list-unstyled components">
            <li><a href="#homeSubmenu"
                   data-toggle="collapse"> <i class="fas fa-desktop"
                                              style="color: #5DADE2"></i>Dashboard
            </a></li>
            <li><a href="#"> <i class="far fa-user-circle"
                                style="color: #F4D03F"></i>Candidate
            </a> <a href="#pageSubmenu" data-toggle="collapse"> <i
                    class="far fa-bell" style="color: #2ECC71"></i> Event
            </a></li>
            <li class="active"><a href="#"> <i class="far fa-calendar-alt"
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
                    <a href="#">STATISTIC</a>
                </div>
            </div>
        </nav>
        <div class="container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="event-tab" data-toggle="tab" href="#event" role="tab"
                       aria-controls="event" aria-selected="true">Event</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="candidate-tab" data-toggle="tab" href="#candidate" role="tab"
                       aria-controls="candidate" aria-selected="false">Candidate</a>
                </li>
            </ul>
            <div class="container bg-white border border-top-0">
                <div class="tab-content p-2" id="myTabContent">
                    <div class="tab-pane fade show active" id="event" role="tabpanel" aria-labelledby="event-tab">
                        <div class="row">
                            <h2>
                                Total number of events by university</h2>

                        </div>

                        <div class="row">
                            <h6 class="text-primary">Filter Condition</h6>
                        </div>
                        <div class="row">
                            <div class="col-1 mt-2 offset-1">
                                <p>University:</p></div>
                            <div class="col-4">
                                <div class="container">
                                    <div class="row">
                                        <input type="text" list="dropdownschool" class="form-control" placeholder="All"
                                               id="inputdropdownschool">
                                        <datalist class="dropdownschool" id="dropdownschool">
                                        </datalist>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 mt-2 text-right">
                                <p>Course code:</p></div>
                            <div class="col-4">
                                <div class="container">
                                    <div class="row">
                                        <input type="text" list="dropdownevent" class="form-control" placeholder="All"
                                               id="inputdropdownevent">
                                        <datalist class="dropdownevent" id="dropdownevent">
                                        </datalist>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <h6 class="text-primary">Filter Date</h6>
                        </div>
                        <div class="row">
                            <div class="col-2 mt-2 offset-1">
                                <p>Planed Start Date:</p></div>
                            <div class="col-3">
                                <div class="container">
                                    <div class="row">
                                        <input type="date" class="form-control" id="planstartdate">
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 mt-2 text-right">
                                <p>Planed End Date:</p></div>
                            <div class="col-3">
                                <div class="container">
                                    <div class="row">
                                        <input type="date" class="form-control" id="planenddate">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col offset-4">
                                <button type="button" class="btn btn-primary" id="filter" onclick="filter();"><i
                                        class="fas fa-filter"></i> Filter
                                </button>
                                <button type="button" class="btn btn-primary" id="showAll" onclick="showAll();"><i
                                        class="fas fa-list-alt"></i> Show all
                                </button>
                                <button type="button" class="btn btn-primary" id="clearInput" onclick="clearInput();"><i
                                        class="fas fa-list-alt"></i> Clear
                                </button>
                                <button type="button" class="btn btn-primary" id="exportFile" onclick="exportFile();"><i
                                        class="fas fa-file"></i> Export
                                </button>
                            </div>

                        </div>
                        <hr>
                        <div class="row mt-3">
                            <h6 class="text-primary">Filter Result</h6>
                        </div>

                        <div id="viewReport">
                            <div class="row">
                                <table id="tableResult" class="display nowrap table-responsive" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Site</th>
                                        <th>Course Name</th>
                                        <th>Subject Type</th>
                                        <th>Sub-Subject Type</th>
                                        <th>Planed start date</th>
                                        <th>Planed end date</th>
                                        <th>Actual start date</th>
                                        <th>Actual end date</th>
                                    </tr>
                                    </thead>

                                </table>

                            </div>
                            <script>
                                $(function () {
                                    $("#tableResult").dataTable();
                                })
                            </script>
                            <hr>
                            <div class="row">
                                <h2>Chart events by university</h2>
                                <h6>
                                    The chart shows the number of students from each school participating in the event.</h6>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="row offset-1">
                                        <div class="dropdown">
                                            <p>Change type of chart: </p>
                                            <select class="form-control dropdowntypechart" onchange="changeType(this);">
                                                <option value="bar">Bar</option>
                                                <option value="line">Line</option>
                                                <option value="pie">Pie</option>
                                            </select>
                                        </div>

                                    </div>
                                    <!--Chart region-->
                                    <canvas id="myChart"></canvas>
                                    <script>
                                        $.getJSON("getChartLabel", function (json) {
                                            var labels = json.map(function (item) {
                                                return item.label;
                                            })
                                            $.getJSON("getChartData", function (json) {
                                                var data = json.map(function (item) {
                                                    return item.data;
                                                });

                                                var coloR = [];
                                                var dynamicColors = function() {
                                                    var r = Math.floor(Math.random() * 255);
                                                    var g = Math.floor(Math.random() * 255);
                                                    var b = Math.floor(Math.random() * 255);
                                                    return "rgb(" + r + "," + g + "," + b + ")";
                                                };
                                                for (var i in data) {
                                                    coloR.push(dynamicColors());
                                                }

                                                var ctx = document.getElementById('myChart').getContext('2d');
                                                var myChart = new Chart(ctx, {
                                                    type: 'bar',
                                                    data: {
                                                        labels: labels,
                                                        datasets: [{
                                                            label: '# event(s) joined',
                                                            data: data,
                                                            backgroundColor: coloR,
                                                            // backgroundColor: [
                                                            //     'rgba(255, 99, 132, 0.2)',
                                                            //     'rgba(54, 162, 235, 0.2)',
                                                            //     'rgba(255, 206, 86, 0.2)',
                                                            //     'rgba(75, 192, 192, 0.2)',
                                                            //     'rgba(153, 102, 255, 0.2)',
                                                            //     'rgba(255, 159, 64, 0.2)'
                                                            // ],
                                                            borderColor: coloR,
                                                            // borderColor: [
                                                            //     'rgba(255, 99, 132, 1)',
                                                            //     'rgba(54, 162, 235, 1)',
                                                            //     'rgba(255, 206, 86, 1)',
                                                            //     'rgba(75, 192, 192, 1)',
                                                            //     'rgba(153, 102, 255, 1)',
                                                            //     'rgba(255, 159, 64, 1)'
                                                            // ],
                                                            borderWidth: 1
                                                        }]
                                                    },
                                                    options: {
                                                        scales: {
                                                            yAxes: [{
                                                                ticks: {
                                                                    beginAtZero: true
                                                                }
                                                            }]
                                                        }
                                                    }
                                                })
                                            })
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div id="loader"></div>

                        <div style="display:none;" id="myDiv" class="animate-bottom">

                        </div>
                    </div>
                    <div class="tab-pane fade" id="candidate" role="tabpanel" aria-labelledby="candidate-tab">
                        <div class="row">
                            <h2>Total students by university</h2>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2 mt-2 text-right offset-2">University:</div>
                            <div class="col-5"><input type="text" list="dropdownschool" class="form-control" placeholder="All"
                                                    id="inputdropdownschoolcandidate">
                                <%--                            <input type="text" list="dropdownevent" class="form-control" placeholder="All"--%>
                                <%--                                   id="inputdropdowneventcandidate">--%></div>


                        </div>
<script>
    function filterCandidate() {
        if (!course)  {
            alert("Opps.. You are missing something");
            $('#inputdropdownschoolcandidate').focus();
        }else{
            $('#showAllcan').show();
            var school = $('#inputdropdownschoolcandidate').val();
            if (!school) school="null";
            //alert("getCandidateFilter/" + school + "/");
            $('#tableResultCandidate').DataTable({
                ajax: "getCandidateFilter/"+school,
                destroy: true,
                columns: [
                    {"data": "account"},
                    {"data": "name"},
                    {"data": "phone"}
                ]
            });
        }

    }
    function showAllCandidate() {
        $('#showAllcan').hide();
        $('#tableResultCandidate').DataTable({
            ajax: "getAllCandidateFilter",
            destroy: true,
            columns: [
                {"data": "account"},
                {"data": "name"},
                {"data": "phone"}
            ]
        });
    }
    function clearInputCandidate() {
$('#inputdropdownschoolcandidate').val('');
    }
    function exportFileCandidate() {
        var doc = new jsPDF('l', 'pt');
        var res = doc.autoTableHtmlToJson(document.getElementById('tableResultCandidate'));
        var height = doc.internal.pageSize.height;
        doc.text("Candidate Report", 50, 50);
        doc.autoTable(res.columns, res.data, {
            startY: 100
        });
        doc.save('CandidateReport.pdf');
    }
</script>
                        <div class="col offset-4">
                            <button type="button" class="btn btn-primary" id="filtercan" onclick="filterCandidate();"><i
                                    class="fas fa-filter"></i> Filter
                            </button>
                            <button type="button" class="btn btn-primary" id="showAllcan" onclick="showAllCandidate();"><i
                                    class="fas fa-list-alt"></i> Show all
                            </button>
                            <button type="button" class="btn btn-primary" id="clearInputcan" onclick="clearInputCandidate();"><i
                                    class="fas fa-list-alt"></i> Clear
                            </button>
                            <button type="button" class="btn btn-primary" id="exportFilecan" onclick="exportFileCandidate();"><i
                                    class="fas fa-file"></i> Export
                            </button>
                        </div>

                        <div class="row">
                            <table id="tableResultCandidate" class="display nowrap" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Account</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                </tr>
                                </thead>

                            </table>

                        </div>
                        <script>
                            $(function () {
                                $("#tableResultCandidate").dataTable();
                            })
                        </script>


                        <div class="row offset-1">
                            <div class="dropdown">
                                <p>Change type of chart: </p>
                                <select class="form-control dropdowntypechart" onchange="changeTypeCandidate(this);">
                                    <option value="line">Line</option>
                                    <option value="pie">Pie</option>
                                    <option value="bar">Bar</option>
                                </select>
                            </div>

                        </div>
                        <!--Chart region-->
                        <canvas id="myChartCandidate"></canvas>
                        <script>
                            $.getJSON("getChartLabel", function (json) {
                                var labels = json.map(function (item) {
                                    return item.label;
                                })
                                $.getJSON("getChartData", function (json) {
                                    var data = json.map(function (item) {
                                        return item.data;
                                    });

                                    var ctx = document.getElementById('myChartCandidate').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'line',
                                        data: {
                                            labels: labels,
                                            datasets: [{
                                                label: '# event(s) joined',
                                                data: data,
                                                backgroundColor: [
                                                    'rgba(255, 99, 132, 0.2)',
                                                    'rgba(54, 162, 235, 0.2)',
                                                    'rgba(255, 206, 86, 0.2)',
                                                    'rgba(75, 192, 192, 0.2)',
                                                    'rgba(153, 102, 255, 0.2)',
                                                    'rgba(255, 159, 64, 0.2)'
                                                ],
                                                borderColor: [
                                                    'rgba(255, 99, 132, 1)',
                                                    'rgba(54, 162, 235, 1)',
                                                    'rgba(255, 206, 86, 1)',
                                                    'rgba(75, 192, 192, 1)',
                                                    'rgba(153, 102, 255, 1)',
                                                    'rgba(255, 159, 64, 1)'
                                                ],
                                                borderWidth: 1
                                            }]
                                        },
                                        options: {
                                            scales: {
                                                yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true
                                                    }
                                                }]
                                            }
                                        }
                                    })
                                })
                            });
                            function changeTypeCandidate(sel) {
                                $.getJSON("getChartLabel", function (json) {
                                    var labels = json.map(function (item) {
                                        return item.label;
                                    })
                                    $.getJSON("getChartData", function (json) {
                                        var data = json.map(function (item) {
                                            return item.data;
                                        });

                                        var ctx = document.getElementById('myChartCandidate').getContext('2d');
                                        var myChart = new Chart(ctx, {
                                            type: sel.value,
                                            data: {
                                                labels: labels,
                                                datasets: [{
                                                    label: '# event(s) joined',
                                                    data: data,
                                                    backgroundColor: [
                                                        'rgba(255, 99, 132, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(255, 206, 86, 0.2)',
                                                        'rgba(75, 192, 192, 0.2)',
                                                        'rgba(153, 102, 255, 0.2)',
                                                        'rgba(255, 159, 64, 0.2)'
                                                    ],
                                                    borderColor: [
                                                        'rgba(255, 99, 132, 1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                        'rgba(153, 102, 255, 1)',
                                                        'rgba(255, 159, 64, 1)'
                                                    ],
                                                    borderWidth: 1
                                                }]
                                            },
                                            options: {
                                                scales: {
                                                    yAxes: [{
                                                        ticks: {
                                                            beginAtZero: true
                                                        }
                                                    }]
                                                }
                                            }
                                        })
                                    })
                                });
                            }
                        </script>
                        More feature is comming!!!




                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    var myVar;
    $('#tableResult').hide();

    function myFunction() {
        myVar = setTimeout(showPage, 100);
    }

    function showPage() {
        $('#tableResult').show();
        document.getElementById("loader").style.display = "none";
        document.getElementById("myDiv").style.display = "block";
    }
</script>


</body>
</html>
