<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>成都大学-模式识别与智能信息处理四川省高校重点实验室-研究队伍</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="模式识别,智能信息,重点实验室">
<link rel="shortcut icon" href="images/background.jpg" />
<link type="text/css" rel="stylesheet" href="css/base/bootstrap_modify_for_lab.css" />
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<!-- 右边导航小方块 -->
<script type="text/javascript" src="js/front/MetroJs.lt.js"></script>
<link href="css/base/Metro.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="css/base/second_page_fream_base_css.css" />
<script type="text/javascript" >
$(document).ready(function(){
	/**
	 * 左侧导航的事件处理
	 * 
	 */
		$requestNum = ${requestScope.section};//从主页相应模块中点击传来的不同的值,用来改变加载哪一块
		
		$realcontentID = $("#realcontent");//得到载入页面的ID
		$line= $("#contentsecondLine");//得到间隔线
		$childMenu = $("#childMenu");//得到三级菜单childMenu
		/**下面定义不同的子页面链接,二级菜单**/
		$menuURIOne = "frontTeamAction_part?section=1";
		$menuURITwo = "frontTeamAction_part?section=2";
		$menuURIThree = "frontTeamAction_part?section=3";
		/**下面定义三级菜单的链接**/
		$subMenuURIOne = "frontTeamAction_separt?section=1";
		$subMenuURITwo = "frontTeamAction_separt?section=2";
		$subMenuURIThree = "frontTeamAction_separt?section=3";
		/**下面定义间隔线的四种不同的样式**/
		$classContentsecondLineOne = "contentsecondLine";
		$classContentsecondLineTwo = "contentsecondLineTwo";
		$classContentsecondLineThree = "contentsecondLineThree";
		
		$line.removeClass();//移除以前间隔线的样式然后在下面添加新的样式
		//在整个页面装入完成后，装入默认的页面，根据链接传来的值$requestNum判断来装载哪一个
		if ($requestNum == 1) {
			$line.addClass($classContentsecondLineOne);
			$realcontentID.load($menuURIOne);
		} else if($requestNum == 2){
			$line.addClass($classContentsecondLineTwo);
			$realcontentID.load($menuURITwo);
		}else if($requestNum == 3){
			$line.addClass($classContentsecondLineThree);
			$realcontentID.load($menuURIThree);
		}
		//找到标签效果对应的标签，注册鼠标点击事件
		$("#tabsecond li").each(function(index){
			//是否有三级，无则然后隐藏
			if($(this).find('b').length){
				$childMenu.show();
			}
			$(this).click(function(){
				$line.removeClass();//移除以前间隔线的样式然后在下面添加新的样式
				//根据点击的索引不同改变间隔线的颜色
				if (index == 0) {
					$line.addClass($classContentsecondLineOne);
					$realcontentID.load($menuURIOne);
				} else if (index == 1) {
					$line.addClass($classContentsecondLineTwo);
					$realcontentID.load($menuURITwo);
				} else if (index == 2) {
					$line.addClass($classContentsecondLineThree);
					$realcontentID.load($menuURIThree);
				}
				//如果二级中有三级，用找到b标签来表示是否显示三级
				if($(this).find('b').length){
					$childMenu.show();
				}else{
					$childMenu.hide();
				}
			});
		});
		//对三级菜单的点击
		//鼠标移向三级菜单显示的样式改变
		$("#childMenu ul li").each(function(index){
			$(this).hover(function(){
				$(this).css("background-color","#8383CE");
			},function(){
				$(this).css("background-color","#B6B6E0");
			});
			$(this).click(function(){
				if(index == 0){
					$realcontentID.load($subMenuURIOne);
				}else if(index == 1){
					$realcontentID.load($subMenuURITwo);
				}else if(index == 2){
					$realcontentID.load($subMenuURIThree);
				}
			});
		});
		//对于loading图片绑定ajax请求开始和交互结束的事件
		$("#contentsecond img").bind("ajaxStart",function(){
			//把div里面的内容清空
			//整个页面中任意ajax交互开始前，function中的内容会被执行
			$(this).show();
		}).bind("ajaxStop",function(){
			//整个页面中任意ajax交互结束后，function中的内容会被执行	
			$(this).slideUp("1000");
		});
		
	/**
	 * 右边菜单的事件处理
	 * 
	 * */
		$(".mTable tr td").each(function(){
			$(this).hover(function () {
				$(this).removeClass("op");
				$(this).addClass("tdChangeBg"); 
			  },function () {
				$(this).addClass("op");
				$(this).removeClass("tdChangeBg");
			  }
			);
		});
	});
	
	function pageQuery(obj){
		//$line.addClass($classContentsecondLineOne);
		$realcontentID.html("");
		$realcontentID.load($(obj).attr("fff"));
	}
</script>
</head>
<body>
<div class="topFream">
	<div id="top">
		<div class="topP">
			<a href="frontIndexAction_index" title="返回首页"><img alt="返回" src="images/Previous.png" /></a>
			<span>模式识别与智能信息处理四川省高校重点实验室</span>
		</div>
		<div class="topS">
			<c:if test="${sessionScope.USER_LOGIN != 1 }">
				<span><a href="frontIndexAction_login">登录</a></span>&nbsp;|
				<span><a href="frontIndexAction_regist">注册</a></span>&nbsp;| 
				<span><a href="frontIndexAction_getMessage?section=1">我要留言</a></span>&nbsp;|
				<span><a href="frontIndexAction_getMessage?section=2">联系我们</a></span>
			</c:if>
			<c:if test="${sessionScope.USER_LOGIN == 1 }">
				<span>欢迎您 ${sessionScope.USER_NAME }</span>&nbsp;| 
				<span><a href="frontIndexAction_logout">退出</a></span>&nbsp;| 
				<span><a href="frontIndexAction_getMessage?section=1">我要留言</a></span>&nbsp;|
				<span><a href="frontIndexAction_getMessage?section=2">联系我们</a></span>
				<span><a href="frontIndexAction_manage">后台管理</a></span>
			</c:if>
		</div> 
	</div>
</div>
<div class="fream">
<!--左边框架  -->
	<div class="freamLeft">	
		<div class="tabTitle">
			<ul id="tabsecond">
			<!-- 二级菜单 -->
				<li class="tabOne">研究方向<b></b></li>
				<li class="tabTwo">职称</li>
				<li class="tabThree">岗位</li>
			</ul>
		</div>
		<div id="contentsecond">
			<div id="contentsecondLine" class="contentsecondLine">&nbsp;</div>
			<!-- 三级菜单 -->
			<div id="childMenu">
				<ul class="childMenuUl">
					<li>图像处理与模式识别</li>
					<li>计算机网络与嵌入式</li>
					<li>数据库与空间信息</li>
				</ul>
			</div>
			<img class="jiazai" alt="加载中。。。" src="images/img-loading.gif" />
			<!-- 需要加载的页面 -->
			<div id="realcontent"></div>
		</div>
	</div>
<!-- ===========右边框架 ===============-->
	<div class="freamRight">
		<table class="mTable">
			<tr>
				<td><a href="frontIntroduceAction_getIntro?section=1">
					<div class="live-tile space op" style="background-color: #891676;">
					<img class="full" alt="" src="images/lab_About.png"> <span
						class="title_bar tile-title" style="">实验室介绍</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
				<td><a href="frontTrainAction_getTrain?section=1">
					<div class="live-tile space op">
					<img class="full" alt="" src="images/lab_people.jpg"> <span
						class="title_bar tile-title" style="">人才培养</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
			</tr>
			<tr>
				<td><a href="frontExchangeAction_getExchange?section=1">
					<div class="live-tile space op">
					<img class="full" alt="" src="images/lab_coopration.png"> <span
						class="title_bar tile-title" style="">合作交流</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
				<td><a href="frontDownloadAction_getDownload?section=1">
					<div class="live-tile space op" style="background-color: #D1603F;">
					<img class="full" alt="" src="images/lab_Download.png"> <span
						class="title_bar tile-title" style="">下载中心</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
			</tr>
			<tr>
				<td><a href="frontAchieveAction_getAchieve?section=1">
					<div class="live-tile space op">
					<img class="full" alt="" src="images/lab_tech.png"> <span
						class="title_bar tile-title" style="">科研成果</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
				<td><a href="frontDynamicAction_getDynamic?section=1">
					<div class="live-tile space op" style="background-color: #A09634;">
					<img class="full" alt="" src="images/lab_News.png"> <span
						class="title_bar tile-title" style="">最新动态</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
			</tr>
			<tr>
			<td class="longTD" colspan="2"><a href="frontTeamAction_getTeam?section=1">
				<div class="live-tile two-wide space op">
				<img class="full" alt="" src="images/lab_teams.png"> <span
					class="title_bar tile-title" style="">科研队伍</span>
				<!-- <p>样式代码在Metro.css第451行下</p> -->
				</div>
				</a>
			</td></tr>
		</table>
	</div><!-- end freamRight -->
</div>
</body>
</html>

