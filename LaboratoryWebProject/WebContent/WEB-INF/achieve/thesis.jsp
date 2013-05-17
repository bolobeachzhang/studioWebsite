<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<style type="text/css">
	body{
		font-family: "微软雅黑";
	}
	#line{
		margin-top: 36px;
	}
	#titleDiv{
		margin-top:5px;
		margin-left: 53px;
		width: 650px;
		font-size: 18px;
		color: #FFFFFF;
	}
	#titleSpan{
		padding:2px 10px 2px 10px;
		float: left;
		background-color: #8fa1b8;
	}
	#downloadSpan{
		padding:2px 10px 2px 10px;
		float: right;
		background-color: #8fa1b8;
		cursor: pointer;
		color: #FFFFFF;
	}
	#downloadSpan:hover{
		background-color: #FCAD3B;
		text-decoration: none;
	}
	#summary{
		margin-left: 53px;
		margin-top:40px;
		width: 650px;
		height: auto !important;
		min-height: 30px;
		overflow: auto;
		text-align: left;
		font-size: 14px;
	}
	#summaryCon{
		margin-left:30px;
		width: 610px;
		height: auto !important;
		min-height: 30px;
		overflow: auto;
		text-indent:2em;
	}
	#mTable{
		margin-left: 53px;
		margin-top:20px;
		width: 650px;
		font-size: 14px;
	}
	#mTable td{
		border: 1px dotted #BFC8D4;
		text-align: left;
		height: 35px;
		padding-left: 19px;
	}
	#mTable tr.odd{
		background-color: #efefef;
	}
	.mTd{
		width: 150px;
	}
	
</style>
</head>
<body>
	<img id="line" src="images/line.png">
	<div id="titleDiv"><span id="titleSpan">${requestScope.thesis.headLine }</span>
					   <c:if test="${sessionScope.USER_TYPE >= requestScope.thesis.downrole }">
					   		<c:if test="${requestScope.thesis.url != null }">
					   			<a id="downloadSpan" href="${requestScope.thesis.url }">点击下载</a>
					   		</c:if>
					   </c:if>
	</div>
	<div id="summary">论文摘要：
		<div id="summaryCon">${requestScope.thesis.digest }</div>
	</div>
	<table id="mTable">
		<tr class="odd"><td class="mTd">论文类型</td><td>
													<c:if test="${requestScope.thesis.type == 1 }">
														<c:out value="一般期刊"></c:out>
													</c:if>
													<c:if test="${requestScope.thesis.type == 2 }">
														<c:out value="核心期刊"></c:out>
													</c:if>
													<c:if test="${requestScope.thesis.type == 4 }">
														<c:out value="EI"></c:out>
													</c:if>
													<c:if test="${requestScope.thesis.type == 8 }">
														<c:out value="SIC"></c:out>
													</c:if>
													</td></tr>
		<tr><td class="mTd">期刊名</td><td>${requestScope.thesis.journalTitle }</td></tr>
		<tr class="odd"><td class="mTd">发表时间</td><td>${requestScope.thesis.time }</td></tr>
		<tr><td class="mTd">论文作者</td><td>${requestScope.thesis.author }</td></tr>
		<tr class="odd"><td class="mTd">论文大小</td><td>${requestScope.thesis.size } MB</td></tr>
		<tr><td class="mTd">论文格式</td><td>${requestScope.thesis.format }</td></tr>
		<tr class="odd"><td class="mTd">下载次数</td><td>${requestScope.thesis.downloads } 次</td></tr>
	</table>
</body>
</html>