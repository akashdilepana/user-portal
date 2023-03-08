
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%
            if (session.getAttribute("utype") == null || !session.getAttribute("utype").equals("1")) {
                response.sendRedirect("index");
                return;
            }


        %>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Systems</title>
        <meta content="" name="description">
        <meta content="" name="keywords">


        <!--<=request.getContextPath()>-->
        <link href="images/fin.png" rel="icon">
        <link href="images/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="./assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./files/assets/icon/feather/css/feather.css">

        <style>
            Body {
                font-family: Montserrat-Medium, sans-serif;
                background-color: #f0f7f8;
                font-size: 14px;
            }
            .center {
                margin: auto;
                width: 115%;
                /*                border: 3px solid green;*/
                padding: 110px;
            }
            iframe {
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            .button {
                background-color: #895fc8; /* Green */
                color: black;
                border: 0px solid #555555;
                padding: 4px 16px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 9px;
                transition-duration: 0.4s;
                cursor: pointer;
                border-radius: 6px;
                font-weight: bold;
                font-family: "Times New Roman", Times, serif;
            }
            .button2 {
                background-color: white; 
                color: #5367af; 

            }

            .button2:hover {
                background-color: #f0f0f0;
                color: #5367af;
            }

            .div {
                border: 1px solid gray;
                padding: 8px;
            }

            h1 {
                text-align: center;
                text-transform: uppercase;
                color: #4CAF50;
            }

            .p {

                letter-spacing: 1px;
                text-align: center;
                margin-left: 90px;
                margin-bottom: 10px;
                margin-top: 100px;
                margin-right: 60px;
            }

            a {
                text-decoration: none;
                color: #008CBA;
            }

            .gal {
                font-size: 10px;
                margin-left: 20px;
            }
        </style>
    </head>

    <body>

        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="#">
                    <img id="logo" class="img-fluid" src=" " width="200" />
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div><!-- End Logo -->

            <div class="home">

                <a onclick= "window.location.href = ('index')" class="text-center">
                    <button type="button" class="button button2"><i class='fa fa-arrow-left'> </i></button>

                </a>
            </div>  



            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">
                    <li class="nav-item dropdown">
                    <li class="nav-item dropdown pe-3">
                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                            <img src="./images/user.png" alt="Profile" class="rounded-circle">
                            <span class="d-none d-md-block dropdown-toggle ps-2"><%=session.getAttribute("user")%></span>
                        </a><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6><%=session.getAttribute("user")%></h6>
                                <span></span>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="logout">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->

                </ul>
            </nav><!-- End Icons Navigation -->

        </header>
        <%@include file="sidebar.jsp"%>

        <main id="main" class="main">


            <center>
                <div style="padding: 20px ">

                    <div class="pagetitle pull-left" id="fname" style="color:#012970; font-weight: bold;"></div>
                    <div id="dis"></div>

                    <embed src="" id="file" width="100%" height="800">

                    <!--                    </iframe>-->

                </div>
            </center>

        </main>

        <%--<%@include file="footer.jsp"%>--%>


        <script src="assets/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/jstree.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>   
        <script src="files/assets/js/func.js"></script>

        <script>


//                    var url = new URL(window.location.href);
//                    var id = url.searchParams.get("id");
//
                    var id = '<%=request.getAttribute("id")%>';
//                    $.get('LoadSideBar', {id: id}, function (resp) {
                    $.post('LoadSideBar/' + id, function (resp) {
                        var data = JSON.parse(resp);
//                var dd = data.description;
//                var ddd = data.file;
//                        console.log(data);
                        var ar = data.list;
//                        $('#fname').append('<p class="">' + data.discription + '</p>');
                        $('#logo').attr('src', 'LoadImage?systemicon=' + data.logo);
                        $('#dis').append('<p class="p">' + data.discription + '</p>');
                        for (var i = 0; i < ar.length; i++) {
                            let jo = ar[i];
                            let pcod = "";


//                            var temp = '<li type="1" class="nav-item" >'
//                                    + '<div idd="' + jo.id + '" class="gallary" ' + pcod + ' url="' + jo.file + '"  >'
//                                    + '<a class="nav-link collapsed dev" data-bs-target="#tables-nav" data-bs-toggle="collapse" >'
//                                    + '<i ></i><span id="' + jo.id + '" class="" style="font-size: 13px">' + jo.description + '<div class="gal" style="display: none">' + jo.path + ' </div></span>'
//                                    + '</a>'
//                                    + '</div>'
//                                    + ' </li>';


                            var temp = '<li class="nav-item">'
                                    + '<a  class="nav-link collapsed"  data-bs-target="#components-nav-' + jo.id + '" data-bs-toggle="collapse">'
                                    + '<span class="text-center" style="margin-left:30px" >' + jo.description + '</span><i class="bi bi-chevron-down ms-auto"></i>'
                                    + '</a>'
                                    + '<ul id="components-nav-' + jo.id + '" class="nav-content collapse" data-bs-parent="#sidebar-nav">'
                                    + '<li>'
                                    + '<a id="gallary" idd="' + jo.id + '" url="' + jo.file + '" fname ="' + jo.description + '"  style="cursor: pointer;">'
                                    + '<i class="bi bi-circle"></i><span style="font-size:12px">' + jo.path + ' </span>'
                                    + '</a>'
                                    + '</li>'
                                    + '</ul>'
                                    + '</li>';



                            $('#side').append(temp);
                        }


                    });



                    $(document).on('click', '#gallary', function () {
//                        $('#fname').html('');

                        $(document).find('#fname').html('');
                        $(this).find('#fname').html('');
//                        $('#fname').html(fname);
                        var ur = $(this).attr('url');
                        var fname = $(this).attr('fname');
                        // alert(id);

                        if ($('#file').attr('src') === 'LoadFile?pdfFile=' + ur + '#toolbar=0&navpanes=0&scrollbar=0') {
                            return;
                        }

                        $('#file').attr('src', 'LoadFile?pdfFile=' + ur + '#toolbar=0&navpanes=0&scrollbar=0');

                        $(".p").hide();

                        if ($('#fname').append('<h6>' + fname + '</h6>')) {
                            return;
                        }
                        $('#fname').append('<h6>' + fname + '</h6>');


                    });

                    $(document).on('click', '.dev', function () {
                        $(document).find('.gal').hide();
                        $(this).find('.gal').show();
                    });
                    $(document).on('click', '.xx', function () {
                        alert($(this).parent().parent().find('gallary').eq(0).text());
                    });
        </script>

    </body>

</html>