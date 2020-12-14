<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<!-- <html> -->
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
<!-- 侧边栏css -->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/style.css"/>

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>主页</title>

</head>
<body  style="padding-top: 55px;" οnlοad="getNowDate()">

<!-- 员工添加的模态框 -->
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加用户</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-9">
		      	<input type="text" name="uname" class="form-control" id="user_add_input_uname" placeholder="用户名">
		        <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-9">
		      <input type="text" name="password" class="form-control" id="user_add_input_password" placeholder="密码">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">手机号</label>
		    <div class="col-sm-9">
		      <input type="text" name="tel" class="form-control" id="user_add_input_tel" placeholder="手机号">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">邮箱</label>
		    <div class="col-sm-9">
		      <input type="text" name="email" class="form-control" id="user_add_input_email" placeholder="邮箱">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>


<!-- 导航条 -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
		<img style="width: 30px;height: 30px" alt="阴阳" src="static/img/logo.png" class="img-circle">
	  </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<!-- 时间 -->
        <li ><a href="#"  style="pointer-events: none;"><font id="timenow"></font> </a></li>
        <!-- 刷新 -->
        <li><a  href="#"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></a></li>
      </ul>
      <!-- 搜索 -->
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
        
      </form>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
      	<!-- 管理员 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  ${user.uname} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" id="myinfo" onclick="myinfoclick()" >我的资料</a></li>
            <li><a href="${APP_PATH }/exit">切换账号</a></li>
            <li><a href="#">设置</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${APP_PATH }/exit">退出登录</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- 导航条下方 -->
<div class="container-fluid">
	<div class="row ">
		<!-- 侧方导航 -->
	 <div class="col-lg-2 col-md-3 col-sm-3 col-xs-3 clearfix " >
		<div class='wrapper'>
		  <ul class='items'>
		    <li>
		      <a href='#' id="" onclick="homeclick()">主页</a>
		    </li>
		    <li>
		      <a href='#' >用户管理</a>
		      <ul class='sub-items'>
		        <li>
		          <a href='#' id="usershowa" onclick="usershowaclick()">用户显示</a>
		        </li>
		        <li>
		          <a  href='#' id="user_add_modal_btn" >用户添加</a>
		        </li>
		      </ul>
		    </li>
		    <li>
		      <a href='#'>图片管理</a>
		      <ul class='sub-items'>
		        <li>
		          <a href='#' id="" onclick="imgclick()">图片信息</a>
		        </li>
		      </ul>
		    </li>
		    <li>
		      <a href='#'>发送邮件</a>
		      <ul class='sub-items'>
		        <li>
		          <a href='#'id="email" onclick="emailclick()">选择用户</a>
		        </li>
		        <li>
		          <a href='#'>发送信息</a>
		        </li>
		      </ul>
		    </li>
		  </ul>
		</div>
	 </div>
	 <!-- 显示 -->
	<div id="show" class=" col-lg-10 col-md-9  col-sm-9 col-xs-9">
	
	<%-- <iframe id="iframe1" frameborder='0' scrolling='auto' src="${APP_PATH }/usershow" width="100%" height="600px"></iframe> --%>
		<div id="usershowdiv" style="display:none;">
			<iframe id="iframe1" frameborder='0' scrolling='auto' src="${APP_PATH }/usershow" width="100%" height="600px"></iframe>
		</div>
		 <div id="homeshow" style="display:;">
			<iframe id="iframe1" frameborder='0' scrolling='auto' src="${APP_PATH }/home.jsp" width="100%" height="650px"></iframe>
		</div>
		 <div id="imgshow" style="display:none;">
			<iframe id="iframe1" frameborder='0' scrolling='auto' src="${APP_PATH }/img.jsp" width="100%" height="600px"></iframe>
		</div>
		<div id="infoshow" style="display:none;">
			<iframe id="iframe1" frameborder='0' scrolling='auto' src="${APP_PATH }/myinfo.jsp" width="100%" height="600px"></iframe>
		</div>
	</div>
	  
 </div>
</div>
<!-- 侧边栏 -->
<script type="text/javascript" src="${APP_PATH }/static/js/script.js"></script>
<!-- 用户显示 -->
<script type="text/javascript" src="${APP_PATH }/static/js/usershow.js"></script> 

<!-- 实时时间 -->
<script type="text/javascript">
function usershowaclick() {
	/* $("#homeshow").toggle();
	$("#usershowdiv").toggle(); */
	$("#imgshow").css("display","none");
	$("#infoshow").css("display","none");
	$("#homeshow").css("display","none");
	$("#usershowdiv").css("display","");
}
function homeclick() {
	/* $("#homeshow").toggle();
	$("#usershowdiv").toggle(); */
	$("#homeshow").css("display","");
	$("#infoshow").css("display","none");
	$("#usershowdiv").css("display","none");
	$("#imgshow").css("display","none");
}
function imgclick() {
	/* $("#homeshow").toggle();
	$("#usershowdiv").toggle(); */
	$("#homeshow").css("display","none");
	$("#infoshow").css("display","none");
	$("#usershowdiv").css("display","none");
	$("#imgshow").css("display","");
}
function myinfoclick() {
	/* $("#homeshow").toggle();
	$("#usershowdiv").toggle(); */
	$("#homeshow").css("display","none");
	$("#infoshow").css("display","");
	$("#usershowdiv").css("display","none");
	$("#imgshow").css("display","none");
}

	setInterval("timenow.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script> 

</body>
</html>