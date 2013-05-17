<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script charset="utf-8" src="./kindeditor-4.1.5/kindeditor.js"></script>
<script charset="utf-8" src="./kindeditor-4.1.5/kindeditor-min.js"></script>
<script charset="utf-8" src="./kindeditor-4.1.5/lang/zh_CN.js"></script>
<script type="text/javascript" src="./js/jquery/jquery.wordlimitor-1.0.1.js"></script>	
<script src="./js/jquery/jquery-1.8.2.min.js" type="text/javascript"></script>
<title>添加文章</title>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.mTable{
		width: 700px;
		margin-left: 25px;
		margin-top: 20px;
	}
	.mTable td{
		padding: 0px;
	}
	.mTable select{
		width: 120px;
	}
	.mTable textarea{
		width: 500px;
		height: 300px;
	}
	.mTable button{
		height: 10px;
	}
	.mBtn{
		margin-left: 50px;
		margin-right: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		//打开页面就加载第一级导航菜单
		$.getJSON("manageArticleAction_loadFirstNavigation",{parentId:100},function(data)
		{
			    	var JSONdata1 =  data;
					var str = "";
					for(var i=0;i<JSONdata1.length;i++)
						{
							
							str +="<option value="+JSONdata1[i]["id"]+">"+JSONdata1[i]["name"]+"</option>";
						}
					var $optionString = $(str);
					$("#firstItem").append($optionString);
		});
		$("#firstItem").change(function(){
			var parentId = $("#firstItem").val();
			$.getJSON("manageArticleAction_loadSecondNavigation",{id:parentId},function(data)
					{
						var JSONdata2 =  data;
						//首先执行删除节点
						$("#secondItem").empty();
						//增加节点
						var str = "<option selected='selected' value='0'>--请选择类型--</option>";
						for(var i=0;i<JSONdata2.length;i++)
							{
								str +="<option value="+JSONdata2[i]["id"]+">"+JSONdata2[i]["name"]+"</option>";
							}
						var $optionString = $(str);
						$("#secondItem").append($optionString);
					});
		  });
		$("#secondItem").change(function(){
			var parentId = $("#secondItem").val();
			$.getJSON("manageArticleAction_loadSecondNavigation",{id:parentId},function(data)
					{
						var JSONdata3 =  data;
						//首先执行删除节点
						$("#thirdItem").empty();
						//增加节点
						var str = "<option selected='selected' value='0'>--请选择类型--</option>";
						for(var i=0;i<JSONdata3.length;i++)
							{
								str +="<option value="+JSONdata3[i]["id"]+">"+JSONdata3[i]["name"]+"</option>";
							}
						var $optionString = $(str);
						$("#thirdItem").append($optionString);
					});
		  });
		
	});
</script>
<script>	
	KindEditor.ready(function(K) {
		     K.create('#textarea_id', {
		             uploadJson : './kindeditor-4.1.5/jsp/upload_json.jsp',
		             fileManagerJson : './kindeditor-4.1.5/jsp/file_manager_json.jsp',
		             allowFileManager : true,
		             //设计kinder的固定宽高
		             width:"625px",
					 minWidth:"625px",
					 height:"230px",
					 minHeight:"230px"
		        });
		});
	//js 判断表单提交数据是否为空
		function check()
		{
			var title = $.trim($(".title").val());
			var secondId = $.trim($("#secondItem").val());
			var author = $.trim($(".author").val());	
			if(title == "" || title==null)
				{
					alert("标题不能为空!!");
					return false;
				}
			else if(secondId == "0" || secondId ==0 || secondId == "")
				{
					alert("请选择文章正确的导航信息!!");
					return false;
				}
			else if(author == "" || author == null)
				{
					alert("文章作者为空!!!");
					return false;
				}
			else
				{
					return true;
				}
		}
	
		</script>
</head>
<body>
	<form action="manageArticleAction_addArticle" method="post" enctype="multipart/form-data" onsubmit="return check()" >
	<table class="table table-striped table-bordered mTable">
		<tbody>
			<tr>
				<td>文章标题：</td><td><input type="text" class="title" name="article.title" maxlength="300" max="30"><span style="color: red">${message}</span></td>
			</tr>
			<tr>
				<td>文章类别：</td>
				<td>
					<select id="firstItem" class="mSelect" name="article.firstId">
							<option value="0">请选择类型</option>
					</select> <select id="secondItem" class="mSelect" name="article.secondId">
							<option value="0">请选择类型</option>
					</select> <select id="thirdItem" class="mSelect" name="article.thirdId">
							<option value="0">请选择类型</option>
					</select>
					
					
				</td>
			</tr>
			<tr>
				<td>文章内容:</td><td><textarea name="article.content" id="textarea_id"></textarea></td>
			</tr>
			<tr>
				<td>文章作者：</td><td><input type="text" name="article.author" maxlength="50" max="50" class="author"></td>
			</tr>
			<!-- <tr> 
				<td>文章附件：</td><td><input type="file" name="upload">您好：最好选择kindereditor自带的上传工具!</td>
			</tr> -->
		</tbody>
		<tfoot>
			<tr><td colspan="2" style="text-align: left;">
				<input type="submit" value="创建文章" class="btn mBtn"> 
				<input type="reset" value="全部重置" class="btn">
			</td></tr>
		</tfoot>
	</table>
	
	</form>
</body>
</html>