<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创新文化</title>
<link href="css/second/dynamicSubPageBase.css" rel="stylesheet" media="screen">
</head>
<body>
	<div id="div"></div>
	<div id="div2">
		
		<c:forEach items="${articleList }" var="article">
			<p>
				<a fff="frontExchangeAction_showArticleDetail?id=${article.id}" onclick="pageQuery(this)" style="cursor:pointer;">${article.title} </a><label>(${article.createTime})</label>
			</p>
		</c:forEach>
<!-- ==================================分页开始======================================== -->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<c:if test="${requestScope.pageNow >1}">
			<a fff="frontDynamicAction_part?section=3&pageNow=${requestScope.pageNow-1}" onclick="pageQuery(this)" style="cursor:pointer;">上一页</a>&nbsp;  
		</c:if>
		<a fff="frontDynamicAction_part?section=3&pageNow=1" onclick="pageQuery(this)" style="cursor:pointer;">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a fff="frontDynamicAction_part?section=3&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a fff="frontDynamicAction_part?section=3&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a fff="frontDynamicAction_part?section=3&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a fff="frontDynamicAction_part?section=3&pageNow=${i}" onclick="pageQuery(this)" style="cursor:pointer;">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a fff="frontDynamicAction_part?section=3&pageNow=${requestScope.pageCount}" onclick="pageQuery(this)" style="cursor:pointer;">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		</c:if>  
		<c:if test="${requestScope.pageNow < requestScope.pageCount}">
			<a fff="frontDynamicAction_part?section=3&pageNow=${requestScope.pageNow+1}" onclick="pageQuery(this)" style="cursor:pointer;">下一页</a>&nbsp;  
		</c:if>
	</div>
	<!-- ==================================分页结束======================================== -->
		
		

	</div>

</body>
</html>