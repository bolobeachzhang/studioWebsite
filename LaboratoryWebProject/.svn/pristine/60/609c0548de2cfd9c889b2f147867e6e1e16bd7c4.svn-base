<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery/jquery.wordlimitor-1.0.1.js"></script>
<script type="text/javascript">
	function check(){
		var oldpass = $("#oldpass");
		if(oldpass.val() == "" || oldpass.val() == null){
			oldpass.focus();
			$("#roldpass").html("原始密码不能为空");
			return false;
		} else {
			$("#roldpass").html("");
		}
		
		var newpass = $("#newpass");
		if(newpass.val() == "" || newpass.val() == null){
			newpass.focus();
			$("#rnewpass").html("新密码不能为空");
			return false;
		} else {
			$("#rnewpass").html("");
		}
		
		var renewpass = $("#renewpass");
		if(renewpass.val() == "" || renewpass.val() == null){
			renewpass.focus();
			$("#rrenewpass").html("新密码不能为空");
			return false;
		} else {
			$("#rrenewpass").html("");
		}
		
		if(renewpass.val() != newpass.val()){
			renewpass.focus();
			$("#rrenewpass").html("两次密码必须一致");
			return false;
		} else {
			$("#rrenewpass").html("");
		}
		return true;
	}
	
	function checkOldPass(obj){
		$.ajax({
			type: "POST",
			url: "managePasswordAction_check",
			data: "pass="+$(obj).val(),
			beforeSend: function (){
				$("#loding").show();
			},
			success: function(msg){
				if(msg == "ok"){
					$("#roldpass").html("");
				} else {
					$("#roldpass").html("原始密码输入错误");
					$("#oldpass").focus();
				}
			},
			complete: function(){
				$("#loding").hide();
			}
		});
	}
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.mTable{
		width: 500px;
		margin-left: 125px;
		margin-top: 20px;
	}
	.mTable th{
		padding: 0px;
	}
	.mTable td{
		padding: 0px;
	}
	.mTable .mBtn{
		margin-left: 20px;
		margin-right: 40px;
	}
	.redstr{
		color: red;
	}
	#success{
		margin-left: 200px;
	}
	
</style>
</head>
<body>
	<div id="success">
	<c:if test="${requestScope.SUCCESS != null }">
		<c:out value="${requestScope.SUCCESS }"></c:out>
	</c:if>
	</div>
	<div id="loding" style="z-index: 9999;background-color: rgba(0,0,0,0.2);position: absolute;top: 50%;left: 50%;display: none;">
		<p style="padding:10px 10px 0px 10px;"><img alt="loding" src="images/Loading01.gif">页面加载中...</p>
	</div>
	<form action="managePasswordAction_updatePass" method="post" onsubmit="return check()">
	<table class="table table-striped table-bordered mTable">
		<tr><td>登陆ID：</td><td><input type="text" value="${sessionScope.USER_ID }" readonly="readonly"></td></tr>
		<tr><td>旧密码：</td><td><input type="text" id="oldpass" onblur="checkOldPass(this)" max="30"><span class="redstr">*</span><span id="roldpass"></span></td></tr> 
		<tr><td>新密码：</td><td><input type="text" id="newpass" name="pass" max="30"><span class="redstr">*</span><span id="rnewpass"></span></td></tr>
		<tr><td>确认密码：</td><td><input type="text" id="renewpass" max="30"><span class="redstr">*</span><span id="rrenewpass"></span></td></tr>
		<tr><td colspan="2" style="text-align: center;"><input type="submit" class="btn mBtn" value="确认修改"> <input type="reset" class="btn" value="重置修改"></td></tr>
	</table>
	</form>
</body>
</html>