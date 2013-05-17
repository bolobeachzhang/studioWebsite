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
		margin-left: 100px;
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
	.submitModify{
		width:350px;
		height:170px;
		position:absolute;
		left:25%;
		top:25%;
		z-index:100;
		background-color:#D3DDEE;
		display:none;
	}
	.submitAdd{
		width:400px;
		height:250px;
		position:absolute;
		left:25%;
		top:25%;
		z-index:100;
		background-color:#D3DDEE;
		display:none;
	}
	.centerDiv{
		/* margin:0 auto; */
		text-align:center;
	}
	#firstItems{
		float:left;
	}
	#secondItems{
		float:left;
	}
	.listItems{
		float:left;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		var modifyInput = $("#modifyName").find("input");	//得到要插入菜单对象信息的修改表单中的input元素
		//这是用来获得点击时的那个菜单对象
		var hrefToModify = $("a[href=#]");	//获得所有的href为#的修改连接
		hrefToModify.each(function(i){	//遍历每个修改连接
			var currentClickToModify = hrefToModify.eq(i);	//得到当前点击的这个查看连接的节点
			currentClickToModify.click(function(){
				var id = currentClickToModify.find("input").eq(0).val();	//取得当前点击修改的这个菜单对象的id
				var parentId = currentClickToModify.find("input").eq(1).val();
				var name = currentClickToModify.find("input").eq(2).val();
				var actionUrl = currentClickToModify.find("input").eq(3).val();
				modifyInput.eq(0).val(id);	//要修改名字的菜单对象中的信息添加到修改表单中
				modifyInput.eq(1).val(parentId);
				modifyInput.eq(2).val(name);
				modifyInput.eq(3).val(actionUrl);
				$(".submitModify").css("display","block");
			});
		});

		//在点击添加时获得该菜单对象的id号
		var hrefToAdd = $("a[href=##]");	//要添加选项的所有节点
		var addInput = $("#addItem").find("input");	//添加节点的弹出框中的所有input元素
		hrefToAdd.each(function(i){
			var currentClickToAdd = hrefToAdd.eq(i);
				currentClickToAdd.click(function(){
					var clickAddId = currentClickToAdd.find("input").eq(0).val();
					addInput.eq(2).val(clickAddId);
					$(".submitAdd").css("display","block");
			});
		});
		
		//当点击删除时，提醒是否要删除
		$(".deleteItem").click(function(){
					//alert("当前菜单还有子菜单,您不能删除它!");
					//return false;
					return confirm("您确定要删除这个菜单项吗?");
		});
		//当点击取消修改时,隐藏修改的表单
		$("#canceModify").click(function(){
			$(".submitModify").css("display","none");
		});

		//当点击取消添加时，隐藏添加的表单
		$("#canceAdd").click(function(){
			$(".submitAdd").css("display","none");
		});
	});
	
	
</script>
</head>
<body>
<!------------------- 这是一个用来显示菜单的table -------------------------------->

<div class="listItems">
	
	<table class="table table-striped table-bordered mTable">
		<thead>
			<tr>
				<th>菜单ID</th><th>菜单名</th><th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="menuItem" items="${menuItems}" varStatus="status">
				<c:if test="${menuItem.parentId == 0}" var="result">	<!-- 用jstl语法来判断:如果是一级菜单就不显示删除功能，其他子菜单都有可删除功能 -->
					<tr>
						<td>${menuItem.id}</td>	<!-- 菜单id号 -->
						<td>${menuItem.name}</td>	<!-- 菜单名字 -->
						<td>
							<!-- <a href="manageMenuAction_get?id=${menuItem.id}&parentId=${menuItem.parentId}&actionUrl=${menuItem.actionUrl}&name=${menuItem.name}">查看子菜单</a> -->
							<a href="manageMenuAction_get?id=${menuItem.id}&parentId=${menuItem.parentId}&actionUrl=${menuItem.actionUrl}&name=${menuItem.name}">查看子菜单</a>
							<a href="#">修改菜单名
								<input type="hidden" value="${menuItem.id}"/>
								<input type="hidden" value="${menuItem.parentId}"/>
								<input type="hidden" value="${menuItem.name}"/>
								<input type="hidden" value="${menuItem.actionUrl}"/>
							</a>
							<a href="##">添加子菜单
								<input type="hidden" value="${menuItem.id}"/>
							</a>
						</td>
					</tr>
				</c:if>
				<c:if test="${result == false}" var="result2">
					<tr>
						<td>${menuItem.id}</td>	<!--  -->
						<td>${menuItem.name}</td>
						<td>
							<a href="manageMenuAction_get?id=${menuItem.id}&parentId=${menuItem.parentId}&actionUrl=${menuItem.actionUrl}&name=${menuItem.name}">查看子菜单</a>
							<a href="#">修改菜单
								<input type="hidden" value="${menuItem.id}"/>
								<input type="hidden" value="${menuItem.parentId}"/>
								<input type="hidden" value="${menuItem.name}"/>
								<input type="hidden" value="${menuItem.actionUrl}"/>
							</a>
							<a href="##">添加菜单
								<input type="hidden" value="${menuItem.id}"/>
							</a>
							<a class="deleteItem" href="manageMenuAction_delete?id=${menuItem.id}&parentId=${menuItem.parentId}&actionUrl=${menuItem.actionUrl}&name=${menuItem.name}">删除</a>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-------------------------------------------------------------------------------->

<!-----------------这个div中的内容是用来显示修改子菜单的弹出框的控制 ----------->
		<div class="submitModify">
			<div class="centerDiv">
				<h3>修改子菜单</h3>
				<form id="modifyName" action="manageMenuAction_update" method="post">
					<input type="hidden" name="id" value=""/>
					<input type="hidden" name="parentId" value=""/>
					<input style="text-align:center;"type="text" name="name" value="chen"/>
					<input type="hidden" name="actionUrl" value=""/><br/><br/>
					<input type="submit" value="确定"/>
					<input id="canceModify" type="button" value="取消"/>
				</form>
			</div>
			
		</div>
<!-------------------------------------------------------------------------------->

<!---------------- 这个div中的内容是用来显示添加子菜单的弹出框的控制 ---------------------->
		<div class="submitAdd">
			<div class="centerDiv">
				<h3>添加子菜单</h3>
				<form id="addItem" action="manageMenuAction_add" method="post">
					<span>菜单名字：</span><input type="text" name="name"/><br/><!-- 新添加的菜单的名字 -->
					<span>菜单链接：</span><input type="text" name="actionUrl"/><br/><!-- 新添加的菜单的actionUrl -->
									    <input type="hidden" name="parentId"/><!-- 这个是新添加菜单的parentId -->
					<span>菜单&nbsp;&nbsp;&nbsp;id：</span><input type="text" name="id"/>	<!-- 这个是新添加菜单的id号:测试阶段是手动添加的，正式是数据库标志自动增加 -->
					<br/><br/>
					<input type="submit" value="确定"/>
					<input id="canceAdd" type="button" value="取消"/>
				</form>
			</div>
		</div>
<!-------------------------------------------------------------------------------------->
</body>
</html>