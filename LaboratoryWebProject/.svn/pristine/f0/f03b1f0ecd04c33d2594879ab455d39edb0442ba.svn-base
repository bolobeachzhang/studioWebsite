<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.wordlimitor-1.0.1.js"></script>
<script type="text/javascript">
	function mselect(type){
		$("input[name='student.type'][value='"+type+"']").attr("checked",true);
	}
</script>

<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.mTable{
		width: 550px;
		margin-left: 25px;
		margin-top: 20px;
		float: left;
	}
	.mTable td{
		padding: 0px;
	}
	#picture{
		width: 102px;
		height: 102px;
		float: left;
		border: 2px solid #CCCCCC;
		margin-top: 20px;
		margin-left: 20px;
	}
	
</style>
</head>
<body>
	<c:if test="${requestScope.success != null}">
		<c:out value="${requestScope.success }" ></c:out>
	</c:if>
	<form action="managePersonAction_updateSDeal" method="post" enctype="multipart/form-data">
		<table id="student"  class="table table-striped table-bordered mTable">
			<tr><td>登陆ID：</td><td><input type="text" name="student.studentId" readonly="readonly" value="${student.studentId }"></td></tr> 
			<tr><td>姓名：</td><td><input type="text" name="student.name" value="${student.name }" max="15"></td></tr>
			<tr><td>邮件地址：</td><td><input type="text" name="student.email" value="${student.email }" max="30"></td></tr>
			<tr><td>个人头像：</td><td><input type="file" name="picture"></td></tr> 
			<tr><td>学习方向：</td><td><input type="text" name="student.studyDirection" value="${student.studyDirection }" max="40"></td></tr>
			<tr><td>类型：</td><td>
							<input type="radio" class="mradio" name="student.type" value="1" style="margin-left: 10px;margin-right: 3px;">普通学生
							<input type="radio" class="mradio" name="student.type" value="2" style="margin-left: 10px;margin-right: 3px;">三好学生
							<input type="radio" class="mradio" name="student.type" value="4" style="margin-left: 10px;margin-right: 3px;">研究生
							<c:out value='<script type="text/javascript"> mselect(${student.type });</script>' escapeXml="false"></c:out>
							</td></tr> 
			<tr><td>详细信息：</td><td><textarea name="student.introduction" max="500">${student.introduction }</textarea></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认修改" class="btn mBtn"></td></tr>
		</table>
	</form>
	<div id="picture"><img alt="" src="${student.imageUrl }"></div>
</body>
</html>