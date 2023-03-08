

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
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
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>User Portal | Add Document</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <%@include file="csslinks.jsp"%>
        <%@include file="style.jsp"%>

        <style> 
            .fas{
                font-size: 14px;
                margin: 20px;
            }

            label {
                display: inline-block;
                margin-bottom: 0rem; 
            }

            .body {
                font-family: Montserrat-Medium, sans-serif;
                background-color: #f0f7f8;
                font-size: 14px;
            }
            button2 { 

                width: 10%; 
                padding: 10px; 
                margin-bottom: 10px;
                margin-top: 20px;
                margin-left: 50px;
                margin-right: 10px; 
                border: none; 
                cursor: pointer; 
            }

            .exit { 

                border: none; 
                color: #ed3538;
            }

            .file { 

                width: 82%; 
                margin-left:  30px;
            }

            form { 
                border: 0px solid #f1f1f1; 
            } 

            #path1{
                padding:18px 0px 18.5px 0px ;
            }

            button:hover { 
                opacity: 0.7; 
            } 

            #demo { 
                margin-bottom: 100px;
                margin-top: 20px;
                margin-left: 100px;
                margin-right: 100px;
                padding-left: 20px; 
                padding-right: 20px; 
                background-color: #ffffff;
                /*border: 2px solid #f1f1f1;*/
            } 

            .img{
                margin-top: 50px;
            }

            .png{
                margin-left: 30px;
                margin-top:  5px;
            }

            .font{
                font-family: open sans, sans-serif;            
                font-size: 13px;
            }

            h5 {
                font-family: "Nunito", sans-serif;
                font-size: 10px;             
                /*margin-left: 30px;*/
                color: #204c95;
            }
            .sts { 
                margin-left:18px;
                width:98%; 
                padding: 5px 20px; 
                display: inline-block; 
                box-sizing: border-box; 
            }

            .close{
                margin-bottom: 10px;
            }
            #system{
                margin-top: 10px;
            }

            .text{
                margin-left: 40px;
                color: #51678f;
            }

            model{
                font-family: open sans, sans-serif;
            }
            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color: #ECF5FF !important;
                /*background-color: whitesmoke !important;*/
            }
           
          
        </style>
    </head>

    <body class="light-mode body">

        <%@include file="menubar.jsp"%>

        <div id="demo" class="card">

            <h5 class="card-title">Documents<a onclick= "window.location.href = ('index')">
                    <i class="feather icon-x cls-card exit pull-right" style=" cursor: pointer;"></i>
                </a></h5>


            <div class="card-header">

                <table class="table table-bordered table-hover" id="tbl">

                    <thead>
                        <tr>
                            <th>ID</th>       
                            <th>Description</th>       
                            <th>Upload Date</th>      
                            <th>System Name</th>      
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>

            <div class="card-footer">
                <div class="row" >
                    <div class="col-2 offset-10">
                        <button  class="btn btn-sm btn-danger pull-right" type="button" id="add" style="float: right;">+ Add</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="doc" tabindex="-1" style="display:none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title h1">Add Document</h5>
                        <h5 class="modal-title h2">Edit Document</h5>
                        <button type="button" class="btn-close home" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body center">

                        <form id="form" class="row g-3 container">

                            <div class="col-md-6"> 
                                <label for="inputName5" class="form-label text">System</label>
                                <select class="" id="allsystem" name="allsystem" style="width:82%; display: block; margin-left: 40px;">
                                    <option value="0">  Select System  </option>
                                    <%                                        JSONArray systems = (JSONArray) request.getAttribute("system");

                                        for (int i = 0; i < systems.length(); i++) {

                                            JSONObject sys = systems.getJSONObject(i);
                                    %>
                                    <option value="<%=sys.getString("id")%>">  <%=sys.getString("sname")%>  </option>
                                    <%
                                        }
                                    %>   
                                </select>
                            </div>

                            <div class="col-md-6" >
                                <label for="inputName5" class="form-label text" style="margin-left:30px">Description</label>
                                <!--<div class="text">Description</div>-->
                                <input type="text" name="description" class="form-control" id="description" required style="margin-left: 30px; width: 82%;">
                                <div class="invalid-feedback">Please enter your username.</div>
                            </div>

                            <!--<div class="row">-->
                            <div class="col-md-6" >
                                <label for="inputName5" class="form-label text">System Path</label>
                                <!--<div class="text">System Path</div>-->
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" name="path1" class="form-control" readonly="" id="path1" required style="margin-left:40px; width: 90px;font-size: 13px;">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="path2" class="form-control" id="path2" required style="width:200px; margin-left:38px;">
                                        <div class="invalid-feedback">Please enter System path.</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label for="file" class="form-label text" style="margin-left:30px">File</label>
                                <input class="form-control file" type="file" id="file1" name="systemfile" style="margin-left:30px">
                            </div>
                            <!--</div>-->

                            <br>
                            <div class="row" style="margin-top: 10px">
                                <div class="col-sm-6 status">
                                    <div class="text text" >Status<span class="text-danger">*</span></div>
                                    <select class="sts" id="status" name="status">
                                        <option value="active">Active</option>
                                        <option value="deactive">Deactive</option>
                                    </select>
                                </div> 
                            </div>

                        </form> 

                    </div>
                    <div class="modal-footer">
                        <button  class="btn btn-sm btn-primary pull-right " type="submit" id="save" style="float: right;">Save</button>
                        <button  class="btn btn-sm btn-primary pull-right " type="submit" id="update" style="float: right;">Update</button>

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
                let sts = new SlimSelect({
                    select: '#status'

                });
                let system = new SlimSelect({
                    select: '#allsystem'

                });

                $.fn.dataTable.ext.errMode = 'none';
                var table = $('#tbl').DataTable({
                    "bLengthChange": true,
                    "bInfo": true,
                    "aLengthMenu": [[10, 25, 40], [10, 25, 40]],
                    "pageLength": 10,
                    "ordering": true,
                    "bDestroy": true,
                    "autoWidth": false,
                    "processing": true,
                    "serverSide": true,
                    "order": [[2, "desc"]],
                    "ajax": {
                        "url": 'loaddocs',
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
                        $(action_td).html('<a class="edit m-r-5 m-l-5" x="' + data['id'] + '"><center><i class="icon feather icon-edit f-16 text-c-green" style=" cursor: pointer;"></i></center></a>');
                        $(row).append(action_td);

                        var tr1 = $(row).find('td').eq(3).html();
                        console.log(tr1);

                        $(row).find('td').addClass('font');
                        $(row).find('td').eq(2).addClass('text-center');

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
                        {"data": "Description"},
                        {"data": "UploadDate"},
                        {"data": "System Name"},
                        {"data": "Status"},
                    ]
                });

                $(document).on('click', '#add', function () {
                    system.set(0);
                    $('#description').val('');
                    $('#file1').val('');
                    $('#file1').show();
                    $('#path1').val('');
                    $('.png').html('');
                    $('#path2').val('');
                    $('#doc').modal('show');
                    $('.h2,#update,.status').hide();
                    $('.h1,#save').show();
                    $('.png').hide();


                });

                let updateId = '';

                $(document).on('click', '.edit', function () {

                    $('#save').hide();
                    $('.h1').hide();
                    $('#update,.h2,.status').show();
                    loadDiv('#load'); // loading start

                    let id = $(this).parent().data('id');
                    updateId = id;

                    system.set(0);
                    $('#file1').val('');
                    $('#description').val('');
                    $('.png').html('');
                    $('#path1').val('');
                    $('#path2').val('');



                    $.post('EditDoc', {id: id}, function (res) {
                        var data = JSON.parse(res);
                        console.log(data);
                        var ar = data.list;
                        for (var i = 0; i < ar.length; i++) {
                            let jo = ar[i];


                            $('#doc').modal('show');
                            $('#description').val(jo.description);

                            system.set(jo.system);
                            sts.set(jo.status);

                            if (jo.file) {
                                $('#file1').hide();
                                $('#file1').after('<div class="png"><a target="_blank" href="LoadImage?systemicon=' + jo.file + '">Click Here to View</a> <i class="fa fa-close dltFile" aria-hidden="true"></i></div>');
                            }
                            let spt = jo.path.toString().split("/");
                            $('#path2').val(jo.path.toString().substring(spt[0].length + 1));
                        }

                        finishLoadDiv('#load'); // loading end
                    });
                });
                function validateData() {
                    if ($("#allsystem").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please Select a System!'
                        });
                        return false;
                    }

                    if ($("#description").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please enter a value for description!',
                        });
                        return false;
                    }
//                    if ($("#path2").val().trim() === '') {
//                        Swal.fire({
//                            icon: 'warning',
//                            title: 'Field Required !',
//                            text: 'Please enter a System Path!',
//                        });
//                        return false;
//                    }
                    if ($("#file1").prop('files').length === 0) {
                        Swal.fire({
                            icon: 'warning',
                            title: 'File Required !',
                            text: 'Please enter a value for files!',
                        });
                        return false;
                    }
                    return true;
                }

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
                            return fetch('SaveDoc', {
                                method: 'POST',
                                body: data
                            });
                        }
                    }).then(response => {
                        return response.value.text();
                    }).then((txt) => {

                        let resp = JSON.parse(txt);
                        //console.log(response)
                        if (resp.status === 'ok') {

                            Swal.fire('Saved!', '', 'success')

                            system.set(0);
                            $('#description').val('');
                            $('#file1').val('');
                            $('#path1').val('');
                            $('#path2').val('');
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
                            return fetch('UpdateDoc', {
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

                            location.href = "adddocument";

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

                $(document).on('click', '.dltFile', function () {
                    $(this).parent().parent().find('input').show();
                    $(this).parent().remove();
                });
                $(document).on('click', '#home', function () {

                    location.href = "adddocument";
                });
                $(document).on('change', '#allsystem', function () {
                    var d = $('#allsystem option:selected').text();
                    $('#path1').val(d + "/");
                });
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

//            var body = document.querySelector('body,.card');
//
//            document.querySelector('#switch').addEventListener('click', function () {
//                if (body.classList.contains('light-mode')) {
//                    body.classList.replace('light-mode', 'dark-mode');
//                } else {
//                    body.classList.replace('dark-mode', 'light-mode');
//                }
//            });
        </script>

    </body>

</html>