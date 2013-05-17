<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册人员后台管理主页面</title>
<link href="css/manage/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		var isDown = false; //是否有下拉的菜单
		var isChildClick = false; //是否为子菜单点击
		var index = 0; //是否是重复点击
		
		$(".clickItem").click(function(event){
			var mthis = $(this);
			
			var parent = mthis.parent(".secondItem");
			if(parent.length > 0){ //判定本次点击是否是子菜单点击
				isChildClick = true;
				event.stopPropagation(); //这里必须阻止jquery事件冒泡
			} else {
				isChildClick = false;
				event.stopPropagation();
			}
			
			if(!isChildClick){ //不是子菜单点击，才可能会有动作
				if(index != mthis.index()){ //根据编号判定是否是同一次点击
					if(isDown){ //判断当前有已有下拉菜单
						$(".secondItem").hide("fast"); //快速隐藏全部子菜单
						isDown = false;
					}
				}
				
				var child = mthis.children(".secondItem");
				if(child.length > 0){ //有子菜单
					if(!isDown){ 
						child.slideDown("slow");
						isDown = true;
					} else {
						child.slideUp("slow");
						isDown = false;
					}
				} 
			}
			
			index = mthis.index();
			var action = mthis.attr("action"); //获得动作
			$("#content").attr("src",action);
			
			$(".clickItem").css({background:"#807D94"}); //颜色变化
			mthis.css({background:"#666D91"});
		});
	});
	
	function autoResize(){
		try{
			document.all["inner"].style.height=inner.document.body.scrollHeight
		}
			catch(e){}
	}
	
	function reinitIframe(){

		var iframe = document.getElementById("content");

		try{

		var bHeight = iframe.contentWindow.document.body.scrollHeight;

		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;

		var height = Math.max(bHeight, dHeight);

		iframe.height =  height;

		}catch (ex){}

		}

		window.setInterval("reinitIframe()", 200);
</script>
</head>
<body>
<div id="top">
	<a href="frontIndexAction_index"><img alt="返回" src="images/Previous.png"></a>
	<p>模式识别与智能信息处理四川省高校重点实验室</p>
	<div><span>欢迎您 ${sessionScope.USER_NAME }</span> | <span><a href="frontIndexAction_logout">注销</a></span></div> 
</div>
<iframe id="content" src="managePasswordAction_get" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="100%" style="height:expression(1); aho:expression(autoResize())">

</iframe>
<div id="operation">
	 <ul class="firstItem">
		<li class="clickItem" action="managePasswordAction_get">&nbsp;•&nbsp;密码修改</li> 
		<li class="clickItem" action="managePersonAction_updateR">&nbsp;•&nbsp;&nbsp;个人信息</li>
		<li class="clickItem" action="manageFileAction_uploadPage">&nbsp;•&nbsp;&nbsp;资料上传</li>
		<li class="clickItem" action="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }">&nbsp;•&nbsp;&nbsp;资料管理</li>
	</ul>
</div>
</body>
</html>