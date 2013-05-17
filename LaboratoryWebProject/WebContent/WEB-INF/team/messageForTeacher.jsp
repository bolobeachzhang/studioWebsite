<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/base/bootstrap_modify_for_lab.css" />
<script type="text/javascript">
	
	$(function(){
		verifyObj = $("#Verify");
		verifyObj.click(function(){
			verifyObj.attr("src","SecurityCodeImageAction?timestamp="+new Date().getTime());
		});
	});
	
	function check(teacherId){
		var name = $("#name");
		if(name.val() == null || name.val() == ""){
			$("#error").text("* 昵称不能为空哦！");
			name.focus();
			return false;
		} else {
			$("#error").text("");
		}
		
		var code = $("#code");
		if(code.val() == null || code.val() == ""){
			$("#error").text("* 验证码不能为空哦！");
			code.focus();
			return false;
		} else {
			$("#error").text("");
		}
		
		var content = $("#content");
		if(content.val() == null || content.val() == ""){
			$("#error").text("* 内容不能为空哦！");
			content.focus();
			return false;
		} else {
			$("#error").text("");
		}
		alert(teacherId);
		$.ajax({
			type:"POST",
			url:"frontTeamAction_subMessage",
			data:"name="+name.val()+"&content="+content.val()+"&teacherId="+teacherId,
			success:function(msg){
				if(msg == "ok"){
					$("#error").text("* 给老师留言成功");
					name.val("");
					code.val("");
					content.val("");
				}
			}
		});
	}
	
	function checkCode(obj){
		var code = $(obj);
		if(code.val() == null || code.val() == ""){
			$("#error").text("* 验证码不能为空哦！");
			code.focus();
			return false;
		} else {
			$("#error").text("");
		}
		
		$.ajax({
			type:"post",
			url: "frontTeamAction_verify",
			data:"code="+code.val(),
			success: function(msg){
				if(msg == "ok"){
					$("#error").text("");
					return false;
				} else {
					$("#error").text("* 验证码输入错误哦！");
					code.focus();
					return false;
				}	
			}
		});
	}
</script>
<style type="text/css">
	#mform{
		width: 93%;
		height: 215px;
	}
	#mform span{
		float: left;
		margin-left: 53px;
	}
	#mform #nickname{
		float: left;
		margin-left: 53px;
		margin-top: 5px;
	}
	#mform #mcode{
		margin-top: 5px;
	}
	#mform textarea{
		float: left;
		margin-left: 53px;
		width: 640px;
		height: 100px;
	}
	#mform img{
		margin-top: -10px;
		margin-left: 10px;
		cursor: pointer;
	}
	#mform .btn{
		float: right;
		margin-right: 20px;
	}
	#mform #error{
		float: left;
		margin-left: 53px;
		color: red;
	}
	.partLine{
		border: 1px solid #9C4E4E;
		width: 653px;
		margin-left: 53px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.message{
		width: 653px;
		height:100%; overflow:auto;
		margin-left: 53px;
		position: relative;
		margin-top: 20px;
	}
	.message .messager{
		float: left;
		color: #994848;
	}
	.message .messageCon{
		width: 480px;
		float: left;
		text-align: left;
	}
	.message .messageTime{
		float: right;
	}
	.message .devideLine{
		color: #D7B8B8;
		margin-left: 75px;
	}
	.message .seperateLine{
		float: left;
		border: 1px solid #9C4E4E;
		width: 650px;
		margin-top: 10px;
	}
	.replay{
		width: 575px;
		margin-left: 78px;
	}
	.replay .replayName{
		float: left;
		color: #994848;
	}
	.replay .replayCon{
		float: left;
		width: 395px;
		text-align: left;
	}
	.replay .replayTime{
		float: right;
	}
	#paging{
		padding-bottom: 20px;
		padding-top: 20px;
	}
	#paging a{
		cursor: pointer;
	}
</style>
</head>
<body>
	<img id="headline" alt="" src="images/line.png">
	
 	<div id="mform">
 		<form action="" method="post">
	 		<span>给老师留言：</span><br>
			<div id="nickname">昵称：<input type="text" id="name"></div>
			<div id="mcode">验证码：<input type="text" id="code" onblur="checkCode(this)"><img id="Verify" alt="看不清?请点击图片更换" src="SecurityCodeImageAction" title="看不清?请点击图片更换"></div>
			<textarea id="content" name="content"></textarea>
			<div id="error"></div>
			<input type="button" value="提交留言" class="btn" onclick="check(${requestScope.teacherId})"> 
		</form>
	</div>
	
	<!-- 定格的分割线 -->
	<div class="partLine"></div>
	<c:if test="${fn:length(requestScope.messages) > 0 }"> <!-- 有留言才显示 -->
		<c:forEach var="message" items="${requestScope.messages }" varStatus="status">
			<!-- message start -->
			<div class="message">
				<div class="messager">${message.messager }：</div>
				<div class="messageCon">${message.messageCon }</div>
				<div class="messageTime">(${message.messageDate })</div>
				<div class="devideLine">*·········································································································································································</div>
				<c:if test="${message.replyCon != null }">
					<div class="replay">
						<div class="replayName">老师回复：</div>
						<div class="replayCon">${message.replyCon }</div>
						<div class="replayTime">(${message.replayDate })</div>
					</div>
				</c:if>
				<div class="seperateLine"></div>
			</div>
			<!-- message end -->
		</c:forEach>
	
		<!-- ==================================分页开始======================================== -->
		<div id="paging">
			当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
			<c:if test="${requestScope.pageNow > 1}">
				<a fff="frontTeamAction_getMessageForT?section=1&pageNow=${requestScope.pageNow - 1 }&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">上一页</a>&nbsp; 
			</c:if>
			<a fff="frontTeamAction_getMessageForT?section=1&pageNow=1&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">[1]</a>&nbsp;  
			<c:if test="${requestScope.pageCount != 1}">  
			    <c:choose>  
			        <c:when test="${requestScope.pageNow <= 5}">  
			            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
			                <a fff="frontTeamAction_getMessageForT?section=1&pageNow=${i}&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
			            </c:forEach>  
			        </c:when>  
			        <c:otherwise>  
			            ...&nbsp;  
			            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
			                end="${requestScope.pageNow}">  
			                <a fff="frontTeamAction_getMessageForT?section=1&pageNow=${i}&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
			            </c:forEach>  
			        </c:otherwise>  
			    </c:choose>  
			    <c:choose>  
			        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
			            || requestScope.pageCount-4<=0}">  
			            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
			                end="${requestScope.pageCount}">  
			                <a fff="frontTeamAction_getMessageForT?section=1&pageNow=${i}&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
			            </c:forEach>  
			        </c:when>  
			        <c:otherwise>  
			            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
			                end="${requestScope.pageNow+3}">  
			                <a fff="frontTeamAction_getMessageForT?section=1&pageNow=${i}&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
			            </c:forEach>  
			            ...&nbsp;  
			            <a fff="frontTeamAction_getMessageForT?section=1&pageNow=${requestScope.pageCount}&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">  
			                [${requestScope.pageCount}]</a>&nbsp;  
			        </c:otherwise>  
			    </c:choose>  
			    <c:if test="${requestScope.pageNow < requestScope.pageCount}">
					<a fff="frontTeamAction_getMessageForT?section=1&pageNow=${requestScope.pageNow + 1 }&teacherId=${requestScope.teacherId }" onclick="pageQuery(this)">下一页</a>&nbsp; 
				</c:if>
			</c:if>  
		</div>
		<!-- ==================================分页结束======================================== -->
	</c:if>
	
	
	
</body>
</html>