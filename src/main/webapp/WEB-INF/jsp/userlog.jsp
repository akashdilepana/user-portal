<%-- 
    Document   : login
    Created on : Sep 21, 2022, 4:58:03 PM
    Author     : Akash
--%>


<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%
        if (session.getAttribute("utype") == null || !session.getAttribute("utype").equals("1")) {
            response.sendRedirect("index");
            return;
        }

    %>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>User Portal | User log</title>
        <meta content="" name="description">
        <meta content="" name="keywords">


        <%@include file="csslinks.jsp"%>


        <style> 
            .fas{
                font-size: 14px;
                margin: 20px;
            }

            Body {
                font-family: Montserrat-Medium, sans-serif;
                background-color: #f0f7f8;
                font-size: 14px;
            }
            button { 
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

            form { 
                border: 0px solid #f1f1f1; 
            } 
            .form-control { 
                margin-left:  50px;
                width: 80%; 
                padding: 5px 20px; 
                display: inline-block; 
                border: 1px solid LightGray; 
                box-sizing: border-box; 
            }

            #demo { 
                margin-bottom: 20px;
                margin-top: 0px;
                margin-left: 100px;
                margin-right: 100px;
                padding: 20px; 
                background-color: #ffffff;
            } 
            #menu { 
                margin-bottom: 20px;
                margin-top: 10px;
                margin-left: 100px;
                margin-right: 100px;
                padding-right: 10px; 
                padding-top: 10px; 
                padding-bottom: 10px; 
                background-color: #ffffff;
            } 

            .img{
                margin-top: 50px;
            }

            .display{
                margin-left: 30px;
                margin-right: 40px;
            }

            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: red;
                color: #204c95;
            }

            .text {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 8px;
                margin-bottom: 0px;
                margin-left:  50px;
                font-weight: bold;
                color: #204c95;
            }

            .close{
                margin-bottom: 10px;
            }
            .placeholder {
                cursor: pointer; 
                background-color: transparent; 
                opacity: 1; 
            }

            .utype { 
                margin-left:  30px;
                width:93%; 
                padding: 5px 20px; 
                display: inline-block; 
                box-sizing: border-box; 
            }
            div.dataTables_wrapper div.dataTables_length select {
                margin-left: 0px;
                padding-left: 5px;
            }
            .pagination {
                --bs-pagination-font-size: 0.8rem;
            }

            #system{
                margin-top: 10px;
            }   

            div.dt-buttons {
                position: relative;
                float: right !important;
                /*                color: green;*/
            }
            .exit { 
                border: none; 
                color: #ed3538;
            }
            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color: #ECF5FF !important;
                /*background-color: whitesmoke !important;*/
            }
            table.dataTable {

                border-collapse:collapse !important;
                border-spacing: 0;
            }
            div.dataTables_wrapper div.dataTables_length select {
                width: 40%; 
                display: inline-block;
                margin-left: 5px;
            }
            .pagination {
                --bs-pagination-font-size: 0.8rem;
            }
            .dropdown-menu.show {
                display: block;
            }

            .row{
                padding-right: 20px;
                    
            }
           
        </style>
    </head>

    <body>

        <%@include file="menubar.jsp"%>

        <div class="card" id="menu">

            <a onclick= "window.location.href = ('index')">
                <i class="feather icon-x cls-card exit pull-right" style=" cursor: pointer;"></i>
            </a>
            <div class="row">


                <div class="col-lg-4" >
                    <div class="text uname">User Name</div>
                    <select class="utype" id="allusers" name="allusers" >
                        <option value="x">  Select User  </option>
                        <% JSONArray systems = (JSONArray) request.getAttribute("user");

                            for (int i = 0; i < systems.length(); i++) {

                                JSONObject sys = systems.getJSONObject(i);
                        %>
                        <option value="<%=sys.getString("username")%>">  <%=sys.getString("username")%>  </option>
                        <%
                            }
                        %>  

                    </select>

                </div>

                <div class="col-lg-4" >
                    <div class="text">From*</div>
                    <input class="form-control" id="fromdate" data-provide="datepicker" name="fromdate" required/>
                </div>

                <div class="col-lg-4" >
                    <div class="text">To*</div>
                    <input class="form-control" id="todate" type="date" name="todate" required/>
                </div>

            </div>

        </div>

        <div id="demo" class="card">
            <div class="card-header">
                <table class="table table-bordered table-hover" id="tbl">

                    <thead>
                        <tr>
                            <th>User Name</th>       
                            <th>Activity</th>      
                            <!--                    <th>URL</th>      -->
                            <th>Date</th>
                        </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>

        <script src="assets/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/jstree.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>   
        <script src="files/assets/js/func.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="files/assets/js/slimselect.js"></script>
        <script src="js/dataTables.buttons.min.js"></script>
        <script src="js/buttons.print.min.js"></script>

        <script>
                let allusers = new SlimSelect({
                    select: '#allusers',
                });
//                $(tboby).find('tr').each.funtion{
//                .eq(0).addClass('text-center');
//                }

                $.fn.dataTable.ext.errMode = 'none';
                var table = $('#tbl').DataTable({
                    dom: 'lfrtipB',
                    buttons: [
                        'print'
                    ],
                    "bLengthChange": true,
                    "bInfo": true,
                    "aLengthMenu": [[10, 25, 40], [10, 25, 40]],
                    "pageLength": 10,
                    "ordering": true,
                    "autoWidth": false,
                    "processing": true,
                    "serverSide": true,
                    "order": [[2, "desc"]],
                    "ajax": {
                        "url": 'userrecod',
                        "contentType": "application/json",
                        "type": "POST",
                        "data": function (d) {
                            d.user = $('#allusers').val();
                            d.fdate = $('#fromdate').val();
                            d.tdate = $('#todate').val();
                            return JSON.stringify(d);
                        },
                        "language": {
                            'loadingRecords': '&nbsp;',
                            //'processing': '<div class="loader2">test</div>'
                            'processing': '<div class ="spinner-border text-primary" role="status"></div>'
                        },
                        error: function (xhr, error, code) {
                            console.log(xhr);
                            console.log(code);
                        },
                        "createdRow": function (row, data, dataIndex) {

                            $(row).find('td:eq(1)').css('text-align', 'center');

                        },
                        "columnDefs": [

                            {"data": "name"},
                            {"data": "activity"},
                            {"data": "date"},
                            {
                                "targets": 0, // your case first column
                                "className": "text-center",
//                                "width": "4%"
                            },
                        ]
                    },
                });
                $('#allusers,#fromdate,#todate').change(function () {
                    table.ajax.reload();
                });
                $(document).on('click', '.xx', function () {
                    alert($(this).parent().parent().find('td').eq(0).text());
                });
        </script>

    </body>

</html>