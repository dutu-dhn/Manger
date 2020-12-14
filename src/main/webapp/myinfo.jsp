<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/12/14
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <%-- <script type="text/javascript"src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script> --%>
    <script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>个人信息</title>
</head>
<body>

<div class="panel   panel-default" >
    <div class="panel-heading">个人信息</div>
    <div class="panel-body">
        <label>用户名:</label>${user.uname}
        <br> <br>
        <label>邮箱:</label>${user.email}
        <br> <br>
        <label>手机号:</label>${user.tel}
        <br> <br>
        <label>上次登录时间:</label>${user.logintime}
        <br> <br>
        <label>注册时间:</label>${user.regtime}
    </div>
</div>
</body>
</html>
