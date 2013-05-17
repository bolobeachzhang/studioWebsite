<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>科研论文</title>
<style type="text/css">
	.mTable{
		width: 90%;
		height: auto;
		margin-left: 53px;
		margin-top: 20px;
	}
	.mTable th{
		padding: 0px;
		height: 29px;
	}
	.mTable td{
		padding: 0px;
		height: 29px;
	}
	#paging{
		cursor: pointer;
	}
</style>
</head>
<body>
	 <table class="table table-striped table-bordered mTable">
	 	<thead>
	 		<tr>
	 		<th>论文标题</th>
	 		<th>论文类型</th>
	 		<th>发表时间</th>
	 		<th>下载次数</th>
	 		<th>详细信息</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<c:forEach var="thesis" items="${requestScope.thesiss }" varStatus="status">
	 			<tr>
	 			<td>${thesis.headLine }</td>
	 			<td><c:if test="${thesis.type == 1}">
	 					<c:out value="一般期刊"/>
	 				</c:if>
	 				<c:if test="${thesis.type == 2}">
	 					<c:out value="核心期刊"/>
	 				</c:if>
	 				<c:if test="${thesis.type == 4}">
	 					<c:out value="EI"/>
	 				</c:if>
	 				<c:if test="${thesis.type == 8}">
	 					<c:out value="SIC"/>
	 				</c:if>
	 			</td>
	 			<td>${thesis.time }</td>
	 			<td>${thesis.downloads }</td>
	 			<td><a fff="frontAchieveAction_getThesisInfo?id=${thesis.id }" onclick="pageQuery(this)">详情</a></td>
	 			</tr>
	 		</c:forEach>
	 		
	 		 
	 	</tbody>
	 </table>
	 <!-- ==================================分页开始======================================== -->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<c:if test="${requestScope.pageNow > 1}">
			<a fff="frontAchieveAction_part?section=1&pageNow=${requestScope.pageNow - 1}" onclick="pageQuery(this)">上一页</a>&nbsp;  	
		</c:if>
		<a fff="frontAchieveAction_part?section=1&pageNow=1" onclick="pageQuery(this)">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a fff="frontAchieveAction_part?section=1&pageNow=${i}" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a fff="frontAchieveAction_part?section=1&pageNow=${i}" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a fff="frontAchieveAction_part?section=1&pageNow=${i}" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a fff="frontAchieveAction_part?section=1&pageNow=${i}" onclick="pageQuery(this)">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a fff="frontAchieveAction_part?section=1&pageNow=${requestScope.pageCount}" onclick="pageQuery(this)">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		    <c:if test="${requestScope.pageNow < requestScope.pageCount }">
				<a fff="frontAchieveAction_part?section=1&pageNow=${requestScope.pageNow + 1}" onclick="pageQuery(this)">下一页</a>&nbsp;  	
			</c:if>
		</c:if>  
	</div>
	<!-- ==================================分页结束======================================== -->
</body>
</html>