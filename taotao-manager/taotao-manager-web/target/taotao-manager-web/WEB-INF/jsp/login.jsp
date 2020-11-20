<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/9
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Custom Theme">
    <!-- END META -->

    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>
        Olive Admin - Flat & Responsive Bootstrap Admin Template
    </title>
    <!-- BEGIN STYLESHEET-->
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
    <link href="css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
    <link href="css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js">
    </script>
    <script src="js/respond.min.js">
    </script>
    <![endif]-->
    <!-- END STYLESHEET-->
</head>
<body class="login-screen">
<!-- BEGIN SECTION -->
<div class="container">
    <form class="form-signin" method="post" action="userlogin">
        <h2 class="form-signin-heading">
           请登录
        </h2>
        <!-- LOGIN WRAPPER  -->
        <div class="login-wrap">
            <input type="text" name="username" class="form-control" placeholder="用户名" autofocus required>
            <input type="password" name="userpwd" class="form-control" placeholder="密码" required>

            <button class="btn btn-lg btn-login btn-block" id="login" type="submit">
                登录
            </button>
            <p>
                <%--or you can sign in via social network--%>
            </p>
         <%--   <div class="login-social-link">
                <a href="index.html" class="facebook">
                    <i class="fa fa-facebook">
                    </i>
                    Facebook
                </a>
                <a href="index.html" class="twitter">
                    <i class="fa fa-twitter">
                    </i>
                    Twitter
                </a>
            </div>--%>
            <div class="registration">
                还没有账号?
                <a class="" href="registration.html">
                    点击申请
                </a>
            </div>
        </div>
        <!-- END LOGIN WRAPPER -->
        <!-- MODAL -->
        <div  id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            Forgot Password ?
                        </h4>
                    </div>
                    <div class="modal-body">
                        <p>
                            Enter your e-mail address below to reset your password.
                        </p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">
                            Cancel
                        </button>
                        <button class="btn btn-success" type="button">
                            Submit
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MODAL -->
    </form>
</div>
<!-- END SECTION -->
<!-- BEGIN JS -->
<script src="js/jquery.js" ></script><!-- BASIC JQUERY LIB. JS -->
<script src="js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->

<script type="text/javascript">
    $("#login").click(function(){
        var username = $("[name=username]").val();
        var password = $("[name=password]").val();

        if(username!="admin" || password!="admin"){
            $.messager.alert('错误',"用户名密码不正确！");
            return ;
        }
        window.location.href="/login";/*/rest/page/index*/
    });
</script>
<!-- END JS -->
</body>
</html>

