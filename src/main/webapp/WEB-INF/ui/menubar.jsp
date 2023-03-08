<%-- 
    Document   : menubar
    Created on : Jan 11, 2023, 10:41:36 AM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbar2">

    <!--        <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button onclick= "window.location.href = ('dashboad.jsp?')" class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="feather icon-home"  ></i>  Dashboad</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button onclick= "window.location.href = ('adddocument.jsp?')" class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false"><i class="feather icon-pie-chart"  ></i>  Add Document</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button onclick= "window.location.href = ('addsystem.jsp?')" class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false"><i class="feather icon-briefcase"  ></i>  Add System</button>
                </li>
        
                <li class="dropdown2">
        
        
                    <button class="dropbtn2 "><i class="feather icon-users" ></i>  Admin 
                        <i class="fa fa-caret-down"></i>
                    </button>
        
                    <div class="dropdown-content2">
                        <a onclick= "window.location.href = ('admin.jsp?')" style='cursor: pointer' >  Users</a>
                        <a onclick= "window.location.href = ('systempages.jsp?')" style='cursor: pointer'>  User Types</a>
        
                    </div>
                </li> 
        
                <li class="nav-item" role="presentation">
                    <button onclick= "window.location.href = ('userlog.jsp?')" class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false"><i class="feather icon-settings" ></i>  User Log</button>
                </li> 
        
            </ul>-->

    <a onclick= "window.location.href = ('dashboad.jsp?')" style='cursor: pointer' class="nav-link active"><i class="feather icon-home"  ></i>  Dashboad</a>
    <a onclick= "window.location.href = ('adddocument.jsp?')" style='cursor: pointer' class="nav-link active"><i class="feather icon-pie-chart"  ></i>  Add Document</a>
    <a onclick= "window.location.href = ('addsystems.jsp?')" style='cursor: pointer' class="nav-link active"><i class="feather icon-briefcase"  ></i>  Add System</a>

    <div class="dropdown2">


        <button class="dropbtn2"><i class="feather icon-users"  ></i>  Admin 
            <i class="fa fa-caret-down"></i>
        </button>

        <div class="dropdown-content2">
            <a onclick= "window.location.href = ('admin.jsp?')" style='cursor: pointer'>  Users</a>
            <a onclick= "window.location.href = ('systempages.jsp?')" style='cursor: pointer'>  User Types</a>

        </div>
    </div> 

    <a onclick= "window.location.href = ('userlog.jsp?')" style='cursor: pointer'><i class="feather icon-settings" ></i>  User Log</a>

   
</div>