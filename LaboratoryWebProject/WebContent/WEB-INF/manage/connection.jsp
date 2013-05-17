<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.wordlimitor-1.0.1.js"></script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.mTable{
		width: 500px;
		margin-top: 20px;
		margin-left: 120px;
	}
	.mTable td{
		padding: 0px;
	}
</style>
</head>
<body>
	<form action="manageConnectionAction_update" method="post">
	<table class="table table-striped table-bordered mTable">
		<c:forEach var="aboutUs" items="${aboutUslist }" varStatus="status">
			
		<tr><td>版权所有：</td><td><input type="text" name="copyright" value="${aboutUs.copyRight }" max="100"></td></tr>
		<tr><td>地址：</td><td><input type="text" name="address" value="${aboutUs.address }" max="100"></td></tr>
		<tr><td>邮编：</td><td><input type="text" name="zipcode" value="${aboutUs.postCode }" max="20"></td></tr>
		<tr><td>联系电话：</td><td><input type="text" name="telephone" value="${aboutUs.phoneNuber }" max="20"></td></tr>
		<tr><td>传真：</td><td><input type="text" name="fax" value="${aboutUs.fax }" max="20"></td></tr>
		<tr><td>邮箱地址：</td><td><input type="text" name="email" value="${aboutUs.mailBox }" max="50"></td></tr>
		<tr><td>网址：</td><td><input type="text" name="website" value="${aboutUs.webSite }" max="50"></td></tr>
		<tr><td>IPC备案：</td><td><input type="text" name="ipcrecord" value="${aboutUs.icpRecode }" max="50"></td></tr>
		<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认修改" class="btn mBtn"> <input type="reset" value="重新输入" class="btn"></td></tr>
		</c:forEach>
	</table>
	
	</form>
	
</body>
</html>