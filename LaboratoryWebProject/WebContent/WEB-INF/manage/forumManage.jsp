<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src=""></script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
var checkState = false; //是否被全选中
function pickadd(obj){
	if(!checkState){
		$("[name = mcheckbox]:checkbox").attr("checked",true); //全选中
		checkState = true;
		$(obj).html("反选");
	} else {
		$("[name = mcheckbox]:checkbox").attr("checked",false);
		checkState = false;
		$(obj).html("全选");
	}
}
//删除选中项
function deleteChecked(){
	var resoult = new Array();
	$("[name = mcheckbox]:checkbox").each(function(){
		if($(this).is(":checked")){
			resoult.push($(this).attr("value"));
		}
	});
	if(resoult.length<1)
		{
			alert("您还没选中任何元素!");
			return false;
		}
	if(confirm("您确定要删除选中主题和主题下的所有回帖信息?"))
		{
			$.ajax({
			type: "POST",
			url: "manageForumAction_deleteCheckedMany_TC",
			data: "resoult="+resoult,
			beforeSend: function (){
				$("#loding").show();
			},
			success: function(msg){
				if(msg == "ok"){
					$("[name = mcheckbox]:checkbox").each(function(){
						if($(this).is(":checked")){
							$(this).closest("tr").empty();
						}
					});
				}
			},
			complete: function(){
				$("#loding").hide();
			}
		});
		}
}
</script>
<style type="text/css">
	.mTable{
		width: 700px;
		margin-left: 25px;
		margin-top: 20px;
	}
	.mTable th{
		padding: 0px;
		padding-left: 5px;
	}
	.mTable td{
		padding: 0px;
		padding-left: 5px;
	}
	#paging{
		width: 700px;
		height:20px;
		margin-left: 20px;
		position: relative;
		float: left;
	}
	#mdelete{
		float: right;
	}
</style>
</head>
<body>
	<div id="loding" style="z-index: 9999;background-color: rgba(0,0,0,0.2);position: absolute;top: 50%;left: 50%;display: none;">
		<p style="padding:10px 10px 0px 10px;"><img alt="loding" src="images/Loading01.gif">页面加载中...</p>
	</div>
	<table class="table table-striped table-bordered mTable">
		<thead>
			<tr>
				<th>选中</th>
				<th>主题</th>
				<th>创建者</th>
				<th>创建者身份</th>
				<th>创建时间</th>
				<th>详细</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${ForumList}" var="forum">
				<tr>
					<td style="width: 40px;"><input style="margin-top: 0px;margin-left: 10px;" type="checkbox" name="mcheckbox" value="${forum.id}"></td>
					<td>${forum.topic_content }</td>
					<td>${forum.spokerName }</td>
					<td>${forum.spokerType }</td>
					<td>${forum.spokerTime }</td>
					<td><a href="manageForumAction_getTopic_content?parentId=${forum.id}">查看帖子</a></td>
					<td><a href="manageForumAction_deleteOne_T_allC?id=${forum.id}&pageNow=${pageNow}">删除</a></td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	
	<!-- ==================================分页======================================== -->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<a href="manageForumAction_showTopicThemeByPage?&pageNow=1">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a href="manageForumAction_showTopicThemeByPage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a href="manageForumAction_showTopicThemeByPage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a href="manageForumAction_showTopicThemeByPage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a href="manageForumAction_showTopicThemeByPage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a href="manageForumAction_showTopicThemeByPage?&pageNow=${requestScope.pageCount}">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		</c:if>  
	<div id="mdelete"><a href="javascript:;" onclick="pickadd(this)">全选</a> <a href="javascript:;" onclick="deleteChecked()">删除选中</a></div>
	</div>
	
</body>
</html>