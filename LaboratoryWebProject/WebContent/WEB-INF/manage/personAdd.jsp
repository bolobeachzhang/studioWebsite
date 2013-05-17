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
	function chooseType(obj){
		var value = parseInt(obj);
		switch (value){
			case 16:
				$("#managerForm").slideDown("fast").siblings("form").slideUp("fast");
				$("#success").html("");
				$("#preview").hide();
				break;
			case 8:
				$("#teacherForm").slideDown("fast").siblings("form").slideUp("fast");
				$("#success").html("");
				$("#preview").show();
				break;
			case 4:
				$("#studentForm").slideDown("fast").siblings("form").slideUp("fast");
				$("#success").html("");
				$("#preview").show();
				break;
			case 2:
				$("#registerForm").slideDown("fast").siblings("form").slideUp("fast");
				$("#success").html("");
				$("#preview").show();
				break;
			default:
				$("form").hide();
				$("#success").html("");
				$("#preview").hide();
				break;
		}
	}
	
	//验证当前输入ID是否是可用的
	function checkID(obj){
		var mthis = $(obj); 
		var id = mthis.val();
		if(id == "" || id == null){
			mthis.nextAll(".idResoult").html("ID不能为空");
			mthis.focus();
			return false;
		}
		var type = mthis.siblings("input").val();
		
		$.ajax({
			type: "POST",
			url: "managePersonAction_checkID",
			data: "id="+id+"&type="+type,
			beforeSend: function (){
				$("#loding").show();
			},
			success: function(msg){
				if(msg == "ok"){
					mthis.nextAll(".idResoult").html("该ID可用");	
					return true;
				} else {
					mthis.nextAll(".idResoult").html("该ID不可用");
					mthis.focus();
					return false;
				}
			},
			complete: function(){
				$("#loding").hide();
			}
		});
	}
	
	//验证添加管理员
	function checkM(obj) {
		var idM = $("#idM");
		if(idM.val() == "" || idM.val() == null){
			$("#idResoult").html("登陆ID不能为空");
			idM.focus();
			return false;
		} else {
			$("#idResoult").html("");
		}
		
		var nameM = $("#nameM");
		if(nameM.val() == "" || nameM.val() == null){
			$("#nameResoult").html("管理员姓名不能为空");
			nameM.focus();
			return false;
		} else {
			$("#idResoult").html("");
		}
		
		var passM = $("#passM");
		if(passM.val() == "" || passM.val() == null){
			$("#passResoult").html("密码不能为空");
			passM.focus();
			return false;
		} else {
			$("#passResoult").html("");
		}
		
		var repassM = $("#repassM");
		if(repassM.val() == "" || repassM.val() == null){
			$("#repassResoult").html("确认密码不能为空");
			passM.focus();
			return false;
		} else {
			$("#repassResoult").html("");
		}
		if(repassM.val() != passM.val()){
			$("#repassResoult").html("两次的密码必须一致");
			repassM.focus();
			return false;
		}
		return true;
	}
	
	//判断教师信息
	function checkT(obj){
		var idTeacher = $("#idTeacher");
		if(idTeacher.val() == "" || idTeacher.val() == null){
			$("#tIDResoult").html("登陆ID不能为空");
			idTeacher.focus();
			return false;
		} else {
			$("#tIDResoult").html("");
		}
		
		var nameTeacher = $("#nameTeacher");
		if(nameTeacher.val() == "" || nameTeacher.val() == null){
			$("#tNameResoult").html("姓名不能为空");
			nameTeacher.focus();
			return false;
		} else {
			$("#tNameResoult").html("");
		}
		
		var passTeacher = $("#passTeacher");
		if(passTeacher.val() == "" || passTeacher.val() == null){
			$("#tPassResoult").html("登陆密码不能为空");
			passTeacher.focus();
			return false;
		} else {
			$("#tPassResoult").html("");
		}
		
		var repassTeacher = $("#repassTeacher");
		if(repassTeacher.val() == "" || repassTeacher.val() == null){
			$("#tRepassResoult").html("确认密码不能为空");
			repassTeacher.focus();
			return false;
		} else {
			$("#tRepassResoult").html("");
		}
		if(repassTeacher.val() != passTeacher.val()){
			$("#tRepassResoult").html("两次的密码必须一致");
			repassTeacher.focus();
			return false;
		}
		return true;
	}
	
	//判断学生信息
	function checkS(obj){
		var idStudent = $("#idStudent");
		if(idStudent.val() == "" || idStudent.val() == null){
			$("#sIDResoult").html("登陆ID不能为空");
			idStudent.focus();
			return false;
		} else {
			$("#sIDResoult").html("");
		}
		
		var nameStudent = $("#nameStudent");
		if(nameStudent.val() == "" || nameStudent.val() == null){
			$("#sNameResoult").html("姓名不能为空");
			nameStudent.focus();
			return false;
		} else {
			$("#sNameResoult").html("");
		}
		
		var passStudent = $("#passStudent");
		if(passStudent.val() == "" || passStudent.val() == null){
			$("#sPassResoult").html("登陆密码不能为空");
			passStudent.focus();
			return false;
		} else {
			$("#sPassResoult").html("");
		}
		
		var repassStudent = $("#repassStudent");
		if(repassStudent.val() == "" || repassStudent.val() == null){
			$("#sRepassResoult").html("确认密码不能为空");
			repassStudent.focus();
			return false;
		} else {
			$("#sRepassResoult").html("");
		}
		if(repassStudent.val() != passTeacher.val()){
			$("#sRepassResoult").html("两次的密码必须一致");
			repassStudent.focus();
			return false;
		}
		return true;
		alert("true");
	}
	
	//判断注册人员信息
	function checkR(obj){
		var idRegister = $("#idRegister");
		if(idRegister.val() == "" || idRegister.val() == null){
			$("#rIDResoult").html("登陆ID不能为空");
			idRegister.focus();
			return false;
		} else {
			$("#rIDResoult").html("");
		}
		
		var nameRegister = $("#nameRegister");
		if(nameRegister.val() == "" || nameRegister.val() == null){
			$("#rNameResoult").html("姓名不能为空");
			nameRegister.focus();
			return false;
		} else {
			$("#rNameResoult").html("");
		}
		
		var passRegister = $("#passRegister");
		if(passRegister.val() == "" || passRegister.val() == null){
			$("#rPassResoult").html("登陆密码不能为空");
			passRegister.focus();
			return false;
		} else {
			$("#rPassResoult").html("");
		}
		
		var repassRegister = $("#repassRegister");
		if(repassRegister.val() == "" || repassRegister.val() == null){
			$("#rRepassResoult").html("确认密码不能为空");
			repassRegister.focus();
			return false;
		} else {
			$("#rRepassResoult").html("");
		}
		if(repassRegister.val() != passRegister.val()){
			$("#rRepassResoult").html("两次的密码必须一致");
			repassRegister.focus();
			return false;
		}
		return true;
	}
	
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
		width: 550px;
		margin-left: 25px;
		margin-top: 20px;
		float: left;
	}
	.mTable td{
		padding: 0px;
	}
	.mTable textarea{
		width: 400px;
		height: 100px;
	}
	.mBtn{
		margin-right: 20px;
	}
	#preview{
		width: 102px;
		height: 102px;
		border: 2px solid #CCCCCC;
		float: right;
		margin-top: 60px;
		margin-right: 20px;
		display: none;
	}
	#preview img{
		width: 100px;
		height: 100px;
	}
	.redstr{
		color: red;
	}
	
</style>
</head>
<body>
	<div id="loding" style="z-index: 9999;background-color: rgba(0,0,0,0.2);position: absolute;top: 50%;left: 50%;display: none;">
		<p style="padding:10px 10px 0px 10px;"><img alt="loding" src="images/Loading01.gif">页面加载中...</p>
	</div>
	<div id="preview" ></div>
	<div id="choose">
		<span>请选择添加类型：</span>
		<select onchange="chooseType(this.value)">
			<option>请选择--</option>
			<option value="16">管理员</option>
			<option value="8">教师</option>
			<option value="4">学生</option>
			<option value="2">注册人员</option>
		</select>
		<span id="success">${requestScope.SUCCESS}</span>
	</div>
	<form action="managePersonAction_addM" method="post" id="managerForm" style="display: none;" onsubmit="return checkM(this)">
		<table id="manager"  class="table table-striped table-bordered mTable">
			<tr><td>登陆ID：</td><td><input hidden="true" value="16" name="usertype"><input type="text" onblur="checkID(this)" id="idM" name="userid" max="20"><span class="redstr">*</span><span id="idResoult" class="idResoult"></span></td></tr>
			<tr><td>姓名：</td><td><input type="text" id="nameM" name="username" max="15"><span class="redstr">*</span><span id="nameResoult"></span></td></tr>
			<tr><td>登陆密码：</td><td><input type="password" id="passM" name="userpass" max="30" max="30"><span class="redstr">*</span><span id="passResoult"></span></td></tr>
			<tr><td>确认密码：</td><td><input type="password" id="repassM" max="30"><span class="redstr">*</span><span id="repassResoult"></span></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" class="btn mBtn" value="确认添加"><input type="reset" value="取消添加" class="btn"></td></tr>
		</table>
	</form>
	<form action="managePersonAction_addT" method="post" id="teacherForm" style="display: none;" onsubmit="return checkT(this)" enctype="multipart/form-data">
		<table id="teacher"  class="table table-striped table-bordered mTable">
			<tr><td>登陆ID：</td><td><input hidden="true" value="8" name="usertype"><input type="text" id="idTeacher" name="teacher.teacherId" onblur="checkID(this)" max="20"><span class="redstr">*</span><span id="tIdResoult" class="idResoult"></span></td></tr>
			<tr><td>姓名：</td><td><input type="text" id="nameTeacher" name="teacher.name" max="14"><span class="redstr">*</span><span id="tNameResoult"></span></td></tr>
			<tr><td>登陆密码：</td><td><input type="password" id="passTeacher" name="teacher.password" max="30"><span class="redstr">*</span><span id="tPassResoult"></span></td></tr>
			<tr><td>确认密码：</td><td><input type="password" id="repassTeacher" max="30"><span class="redstr">*</span><span id="tRepassResoult"></span></td></tr>
			<tr><td>邮件地址：</td><td><input type="text" name="teacher.email" max="40"></td></tr>
			<tr><td>联系电话：</td><td><input type="text" name="teacher.phoneNumber" max="20"></td></tr>
			<tr><td>性别：</td><td><input type="radio" name="teacher.sex" checked="checked" value="male" style="margin-left: 50px;margin-right: 3px;">男<input type="radio" name="teacher.sex" value="female" style="margin-left: 20px;margin-right: 3px;">女</td></tr>
			<tr><td>教师照片：</td><td><input type="file" onchange="preview(this)" name="picture"></td></tr> 
			<tr><td>教师年龄：</td><td><input type="text" name="teacher.age" max="3"></td></tr>
			<tr><td>研究方向：</td><td>
								  	<select name="teacher.research">
								  		<option value="图形处理与模式识别" selected="selected">图形处理与模式识别</option>
								  		<option value="计算机网络与嵌入式">计算机网络与嵌入式</option>
								  		<option value="数据库与空间技术">数据库与空间技术</option>
								  	</select></td></tr>
			<tr><td>教师职称：</td><td>
									<select name="teacher.title">
										<option value="博士讲师" selected="selected">博士讲师</option>
										<option value="教授">教授</option>
										<option value="副教授">副教授</option>
										<option value="其他">其他</option>
									</select>
			</td></tr>
			<tr><td>教师岗位：</td><td>
									<select name="teacher.post">
										<option value="教师">教师</option>
										<option value="组长">组长</option>
										<option value="办公室">办公室</option>
										<option value="主任">主任</option>
								  		<option value="学术带头人">学术带头人</option>
								  	</select></td></tr>
			<tr><td>详细信息：</td><td><textarea name="teacher.introduction" max="500"></textarea></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认添加" class="btn mBtn"><input type="reset" value="取消添加" class="btn"></td></tr>
		</table>
	</form>
	<form action="managePersonAction_addS" method="post" id="studentForm" style="display: none;" onsubmit="return checkS(this)" enctype="multipart/form-data">
		<table id="student"  class="table table-striped table-bordered mTable">
			<tr><td>登陆ID：</td><td><input hidden="true" value="4" name="usertype"><input type="text" onblur="checkID(this)" id="idStudent" name="student.studentId" max="20"><span class="redstr">*</span><span id="sIDResoult" class="idResoult"></span></td></tr>
			<tr><td>学生姓名：</td><td><input type="text" id="nameStudent" name="student.name" max="15"><span class="redstr">*</span><span id="sNameResoult"></span></td></tr>
			<tr><td>登陆密码：</td><td><input type="password" id="passStudent" name="student.password" max="30"><span class="redstr">*</span><span id="sPassResoult"></span></td></tr>
			<tr><td>确认密码：</td><td><input type="password" id="repassStudent" max="30"><span class="redstr">*</span><span id="sRepassResoult"></span></td></tr>
			<tr><td>邮件地址：</td><td><input type="text" name="student.email" max="40"></td></tr> 
			<tr><td>个人头像：</td><td><input type="file" name="picture" onchange="preview(this)"></td></tr>  
			<tr><td>学习方向：</td><td><input type="text" name="student.studyDirection" max="40" ></td></tr>
			<tr><td>学生类型：</td><td><input type="radio" name="student.type" value="1" checked="checked" style="margin-left: 10px;margin-right: 3px;">普通学生<input type="radio" name="student.type" value="2" style="margin-left: 10px;margin-right: 3px;">三好学生<input type="radio" name="student.type" value="4" style="margin-left: 10px;margin-right: 3px;">研究生</td></tr>
			<tr><td>详细信息：</td><td><textarea name="student.Introduction" max="500"></textarea></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认添加" class="btn mBtn"><input type="reset" value="取消添加" class="btn"></td></tr>
		</table>
		
	</form>
	<form action="managePersonAction_addR" method="post" id="registerForm" style="display: none;"onsubmit="return checkR(this)" enctype="multipart/form-data">
		<table id="register"  class="table table-striped table-bordered mTable">
			<tr><td>登陆ID：</td><td><input hidden="true" value="2" name="usertype"><input type="text" onblur="checkID(this)" id="idRegister" name="register.registerId" max="20"><span class="redstr">*</span><span id="rIDResoult" class="idResoult"></span></td></tr>
			<tr><td>姓名：</td><td><input type="text" id="nameRegister" name="register.name" max="15"><span class="redstr">*</span><span id="rNameResoult"></span></td></tr>
			<tr><td>登陆密码：</td><td><input type="password" id="passRegister" name="register.password" max="20"><span class="redstr">*</span><span id="rNameResoult"></span></td></tr>
			<tr><td>确认密码：</td><td><input type="password" id="repassRegister" max="20"><span class="redstr">*</span><span id="rNameResoult"></span></td></tr>
			<tr><td>邮件地址：</td><td><input type="text" name="register.email" max="40"></td></tr>
			<tr><td>联系电话：</td><td><input type="text" name="register.phoneNumber" max="20"></td></tr>
			<tr><td>身份证号码：</td><td><input type="text" name="register.idNumber" max="20"></td></tr>
			<tr><td>性别：</td><td><input type="radio" name="register.sex" checked="checked" value="male" style="margin-left: 50px;margin-right: 3px;">男&nbsp;<input type="radio" name="register.sex" value="female" style="margin-left: 50px;margin-right: 3px;">女</td></tr>
			<tr><td>个人头像：</td><td><input type="file" name="picture" onchange="preview(this)"></td></tr>
			<tr><td>研究方向：</td><td><input type="text" name="register.research" max="40"></td></tr> 
			<tr><td>工作单位：</td><td><input type="text" name="register.workUnit" max="40"></td></tr>  
			<tr><td>详细信息：</td><td><textarea name="register.content" max="500"></textarea></td></tr>
			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="确认添加" class="btn mBtn"><input type="reset" value="取消添加" class="btn"></td></tr>
		</table>
	</form>
</body>
</html>