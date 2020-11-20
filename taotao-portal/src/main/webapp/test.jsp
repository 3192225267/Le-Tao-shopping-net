<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/6
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="utf-8">
    <title>JSONP 实例</title>
    <script src="https://cdn.static.runoob.com/libs/jquery/1.8.3/jquery.js"></script>
</head>
<body>
<div id="tt"></div>
<script type="text/javascript">
    function d(result)
    {

        var date = result.data;
        for(var i = 0; i < date.length; i++)
        {
            $("#tt").append(date[i].n);
        }

    }
</script>
<script type="text/javascript" src="http://localhost:8081/rest/itemcat/list?callback=d"></script>

</body>



</html>
