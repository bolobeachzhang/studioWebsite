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
	//选中性别
	function mselectSex(type){
		$("input[name='teacher.sex'][value='"+type+"']").attr("checked",true);
	}
	//选中研究方向
	function mselectResearch(research){
		$("select[name='teacher.research'] option[value='"+research+"']").attr("selected",true);
	}
	//选中职称
	function mselectTitle(title){
		$("select[name='teacher.title'] option[value='"+title+"']").attr("selected",true);
	}
	//选中教师岗位
	function mselectPost(post){
		$("select[name='teacher.post'] option[value='"+post+"']").attr("selected",true);
	}
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	/* 这个样式是 jquery.wordlimitor插件的样式*/
	.textlimit {
	   position:absolute;
	   font-size:9pt;
	   color:#4586b5;
	   font-size:16px;
	   font-weight:bold;
	   font-family:Arial;
	   display:none;
	}
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
		<c:out value="${requestScope.success }"></c:out>
	</c:if>
	<form action="managePersonAction_updateTDeal" method="post" enctype="multipart/form-data">
	<table id="teacher"  class="table table-striped table-bordered mTable" >
			<tr><td>登陆ID：</td><td><input type="text" name="teacher.teacherId" readonly="readonly" value="${teacher.teacherId }"></td></tr>
			<tr><td>姓名：</td><td><input type="text" name="teacher.name" value="${teacher.name }" max="15"></td></tr>
			<tr><td>邮件地址：</td><td><input type="text" name="teacher.email" value="${teacher.email }" max="40"></td></tr>
			<tr><td>联系电话：</td><td><input type="text" name="teacher.phoneNumber" value="${teacher.phoneNumber }" max="20"></td></tr>
			<tr><td>性别：</td><td>
								<input type="radio" name="teacher.sex" value="male" style="margin-left: 50px;margin-right: 3px;">男
								<input type="radio" name="teacher.sex" value="famale" style="margin-left: 20px;margin-right: 3px;">女
								<c:out value='<script type="text/javascript"> mselectSex("${teacher.sex }");</script>' escapeXml="false"></c:out>
							</td></tr>
			<tr><td>教师照片：</td><td><input type="file" name="picture"></td></tr>
			<tr><td>教师年龄：</td><td><input type="text" name="teacher.age" value="${teacher.age }" max="3"></td></tr>
			<tr><td>研究方向：</td><td>
								  	<select name="teacher.research">
								  		<option value="图形处理与模式识别">图形处理与模式识别</option>
								  		<option value="计算机网络与嵌入式">计算机网络与嵌入式</option>
								  		<option value="数据库与空间技术">数据库与空间技术</option>
								  	</select>
								  	<c:out value='<script type="text/javascript"> mselectResearch("${teacher.research }");</script>' escapeXml="false"></c:out>
								  	</td></tr>
			<tr><td>教师职称：</td><td>
									<select name="teacher.title">
										<option value="博士讲师">博士讲师</option>
										<option value="教授">教授</option>
										<option value="副教授">副教授</option>
										<option value="讲师">讲师</option>
										<option value="其他">其他</option>
									</select>
									<c:out value='<script type="text/javascript"> mselectTitle("${teacher.title }");</script>' escapeXml="false"></c:out>
									</td></tr>
			<tr><td>教师岗位：</td><td>
									<select name="teacher.post">
										<option value="教师">教师</option>
										<option value="组长">组长</option>
										<option value="办公室">办公室</option>
										<option value="主任">主任</option>
								  		<option value="学术带头人">学术带头人</option>
								  	<c:out value='<script type="text/javascript"> mselectPost("${teacher.post }");</script>' escapeXml="false"></c:out>
								  	</select></td></tr>
			<tr><td>详细信息：</td><td><textarea name="teacher.introduction" max="500">${teacher.name }</textarea></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认更新" class="btn mBtn"></td></tr>
		</table>
		</form>
		<div id="picture"><img alt="" src="${teacher.pictureUrl }"></div>
</body>
</html>