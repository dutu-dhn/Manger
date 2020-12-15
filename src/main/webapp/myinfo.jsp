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

    <title>个人信息</title>
</head>
<body>
<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-9">
                            <input type="text" name="uname" class="form-control" id="user_update_input_uname" placeholder="用户名" value="${user.uname}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="text" name="password" class="form-control" id="user_update_input_password" placeholder="密码" value="${user.password}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-9">
                            <input type="text" name="tel" class="form-control" id="user_update_input_tel" placeholder="手机号" value="${user.tel}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-9">
                            <input type="text" name="email" class="form-control" id="user_update_input_email" placeholder="邮箱" value="${user.email}">
                            <span class="help-block"></span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="location.reload();" class="btn btn-primary" id="user_update_btn"  edit-id="${user.id}">更新</button>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row ">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class=" panel  panel-default">
                <div class="panel-heading" style="text-align: center;">个人信息</div>
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
                    <br>
                    <button type="button"   class="btn btn-info " data-toggle="modal" data-target="#userUpdateModal">更改</button>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<script type="text/javascript" src="${APP_PATH }/static/js/usershow.js"></script>
</body>
</html>
<%--更改后,再次查询把登录user重新给sessionn--%>