<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>被包含的个人详情</title>
<style type="text/css">
	body{
		font-family: "微软雅黑";
	}
	#mTable{
		width: 500px;
		background-color:#E2E2E2;
		margin-top: 38px;
		margin-left: 60px;
		float: left;
	}
	#mTable td{
		line-height: 40px;
		border:1px solid #949494;
	}
	#pictureDiv {
		width: 102px;
		height: 102px;
		border: 2px solid #949494 ;
		float: left;
		margin-top: 38px;
		margin-left: 20px;
	}
	#pictureDiv img{
		width: 100px;
		height: 100px;
	}
	#introduceDiv{
		width: 500px;
		float: left;
		text-align: left;
		margin-left: 60px;
		margin-top: 10px;
	}
	#introduceDiv span{
		font-size: 16px;
	}
	#introduceDiv div{
		width: 450px;
		height: auto !important;
		min-width: 30px;
		height: 30px;
		overflow: auto;
		font-size: 14px;
		margin-left: 30px;
		margin-top: 3px;
	}
	#thesisDiv{
		width: 500px;
		float: left;
		margin-left: 60px;
		margin-top: 10px;
		text-align:left;
	}
	#thesisDiv span{
		font-size: 16px;
	}
	#thesisDiv .thesis{
		width: 450px;
		line-height:25px;
		font-size: 14px;
		margin-left: 30px;
		margin-top: 3px;
	}
	#messageDiv{
		width: 500px;
		margin-left: 60px;
		text-align: right;
		color: #48837F;
	}
	#messageDiv a{
		cursor: pointer;
	}
</style>
</head>
<body>
<table id="mTable"> 
	<tr><td style="width:126px;text-align: center;">姓名：</td><td>${requestScope.teacher.name }</td></tr>
	<tr><td>电话：</td><td>${requestScope.teacher.phoneNumber }</td></tr>
	<tr><td>邮箱：</td><td>${requestScope.teacher.email }</td></tr>
	<tr><td>研究方向：</td><td>${requestScope.teacher.research }</td></tr>
	<tr><td>职称：</td><td>${requestScope.teacher.title }</td></tr>
	<tr><td>岗位：</td><td>${requestScope.teacher.post }</td></tr>
</table>
<!-- 加载教师图片 -->
<c:if test="${requestScope.teacher.pictureUrl != null }">
	<div id="pictureDiv"><img id="picture" src="${requestScope.teacher.pictureUrl }"></div>
</c:if>

<div id="introduceDiv"><span>简介</span>
	<div>${requestScope.teacher.introduction }</div>
</div>
<c:if test="${fn:length(requestScope.thesiss) > 0 }">
	<div id="thesisDiv"><span>科研论文</span>
		<c:forEach var="thesis" items="${requestScope.thesiss }" varStatus="status">
			<div class="thesis">${status.index + 1}. <a href="">${thesis.headLine }</a>; 
			<c:if test="${thesis.type == 1 }">
				<c:out value="一般期刊"></c:out>
			</c:if>
			<c:if test="${thesis.type == 2 }">
				<c:out value="核心期刊"></c:out>
			</c:if>
			<c:if test="${thesis.type == 4 }">
				<c:out value="EI"></c:out>
			</c:if>
			<c:if test="${thesis.type == 8 }">
				<c:out value="SIC"></c:out>
			</c:if>; 
			${thesis.time }; 
			下载次数：${thesis.downloads }</div>
		</c:forEach>
	</div>
</c:if>
<div id="messageDiv"><a fff="frontTeamAction_getMessageForT?teacherId=${requestScope.teacher.teacherId }" onclick="pageQuery(this)">-->给他留言</a></div>
</body>
</html>