<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.pointer-1.0.js"></script>
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
		if(resoult.length <= 0){
			alert("还没有选中项");
			return;
		}
		$.ajax({
			type: "POST",
			url: "manageMessageAction_deleteChecked",
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
	
	function mdelete(id,obj){
		$.ajax({
			type: "POST",
			url: "manageMessageAction_deleteOne",
			data: "id="+id,
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
	
	//显示回复框
	function showReplayTable(obj,messager,messageCon,messageDate,replyCon,messageId){
		$("#replayTable").slideDown();
		$("#messager").html(messager);
		$("#messageDate").html(messageDate);
		$("#messageCon").html(messageCon);
		$("#replayCon").html(replyCon);
		
		$("#cancle").click(function(){
			$("#replayTable").slideUp();
		});
		
		$("#dele").click(function(){
			mdelete(messageId,obj);
			$("#replayTable").slideUp();
			$(obj).closest("tr").empty();
		});
	}
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.mTable{
		margin-top: 20px;
		margin-left: 25px;
		width: 700px;
	}
	.mTable th{
		padding: 0px;
		padding-left: 5px;
	}
	.mTable td{
		padding: 0px;
		padding-left: 5px;
	}
	.mTable textarea{
		width: 300px;
		height: 80px;
	}
	#messageDate{
		margin-left: 370px;
	}
	.mTable button {
		margin-right: 20px;
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
	#replayTable{
		display: none;
		z-index: 999;
		position: absolute;
		background-color: rgba(88,88,88,0.8);
		top: 0px;
		left: 0px;
		width: 100%;
		height: 320px;
		
	}
	#replayTable table{
		width: 700px;
		margin-top: 20px;
		margin-left: 25px;
	}
	#replayTable table td{
		padding: 0px;
		color: FFF;
	}
	#replayTable textarea{
		width: 410px;
		height: 80px;
	}
</style>
</head>
<body>
	<div id="loding" style="z-index: 9999;background-color: rgba(0,0,0,0.2);position: absolute;top: 50%;left: 50%;display: none;">
		<p style="padding:10px 10px 0px 10px;"><img alt="loding" src="images/Loading01.gif">页面加载中...</p>
	</div>
	
	<c:choose>
		<c:when test="${requestScope.messages == null}">
			<span>暂时没有更多信息</span>
		</c:when>
		<c:otherwise>
			
				<table class="table table-striped table-bordered mTable">
					<thead><tr>
						<th>选中</th><th>留言者</th><th>留言内容</th><th>留言时间</th><th>回复内容</th><th>查看</th><th>操作</th>
					</tr></thead>
					<tbody>
					<c:forEach var="message" items="${requestScope.messages }" varStatus="status">
						<tr>
							<td style="width: 40px;"><input style="margin-top: 0px;margin-left: 10px;" type="checkbox" name="mcheckbox" value="${message.messageId }"></td> 
							<td>${message.messager }</td>
							<td limit="15">${message.messageCon }</td>
							<td>${message.messageDate }</td>
							<td limit="15">${message.replyCon }</td>
							<td><a href="javascript:;" onclick="showReplayTable(this,'${message.messager }','${message.messageCon }','${message.messageDate }','${message.replyCon }',${message.messageId})">回复留言</a></td>
							<td><a href="javascript:;" onclick="mdelete(${message.messageId},this)">删除留言</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			
		</c:otherwise>
	</c:choose>
	<!-- ==================================分页======================================== -->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<a href="manageMessageAction_showMUnchecked?&pageNow=1">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a href="manageMessageAction_showMUnchecked?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a href="manageMessageAction_showMUnchecked?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a href="manageMessageAction_showMUnchecked?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a href="manageMessageAction_showMUnchecked?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a href="manageMessageAction_showMUnchecked?&pageNow=${requestScope.pageCount}">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		</c:if>  
	<div id="mdelete"><a href="javascript:;" onclick="pickadd(this)">全选</a> <a href="javascript:;" onclick="deleteChecked()">删除选中</a></div>
	</div>
	
	
	<div id="replayTable">
	<table  class="table table-bordered " >
		<tr><td colspan="2"><span id="messager" style="color: #FFFFFF;"></span><span id="messageDate" style="color: #FFFFFF;"></span></td></tr>
		<tr><td><span style="color: #FFFFFF;">内容：</span></td><td><textarea id="messageCon" readonly="readonly"></textarea></td></tr>
		<tr><td><span style="color: #FFFFFF;">回复：</span></td><td><textarea id="replayCon" readonly="readonly"></textarea></td></tr>
		<tr><td colspan="2">
			<button  id="dele" style="margin-left: 150px;margin-right: 20px;" class="btn">删除留言</button>
			<button  id="cancle" style="margin-left: 20px;margin-right: 20px;" class="btn">取消查看</button>
			</td></tr>
	</table>
	</div>
</body>
</html>