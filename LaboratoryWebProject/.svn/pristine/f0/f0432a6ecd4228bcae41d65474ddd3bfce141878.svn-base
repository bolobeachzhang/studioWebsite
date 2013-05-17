<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>成都大学-模式识别与智能信息处理四川省高校重点实验室-合作交流-学术论坛</title>
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
		$requestNum = 1;//从主页相应模块中点击传来的不同的值,用来改变加载哪一块。只引用了一个页面，其他三个没用
		
		$realcontentID = $("#realcontent");//得到载入页面的ID
		$line= $("#contentsecondLine");//得到间隔线
		$childMenu = $("#childMenu");//得到三级菜单childMenu
		/**下面定义不同的子页面链接**/
		$menuURIOne = "replyBBS.jsp";
		$menuURITwo = "cooperationProjects.jsp";
		$menuURIThree = "academicExchangeConference.jsp";
		$menuURIFour = "academicBBSindex.jsp";
		/**下面定义三级菜单的链接**/
		$subMenuURIOne = "academicExchangeConference.jsp";
		$subMenuURITwo = "academicExchangeLecture.jsp";
		/**下面定义间隔线的四种不同的样式**/
		$classContentsecondLineOne = "contentsecondLine";
		$classContentsecondLineTwo = "contentsecondLineTwo";
		$classContentsecondLineThree = "contentsecondLineThree";
		$classContentsecondLineFour = "contentsecondLineFour";
		
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
		}else if($requestNum == 4){
			$line.addClass($classContentsecondLineFour);
			$realcontentID.load($menuURIFour);
		}
		
		//找到标签效果对应的标签，注册鼠标点击事件
		$("#tabsecond li").each(function(index){
			//是否有三级，无则然后隐藏
			if($(this).find('b').length){
				$childMenu.show();
			}else{
				$childMenu.hide();
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
				}else if (index == 3) {
					$line.addClass($classContentsecondLineFour);
					$realcontentID.load($menuURIFour);
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
			}
		});
	});
	//对于loading图片绑定ajax请求开始和交互结束的事件
	$("#contentsecond img").bind("ajaxStart",function(){
		//把div里面的内容清空
		$realcontentID.html("");
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
</script>

</head>
<body>
<!-- =======顶部========= -->
<div class="topFream">
	<div id="top">
		<div class="topP">
			<a href="manageAccessAction_index" title="返回首页"><img alt="返回" src="images/Previous.png" /></a>
			<span>模式识别与智能信息处理四川省高校重点实验室</span>
		</div>
		<div class="topS">
			<span><a href="javascript:void(0)">登录</a></span>&nbsp;|
			<span><a href="javascript:void(0)">注册</a></span>&nbsp;| 
			<span><a href="javascript:void(0)">我要留言</a></span>&nbsp;|
			<span><a href="javascript:void(0)">联系我们</a></span>
		</div> 
	</div>
</div><!-- end topFream -->
<div class="fream">
<!--=========左边框架===========  -->
	<div class="freamLeft">	
		<div class="tabTitle">
			<ul id="tabsecond">
			<!-- 二级菜单 -->
				<li class="tabOne">论坛帖子</li>
			</ul>
		</div>
		<div id="contentsecond">
			<div id="contentsecondLine" class="contentsecondLine">&nbsp;</div>
			<!-- 三级菜单 -->
			<div id="childMenu">
				<ul class="childMenuUl">
				</ul>
			</div>
			<img class="jiazai" alt="加载中。。。" src="images/img-loading.gif" />
			<!-- 需要加载的页面 -->
			<div id="realcontent"></div>
		</div>
	</div><!-- end freamLeft -->
<!-- ===========右边框架 ===============-->
	<div class="freamRight">
		<table class="mTable">
			<tr>
				<td><a href="../introduce/LabIntroduceMain.jsp">
					<div class="live-tile space op" style="background-color: #891676;">
					<img class="full" alt="" src="images/lab_About.png"> <span
						class="title_bar tile-title" style="">实验室介绍</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
				<td><a href="../train/trainMain.jsp">
					<div class="live-tile space op">
					<img class="full" alt="" src="images/lab_people.jpg"> <span
						class="title_bar tile-title" style="">人才培养</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
			</tr>
			<tr>
				<td><a href="../exchange/exchangeMain.jsp">
					<div class="live-tile space op">
					<img class="full" alt="" src="images/lab_coopration.png"> <span
						class="title_bar tile-title" style="">合作交流</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
				<td><a href="../download/downloadMain.jsp">
					<div class="live-tile space op" style="background-color: #D1603F;">
					<img class="full" alt="" src="images/lab_Download.png"> <span
						class="title_bar tile-title" style="">下载中心</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
			</tr>
			<tr>
				<td><a href="../achieve/achieveMain.jsp">
					<div class="live-tile space op">
					<img class="full" alt="" src="images/lab_tech.png"> <span
						class="title_bar tile-title" style="">科研成果</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
				<td><a href="../dynamic/dynamicMain.jsp">
					<div class="live-tile space op" style="background-color: #A09634;">
					<img class="full" alt="" src="images/lab_News.png"> <span
						class="title_bar tile-title" style="">最新动态</span>
					<!-- <p>样式代码在Metro.css第451行下</p> -->
					</div>
					</a>
				</td>
			</tr>
			<tr>
			<td class="longTD" colspan="2"><a href="../team/teamMain.jsp">
				<div class="live-tile two-wide space op">
				<img class="full" alt="" src="images/lab_teams.png"> <span
					class="title_bar tile-title" style="">科研队伍</span>
				<!-- <p>样式代码在Metro.css第451行下</p> -->
				</div>
				</a>
			</td></tr>
		</table>
	</div><!-- end freamRight -->
</div><!-- end fream -->
</body>
</html>
