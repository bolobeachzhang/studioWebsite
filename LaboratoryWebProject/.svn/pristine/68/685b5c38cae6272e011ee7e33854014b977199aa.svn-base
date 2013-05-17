<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成都大学-模式识别与智能信息处理重点实验室-首页</title>
<link rel="shortcut icon" href="images/background.jpg" />
<link rel="stylesheet" href="css/base/mystyle.css" type="text/css">
<link rel="stylesheet" href="css/base/Metro.css" type="text/css">
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.pointer-1.0.js"></script>
<script type="text/javascript" src="js/front/MetroJs.lt.js"></script>
<script type="text/javascript" src="./js/jquery/jquery.pointer-1.0.js"></script>
<script type="text/javascript" src="./js/jquery/time.js"></script>
<script type="text/javascript">
$(window).load(function(){/*网页载入的时候载入以下动作  */
	var imgs=[{src:'images/lab_coopration.png'}];/* 配合‘合作交流’动作 */
	/*分别为实验室介绍、最新动态、科研队科研成过设置动作  */
	var $tiles = $("#tile1,#tile2,#tile3,#tile6").liveTile({
		playOnHover:true,
		repeatCount:0,
		delay:0,
		startNow:false
	});
	/*  科研成果模块的flip效果*/
	$("#flip1").liveTile({ startNow:true });
	$("#tile10").liveTile({
		pauseOnHover:true
	});
	/*end  */
	/* 轮播按钮的动作 */
	$(".prev").click(function(){
	    $("#tile10").liveTile("goto", "prev");
	});
	$(".next").click(function(){
	    $("#tile10").liveTile("goto", "next");
	    // or
	    //$("#tile1").liveTile("goto");
	});
	/* end */
	
	/* 合作交流的动作 */
	$("#tile4").liveTile({
		mode:'slide',        
	      frontImages: imgs,
	      frontIsRandom: false
	});
	/* 人才培养和下载中心的点击动作 */
	$("#tile5,#tile7").liveTile();
});
	</script>
<style type="text/css">

</style>
</head> 
<body>
	<div id="div1">
		<div class="div2">
<!-- 将导航磁贴放在table中 -->
			<table>
<!--第一行  -->
				<tr>
					<td class="replace">
				<!-- 导航磁贴1：实验室介绍（样式和布局 -->
						<div class="tiles red">
							<div class="live-tile shadow" id="tile1" data-mode="flip"  data-direction="horizontal" >
								<div ><!--引用样式让标题居中  -->
									<!-- <a class="full" href="#">front title</a>  -->
									<img alt="" src="images/lab_About.png">
									<span class="tile-title">实验室介绍</span>
								</div>
								<div>
									<a href="frontIntroduceAction_getIntro?section=1">实验室概况</a><br> 
									<a href="frontIntroduceAction_getIntro?section=2">组织机构</a><br>
									<a href="frontIntroduceAction_getIntro?section=3">学术带头人</a><br> 
									<a href="frontIntroduceAction_getIntro?section=4">实验室主任</a>
									  <span class="tile-title"><a href="frontIntroduceAction_getIntro?section=1" class="full">实验室介绍</a></span>
								</div>
							</div>
						</div> 
				<!-- end -->
						</td>
					
					<td class="replace">
				<!--导航磁贴2：最新动态（样式和布局)  -->
						<div class="live-tile cyan shadow" id="tile2" data-mode="slide">
							<div>
								<!-- <a class="full" href="#">front title</a>  -->
								<img  class="full" alt="" src="images/lab_News.png">
								<span class="tile-title">最新动态</span>
							</div>
							<div>
								    <a href="frontDynamicAction_getDynamic?section=1">行业动态</a><br> 
									<a href="frontDynamicAction_getDynamic?section=2">实验室新闻</a><br>
									<a href="frontDynamicAction_getDynamic?section=3">创新文化</a><br> 
									<a href="frontDynamicAction_getDynamic?section=4">通知公告</a>
								<span class="tile-title"><a href="frontDynamicAction_getDynamic?section=1" class="full">最新动态</a></span>
							</div>
						</div>
				<!-- end -->
						</td>
				
					<td colspan="2" class="replace1">
				<!--导航磁贴3：研究队伍（样式和布局)  -->
					<div class="live-tile green two-wide shadow" id="tile3" data-mode="slide"  data-direction="horizontal">
							<div>
								<!-- <a class="full" href="#">front title</a> -->
								<img class="full" alt="" src="images/lab_teams.png"> 
								<!--<span class="tile-title">研究队伍</span>-->
							</div>
							<div>
								    <a href="frontTeamAction_getTeam?section=1">研究方向</a><br> 
									<a href="frontTeamAction_getTeam?section=2">职称</a><br>
									<a href="frontTeamAction_getTeam?section=3">岗位</a><br> 
								<span class="tile-title"><a href="frontTeamAction_getTeam?section=1" class="full">研究队伍</a></span>
							</div>
						</div>
				<!-- end -->
					</td>
				</tr>
<!-- 第一行end -->
				<tr>
				<!--导航磁贴4：合作交流（样式和布局)  -->
					<td class="replace2">
					<div id="tile4" class="live-tile slide bounce shadow" data-link="frontExchangeAction_getExchange?section=1" data-delay="2500" data-stack="true" data-bounce="true" data-stops="50%,100%,0" >
						<div>
							 <img class="full" alt="" src="images/lab_coopration.png">
							 <span class="tile-title">合作交流</span>	
						 </div>
						 <div style="background-color: olive;">
         					 <p>This tile swaps the front image in sequence everytime the the tile hits 100%</p>
       					 </div>
					</div>				
					</td>
				<!--导航磁贴5：人才培养（样式和布局)  -->
					<td class="replace2">
					<div id="tile5" class="live-tile shadow bounce" data-bounce="true" data-mode="none" data-link="frontTrainAction_getTrain?section=1">
							<img class="full" alt="" src="images/lab_people.jpg">
				        	<span class="tile-title" style="text-align:center;">人才培养</span>	
					</div>
					</td>
				<!--导航磁贴6：科研成果（样式和布局)  -->
					<td class="replace2">
					<!-- start -->
								<div class="mango tiles">
								   <div class="live-tile brown shadow" id="tile6" data-mode="slide">
									    <div class="list-tile" >
									        <span class="tile-title title_bar">科研成果</span>
									        <ul id="flip1" class="flip-list fourTiles" data-initdelay="500" data-mode="flip-list" data-delay="1000">
									            <li>
									                <div class="accent cobalt"><!-- Put images or other content here --><img src="images/lab_technology_01.gif"/></div>
									                <div><!-- Put images or other content here -->论文</div>
									            </li>
									            <li>
									                <div class="accent cobalt"><!-- Put images or other content here --><img src="images/lab_technology_02.gif"/></div>
									                <div><!-- Put images or other content here -->获奖</div>
									            </li>
									            <li>
									                <div class="accent cobalt"><!-- Put images or other content here --><img src="images/lab_technology_03.gif"/></div>
									                <div><!-- Put images or other content here 这个div里不设置内容--></div>
									            </li>
									            <li data-direction="horizontal">
									                <div class="accent cobalt"><!-- Put images or other content here --><img src="images/lab_technology_04.gif"/></div>
									                <div><!-- Put images or other content here -->其他</div>
									            </li>
									        </ul>
									    </div>
							        <div>
							            <a href="frontAchieveAction_getAchieve?section=1">论文</a><br> 
										<a href="frontAchieveAction_getAchieve?section=2">获奖</a><br>
										<a href="frontAchieveAction_getAchieve?section=3">其他</a><br> 
							            <span class="tile-title"><a href="frontAchieveAction_getAchieve?section=1">科研成果</a></span>
							        </div>
							    </div>
							</div>								
					<!--end  -->
					</td>
				<!-- end -->
				<!--导航磁贴7：下载中心（样式和布局)  -->
					<td class="replace2">
					<div id="tile7" class="live-tile shadow emerald bounce" data-link="frontDownloadAction_getDownload?section=1" data-bounce="true" data-mode="none"><!-- 样式bounce是一个点击样式 -->
						<div>
							<img class="full" src="images/lab_Download.png">
							<span class="tile-title">下载中心</span>	
						</div>
					</div>
					</td>
				<!-- end -->
				</tr>
<!-- 第二行end -->
			</table>
		</div>
		<c:if test="${sessionScope.USER_LOGIN != 1 }">
			<p class="mp"><a href="frontIndexAction_login">登录 </a>|<a href="frontIndexAction_regist"> 注册</a> | <a href="frontIndexAction_getMessage?section=1">我要留言</a> | <a href="frontIndexAction_getMessage?section=2">联系我们</a>&nbsp;&nbsp;</p>
		</c:if> 
		<c:if test="${sessionScope.USER_LOGIN == 1 }">
			<p class="mp">欢迎您 ${sessionScope.USER_NAME } | <a href="frontIndexAction_logout">退出</a> | <a href="frontIndexAction_getMessage?section=1">我要留言</a> | <a href="frontIndexAction_getMessage?section=2">联系我们</a> | <a href="frontIndexAction_manage">后台管理</a></p>
		</c:if> 
<!-- scroll-view -->
		<div id="div3">
		<!-- 公告栏和轮播按钮 -->
			<span  id="dot"> 公告栏</span>
				<!-- 轮播按钮样式 -->
					<div class="clear" id="scroll_button">
						    <a href="javascript:;" class="prev"><img src="images/lab_prev.png" style="border: none;"  width="36" height="36"/></a>&nbsp;&nbsp;
						    <a href="javascript:;" class="next"><img src="images/lab_next.png" style="border: none;" width="36" height="36"/></a>    
					</div>
				<!-- 轮播end -->
		<!-- 公告栏和轮播按钮end -->
		
		<!-- 以下为轮播内容 -->
					<div class="tile-group" ><!-- 这里要去掉框架metro.css中第270行的overflow:hidden属性并且要去掉div之前应用的red样式，否则背景不会透明 -->
					   	 <div id="tile10" data-mode="carousel" data-start-now="true" class="live-tile" data-direction="horizontal" data-delay="2000">        
							   <!-- 显示实验室概况 -->
							     <div>
							     		<!-- <div class="scroll_content"><span>●</span><a href="download/downloadMain.jsp" title="1小江江疯了1小江江疯了1小江江疯了" target="_blank">1小江江疯了</a><label>【2013.04.12】</label></div> -->
										<c:forEach items="${introduceList}" var="article">
											<div class="scroll_content"><span>●</span><a limit="18" href="frontExchangeAction_showArticleDetail?id=${article.id}" style="cursor:pointer;" title="${article.title }" target="_blank">${article.title }</a><label limit="11">【${article.createTime}</label></div>
										</c:forEach>								     	    
							     </div>
							    <!-- 实验室概况end -->
							    <!-- 最新动态 --> 
							        <div>
							     	   <c:forEach items="${dynamicList}" var="article">
											<div class="scroll_content"><span>●</span><a limit="18" href="frontExchangeAction_showArticleDetail?id=${article.id}" style="cursor:pointer;" title="${article.title }" target="_blank">${article.title }</a><label limit="11">【${article.createTime}</label></div>
										</c:forEach>	
							        </div>
							    <!-- 最新动态end -->
							    <!-- 科研成果 -->
							        <!-- <div class="accent emerald"><p class="23metroExtraLarge">2 and a half</p> -->
							        <div>
							     	   <c:forEach items="${achieveList}" var="article">
											<div class="scroll_content"><span>●</span><a limit="18" href="frontExchangeAction_showArticleDetail?id=${article.id}" style="cursor:pointer;" title="${article.title }" target="_blank">${article.title }</a><label limit="11">【${article.createTime}</label></div>
										</c:forEach>	
							        </div>
							     <!-- 科研成果end -->
							    <!-- 公告 -->
							        <div>
							        	<c:forEach items="${exchangeList}" var="article">
											<div class="scroll_content"><span>●</span><a limit="18" href="frontExchangeAction_showArticleDetail?id=${article.id}" style="cursor:pointer;" title="${article.title }" target="_blank">${article.title }</a><label limit="11">【${article.createTime}</label></div>
										</c:forEach>	
							        </div>
							     <!-- 公告end -->
							     <!-- 合作交流 -->
							        <div>
							        	<c:forEach items="${announcementList}" var="article">
											<div class="scroll_content"><span>●</span><a limit="18" href="frontExchangeAction_showArticleDetail?id=${article.id}" style="cursor:pointer;" title="${article.title }" target="_blank">${article.title }</a><label limit="11">【${article.createTime}</label></div>
										</c:forEach>	
							        </div> 
							     <!--合作交流end  -->
							    </div>
			   		 </div> 
		</div>
<!-- scroll-view end -->
	</div>
	<div id="div4">
		<p>${requestScope.aboutUs.copyRight } </p>
		<p>地址： ${requestScope.aboutUs.address } </p>
		<p>电话 ${requestScope.aboutUs.phoneNuber } 邮编：${requestScope.aboutUs.postCode }</p>
	</div>
</body>
</html>