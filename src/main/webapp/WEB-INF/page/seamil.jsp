<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>yjian</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="./chat.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/yjian.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" 
    	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
        crossorigin="anonymous">
</head>

<script>
    document.getElementsByTagName('body').height=window.innerHeight;
</script>
<body class="box">
   
    <div class="container">
        <div class="chatbox">
            <div class="chatleft">
                <div class="top">
                    <i class="fas fa-bars" style="font-size: 1.4em"></i>
                    <input type="text" placeholder="search" style="width: 140px; height: 36px; margin-left: 25px;">
                    <button class="searchbtn"></style><i class="fas fa-search"></i></button>
                </div>
                <div class="center">
                    <ul>
                        <li>
                            <img style="border-radius: 20px; vertical-align: middle;" src="http://placehold.it/40x40">
                            <span style="margin-left: 10px;">获取用户</span>
                        </li>
                        
                    </ul>
                </div>
            </div>
            <div class="chatright">
                <div class="top">
                    <img style="border-radius: 20px; vertical-align: middle;" src="http://placehold.it/40x40" >
                    <span style="margin-left: 20px;" >用户</span>
                    <i class="fas fa-ellipsis-v" style="font-size: 1.4em; position: absolute; right: 20px; color: gray;"></i>
                </div>
               
                <div class="footer">
                    <textarea maxlength="800" rows="5" cols="40" style="width: 100%; resize: none; border: none; " placeholder="请在此输入要发送的内容..."></textarea>
                    <button class="sendbtn">发送</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>