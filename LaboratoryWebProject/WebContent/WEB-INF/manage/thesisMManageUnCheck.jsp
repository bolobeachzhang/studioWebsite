<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		var resoultId = new Array();
		var resoultUrl = new Array();
		$("[name = mcheckbox]:checkbox").each(function(){
			if($(this).is(":checked")){
				resoultId.push($(this).attr("value"));
				resoultUrl.push($(this).attr("url"));
			}
		});
		if(resoultId.length <= 0){
			alert("还没有选中项");
			return;
		}
		$.ajax({
			type: "POST",
			url: "manageThesisAction_deleteChecked",
			data: "resoultId="+resoultId+"&resoultUrl="+resoultUrl,
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
	
	function mdelete(id,url,obj){
		$.ajax({
			type: "POST",
			url: "manageThesisAction_deleteOne",
			data: "id="+id+"&url="+url, 
			beforeSend: function (){
				$("#loding").show();
			},
			success: function(msg){
				if(msg == "ok"){
					$(obj).closest("tr").empty();
				}
			},
			complete: function(){
				$("#loding").hide();
			}
		});
	}
	
	function getPass(id,obj){
		$.ajax({
			type: "POST",
			url: "manageThesisAction_pass",
			data: "id="+id, 
			beforeSend: function (){
				$("#loding").show();
			},
			success: function(msg){
				if(msg == "ok"){
					alert("审核通过");
					$(obj).parent("td").siblings(".pass").html("已审核");
				}
			},
			complete: function(){
				$("#loding").hide();
			}
		});
	}
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
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
		margin-left: 25px;
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
	<c:choose>
		<c:when test="${requestScope.thesiss == null}">
			<span>暂时没有更多信息</span>
		</c:when>
		<c:otherwise>
			<table class="table table-striped table-bordered mTable">
				<thead>
					<tr><th>选中</th><th>标题</th><th>类型</th><th>期刊名</th><th>作者</th><th>审核状态</th><th>详情</th><th>审核</th><th>操作</th></tr>
				</thead>
				<tbody>
				<c:forEach var="thesis" items="${requestScope.thesiss }" varStatus="status">
					<tr><td style="width: 40px;"><input style="margin-top: 0px;margin-left: 10px;" type="checkbox" name="mcheckbox" url="${thesis.url }"></td>
						<td>${thesis.headLine }</td>
						<td>
							<c:if test="${thesis.type == 1}"><c:out value="一般期刊"></c:out></c:if>
							<c:if test="${thesis.type == 2}"><c:out value="核心期刊"></c:out></c:if>
							<c:if test="${thesis.type == 4}"><c:out value="EI"></c:out></c:if>
							<c:if test="${thesis.type == 8}"><c:out value="SIC"></c:out></c:if>
						</td> 
						<td>${thesis.journalTitle }</td>
						<td>${thesis.author }</td>
						<td class="pass">
							<c:if test="${thesis.checkState == 0}"><c:out value="未审核"></c:out></c:if>
							<c:if test="${thesis.checkState == 1}"><c:out value="已审核"></c:out></c:if>
						</td>
						<td><a href="manageThesisAction_updateT?id=${thesis.id }">查看</a></td>
						<td><a href="javascript:;" onclick="getPass(${thesis.id},this)">审核通过</a></td> 
						<td><a href="javascript:;" onclick="mdelete(${thesis.id},'${thesis.url }',this)">删除</a></td></tr> 
				</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	
	<!-- ==================================分页======================================== -->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<a href="manageMessageAction_showMUncheck?&pageNow=1">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a href="manageMessageAction_showMUncheck?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a href="manageMessageAction_showMUncheck?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a href="manageMessageAction_showMUncheck?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a href="manageMessageAction_showMUncheck?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a href="manageMessageAction_showMUncheck?&pageNow=${requestScope.pageCount}">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		</c:if>  
	<div id="mdelete"><a href="javascript:;" onclick="pickadd(this)">全选</a> <a href="javascript:;" onclick="deleteChecked()">删除选中</a></div>
	</div>
</body>
</html>