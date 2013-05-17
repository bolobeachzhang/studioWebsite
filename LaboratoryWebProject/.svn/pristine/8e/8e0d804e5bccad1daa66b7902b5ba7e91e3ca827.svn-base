<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>课件下载</title>
<link href="css/second/downloadSubPageBase.css" rel="stylesheet" media="screen">
<link href="css/base/Metro.css" rel="stylesheet" type="text/css">
<style type="text/css">
	table{
		margin-button:0px;
	}
	th{
		padding:0px;
		text-align:center;
	}
	td{
		padding:0px;
		text-align:center;
	}
	#div1{
		padding:0px;
		border:0px;
	}
	#content a{
		text-decoration:none;
	}
	#paging{
		width:100%;
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		var delPage = $("#paging").find("a[class]");
		var section = $("#section").val();
		//alert(section);
		//var cPage = $("#currentPage").html();
		var firstPage = $("#firstPage");
		var lastPage = $("#lastPage");
		delPage.each(function(i){
			var dePageClick = delPage.eq(i);
			var cpage;
			dePageClick.click(function(){
				var pageCount = parseInt($("#pageCount").val());
				var hr = dePageClick.attr("class");
				var currentPage = parseInt(dePageClick.html());	//获得当前点击链接的页数
				$("#currentPage").html(currentPage);	//设置当前也面的值
				cpage = $("#pageNow").val(currentPage);
				if(currentPage == 1){
					firstPage.hide();
				}else{
					firstPage.show();
				}
				if(currentPage == pageCount){
					lastPage.hide();
				}else{
					lastPage.show();
				}
				$.getJSON(hr,function(data){
					var len = data.length;
					if(len > 0){
						var i = 0;
						var thead = "<tr><th>名称</th><th>作者</th><th>上传时间</th><th>下载次数</th></tr>";
						var allFileObj = "";
						 $("#content").html("");	//在之前要清楚所有的文件信息
						 $("#content").append(thead);
						for(i; i < len; i++){
							allFileObj = "<tr><td><a href=\"frontDownloadAction_fontDownload?id="+data[i].id+"&fileName="+data[i].fileName+"&fileUrl="+data[i].fileUrl+"\">"+data[i].fileName+"</a></td>"+
								"<td>"+data[i].uploaderName+"</td><td>"+data[i].time+"</td><td>"+data[i].downloads+"</td></tr>";
								$("#content").append(allFileObj);
						}
					}
				});
			});
		});
		
		
		$("#lastPage").click(function(){
			var nextPage;
			var cPage = $("#currentPage");
			var currentPage = parseInt(cPage.html());	//获得当前点击链接的页数
			var pageCount = parseInt($("#pageCount").val());
			if(currentPage<pageCount){
				nextPage = currentPage+1;	//获得下一页的值
			}
			if(nextPage > 1){
				firstPage.show();
			}
			if(nextPage == pageCount){
				lastPage.hide();
			}
			cPage.html(nextPage);
			cpage = $("#pageNow").val(currentPage);
			var hr = "frontDownloadAction_loadFontPage?section="+section+"&pageNow="+nextPage;
			$.getJSON(hr,function(data){
				var len = data.length;
				if(len > 0){
					var i = 0;
					var thead = "<tr><th>名称</th><th>作者</th><th>上传时间</th><th>下载次数</th></tr>";
					var allFileObj = "";
					 $("#content").html("");	//在之前要清楚所有的文件信息
					 $("#content").append(thead);
					for(i; i < len; i++){
						allFileObj = "<tr><td><a href=\"frontDownloadAction_fontDownload?id="+data[i].id+"&fileName="+data[i].fileName+"&fileUrl="+data[i].fileUrl+"\">"+data[i].fileName+"</a></td>"+
							"<td>"+data[i].uploaderName+"</td><td>"+data[i].time+"</td><td>"+data[i].downloads+"</td></tr>";
							$("#content").append(allFileObj);
					}
				}
			});
		});
		
		$("#firstPage").click(function(){
			var prePage;
			var cPage = $("#currentPage");
			var pageCount = parseInt($("#pageCount").val());
			var currentPage = parseInt(cPage.html());	//获得当前点击链接的页数
			if(currentPage > 1){
				prePage = currentPage-1;	//获得下一页的值
			}
			if(prePage < pageCount){
				lastPage.show();
			}
			if(prePage == 1){
				firstPage.hide();
			}
			cPage.html(prePage);
			var hr = "frontDownloadAction_loadFontPage?section="+section+"&pageNow="+prePage;
			$.getJSON(hr,function(data){
				var len = data.length;
				if(len > 0){
					var i = 0;
					var thead = "<tr><th>名称</th><th>作者</th><th>上传时间</th><th>下载次数</th></tr>";
					var allFileObj = "";
					 $("#content").html("");	//在之前要清楚所有的文件信息
					 $("#content").append(thead);
					for(i; i < len; i++){
						allFileObj = "<tr><td><a href=\"frontDownloadAction_fontDownload?id="+data[i].id+"&fileName="+data[i].fileName+"&fileUrl="+data[i].fileUrl+"\">"+data[i].fileName+"</a></td>"+
							"<td>"+data[i].uploaderName+"</td><td>"+data[i].time+"</td><td>"+data[i].downloads+"</td></tr>";
							$("#content").append(allFileObj);
					}
				}
			});
		});
		
		var downloadNodes = $(".download");	//确定下载
		downloadNodes.each(function(i){
			downloadNodes.eq(i).click(function(){
				return confirm("确定下载?");
			});
		});
	});
</script>
</head>
<body>
<img  src="images/line.png">
<div id="div">
		<div id="div1">
			<table id="content" class="table table-striped table-hover ">
			
				<tr>
					<th>名称</th>
					<th>作者</th>
					<th>上传时间</th>
					<th>下载次数</th>
				</tr>
				
				<c:forEach var="file" items="${fileList}" varStatus="status">
				
					<tr>
						<td class="myTitle"><a class="download" title="${file.title}" href="frontDownloadAction_fontDownload?id=${file.id}&fileName=${file.fileName}&fileUrl=${file.fileUrl}">${file.fileName }</a></td>
						<td>${file.uploaderName }</td>
						<td>${file.time }</td>
						<td>${file.downloads }</td>
					</tr>
				</c:forEach>
	   		</table>
   	</div>
   	
   	<div id="paging">
   			<input type="hidden" id="section" value="${requestScope.section }"/>
   			<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
   			<input type="hidden" id="pageNow"/>
   			
			当前第&nbsp;<span id="currentPage">${requestScope.pageNow }</span>&nbsp;页,共&nbsp;${requestScope.pageCount }&nbsp;页&nbsp;&nbsp;
				<a id="firstPage" href="#"> 上一页</a>&nbsp;  	
			<a href="#" class="frontDownloadAction_loadFontPage?section=${requestScope.section }&pageNow=1">1</a>&nbsp;  
			<c:if test="${pageCount > 1}">
			    <c:choose>
			        <c:when test="${requestScope.pageNow <= 5}">  
			            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
			                <a href="#" class="frontDownloadAction_loadFontPage?section=${requestScope.section }&pageNow=${i}">${i }</a>&nbsp;  
			            </c:forEach>  
			        </c:when>
			        <c:otherwise>
			            ...&nbsp;  
			            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
			                end="${requestScope.pageNow}">  
			                <a href="#"  class="frontDownloadAction_loadFontPage?section=${requestScope.section }&pageNow=${i}">${i }</a>&nbsp;  
			            </c:forEach>  
			        </c:otherwise>
			    </c:choose>
			    <c:choose>
			        <c:when test="${requestScope.pageNow >= requestScope.pageCount-4   
			            || requestScope.pageCount-4<=0}">
			            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
			                end="${requestScope.pageCount}">  
			                <a href="#" class="frontDownloadAction_loadFontPage?section=${requestScope.section }&pageNow=${i}">${i }</a>&nbsp;  
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
			                end="${pageNow+3}">  
			                <a href="#" class="frontDownloadAction_loadFontPage?section=${requestScope.section }&pageNow=${i}">${i }</a>&nbsp;  
			            </c:forEach>  
			            ...&nbsp;
			            <a href="#" class="frontDownloadAction_loadFontPage?section=${requestScope.section }&pageNow=${requestScope.pageCount}">  
			                [${pageCount}]</a>&nbsp;  
			        </c:otherwise>  
			    </c:choose>
			</c:if>
			 <c:if test="${requestScope.pageNow < requestScope.pageCount }">
				<a id="lastPage" href="#"> 下一页</a>&nbsp;  	
			</c:if> 
		</div>
		
</div>
</body>
</html>