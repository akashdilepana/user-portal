<%-- 
    Document   : usertype
    Created on : Dec 16, 2022, 2:04:08 PM
    Author     : Akash
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

    <%
        if (session.getAttribute("utype") == null || !session.getAttribute("utype").equals("1")) {
            response.sendRedirect("index");
            return;
        }

    %>

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>User Portal | System Pages</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <%@include file="csslinks.jsp"%>
        <%@include file="style.jsp"%>
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />-->

        <style> 
            .pagination {
                --bs-pagination-font-size: 0.8rem;
            }
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

            .text{
                margin-left:  10px;
                padding: 5px 0px; 
                display: inline-block; 
                box-sizing: border-box;
                font-weight: bold;
            }

            .namet,.unamet,.utypet{
                margin-left:  10px;
                font-weight: bold;
                color: #204c95;
            }

            .utype { 
                margin-left:  0px;
                width:99%; 
                padding: 5px 10px; 
                display: inline-block; 
                box-sizing: border-box; 
            }

            button:hover { 
                opacity: 0.7; 
            } 

            #demo { 
                margin-bottom: 50px;
                margin-top: 20px;
                margin-left: 150px;
                margin-right: 150px;
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


            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                color: #204c95;
                font-size: 14px;
            }
            .font{
                font-family: Arial, Helvetica, sans-serif;             
                font-size: 13px;
                padding: 25px;
            }

            p {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
                margin-left: 30px;
                color: #204c95;
            }
            .card1 {        
                margin: 0px;
                padding-left: 0px; 
                background-color: #ffffff;
                width: 35%;
                border-right: 2px solid #f1f1f1;
            }

            .card2 { 

                margin: 0px;
                padding-left: 15px; 
                background-color: #ffffff;
                width: 65%;
                border-radius: 5px;
            }
            #system{
                margin-top: 10px;
            }   

            .close{
                margin-bottom: 10px;
            }
            .exit { 
                border: none; 
                color: #ed3538;
            }
            .h1, h1 {
                font-size: 1.6rem;
            }
            .modal-lg, .modal-xl {
                --bs-modal-width: 850px;
            }
            .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
                background-color: #ECF5FF !important;
                /*background-color: whitesmoke !important;*/
            }

            .form-check {
                display: flex;
            }

        </style>
        <!--        <style>
                    ul, #list1,#list2,#list3 {
                        list-style-type: none;
                    }
        
                    #list1,#list21,#list3 {
                        margin: 0;
                        padding: 0;
                    }
        
                    .box {
                        cursor: pointer;
                        -webkit-user-select: none; /* Safari 3.1+ */
                        -moz-user-select: none; /* Firefox 2+ */
                        -ms-user-select: none; /* IE 10+ */
                        user-select: none;
                    }
        
                    .box::before {
                        content: "\2610";
                        color: black;
                        display: inline-block;
                        margin-right: 6px;
                    }
        
                    .check-box::before {
                        content: "\2611"; 
                        color: dodgerblue;
                    }
        
                    .nested {
                        display: none;
                    }
        
                    .active {
                        display: block;
                    }
                </style>-->
    </head>

    <body>

        <%@include file="menubar.jsp"%>

        <div id="demo" class="card">
            <h5 class="card-title">User Types <span class="breadcrumb-item active">| Page Access</span>
                <a onclick= "window.location.href = ('index')">
                    <i class="feather icon-x cls-card exit pull-right" style=" cursor: pointer;"></i>
                </a></h5>
            <div class="card-header">

                <table class="table table-bordered table-hover" id="tbl">

                    <thead>
                        <tr>
                            <th>id</th>
                            <th>User Type</th>        
                            <th>Create by</th>  
                            <th>Create on</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>

            <br><br>
            <div class="card-body">
                <div class="row">
                    <div class="col-2 offset-10">
                        <button class="btn btn-sm btn-danger pull-right " type="button" id="spage" style="float: right;">+Add</button>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="doc" tabindex="-1" style="display:none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title h1">Create User Type</p>
                        <p class="modal-title h2">Edit User Type</p>
                        <button type="button" class="btn-close home" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body center">

                        <form id="form" class="row g-3 container">

                            <br>

                            <div class="container">
                                <div class="row">
                                    <div class="card1">
                                        <div class="col-lg-8" >
                                            <div class="text namet">Name</div>
                                            <input type="text" name="type_name" class="form-control utypen" id="type_name" required style="margin-left:10px;  width:145%; border-radius: 4px;">

                                            <div class="invalid-feedback">Please enter Name</div>
                                        </div>

                                        <br>
                                        <div class="col-lg-12" id="status">
                                            <div class="text utypet">Status*</div>

                                            <select class="utype "  id="utype" name="utype">
                                                <option value="active">Active</option>
                                                <option value="deactive">Deactive</option> 

                                            </select>
                                        </div>
                                    </div>

                                    <br><br>
                                    <div class="card2" >

                                        <div class="row" style="margin-left :10px">
                                            <div class="col-lg-4">
                                                <div class="text namet">Information Systems*</div>
                                                <div class="activity-content" style="font-size: 12px; margin-top: 10px" >
                                                    <!--<div id="list1" ></div>-->
                                                    <ul id="list1" ></ul>
                                                </div>

                                            </div>
                                            <div class="col-lg-4">
                                                <div class="text namet">Others*</div>
                                                <div class="activity-content" style="font-size: 12px; margin-top: 30px" >
                                                    <ul id="list2" ></ul>
                                                    <!--<div id="list3" ></div>-->
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="text namet">Privacy Policy*</div>
                                                <div class="activity-content" style="font-size: 12px;margin-top: 30px" >
                                                    <ul id="list3" > </ul>
                                                    <!--                                                    <div id="list3" ></div>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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

        <script src="assets/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/jstree.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>   
        <script src="files/assets/js/func.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="files/assets/js/slimselect.js"></script>

        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>-->

        <script>
                    let status = new SlimSelect({

                        select: '#utype'
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
                            "url": 'LoadUserType',
                            "contentType": "application/json",
                            "type": "POST",
                            "data": function (d) {

                                return JSON.stringify(d);
                                console.log(data);
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

                            $(row).find('td').addClass('font');
                            $(row).find('td').eq(1).addClass('text-center');
                            var tr1 = $(row).find('td').eq(3).html();

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
                            {"data": "end by"},
                            {"data": "end date"},
                            {"data": "Status"},
                        ]

                    });
                    document.getElementById('save').addEventListener('click', function (evt) {
                        evt.preventDefault();

                        let data = new FormData();

                        let access = [];
                        $('#list1,#list2,#list3').find('li').each(function () {
                            let chk = $(this).find('input').first();
                            if ($(chk).is(':checked')) {
                                access.push($(chk).val());
                            }
                        });

                        data.append('access', JSON.stringify(access));
                        data.append('type_name', $('#type_name').val());
                        data.append('utype', $('#utype').val());

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
                                return fetch('savePages', {
                                    method: 'POST',
                                    body: data
                                            //                                         body: new URLSearchParams({inputUsertype: $('#inputUsertype').val(), access: JSON.stringify(access)})
                                });
                            },
                        }).then(response => {
                            return response.value.text();
                        }).then((txt) => {
                            let resp = JSON.parse(txt);

                            if (resp.status === 'ok') {

                                Swal.fire('Saved!', '', 'success');
                                location.href = "userType";

                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error...',
                                    text: resp.msg,
                                    footer: '<a href="">Why do I have this issue?</a>'

                                });
                            }
                        });
                    }
                    );
                    document.getElementById('update').addEventListener('click', function (evt) {
                        evt.preventDefault();

                        let data = new FormData();

                        let access = [];
                        $('#list1,#list2,#list3').find('li').each(function () {
                            let chk = $(this).find('input').first();
                            if ($(chk).is(':checked')) {
                                access.push($(chk).val());
                            }
                        });

                        data.append('access', JSON.stringify(access));
                        data.append('type_name', $('#type_name').val());
                        data.append('utype', $('#utype').val());


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
                                return fetch('updatePages', {
                                    method: 'POST',
                                    body: data
                                });
                            }
                        }).then(response => {
                            return response.value.text();
                        }).then((txt) => {
                            let resp = JSON.parse(txt);

                            if (resp.status === 'ok') {

                                Swal.fire('Updated!', '', 'success')

                                location.href = "userType";

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

                    $(document).on('click', '#spage', function () {

                        $('#list1').find('input[type="checkbox"]').removeAttr('checked');
                        $('#list2').find('input[type="checkbox"]').removeAttr('checked');
                        $('#list3').find('input[type="checkbox"]').removeAttr('checked');

                        $('#type_name').val('');
                        status.set(0);

                        $('#update,#status,.h2').hide();
                        $('#doc').modal('show');
                        $('#save,.h1').show();

                    });

                    let updateId = '';
                    $(document).on('click', '.edit', function () {

                        let id = $(this).parent().data('id');
                        updateId = id;
                        list(id);
                        $('#save,#status,.h1').hide();
                        $('#doc').modal('show');
                        $('#update,#status,.h2').show();


                        $.post('EditUserType', {id: id}, function (res) {
                            var jo = JSON.parse(res);
                            $('#type_name').val(jo.name);

                            status.set(jo.status);
                        });
                    });

                    $(document).on('click', '#home', function () {

                        location.href = "userType";
                    });
                    function validateData() {
                        if ($("#tname").val().trim() === '') {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Field Required !',
                                text: 'Please enter Name!',
                            });
                            return false;
                        }
                    }

                    list();
                    function list(utype) {
                        $('#list1').html('');
                        $('#list2').html('');
                        $('#list3').html('');
                        $.get('UserTypeList', {utype: utype}, function (resp) {
                            var navs = JSON.parse(resp);
                            for (var i = 0; i < navs.length; i++) {
                                let nav = navs[i];
                                let pcod = "";
                                var temp = '<li>'
                                        + ' <label>'
                                        + ' <div class="form-check form-switch"><input type="checkbox" ' + (nav.access === 'YES' ? 'checked' : '') + ' name="item1" class="form-check-input" value="' + nav.id + '">' + "  " + '' + nav.sname + '</div>'
                                        + '</label>'
                                        + '</li>'


//                                var temp = ' <ul>'
//                                        + ' <li id="' + nav.id + '">' + "  " + '' + nav.sname + '</li>'
//                                        + '</ul>'
//                                        + ' </li>'
//                                        + ' </ul>';

                                if (nav.stype === '1') {

                                    $('#list1').append(temp);
                                } else if (nav.stype === '2') {

                                    $('#list2').append(temp);
                                } else {
                                    $('#list3').append(temp);
                                }
                            }
                        });
                    }
//                    


//                    $(function () {
//                        $.ajax({
//                            async: true,
//                            type: "GET",
//                            url: "UserTypeList",
//                            dataType: "json",
//                            success: function (json) {
//                                createJSTree(json);
//                            },
//
//                            error: function (xhr, ajaxOptions, thrownError) {
//                                alert(xhr.status);
//                                alert(thrownError);
//                            }
//                        });
//                    });
//
//                    function createJSTree(jsondata) {
//                        $('#list1').jstree({
//                            'core': {
//                                'plugin': ["checkbox"],
//                                'data': jsondata
//
//                            }
//                        });
//                        console.log(jsondata);
//                    }


//                        var toggler = document.getElementsByClassName("box");
//                        var i;
//
//                        for (i = 0; i < toggler.length; i++) {
//                            toggler[i].addEventListener("click", function () {
//                                this.parentElement.querySelector(".nested").classList.toggle("active");
//                                this.classList.toggle("check-box");
//                            });
//                        }
                    //                $(document).on('click', 'list', function () {
                    //
                    //                    var t = $(this).html();
                    //
                    //                });
                    //
                    //                $('#list1').find('input').each(function () {
                    //                    var t = $(this).val();
                    //                    if (t.checked) {
                    //                        $(this).attr('checked', true);
                    //                    } else {
                    //                        $(this).attr('checked', false);
                    //                    }
                    //                    console.log(t);
                    //                });
                    //                $('#list2').find('input').each(function () {
                    //                    var tt = $(this).val();
                    //                    if (tt.checked) {
                    //                        $(this).attr('checked', true);
                    //                    } else {
                    //                        $(this).attr('checked', false);
                    //                    }
                    //                    console.log(tt);
                    //                });


        </script><!-- comment -->
    </body>

</html>
