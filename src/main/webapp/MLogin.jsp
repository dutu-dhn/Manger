<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
  <meta charset="UTF-8">
  <title>后台登录</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/MLogin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="login">
	<h1>欢迎登录</h1>
    <form action="MLogin" method="post">
    	<input type="text" name="uname" placeholder="Username" required="required" />
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">登录</button>
    </form>
</div>
<!-- partial -->
  <script  src=""></script>

</body>
</html>
