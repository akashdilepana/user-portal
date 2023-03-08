<%-- 
    Document   : newjsp
    Created on : Oct 26, 2022, 10:07:56 AM
    Author     : Akash
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>User Portal | Dashboard</title>
        <meta content="" name="description">
        <meta content="" name="keywords">



        <%@include file="csslinks.jsp"%>

        <link href="assets/css/magicscroll.css" rel="stylesheet">
        <style>

            .body {
                font-family: Montserrat-Medium, sans-serif;
                background-color: #f0f7f8;
                color: #353c4e;
                font-size: 14px;
            }
            .button {
                background-color: #895fc8; /* Green */
                color: black;
                border: 0px solid #b4b4b4;
                padding: 7px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 9px;
                transition-duration: 0.4s;
                cursor: pointer;
                border-radius: 6px;
            }

            .button2 {
                background-color: white; 
                color: #5367af; 
            }
            .button2:hover {
                background-color: #f0f0f0;
                color: #5367af;
            }
            .zoom{
                padding:1px;
                margin: auto;
                width:220px;
                transition: transform .5s;
            }
            .zoom:hover{
                transform: scale(1.05);
            }
            div.gallary {
                margin: 50px;
                border: none;
                float: left;
                width: 8%;
                padding: 5px;

            }

            .card3 { 

                margin: 0px;
                padding-left: 5px; 
                padding-right: 5px; 
                background-color: #ffffff;
                width: 33.333%;
                border-right: 2px solid #f1f1f1;
            }
            .card2 { 

                margin: 0px;
                padding-left: 5px; 
                padding-right: 5px; 
                background-color: #ffffff;
                width: 33.333%;
            }

            #sys:hover {
                border: 1px solid #b4b4b4;
                border-radius: 8px;
            }
            #sys{
                margin:0px;
                padding:0px;
            }
            .gallary img {
                width: 100%;
                height: auto;
            }
            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color:  #FBFBFB !important;
            }

            div.desc {
                padding: 0px;
                text-align: center;
                /*margin-bottom:10px;*/
            }

            div.title {
                padding: 0px;
                text-align: center;
                font-weight: bold;
                font-size: 10px;
            }
            .p1 {
                font-size: 14px;
                margin-top: 10px;
                margin-bottom: 10px;
                color: #204c95;
            }

            .round2 {
                border: 1px solid #ace3ff;
                border-radius: 8px;
                padding: 2px;
                margin-right: 10px;
                margin-left: 10px;
                margin-top: 10px;
                /*width:80%;*/
            }

            .table-hover{
                border-radius: 2px;
            }
            .table td, .table th {
                border-top: 0px solid #dee2e6;

            }
            .table>:not(caption)>*>* {
                padding-left: 0rem;

            }
            .card {
                margin-bottom: 0px; 
            }
            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color: #ECF5FF !important;
                /*background-color: whitesmoke !important;*/
            }

            .table-striped>tbody>tr:nth-of-type(odd)>* {
                /*background: #eeefdd;*/
                /*                background-image: radial-gradient(circle, rgba(149,238,255,0.9108018207282913) 0%, rgba(182,255,254,1) 43%);*/
            }
            tr:nth-child(even) {
                /*background-color: #e3faff;*/
            }

            .table{
                --bs-table-hover-bg: rgba(0, 0, 0, 0);
            }
            td{
                padding: 0px;
            }

            h2 {
                font-size: 32px;
                margin-bottom: 1em;
            }

            .list {
                display: flex;
                overflow-y: auto;
                scroll-snap-type: y mandatory;

            }
            .list::-webkit-scrollbar {
                width: 8px;
                cursor: pointer;

            }

            .list::-webkit-scrollbar-thumb,
            .list::-webkit-scrollbar-track {
                border-radius: 92px;
                box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);

            }

            .list::-webkit-scrollbar-thumb {
                background: #7B68EE;
            }

            .list ::-webkit-scrollbar-track {
                background: var(--thumb);
            }



            .row>* {
                flex-shrink: 0;
                padding-right: calc(var(--bs-gutter-x) * .1); 
                padding-left: calc(var(--bs-gutter-x) * .1);
            }
            .row {
                --bs-gutter-x: 1.0rem;
            }

        </style>
    </head>

    <body class="body">
        <%@include file="menubar.jsp"%>
    <center >
        <main  class="" id="load" >
            <div id="system" class="card" style="z-index:0;">
                <div class="col-lg-12"  >
                    <div class="row" >

                        <div  id="systemst">
                            <div class="row" id="sd">
                                <!--<div class="card">-->
                                <div class="card3" style="margin-bottom: 30px">
                                    <div class=" col-lg-12">


                                        <div class="section-headline services-head text-center">
                                            <p class="p1">Information Systems</p>
                                        </div>
                                    </div>

                                    <div class="card border col-sm-12 tbl list "  style="height: 400px; ">
                                        <div  class="text-left" title="Click here to view more information" style="cursor:pointer; ">

                                            <table class="table table-hover table-striped" style="width:100%">
                                                <thead style="display: none;">
                                                </thead>
                                                <tbody  id="systemstt" style="padding:0px">


                                                </tbody>
                                            </table>

                                            <!--                                                <div class="container">
                                            
                                                                                                <ul class="cards" id="systemstt">
                                            
                                            
                                            
                                                                                                </ul>
                                            
                                                                                            </div>-->
                                        </div>
                                    </div>
                                </div>

                                <br><!-- comment -->

                                <div class="card3" style="margin-bottom: 30px">
                                    <div class=" col-lg-12">


                                        <div class="section-headline services-head text-center">
                                            <p class="p1">Others</p>
                                        </div>
                                    </div>

                                    <div class="card border col-sm-12 tbl list" style="height: 400px; ">
                                        <div  class="text-left" title="Click here to view more information" style="cursor:pointer; ">

                                            <table class="table table-hover table-striped" >
                                                <thead style="display: none;">
                                                </thead>
                                                <tbody  id="itop" style="padding:0px">


                                                </tbody>
                                            </table>

                                            <!--                                                <div class="container">
                                            
                                                                                                <ul class="cards" id="systemstt">
                                            
                                            
                                            
                                                                                                </ul>
                                            
                                                                                            </div>-->
                                        </div>
                                    </div>
                                </div>


                                <div class="card2" style="margin-bottom: 30px">
                                    <div class=" col-lg-12">


                                        <div class="section-headline services-head text-center">
                                            <p class="p1">Policy and Procedure</p>
                                        </div>
                                    </div>

                                    <div class="card border col-sm-12 tbl list"  style="height: 400px; ">
                                        <div  class="text-left" title="Click here to view more information" style="cursor:pointer; ">

                                            <table class="table table-hover table-striped" >
                                                <thead style="display: none;">
                                                </thead>
                                                <tbody  id="policy" style="padding:0px" >


                                                </tbody>
                                            </table>

                                            <!--                                                <div class="container">
                                            
                                                                                                <ul class="cards" id="systemstt">
                                            
                                            
                                            
                                                                                                </ul>
                                            
                                                                                            </div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </main>
    </center>
    <br>

    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/magicscroll.js"></script>

    <script>

        system();
        //        LoadDiv('#load');
        function system() {
            $.get('dashboad', {}, function (resp) {


                //                            console.log(resp);
                var navs = JSON.parse(resp);
                for (var i = 0; i < navs.length; i++) {
                    let nav = navs[i];
                    let pcod = "";


                    var temp = '<tr idd="' + nav.id + '"  class="zoom post-item clearfix gallary" style="margin: 30px" ' + pcod + '>'
                            //                            + '<td width="2%"><div style="text-align:center;margin-top: 30px"><i class="fa fa-th-list" aria-hidden="true"></i></div></td>'
                            + '<td  style="font-size: 13px; text-align: center; width: 20%"><div class="text-muted smal lps-1"><img class="card " src=LoadImage?systemicon=' + nav.icon + ' style="width:40px;margin:15px 20px 0px" /><br>'
                            + '<div style="text-align: center;">' + nav.sname + '</div></div></td>'
                            + '<td class="align-middle " style="font-size: 12px; text-align:justify; width: 80%">' + nav.discription + ' </td>'
                            + '</tr>';

                    if (nav.type === '1') {
                        //                        $('#cards').append(temp);
                        $('#systemstt').append(temp);
                    } else if (nav.type === '2') {
                        $('#itop').append(temp);
                    } else {
                        $('#policy').append(temp);
                    }

                }
                // loading end
            }
            );

            $(document).on('click', '.gallary', function () {
                var id = $(this).attr('idd');

//                $.post('click_system', {id:id}, function () {
//
//                    
//                });

                window.location.href = ('system?id=' + id);

            });
        }
        //        finishLoadDiv('#load');
    </script>

    <script>
        function loadDiv(card) {
            var $this = $(card);
            $this.addClass("div-load");
            $this.append('<div class="div-loader"><i class="loader2"></div>');
        }
        function finishLoadDiv(card) {
            var $this = $(card);
            $this.children(".div-loader").remove();
            $this.removeClass("div-load");
        }

        $('.nav-link').click(function () {
            $('nav-link').removeClass('active');
            $(this).addClass('active');
        });

    </script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>
