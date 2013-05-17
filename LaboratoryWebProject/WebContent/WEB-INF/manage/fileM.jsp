<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		var type = $("#selectType");
		
		type.change(function(){
			var uploadType = type.val();
			var listSrc = "";
				listSrc = "manageFileAction_getFiles?id=&title=&fileName=&uploaderId=&uploaderName=&uploaderRole="+uploadType+"&downloaderRole=&time=&checks=&size=&type=&fileUrl=&downloads=";
				//	alert(listSrc);
					$("#content").attr("src",listSrc);
		});
	});
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		height: auto !important;
		min-height: 600px;
		height: 600px;
	}
	#choose{
		margin-top: 20px;
		margin-left: 200px;
	}
	#choose select{
		margin-top: 10px;
	}
	.mTable{
		width: 700px;
		margin-left: 25px;
		margin-top: 20px;
		float: left;
	}
	.mTable td{
		padding: 0px;
		text-align:center;
	}
	.mTable th{
		padding: 0px;
		text-align:center;
	}
	.mBtn{
		margin-left: 50x;
		margin-right: 100px;
	}
	.headImg{
		width: 102px;
		height: 102px;
		border: 2px solid #CCCCCC;
		float: left;
		margin-top: 20px;
		margin-left: 20px;
	}
	#content{
		width: 750px;
		height:auto !important;
		min-height:600px;
		height:600px;
		margin-left:0px;
		border: 0px;
		background: #FFF;
		float: left;
	}
</style>
</head>
<body>
	<div id="choose">
		<span>请选择管理类型：</span>
		<select id="selectType">
			<!-- <option value="10">查看全部</option> -->
			<option value="16">管理员</option>
			<option value="8">教师</option>
			<option value="4">学生</option>
			<option value="2">注册人员</option>
		</select>
	</div>
	<iframe id="content" src="manageFileAction_getFiles?id=&title=&fileName=&uploaderId=&uploaderName=&uploaderRole=16&downloaderRole=&time=&checks=&size=&type=&fileUrl=&downloads="></iframe>
</body>
</html>