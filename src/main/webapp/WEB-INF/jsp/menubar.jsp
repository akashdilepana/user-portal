<%-- 
    Document   : menubar
    Created on : Jan 11, 2023, 10:41:36 AM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
    <%
        if (session.getAttribute("utype") != null && session.getAttribute("utype").equals("1")) {
    %>
    #system{
        margin-top: 30px;
    }
    <%
    } else {
    %>
    #system
    {
        margin-top: 90px;
    }
    .card1
    {
        background-color: #f5f5f5;
        border-radius: 3px;
    }
    .card2 {
        border-radius: 3px; 
    }
    .card1
    {
        border-right: 3px solid white;
    }

    <% }
    %>

    .div-load{
        position:relative;overflow:hidden}.div-load .div-loader{position:absolute;top:0;left:0;width:100%;height:100%;display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;background-color:rgba(255,255,255,.7);z-index:999}.div-load .div-loader i{margin:0 auto;color:#4099ff;font-size:20px}.loader2{margin:auto;width:50%;border:4px solid #f3f3f3;border-top:4px solid #3498db;border-radius:50%;width:40px;height:40px;animation:spin .8s linear infinite}@keyframes spin{0%{transform:rotate(0)}100%{transform:rotate(360deg)}
    }

    .navbar {
        --bs-navbar-padding-x: auto;
    }

    .navbar2 {
        overflow: hidden;
        background-color: white;
        margin-top: 60px;
        margin-bottom: 0px;
    }

    .navbar2 a {
        float: left;
        font-size: 12px;
        color: #353c4e;
        text-align: center;
        padding: 8px 28px;
        text-decoration: none;
    }

    .dropdown2 {
        float: left;
        overflow: hidden;
    }

    .dropdown2 .dropbtn2 {
        font-size: 12px;  
        border: none;
        outline: none;
        color: #353c4e;
        padding: 8px 28px;
        background-color: inherit;
        font-family: inherit;
        margin: 0;
    }

    .navbar2 a:hover, .dropdown2:hover .dropbtn2 {
        color: #42a5f5;
    }
    .navbar2 a.active {
        color: #42a5f5;
    }
    /*    .navbar2 div.active > a {
            color: #42a5f5;
        }*/

    .dropdown-content2 {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content2 a {
        float: none;
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropdown-content2 a:hover {
        background-color: #ddd;
    }

    .dropdown2:hover .dropdown-content2 {
        display: block;
    }
    .rounded-circle {
        border: 2px solid #fff;
    }
    .navbar2 a {

        font-weight: 100;
    }
</style>
<header id="header" class="header fixed-top d-flex align-items-center"  style="background: #6c4892;">

    <div class="d-flex align-items-center justify-content-between" >
        <a href="#">
            <img class="img-fluid" src="./images/UserLogo.png" width="200" />
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    <!--    <button id="switch">Toggle dark mode</button>-->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item dropdown">

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="./images/user.png" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2" style=" cursor: pointer; color: white"><%=session.getAttribute("user")%></span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6><%=session.getAttribute("user")%></h6>
                        <span></span>
                    </li>


                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li style=" cursor: pointer;">
                        <a class="dropdown-item d-flex align-items-center" href="logout">
                            <i class="bi bi-box-arrow-right"></i>
                            <span >Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header>

<nav class="card" >
    <%
        if (session.getAttribute("utype") != null && session.getAttribute("utype").equals("1")) {
    %>
    <div class=" navbar2">



        <a onclick= "window.location.href = ('index')" style='cursor: pointer' class="nav-link"><i class="feather icon-home"></i>  Dashboad</a>
        <a onclick= "window.location.href = ('adddocument')" style='cursor: pointer' class="nav-link"><i class="feather icon-pie-chart"  ></i>  Add Document</a>
        <a onclick= "window.location.href = ('addsystems')" style='cursor: pointer' class="nav-link"><i class="feather icon-briefcase"  ></i>  Add System</a>

        <div class="dropdown2">


            <button class="dropbtn2"><i class="feather icon-users"  ></i>  Admin 
                <i class="fa fa-caret-down"></i>
            </button>

            <div class="dropdown-content2" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" onclick= "window.location.href = ('users')" style='cursor: pointer'>  Users</a>
                <a class="dropdown-item" onclick= "window.location.href = ('userType')" style='cursor: pointer'>  User Types</a>

            </div>
        </div> 

        <!--        <div class="nav-item dropdown2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Admin 
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" onclick= "window.location.href = ('users')" style='cursor: pointer'>  Users</a>
                        <a class="dropdown-item" onclick= "window.location.href = ('userType')" style='cursor: pointer'>  User Types</a>
        
                    </div>
                </div>-->


        <a onclick= "window.location.href = ('userlog')" style='cursor: pointer' class="nav-link "><i class="feather icon-settings" ></i>  User Log</a>


    </div>


    <!--<nav class="navbar navbar-expand-lg navbar-light bg-light">-->


    <!--    <div class="d-flex flex-row" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
               <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
    
        </div>-->



    <%
        }
    %>

</nav>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> 

<script>
            $('.nav-link').click(function () {
                $('nav-link').removeClass('active');
                $(this).addClass('active');
            });

</script>