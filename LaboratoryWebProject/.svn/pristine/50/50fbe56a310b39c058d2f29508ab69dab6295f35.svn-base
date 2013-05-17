<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<style type="text/css">
	#navigationType{
		margin-left: 120px;
		margin-top: 20px;
	}
	.mTable{
		width: 700px;
		margin-left: 25px;
		margin-top: 20px;
	}
	.mTable th{
		padding: 0px;
		text-align:center;
	}
	.mTable td{
		padding: 0px;
		text-align:center;
	}
	.mTable a{
		margin-right: 20px;
	}
	#firstItems{
		float:left;
	}
	#secondItems{
		float:left;
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
<script type="text/javascript">
	$(function(){
		//当页面加载时，初始化级联菜单
		//将二级菜单隐藏起来
		var firstItems = $("#firstItems");	//得到第一个下拉表的节点
		var secondItems = $("#secondItems").css("display","none");	//得到第二个下拉表的节点
		var listItems = $(".listItems");	//显示信息的div
		var parentId = null;		//用来供查询的parentId
		var srcStr = null;			//用来存放修改后要在ifream中显示的src
		loadFirstCascade(firstItems);
		
		//一级菜单的change函数监听
		firstItems.change(function(){
			secondItems.css("display","none");	//在每次选择前都隐藏第二把下拉表
			parentId = firstItems.val();	//取得一级菜单的id号
			if(parentId == "NO"){
				srcStr = "manageMenuAction_get?id=0&parentId=&actionUrl=&name=";
			}else{
				srcStr = "manageMenuAction_get?id="+parentId+"&parentId=&actionUrl=&name=";
			}
			$("#content").attr("src",srcStr);	//当点击时查询出数据 */
			var parentId = firstItems.val();
			secondItems.html("");
			$.getJSON("manageMenuAction_cascade",{parentId:parentId},function(data){	//jquery的post方法加载一级菜单
				var len = data.length;
				if(len != 0){
					var i = 0 ;
					for(i ;i < len ;i++){
						secondItems.append("<option value="+data[i]['id']+">"+data[i]['name']+"</option>");
					}
					secondItems.css("display","block");	//当第二个下拉表的数据加载出来后，显示这个下拉表
				}else{
					secondItems.css("display","none");	//如果没有返回数据,那么第二个下拉列表还是要隐藏
				}
			});
		});
		
		//secondCascadeChange
		secondItems.change(function(){
			listItems.html("");	//获得数据时,将第二个下拉表中的内容先清空
			parentId = secondItems.val();
			srcStr = "manageMenuAction_get?id="+parentId+"&parentId=&actionUrl=&name=";
			$("#content").attr("src",srcStr);
		});
	});

	//加载一级菜单的函数
	function loadFirstCascade(firstItems){
		var parentId = 0;
		$.getJSON("manageMenuAction_cascade",{parentId:parentId},function(data){	//jquery的post方法加载一级菜单
			var len = data.length;
			var i = 0 ;
			firstItems.append("<option value='NO'>---查看首页菜单---</option>");
			for(i ;i < len ;i++){
				firstItems.append("<option value="+data[i]['id']+">"+data[i]['name']+"</option>");
			}
		});
	}
</script>
</head>
<body>
	<!--这个是过滤的级联菜单  -->
	<div id="navigationType">
		<select id="firstItems">
		</select>
		<select id="secondItems">
		</select>
	</div>
	
	<iframe id="content" src="manageMenuAction_get?id=0&parentId=&actionUrl=&name="></iframe><!-- 用来显示内容的iframe -->
	
</body>
</html>