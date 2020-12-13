<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .box {
            display: flex;
            width: 100%;
            align-items: center;
        }
       
        .box .yimg {
            width: 1200px;
            height: 600px;
            background-color: blue;
            margin: 0 auto;
        }
        .box .yimg {
            display: flex;
            flex-wrap: wrap;
        }
        .box .yimg .zimg {
            width: 400px;
            height: 300px;
            background-color: red;
        }
        .box .yimg .zimg >img {
            width: 400px;
            height: 300px;
        }
    </style>
</head>
<body>
    <div class="box">
        <div class="zdao"></div>
        <div class="yimg">
            <div class="zimg">
                <img src="static/img/s.jpg" alt="">
            </div>
            <div class="zimg">
                <img src="static/img/sh.jpg" alt="">
            </div>
            <div class="zimg">
                <img src="static/img/shi.jpg" alt="">
            </div>
            <div class="zimg">
                <img src="static/img/shio.jpg" alt="">
            </div>
            <div class="zimg">
                <img src="static/img/shoy.jpg" alt="">
            </div>
            <div class="zimg">
                <img src="static/img/shioo.jpg" alt="">
            </div>
        </div>
    </div>
    <script>
    </script>
</body>
</html>