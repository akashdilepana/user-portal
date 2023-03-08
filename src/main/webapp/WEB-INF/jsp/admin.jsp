<%-- 
    Document   : login
    Created on : Sep 21, 2022, 4:58:03 PM
    Author     : Akash
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Portal | Users</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <%@include file="csslinks.jsp"%>
        <%@include file="style.jsp"%>
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

            form { 
                border: 0px solid #f1f1f1; 
            } 
            .name,.uname { 
                margin-left:40px;
                width: 80%; 
                display: inline-block; 
                border: 1px solid LightGray; 
                box-sizing: border-box; 
            }
            .namet,.unamet,.utypet{
                margin-left:  40px;
                font-weight: bold;
            }
            .sts { 
                margin-left:  28px;
                width:96.6%; 
                padding: 5px 20px; 
                display: inline-block; 
                box-sizing: border-box; 
            }
            .utype { 
                margin-left:  16px;
                width:96.6%; 
                padding: 5px 20px; 
                display: inline-block; 
                box-sizing: border-box; 
            }
            .stst{
                margin-left: 50px;
                font-weight: bold;
            }
            button:hover { 
                opacity: 0.7; 
            } 

            #demo { 
                margin-bottom: 50px;
                margin-top: 20px;
                margin-left: 100px;
                margin-right: 100px;
                padding-left: 20px; 
                padding-right: 20px; 
                background-color: #ffffff;
            } 

            .ts{
                margin-left: 50px;
            }

            .img{
                margin-top: 50px;
            }
            .font{
                font-family: open sans, sans-serif;               
                font-size: 13px;
            }

            p {
                /*font-family: "Nunito", sans-serif;*/
                font-size: 10px;             
                /*margin-left: 30px;*/
                color: #204c95;
            }

            .close{
                margin-bottom: 10px;
            }

            #system{
                margin-top: 10px;
            } 
            .exit { 
                border: none; 
                color: #ed3538;
            }
            .h1, h1 {
                font-size: 1.6rem;
            }
            .text{
                font-weight: bold;
                color: #51678f;
            }

            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color: #ECF5FF !important;
                /*background-color: whitesmoke !important;*/
            }
          

        </style>



    </head>

    <body>
        <%@include file="menubar.jsp"%>

        <div id="demo" class="card">

            <h5 class="card-title">Users<a onclick= "window.location.href = ('index')">
                    <i class="feather icon-x cls-card exit pull-right" style=" cursor: pointer;"></i>
                </a></h5>
            <div class="card-header">
                <table class="table table-bordered table-hover" id="tbl">

                    <thead >
                        <tr>
                            <th>id</th>
                            <th>Name</th>       
                            <th>User Name</th>      
                            <th>User Type</th>  
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                    </thead>

                    <tbody >

                    </tbody>
                </table>
            </div>


            <br><br>
            <div class="card-body">
                <div class="row">
                    <div class="col-2 offset-10">
                        <button class="btn btn-sm btn-danger pull-right " type="button" id="add" style="float: right;">+ ADD</button>

                    </div>

                </div>

            </div>
        </div>


        <div class="modal fade" id="doc" tabindex="-1" style="display:none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title h1">Add User</p>
                        <p class="modal-title h2">Edit User</p>
                        <button type="button" class="btn-close home" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body center">

                        <form id="form" class="row g-3 container">

                            <div class="col-md-6" >
                                <label class="text namet">Name
                                </label>
                                <input type="text" name="name" class="form-control name" id="name" required>
                                <div class="invalid-feedback">Please enter Name</div>
                            </div>

                            <div class="col-md-6" >
                                <label class="text namet ">User Name
                                    <span class="text-danger">*</span></label>
                                <input type="text" name="username" class="form-control uname" id="username" required>
                                <div class="invalid-feedback">Please enter User Name.</div>
                            </div>

                            <br><br><br><br>
                            <br><br>

                            <div class="row">
                                <div class="col-md-6" >
                                    <div class="text utypet">User Type<span class="text-danger">*</span></div>

                                    <select class=" utype"  id="usertype" name="usertype">
                                        <option value="0">  Select Type  </option>
                                        <%                                        JSONArray systems = (JSONArray) request.getAttribute("usertype");

                                            for (int i = 0; i < systems.length(); i++) {

                                                JSONObject sys = systems.getJSONObject(i);
                                        %>
                                        <option value="<%=sys.getString("id")%>">  <%=sys.getString("name")%>  </option>
                                        <%
                                            }
                                        %>   

                                    </select>
                                </div>

                                <div class="col-md-6 status" style="display:none" >
                                    <!--                                <div class="ts">-->
                                    <div class="text  stst" >Status<span class="text-danger">*</span></div>
                                    <select class=" sts" id="status" name="status">

                                        <option value="active">Active</option>
                                        <option value="deactive">Deactive</option>
                                    </select>
                                    <div class="invalid-feedback">Please enter User Name.</div>
                                    <!--</div>-->
                                </div>  
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button  class="btn btn-sm btn-primary mb-3 pull-right " type="submit" id="save" style="float: right;"><i class="bi bi-collection"></i>Save</button>
                        <button  class="btn btn-sm btn-success pull-right " type="submit" id="update" style="float: right;">Update</button>

                    </div>
                </div>
            </div>
        </div>





        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/datatables.min.js"></script>
        <script src="files/assets/js/slimselect.js"></script>

        <script>
                let status = new SlimSelect({
                    select: '#status',
                });
                let utype = new SlimSelect({
                    select: '#usertype'
                });

                $.fn.dataTable.ext.errMode = 'none';
                var table = $('#tbl').DataTable({
                    "bLengthChange": true,
                    "bInfo": true,
                    "aLengthMenu": [[10, 25, 40], [10, 25, 40]],
                    "pageLength": 10,
                    "ordering": true,
                    "autoWidth": false,
                    "processing": true,
                    "serverSide": true,
                    "order": [[3, "desc"]],
                    "ajax": {
                        "url": 'loadUsers',
                        "contentType": "application/json",
                        "type": "POST",
                        "data": function (d) {
                            return JSON.stringify(d);
                        },
                        error: function (xhr, error, code) {
                            console.log(xhr);
                            console.log(code);
                        }
                    },

                    "language": {
                        'loadingRecords': '&nbsp;',
                        //'processing': '<div class="loader2">test</div>'
                        'processing': '<div class ="spinner-border text-primary" role="status"></div>'
                    },

                    "createdRow": function (row, data) {

                        let action_td = document.createElement('td');
                        $(action_td).data('id', data['id']);
                        $(action_td).html('<a class="edit m-r-5 m-l-5" x="' + data['id'] + '"><center><i class="icon feather icon-edit f-16 text-c-green" style="cursor: pointer"></i></center></a>');
                        $(row).append(action_td);

                        var tr1 = $(row).find('td').eq(3).html();
                        //        $('#tbl').find('table').find('tbody').find('tr').each(function () {

                        //                            var tr1 = $(this).find('td').eq(4).html();

                        $(row).find('tr').addClass('text-center');
                        $(row).find('td').eq(2).addClass('text-center');
                        $(row).find('td').addClass('font');

                        if (tr1 === 'active') {
                            $(row).find('td').eq(3).html('<label class="alert alert-success " style="font-size:10px">Active</label>');
                            $(row).find('td').eq(3).addClass('text-center');
                        } else if (tr1 === 'deactive') {
                            $(row).find('td').eq(3).html('<label class="alert alert-danger " style="font-size:10px">Deactive</label>');
                            $(row).find('td').eq(3).addClass('text-center');
                        }
                    },
                    "columns": [
                        {"data": "id", visible: false},
                        {"data": "name"},
                        {"data": "username"},
                        {"data": "user type"},
                        {"data": "Status"},
                    ]

                });

                document.getElementById('save').addEventListener('click', function (evt) {
                    evt.preventDefault();
                    let validated = validateData();
                    if (!validated) {
                        return;
                    }

                    let data = new FormData(document.getElementById('form'));
                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You are about to save, Please make sure that the entred data are correct!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Save!',
                        showLoaderOnConfirm: true,
                        allowOutsideClick: () => !Swal.isLoading(),
                        preConfirm: () => {
                            return fetch('UserSave', {
                                method: 'POST',
                                body: data
                            });
                        }
                    }).then(response => {
                        return response.value.text();
                    }).then((txt) => {

                        let resp = JSON.parse(txt);
                        if (resp.status === 'ok') {

                            Swal.fire('Saved!', '', 'success');

                            $('#name').val('');
                            $('#username').val('');
                            utype.set(0);
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error...',
                                text: resp.msg,
                                footer: '<a href="">Why do I have this issue?</a>'

                            });
                        }
                    });
                });

                document.getElementById('update').addEventListener('click', function (evt) {
                    evt.preventDefault();
                    let data = new FormData(document.getElementById('form'));
                    data.append('id', updateId);

                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You are about to save, Please make sure that the entred data are correct!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Save!',
                        showLoaderOnConfirm: true,
                        allowOutsideClick: () => !Swal.isLoading(),
                        preConfirm: () => {
                            return fetch('UserUpdate', {
                                method: 'POST',
                                body: data
                            });
                        }
                    }).then(response => {
                        return response.value.text();
                    }).then((txt) => {
                        //console.log(response)
                        let resp = JSON.parse(txt);

                        if (resp.status === 'ok') {

                            Swal.fire('Updated!', '', 'success')

                            location.href = "users";

                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error...',
                                text: resp.msg,
                                footer: '<a href="">Why do I have this issue?</a>'

                            });
                        }
                    });
                });

                $(document).on('click', '#add', function () {

                    $('#name').val('');
                    status.set(0);
                    utype.set(0);
                    $('#username').val('');

                    $('#update,.status,.h2').hide();
                    $('#save,.h1').show();
                    $('#doc').modal('show');
                });

                let updateId = '';
                $(document).on('click', '.edit', function () {

                    $('#update,.h2,.status').show();
                    $('#save,.h1').hide();
                    let id = $(this).parent().data('id');
                    updateId = id;

                    $('#name').val('');
                    utype.set(0);
                    $('#username').val('');
                    status.set(0);

                    $.post('EditUsers', {id: id}, function (res) {
                        var jo = JSON.parse(res);
                        console.log(jo);

//                            $('#demo,#add').hide();
                        $('#doc').modal('show');
                        $('#name').val(jo.name);
                        $('#username').val(jo.username);
                        utype.set(jo.user_type);
                        //                                $('#usertype').val(jo.user_type);
                        status.set(jo.status);


                    });
                });




                $(document).on('click', '#home', function () {

                    location.href = "users";
                });
                function validateData() {
                    if ($("#name").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please enter Name!',
                        });
                        return false;
                    }
                    if ($("#username").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please enter User Name!',
                        });
                        return false;
                    }
                    if ($("#usertype").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please Select User Type!',
                        });
                        return false;
                    }
                    return true;
                }



        </script>


    </body>

</html>