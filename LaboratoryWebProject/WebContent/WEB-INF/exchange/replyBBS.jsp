<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回帖页面</title>
<link type="text/css" rel="stylesheet" href="css/base/bootstrap_modify_for_lab.css" />
<link href="css/second/replyBBS.css" rel="stylesheet" media="screen">
<script charset="utf-8" src="./kindeditor-4.1.5/kindeditor.js"></script>
<script charset="utf-8" src="./kindeditor-4.1.5/kindeditor-min.js"></script>
<script charset="utf-8" src="./kindeditor-4.1.5/lang/zh_CN.js"></script>
<script charset="utf-8" src="./kindeditor-4.1.5/code/prettify.js"></script>
<script type="text/javascript" src="./js/jquery/jquery.wordlimitor-1.0.1.js"></script>	
<script src="./js/jquery/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("#pointDiscuss a").click(function(){
		document.getElementById("textareacontent").focus();
	});
	//ajax提交回帖信息
	$("#replyContent").click(function()
			{
				var replyContent = $.trim($("#textareacontent").val());
				if(replyContent == "" || replyContent == null)
					{
						alert("回帖内容不能为空 !");
						return false;
					}
				var replyId = $("#parentId").val();
				$.post("frontExchangeAction_addFourmContent",{
						content:replyContent,
						parentId:replyId
						},function(data)
							{
								alert("回帖成功＾＿＾");
								$("#textareacontent").val("");		//清空				
							});
			});
	
	
});

</script>
</head>
<body>
<div id="div0">
	<div id="div"></div>
	<!-- ===论坛主题==== -->
	<div id="div1">
		<p class="p">主题显示：${forumTitle.topic_content}
			<label id="pointDiscuss"><a href="#fatie">评论</a></label>
		</p>
		<!-- 回帖显示 -->
	 	<c:forEach items="${forumList}" var="forum">
	 		<div class="replyList">
	 			<div id="div3">
	 				<img alt="" src="./images/BBSPeplePhotos/bg.jpg"/>
	 			</div>
	 			<div class="div4content">
					${forum.topic_content}				
			   </div>
			 <p class="p0">
			   ${forum.spokerTime}
			</p>
	 	</div>
	 	</c:forEach>
	</div>
	<!-- 分页 ------------------------------------------------------------------------------------------------->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<c:if test="${requestScope.pageNow > 1 }">
			<a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${requestScope.pageNow-1}" onclick="pageQuery(this)" style="cursor:pointer;">上一页</a>&nbsp; 
		</c:if>
		<a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=1" onclick="pageQuery(this)" style="cursor:pointer;">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i}]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i}]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${requestScope.pageCount}" onclick="pageQuery(this)" style="cursor:pointer;">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		   <c:choose>
		   	 <c:when test="${requestScope.pageNow < requestScope.pageCount}">
		    	<a fff="frontExchangeAction_queryContentByparentId?id=${forumTitle.id}&pageNow=${requestScope.pageNow+1}" onclick="pageQuery(this)" style="cursor:pointer;">下一页</a> 
		    </c:when>
		   </c:choose>
		</c:if>  
	</div>
	
	<!-- ===回复==== -->
	<div id="div2">
		<a name="fatie"></a>
		<p class="p">&nbsp;&nbsp;回复</p>
		<p class="p1">
			<input type="hidden" value="${forumTitle.id}" id="parentId">
			<textarea id="textareacontent"></textarea>
		</p>
		<input type="button" class="btn" id="replyContent" value="提交" style="float: right;margin-right: 50px;">
	</div>
	</div>
</body>
</html>