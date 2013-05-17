<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<style type="text/css">
body {
	margin: auto;
	background-color: #fff;
}

#div {
	margin: 0 auto;
	width: 700px;
	height: 100px;
}

#div1 {
	margin: 0 auto;
	width: 700px;
	height: auto;
}

.p1 {
	text-align: center;
	font-family: "微软雅黑";
	font-size: 20px;
}

hr {
	border: 1px dotted #dddddd;
}

.p2 {
	text-align: center;
	font-family: "微软雅黑";
	font-size: 15px;
}

</style>
</head>
<body>
	<div id="div">
		<p class="p1"><!-- 我院参赛队荣获第三届“蓝桥杯”全国软件大赛第一名 -->${article.title }</p>
		<hr>
		<p class="p2">
			浏览：${article.times}次 &nbsp;&nbsp;时间：${article.createTime}  &nbsp;&nbsp;字体：【小 中 大】 <a href="#">【打印】</a><a
				href="#">【关闭】</a>
		</p>
	</div>
	<div id="div1">
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			${article.content }
		</p>
	</div>
</body>
</html>