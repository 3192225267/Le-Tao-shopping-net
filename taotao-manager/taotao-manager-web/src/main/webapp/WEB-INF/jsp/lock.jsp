<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/10
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<base href="<%=basePath%>>">
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
        Lock Screen
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
<body class="lock-screen" onload="startTime()">
<!-- LOCK SCREEN WRAPPER-->
<div class="lock-wrapper">
    <div id="time">
    </div>

    <div class="lock-box text-center">
        <div style="margin-left: 50px;margin-bottom: 50px;">
        <img src="http://192.168.11.144/ftpuser/2020/01/11/123123.jpg" width="130px" height="120px" alt="lock avatar">
        </div>
        <h1>
            输入密码来解锁
        </h1>
        <span class="locked">
          已锁定
        </span>
        <form role="form" class="form-inline" action="Unlock" method="post">
            <div class="form-group col-lg-12">
                <input type="password" name="password" placeholder="输入密码" id="exampleInputPassword2" class="form-control lock-input">
                <button class="btn btn-lock" type="submit">
                    <i class="fa fa-arrow-right">
                    </i>
                </button>
            </div>
        </form>
    </div>
</div>
<!-- LOCK SCREEN WRAPPER-->
<script>
    // TIMER FUNCTION
    function startTime()
    {
        var today=new Date();
        var h=today.getHours();
        var m=today.getMinutes();
        var s=today.getSeconds();
        // add a zero in front of numbers<10
        m=checkTime(m);
        s=checkTime(s);
        document.getElementById('time').innerHTML=h+":"+m+":"+s;
        t=setTimeout(function(){
                startTime()}
            ,500);
    }

    function checkTime(i)
    {
        if (i<10)
        {
            i="0" + i;
        }
        return i;
    }
</script>
</body>
</html>



