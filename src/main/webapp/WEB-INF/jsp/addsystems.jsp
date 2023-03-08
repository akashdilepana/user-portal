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
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>User Portal | Add System</title>
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
            #save,#update {                           
                margin-top: 20px;
                margin-right: 20px;
            } 

            form { 
                border: 0px solid #f1f1f1; 
            } 
            .form-control { 
                margin-left:  60px;
                margin-top: 5px;
                width: 70%; 

            }

            .type { 
                width: 81.5%; 
                padding: 5px 20px; 
                display: inline-block; 
                box-sizing: border-box; 
            }
            .text{
                margin-left:  60px;
                font-weight: bold;
                color: #51678f;
            }

            .sts { 
                margin-left:41px;
                width: 81%; 
                padding: 5px 20px; 
                display: inline-block; 
                box-sizing: border-box; 
            }
            .stst{
                margin-left:  80px;
                font-weight: bold;
            }

            .png{
                margin-left: 60px;
                margin-bottom: 10px;
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
            } 
            .img{
                margin-top: 50px;
            }

            #close{
                width: 20%;
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
            .close{
                margin-bottom: 10px;
            }
            label {
                margin: 0px;
            }

            .exit { 
                border: none; 
                color: #ed3538;
            }
            .sname{
                text-align: center;
                font-weight: bold;
                font-stretch: 12px;
                margin-top: inherit;
            }
            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color: #ECF5FF !important;
                /*background-color: whitesmoke !important;*/
            }
          
        </style>

    </head>

    <body>

        <%@include file="menubar.jsp"%>

        <div id="demo" class="card" >

            <h5 class="card-title">Systems<a onclick= "window.location.href = ('index')">
                    <i class="feather icon-x cls-card exit pull-right" style=" cursor: pointer;"></i>
                </a></h5>

            <div class="card-header">
                <table class="table table-bordered table-hover" id="tbl">

                    <thead>
                        <tr>
                            <th>id</th>
                            <th>System Name</th>       
                            <th>Description</th>      
                            <th>System Type</th>  
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>

            <br>
            <div class="card-body">
                <div class="row">
                    <div class="col-2 offset-10">
                        <button  class="btn btn-sm btn-danger pull-right " id="add" style="float: right;">+ Add</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="doc" tabindex="-1" style="display:none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title h1">Add System</h5>
                        <h5 class="modal-title h2">Edit System</h5>
                        <button type="button" class="btn-close home" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body center">

                        <form id="form" class="row g-3 container">

                            <div class="col-md-6" >
                                <div class="text">System</div>
                                <input type="text" name="system" class="form-control" id="system" required style="margin-top: 5px">
                                <div class="invalid-feedback">Please enter System</div>
                            </div>

                            <div class="col-md-6" >
                                <div class="text" style="margin-left:59px">System Type<span class="text-danger">*</span></div>

                                <select class="type" id="systemtype" name="systemtype" style="margin-left: 39px;">
                                    <option value="0">  Select Type  </option>
                                    <%                                            JSONArray systems = (JSONArray) request.getAttribute("system");

                                        for (int i = 0; i < systems.length(); i++) {

                                            JSONObject sys = systems.getJSONObject(i);
                                    %>
                                    <option value="<%=sys.getString("id")%>">  <%=sys.getString("name")%>  </option>
                                    <%
                                        }
                                    %>   

                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="text">Icon
                                </label>
                                <br>
                                <input class="form-control file" type="file" name="systemicon" id="icon">

                            </div>

                            <div class="col-md-6">
                                <label for="addlogo" class="text" >Logo
                                </label>
                                <br>
                                <input class="form-control file" type="file" name="systemlogo" id="logo" style="margin-bottom:10px;">

                            </div>

                            <br><br><br><br>

                            <!--                            <div class="row">-->

                            <div class="col-md-6">
                                <div class="text">Description</div>
                                <textarea name="description" class="form-control" id="description" style="height: 0px; width: 70%;margin-left: 60px;" required></textarea>
                                <div class="invalid-feedback">Please enter Description.</div>
                            </div>
                            <div class="col-md-6 status"  >
                                <div class=" text " style="margin-left: 61px; margin-bottom: 0px; font-weight: bold; ">Status<span class="text-danger">*</span></div>

                                <select class="sts" id="status" name="status">
                                    <option value="active">Active</option>
                                    <option value="deactive">Deactive</option>
                                </select>
                                <div class="invalid-feedback">Please enter User Name.</div>
                            </div>

                            <!--</div>--> 

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button  class="btn btn-sm btn-success mb-3 pull-right " type="submit" id="save" style="float: right;"><i class="bi bi-collection"></i>Save</button>
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
                let stype = new SlimSelect({
                    select: '#systemtype'

                });

                let status = new SlimSelect({
                    select: '#status'

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
                    "order": [[2, "desc"]],
                    "ajax": {
                        "url": 'loadSystem',
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
                        console.log(tr1);

                        $(row).find('td').addClass('font');
                        $(row).find('td').eq(2).addClass('text-center');
                        $(row).find('td').eq(0).addClass('sname');

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
                        {"data": "description"},
                        {"data": "system name"},
                        {"data": "Status"},
                    ]

                });

                $(document).on('click', '#add', function () {

                    $('#system').val('');
                    stype.set(0);
                    $('#description').val('');
                    $('.png').html('');
                    $('#icon').val('');
                    $('#logo').val('');
                    $('.h2,#update,.status').hide();
                    $('.h1,#save,#logo,#icon').show();
                    $('.png').hide();
                    $('#doc').modal('show');

                });

                let updateId = '';

                $(document).on('click', '.edit', function () {
                    $('#save').hide();
                    $('.h1').hide();
                    $('#update,.h2,.status').show();

                    let id = $(this).parent().data('id');

                    updateId = id;

                    $('#system').val('');
                    stype.set(0);
                    $('#description').val('');
                    $('.png').html('');
                    $('#icon').val('');
                    $('#logo').val('');
                    $('#status').val('');
                    loadDiv('#load'); // loading start

                    $.post('EditSystem', {id: id}, function (res) {
                        var data = JSON.parse(res);

                        console.log(data);
                        var ar = data.list;
                        for (var i = 0; i < ar.length; i++) {
                            let jo = ar[i];

//                                    $('#demo,#add').hide();
                            $('#doc').modal('show');


                            $('#system').val(jo.sname);
                            $('#description').val(jo.description);
                            status.set(jo.status);

                            if (jo.icon) {
                                $('#icon').hide();
                                $('#icon').after('<div class="png"><a target="_blank" href="LoadImage?systemicon=' + jo.icon + '">Click Here to View   </a> <i class="fa fa-close dlticon" aria-hidden="true"></i></div>');
                            }
                            if (jo.logo) {
                                $('#logo').hide();
                                $('#logo').after('<div class="png"><a target="_blank" href="LoadImage?systemlogo=' + jo.logo + '">Click Here to View   </a> <i class="fa fa-close dltlogo" aria-hidden="true"></i></div>');
                            }
                            stype.set(jo.systemtype);
                        }

                        finishLoadDiv('#load');// loading end
                    });

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
                            return fetch('SaveSystem', {
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

                            Swal.fire('Saved!', '', 'success')

                            $('#system').val('');
                            $('#description').val('');
                            $('#icon').val('');
                            $('#logo').val('');
                            stype.set(0);
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
                            return fetch('UpdateSystem', {
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

                            location.href = "addsystems";

                            //                                        $('#system').val('');
                            //                                        $('#description').val('');
                            //                                        $('#icon').val('');
                            //                                        $('#logo').val('');
                            //                                        $('#systemtype').val('');
                            //                                        $('#status').val('');
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
                // var dp1 = $('#all').val();
                $(document).on('click', '.dlticon', function () {
                    $(this).parent().parent().find('input').show();
                    $(this).parent().remove();
                });
                $(document).on('click', '.dltlogo', '.dlticon', function () {
                    $(this).parent().parent().find('input').show();
                    $(this).parent().remove();
                });



                $(document).on('click', '#home', function () {

                    loadDiv('#load'); // loading start
                    location.href = "addsystems";
                    finishLoadDiv('#load');// loading end
                });

                function validateData() {
                    if ($("#system").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please enter a value for System!',
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
                    if ($("#icon").prop('files').length === 0) {
                        Swal.fire({
                            icon: 'warning',
                            title: 'File Required !',
                            text: 'Please enter System icon!',
                        });
                        return false;
                    }
                    if ($("#logo").prop('files').length === 0) {
                        Swal.fire({
                            icon: 'warning',
                            title: 'File Required !',
                            text: 'Please enter System logo!',
                        });
                        return false;
                    }
                    if ($("#systemtype").val().trim() === '') {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Field Required !',
                            text: 'Please select System Type!',
                        });
                        return false;
                    }

                    return true;
                }
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
            
            
            
//            
//            
//
//            .card .card-content {
//                margin: 20px 0;
//                max-width: 85%;
//            }
//
//            .card .card-link-wrapper {
//                margin-top: auto;
//            }
//
//            .card .card-link {
//                display: inline-block;
//                text-decoration: none;
//                color: white;
//                background: var(--red);
//                padding: 6px 12px;
//                border-radius: 8px;
//                transition: background 0.2s;
//            }
//
//            .card:hover .card-link {
//                background: var(--darkred);
//            }



            
            
            
//            var temp = ' <ul class="cards" idd="' + nav.id + '">'
//                            + ' <li class="card list">'
//                            + '<div>'
//                            + '  <h3 class="card-title"></h3>'
//                            + ' <img class="card list" src=LoadImage?systemicon=' + nav.icon + ' style="width:40px;margin:15px 20px 0px"/>'
//                            + '<div class="card-content">'
//                            + '<p>' + nav.discription + '</p>'
//                            + ' </div>'
//                            + '</div>'
//                            + '<div class="card-link-wrapper ">'
//                            + '  <a href="" class="card-link">' + nav.sname + '</a>'
//                            + '</div>'
//                            + ' </li>'
//                            + '</ul>';

        </script>

    </body>

</html>