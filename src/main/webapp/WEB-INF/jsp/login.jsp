<%-- 
    Document   : login
    Created on : Sep 21, 2022, 4:58:03 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <title>User Portal | Login</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link href="images/fin.png" rel="icon">
        <link href="images/apple-touch-icon.png" rel="apple-touch-icon">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="./files/bower_components/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./files/assets/pages/waves/css/waves.min.css" type="text/css" media="all"> 
        <link rel="stylesheet" type="text/css" href="./files/assets/icon/feather/css/feather.css">
        <link rel="stylesheet" type="text/css" href="./files/assets/icon/themify-icons/themify-icons.css">
        <link rel="stylesheet" type="text/css" href="./files/assets/icon/icofont/css/icofont.css">
        <link rel="stylesheet" type="text/css" href="./files/assets/icon/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="./files/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="./files/assets/css/pages.css">
    </head>
    <body themebg-pattern ="theme1">

        <div class="theme-loader">
            <div class="loader-track">
                <div class="preloader-wrapper">
                    <div class="spinner-layer spinner-blue">
                        <div class="circle-clipper left">
                            <div class="circle"></div>
                        </div>
                        <div class="gap-patch">
                            <div class="circle"></div>
                        </div>
                        <div class="circle-clipper right">
                            <div class="circle"></div>
                        </div>
                    </div>
                    <div class="spinner-layer spinner-red">
                        <div class="circle-clipper left">
                            <div class="circle"></div>
                        </div>
                        <div class="gap-patch">
                            <div class="circle"></div>
                        </div>
                        <div class="circle-clipper right">
                            <div class="circle"></div>
                        </div>
                    </div>
                    <div class="spinner-layer spinner-yellow">
                        <div class="circle-clipper left">
                            <div class="circle"></div>
                        </div>
                        <div class="gap-patch">
                            <div class="circle"></div>
                        </div>
                        <div class="circle-clipper right">
                            <div class="circle"></div>
                        </div>
                    </div>
                    <div class="spinner-layer spinner-green">
                        <div class="circle-clipper left">
                            <div class="circle"></div>
                        </div>
                        <div class="gap-patch">
                            <div class="circle"></div>
                        </div>
                        <div class="circle-clipper right">
                            <div class="circle"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="login-block" >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">

                        <form class="md-float-material form-material">
                            <div class="text-center">
                                <img src="./images/login.png" width="350" alt="logo.png">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">

                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center txt-primary">Sign In</h3>
                                        </div>
                                    </div>

                                    <!--                                    <h3 class="text-center text-danger">**UAT**</h3>-->

                                    <p class="text-muted text-center p-b-5">Sign in with your AD account</p>
                                    <div id="altarea"></div>
                                    <div class="form-group form-primary">
                                        <input type="text" id="username" name="username" class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Username</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" id="password" name="password" class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Password</label>
                                    </div>

                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="button" id="loginbtn" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </section>
        <script  src="./files/bower_components/jquery/js/jquery.min.js"></script>
        <script  src="./files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
        <script  src="./files/bower_components/popper.js/js/popper.min.js"></script>
        <script  src="./files/bower_components/bootstrap/js/bootstrap.min.js"></script>
        <script src="./files/assets/js/waves.min.js" ></script>
        <script  src="./files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>
        <script  src="./files/bower_components/modernizr/js/modernizr.js"></script>
        <script  src="./files/bower_components/modernizr/js/css-scrollbars.js"></script>
        <script  src="./files/assets/js/common-pages.js"></script>
        <script  src="./files/assets/js/script.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>

    <script>
        document.getElementById('loginbtn').addEventListener('click', function (evt) {
            evt.preventDefault();

            fetch('login', {
                method: 'POST',
                body: new URLSearchParams({
                    username: document.getElementById('username').value,
                    password: document.getElementById('password').value
                })
            }).then((resp) => resp.text()).then((txt) => {
                if (txt === 'ok') {

                    window.location.href = "index";

                } else if (txt === 'no') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Try Again...',
                        text: 'Invalid Username or Password !',
                        footer: '<a href="">Try Again</a>'
                    })
                }

            });


        });


        $('#password').on('keypress', function (e) {

            if (e.which === 13) {
                $('#loginbtn').click();
            }
        });

    </script>

</body>

</html>