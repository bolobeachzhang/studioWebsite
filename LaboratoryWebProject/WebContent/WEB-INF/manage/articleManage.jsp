<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<!-- 引入jquery包 -->
<script src="./js/jquery/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		//打开页面就加载第一级导航菜单
		$.getJSON("manageArticleAction_loadFirstNavigation",{parentId:100},function(data)
		{			
			
					
					var  query =  "manageArticleAction_ArticleBypage";
					$("#articleIframe").attr("src",query);
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
			var firstId = $("#firstItem").val();
			$.getJSON("manageArticleAction_loadSecondNavigation",{id:firstId},function(data)
					{
						//开始请求文章显示列表
						var  query =  "manageArticleAction_loadArticleByNavi?firstId="+firstId+"&secondId=0&thirdId=0";
						$("#articleIframe").attr("src",query);
						
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
						//添加导航信息
						$("#secondItem").append($optionString);
						
					});
		  });
		$("#secondItem").change(function(){
			var firstId = $("#firstItem").val();
			var secondId = $("#secondItem").val();
			$.getJSON("manageArticleAction_loadSecondNavigation",{id:secondId},function(data)
					{
				
						var  query =  "manageArticleAction_loadArticleByNavi?firstId="+firstId+"&secondId="+secondId+"&thirdId=0";
						$("#articleIframe").attr("src",query);
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
		$("#thirdItem").change(function(){
			var firstId = $("#firstItem").val();
			var secondId = $("#secondItem").val();
			var thirdId = $("#thirdItem").val();
			var  query =  "manageArticleAction_loadArticleByNavi?firstId="+firstId+"&secondId="+secondId+"&thirdId="+thirdId;
			$("#articleIframe").attr("src",query);
		  });
		//查询
		$("#submitItem").click(function()
				{
					var queryString = $("#searchItem").val();
					var  query =  "manageArticleAction_searchArticleByTitle?keywords="+queryString;
					$("#articleIframe").attr("src",query);
				});
	});
	
	
	
</script>
<style type="text/css">
	#typeTable{
		width: 700px;
		height: 100px;
		margin-top: 20px;
		margin-left: 20px;
	}
	#typeTable select{
		width: 200px;
	}
	#typeTable input[type="submit"]{
		margin-left: 10px;
		margin-top: -10px;
	}
	#articleIframe{
		width: 700px;
		height: 500px;
		border: 0px;
		margin-left: 25px;
	}
	
</style>
</head>
<body>
	
	<table id="typeTable">
		<tr><td>
				<span>类别：</span>
				<select id="firstItem" class="mSelect">
					<option>--请选择类型--</option>
				</select>
			</td>
			<td>
				<select id="secondItem" class="mSelect">
					<option>--请选择类型--</option>
				</select>
			</td>
			<td>
				<select id="thirdItem" class="mSelect">
					<option>--请选择类型--</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="3" style="text-align: center;">
				<span>标题:</span>
				<input type="text" id="searchItem" name="keyWords">
				<input type="submit" id="submitItem" class="btn">
			</td></tr>
	</table>
	<iframe src="" id="articleIframe"></iframe>
</body>
</html>