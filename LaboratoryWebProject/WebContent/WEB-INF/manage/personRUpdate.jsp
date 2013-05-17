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
	//图像预览
	function preview(file)
	{
		 var prevDiv = document.getElementById('preview');
		 if (file.files && file.files[0]){
			var reader = new FileReader();
			reader.onload = function(evt){
				prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
			};  
			reader.readAsDataURL(file.files[0]);
		  }
	   else {
	       prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	   }
	}
	
	//性别选中
	function mselect(sex){
		$("input[name='register.sex'][value='"+sex+"']").attr("checked",true);
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
	#preview{
		width: 102px;
		height: 102px;
		float: left;
		border: 2px solid #CCCCCC;
		margin-top: 20px;
		margin-left: 20px;
	}
	#preview img{
		width: 100px;
		height: 100px;
	}
	
</style>

</head>
<body>
	<c:if test="${requestScope.success != null}">
		<c:out value="${requestScope.success }"></c:out>
	</c:if>
	<form action="managePersonAction_updateRDeal" method="post" enctype="multipart/form-data">
	<table id="register"  class="table table-striped table-bordered mTable">
			<tr><td>登陆ID：</td><td><input type="text" name="register.registerId" readonly="readonly" value="${register.registerId }"></td></tr>
			<tr><td>姓名：</td><td><input type="text" name="register.name" value="${register.name }" max="15"></td></tr>
			<tr><td>邮件地址：</td><td><input type="text" name="register.email" value="${register.email }" max="40"></td></tr>
			<tr><td>联系电话：</td><td><input type="text" name="register.phoneNumber" value="${register.phoneNumber }" max="20"></td></tr>
			<tr><td>身份证号码：</td><td><input type="text" name="register.idNumber" value="${register.idNumber }" max="20"></td></tr>
			<tr><td>性别：</td><td>
							    <input type="radio" name="register.sex" value="male" style="margin-left: 50px;margin-right: 3px;">男<input type="radio" name="register.sex" value="famale" style="margin-left: 20px;margin-right: 3px;">女
								<c:out value='<script type="text/javascript"> mselect("${register.sex }");</script>' escapeXml="false"></c:out>
							</td></tr>
			<tr><td>个人头像：</td><td><input type="file" name="picture" onchange="preview(this)"></td></tr>
			<tr><td>研究方向：</td><td><input type="text" name="register.research" value="${register.research }" max="40"></td></tr> 
			<tr><td>工作单位：</td><td><input type="text" name="register.workUnit" value="${register.workUnit }" max="40"></td></tr> 
			<tr><td>详细信息：</td><td><textarea name="register.content" max="500">${register.content }</textarea></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认修改" class="btn mBtn"></td></tr>
		</table>
		</form>
		<div id="preview"><img alt="" src="${register.imageUrl }"></div>
</body>
</html>