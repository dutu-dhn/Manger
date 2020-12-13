<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<%-- <script type="text/javascript"src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script> --%>
<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>测试</title>

</head>
<body>
<!-- 导航条下方 -->
<div class="container-fluid">
	<div class="row " style="visibility:hidden">
		<!-- 侧方导航 -->
	 <div class="col-lg-3  ">
		
	 </div>
	<div class=" col-lg-5 " id="add"><!-- omsubmit='return addUser()' -->
		 <form class="form-horizontal" method="post" action="${APP_PATH }/user"  >
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-9">
		      	<input type="text" name="uname" class="form-control" id="user_update_input_uname" placeholder="用户名">
		        <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-9">
		      <input type="text" name="password" class="form-control" id="user_update_input_password" placeholder="密码">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">手机号</label>
		    <div class="col-sm-9">
		      <input type="text" name="tel" class="form-control" id="user_update_input_tel" placeholder="手机号">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">邮箱</label>
		    <div class="col-sm-9">
		      <input type="text" name="email" class="form-control" id="user_update_input_email" placeholder="邮箱">
		      <span class="help-block"></span>
		    </div>
		  </div>
		 <!--  <button type="submit"  class="btn btn-success" id="user-save-btn">保存</button> -->
		   <button type="button"  class="btn btn-success" id="user-save-btn" onclick="addUser()" >保存</button>
		</form>
	</div>
	<div class=" col-lg-4 ">
	
	</div>
	  
 </div>
</div>
 <script type="text/javascript" src="${APP_PATH }/static/js/usershow.js"></script>  
</body>
</html>