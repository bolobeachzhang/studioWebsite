<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><!-- 这是一个登录页面 -->
<title>成都大学-模式识别与智能信息处理四川省高校重点实验室-登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="模式识别,智能信息,重点实验室">
<link rel="shortcut icon" href="images/lablogo.png" />
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<style type="text/css">
@CHARSET "UTF-8";
body {
		margin: 0px;
		padding: 0px;
		background-image: url("images/background.jpg");
		background-repeat: repeat;
		width: 100%;
		margin: 0 auto;
}
/* 顶部*/
.topFream {
		margin: 0 auto;
		padding: 0px;
		width: 100%;
		height: 75px;
		color: #fff;
		float: left;
		margin-bottom: 3px;
		algin: cener;
}

#top {
		margin: 0px;
		padding: 0px;
		width: 1348px;
		height: 75px;
		color: #fff;
		float: left;
}

.topP {
		width: 1100px;
		margin-top: 10px;
		float: left;
}

.topP a img {
		width: 52px;
		height: 52px;
		z-index: 10;
		float: left;
		margin-left: 50px;
}

.topP span {
		width: 550px;
		margin: 0px;
		padding: 0px;
		height: 24px;
		font-size: 24px;
		color: #FFF;
		margin-top: 25px;
		margin-left: 200px;
		float: left;
}

/* 中间框架 */
.fream {
		margin: 0 auto;
		padding: 0px;
		width: 633px;
		height: 520px;
		float: left;
		/*background-color: pink;*/
}

.contentall {
		float: left;
		width: 633px;
		padding: 0px;
		height: 520px;
		background-image: url("images/regist.png");
}

.content {
		margin-left: 41px;
		margin-top: 37px;
		width: 580px;
		height: 475px;
}

/*欢迎注册 */
#contentT {
		width: 100%;
		height: 24px;
		margin-top: 20px;
		float: left;
}

#contentT .contentTL {
		width: 163px;
		float: left;
		margin-left: 71px;
		color: #2e529b;
		margin-top: 10px;
		border-color: #2e529b;
}

#contentT .contentTR {
		width: 235px;
		float: right;
		color: #2e529b;
		vertical-align: middle;
		margin-top: 10px;
		border-color: #2e529b;
}

#logError{
	position: relative;
	top: 55px;
	left: 150px;
	color: red;
	font-size: 12px;
}
/*输入内容*/
.tabCDiv {
		float: left;
		width: 430px;
		height: 410px;
		margin-left: 150px;
		margin-top: 60px;
}
.inputuser{
	padding-top:5px;
	padding-bottom:5px;
	font-size:16px;
border:1px dotted #9A9A9A;
	float:left;
	width: 285px;
	margin-bottom: 7px;

}
.img{
	margin-left:3px;
	width: 20px;height: 20px;float: left;
margin-top: 2px;
}
.font1{
	font-size:14px;
color:#9A9A9A;
	font-family: "宋体";
	width:60px;
	margin-left:10px;
	margin-top:2px;
	float: left;
}
.inputtext{
	margin-left:5px;
	float: left;
	height:18px;
	width:140px;
	border: 0px;
}
/* 角色选择 */
.select{
	float: left;
	width: 285px;
height: 50px;
}
.leftFont{
	line-height:30px;
	color:#447C23;
	font-size:13px;
	font-family: "宋体";
	width:80px;
	height: 50px;
	float: left;
}

.rightSelect{
	color:#9A9A9A;
	line-height:30px;
	float:left;
	font-size:12px;
	font-family:"宋体";
	width: 205px;
	height: 50px;
}
label{
	width: 70px;
}
/*验证登录  */
.checkandlogin{
	padding-top:0px;
	color:#9A9A9A;
	font-size:12px;
	font-family:"宋体";
	margin-top:20px;
	width: 285px;
	float: left;
	vertical-align: middle;
}
.checkandlogin a{
	color: #9A9A9A;
text-decoration: none;
}
.check{
	margin-left:3px;
	float: left;
}
.checkinput{
	width: 80px;
}
#checkImg{
	cursor: pointer;
	position: relative;
	bottom: -10px;
}
/* 登录 */
.loginBu{
	width: 285px;
	margin-top:15px;
	float: left;
}
.status{
	color: #9A9A9A;
	margin-top:8px;
	font-size:12px;
	line-height:16px;
	font-family:"宋体";
	float: left;
}
.go{
	width:124px;
	height:30px;
	float: right;
}
.loginbut:HOVER{
	border:0px;cursor:pointer; width:124px; height:30px;
	background-color:Transparent;
	background-image:url(images/adminLogined.png);
}
</style>
<script type="text/javascript">
$(function(){
	/*
	//能否登录成功
	//下面的用户名和密码是从数据库读出的 ，先用1 代替 
	$getUsername =1;
	$getPassword =1;
	//模拟验证码的验证码，将存在的验证码交给下面的$getCheck 就ok了 
	$getCheck=1;
	//表单中提示正确错误的图片的URL 			
	$okImgURL = "images/right.gif";
	$noImgURL = "images/error.gif";
	//得到提示正确错误的图片的ID 
	$useno_ok1 = $("#useno_ok1");
	$useno_ok2 = $("#useno_ok2");
	//用户名的验证
	$("#username").blur(function(){
		//var reg= /^[0-9]\d/gi;
	$username=$("#username").val();			
			if($username==$getUsername){
				$($useno_ok1).attr("src",$okImgURL);						
			}else{
				$($useno_ok1).attr("src",$noImgURL);
				document.myform.username.focus();
				return false;
			}						
	});
	$("#username").keyup(function(){
		$username=$("#username").val();			
				if($username==$getUsername){
					$($useno_ok1).attr("src",$okImgURL);						
				}else{
					$($useno_ok1).attr("src",$noImgURL);
					document.myform.username.focus();
					return false;
				}						
	});
	
	//密码验证
	$("#password").keyup(function(){
		$password=$("#password").val();	
			if($password==$getPassword){
				$($useno_ok2).attr("src",$okImgURL);
			}else{
				$($useno_ok2).attr("src",$noImgURL);
				document.myform.password.focus();
				return false;
			}					
	});	
	$("#password").blur(function(){
		$password=$("#password").val();	
			if($password==$getPassword){
				$($useno_ok2).attr("src",$okImgURL);
			}else{
				$($useno_ok2).attr("src",$noImgURL);
				document.myform.password.focus();
				return false;
			}					
	});
	//验证码
	$("#checkinput").keyup(function(){
		$checkin=$("#checkinput").val();
			if($checkin==$getCheck){		
			}else{	
				document.myform.checkinput.focus();
				return false;
			}					
	});*/
	//能否提交信息
	$("#loginbut").click(function(){
		//输入框的用户名、密码、身份、验证码
		$usernameval=$("#username").val();
		$passwordval=$("#password").val();
		$statusSelectval=document.myform.choice.value;	
		$check= $("#checkinput").val();
		//用户名
		if($usernameval=="")
		{
			alert("用户名不能为空！");
			document.myform.username.focus();
			return false;
		}else if($usernameval != $getUsername){
			alert("用户名填写不正确！");
			document.myform.username.focus();
			return false;
			}
		//密码
		else if ($passwordval=="")
		{ 
			alert("密码不能为空!");
			document.myform.password.focus();
			return false; 
		}else if($passwordval != $getPassword){
			alert("密码不正确！");
			document.myform.username.focus();
			return false;
		}else if ($check =="")
		{ 
			alert("验证码不能为空!");
			document.myform.checkinput.focus();
			return false; 
		}
		else if($check != $getCheck){
			alert("验证码不正确！");
			document.myform.checkinput.focus();
			return false;
		}
	});
	//对登录按钮样式的改变 ，当鼠标移向时 
	$(".loginbut").hover(function(){
			$(this).css("background-image","url('images/adminLogined.png')");
		},function(){
			$(this).css("background-image","url('images/adminLogin.png')");
	});
	//适应不同的屏幕的fream的边距  的方法 （freamM()）
	freamM();
	function freamM(){
		$screenW = screen.width;//得到屏幕的宽度 
		$screenH = screen.height;
		$framMarginLeft = $screenW * 0.27;
		$framMarginTop = $screenH * 0.05;
		$(".fream").css("margin-left",$framMarginLeft);
		$(".fream").css("margin-top",$framMarginTop);
	}
	
	
	//验证码更换
	var checkImg = $("#checkImg");
	checkImg.click(function(){
		checkImg.attr("src","SecurityCodeImageAction?timestamp="+new Date().getTime());
	});
	
});
</script>
</head>
<body>
<!-- =======顶部========= -->
<div class="topFream">
	<div id="top">
		<div class="topP">
			<a href="frontIndexAction_index" title="返回首页"><img alt="返回" src="images/Previous.png" /></a>
			<span>模式识别与智能信息处理四川省高校重点实验室</span>
		</div>
	</div>
</div><!-- end topFream -->
<div class="fream">
<!--=========左边框架===========  -->
	<div class="contentall">
		<div class="content">
			<div id="contentT">
				<hr class="contentTL">
				<font style="float: left;font-size: 20px;margin-left: 15px;">欢迎登录</font>
				<hr class="contentTR">
			</div><!-- end contentT -->
			<div id="logError">
				<c:if test="${requestScope.error != null}">
					<c:out value="* ${requestScope.error}"></c:out> 
				</c:if>
			</div><!-- 这里显示登录错误信息  -->
			<!-- 注册的表格开始 -->
			<div class="tabCDiv">
					<form action="frontIndexAction_checkLogin" name="myform" method="post" id="registerForm" onsubmit="return checkR(this)" >
						<div class="inputuser">
								<img src="images/User_male.png" class="img"/>
								<div class="font1">用户ID:</div>
								<input type="text"class="inputtext" id="username" name="username" value="" onchange="test_name ()"/>
								<img id="useno_ok1" style="width: 20px;height: 20px;" src="images/blank.gif">
							</div>
							<div class="inputuser">
								<img src="images/Key.png" class="img"/>
								<div class="font1">密&nbsp;&nbsp;码:</div>
								<input type="password"class="inputtext" id="password" name="password" value=""  onchange="test_password()"/>
								<img id="useno_ok2" style="width: 20px;height: 20px;" src="images/blank.gif">
							</div>
							<div class="select">
								<div class="leftFont">身份选择：</div>
								<div class="rightSelect">
									<input type="radio" id="choice" name="choice" value="16" checked="checked"><label for="choice1">系统管理员</label>
									<input type="radio" id="choice" name="choice" value="8"><label for="choice2">教师登录</label><br>
									<input type="radio" id="choice" name="choice" value="4"><label for="choice3">学生登录</label>&nbsp;&nbsp;
									<input type="radio" id="choice" name="choice" value="2"><label for="choice4">注册会员</label>		
								</div>		
							</div>
							<!-- 验证码和登录 -->
							<div class="checkandlogin">
								<div class="check">验证码：<input class="checkinput" id="checkinput" name="checkinput" type="text" onchange="test_check ()"/>
								<font color="red">*</font>&nbsp;<img src="SecurityCodeImageAction" title="看不清?请点击图片更换" id="checkImg"/></div>	
							</div>
							
							<div class="loginBu">
								<div class="go"><input type="submit" id="loginbut" value="" class="loginbut" style="border:0px;cursor:pointer; width:124px; height:30px;background-color:Transparent;background-image:url(images/adminLogin.png);"/></div>
							</div>
				</form>
			</div><!-- end tabCDiv -->
		</div>
	</div><!-- end contentall -->
</div><!-- end fream -->
</body>
</html>
