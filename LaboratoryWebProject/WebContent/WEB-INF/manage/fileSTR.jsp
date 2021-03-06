<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var deleteNodes = $(".delete");		//确定删除事件
		deleteNodes.each(function(i){
			deleteNodes.eq(i).click(function(){
				return confirm("您确定要删除这个文件吗?");
			});
		});
		
		var downloadNodes = $(".download");	//确定下载
		downloadNodes.each(function(i){
			downloadNodes.eq(i).click(function(){
				//alert(downloadNodes.eq(i).attr("href"));
				return confirm("确定下载?");
			});
		});
		
		var check0 = $(".check0");	//审核没有审核的文件按
		check0.each(function(i){
			check0.eq(i).click(function(){
				return confirm("确定审核?");
			});
		});
		
		var check1 = $(".check1");	//审核没有审核的文件按
		check1.each(function(i){
			check1.eq(i).click(function(){
				alert("该文件已经审核!");
				return false;
			});
		
		});
		
		var selectAll = $("#selectAll");	//选中所有的单选框节点
		var allCheckbox = $("input[type=checkbox]");	//所有checkbox节点
		selectAll.toggle(function(){
				allCheckbox.each(function(i){
					allCheckbox.eq(i).attr("checked","checked");	//选中所有checkbox
				});
			},
			function(){
				allCheckbox.each(function(i){
					allCheckbox.eq(i).removeAttr("checked");		//取消素所有选中的checkbox
				});
			}
		);
		
		var delectAll = $("#deleteAll");	
		delectAll.click(function(){	//获得所有选中的文件的id号
			var ischecked = null;
			var fileIds = "";
			allCheckbox.each(function(i){
				ischecked = allCheckbox.eq(i).attr("checked");
				if(ischecked == "checked"){
					fileIds += "-"+allCheckbox.eq(i).attr("class");
				}
			});
			
			var currentPage = $("#currentPage").val();
			var uploadAuthor = $("#uploadAuthor").val();
			
			//var hr = "manageFileAction_deleteFiles?uploadAuthor="+uploadAuthor+"&pageNow="+currentPage;
			
			if(fileIds != ""){
				 if(confirm("确定删除所有选文件?")){
					 var hr = "manageFileAction_deleteSTRFiles?fileIds="+fileIds+"&uploadAuthor="+uploadAuthor+"&pageNow="+currentPage;
					delectAll.attr("href",hr);
				}
			}else{
				alert("您没有选择文件?");
			}
		});
		
		var downloadNodesOffset = $(".download");	//取得下载链接的位置
		downloadNodesOffset.each(function(i){
			var textArea =  $(".textArea");
			var title = null;
			downloadNodesOffset.eq(i).hover(	//当鼠标处于下载处时显示文件的描述信息
					function(){
						var offset = downloadNodesOffset.eq(i).offset();
						var top = offset.top+28;
						var left = offset.left-160;
						title = downloadNodesOffset.eq(i).attr("titles");
						textArea.text("文件描述:"+title);
						textArea.css({"display":"block", "top":top, "left":left});
					},
					function(){
						textArea.css({"display":"none"});
					}
				);
		});
	});
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		height: auto !important;
		min-height: 600px;
		height: 600px;
	}
	.mTable{
		width: 725px;
		margin-left: 13px;
		margin-top: 20px;
		float: left;
	}
	.mTable td{
		padding: 0px;
		text-align:center;
	}
	.mTable th{
		padding: 0px;
		text-align:center;
	}
	#paging{
		float:left;
		margin-left:30px;
	}
	#selectRight{
		float:right;
		margin-right:25px;
	}
	.textArea{
		position:absolute;
		display:none;
		top:100px;
		left:100px;
	}
	.divName{
		text-align:left;
		padding-left:6px;
		margin-top:4px;
		padding-top:0px;
		margin-right:0px;
		line-height:25px;
		height:30px;
		width:270px;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.divName a{
		color:#333333;
	}
	.divName a:hover{
		text-decoration:none;
		cursor:pointer;
		color:#3AAFEB;
	}
</style>
</head>
<body>
	<table id="table"  class="table table-striped table-bordered mTable">
		<thead>
			<tr><th>选中</th><th>文件名字</th><th>文件类型</th><th>上传人员</th><th>下载次数</th><th>文件大小</th><th>上传时间</th><th colspan=2>操作</th></tr>
		</thead>
		<tbody>
		<c:forEach var="file" items="${fileList}" varStatus="status">
			<c:if test="${file.checks ==1 }">
				<tr>
					<td>
						<c:if test="${file.uploaderRole == sessionScope.USER_TYPE}">
							<input type="checkbox" class="${file.id }">	<!-- 如果该文件的权限和登录这的权限相同,那么可以点击选择 -->
						</c:if>
					</td>
					<td><div class="divName"><a title="${file.fileName }">${file.fileName }</a></div></td>
					<td>
						<c:if test="${file.type ==1 }" var ="result1">
							课件
						</c:if>
						<c:if test="${file.type ==2 }" var ="result2">
							软件
						</c:if>
						<c:if test="${file.type ==3 }" var ="result3">
							文档
						</c:if>
					</td>
					<td>${file.uploaderName }<input type="hidden" value="${file.uploaderRole }"/></td>
					<td>${file.downloads }</td>
					<td>${file.size }</td>
					<td>${file.time }</td>
					<td><a class="download" titles="${file.title }" href="manageFileAction_download?id=${file.id}&title=${file.title}&fileName=${file.fileName}&uploaderId=${file.uploaderId}&uploaderName=${file.uploaderName}&uploaderRole=${file.uploaderRole}&downloaderRole=${file.downloaderRole}&time=${file.time}&checks=${file.checks}&size=${file.size}&type=${file.type}&fileUrl=${file.fileUrl}&downloads=${file.downloads}">下载</a></td>
					<td>
						<c:if test="${file.uploaderRole == sessionScope.USER_TYPE }" var="result"><!-- 如果这个文件的上传者的权限和当前登录这的权限不同,那么不 能执行删除操作 -->
							<a class="delete" href="manageFileAction_deleteSTR?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=${requestScope.pageNow}&id=${file.id}&title=${file.title}&fileName=${file.fileName}&uploaderId=${file.uploaderId}&uploaderName=${file.uploaderName}&uploaderRole=${file.uploaderRole}&downloaderRole=${file.downloaderRole}&time=${file.time}&checks=${file.checks}&size=${file.size}&type=${file.type}&fileUrl=${file.fileUrl}&downloads=${file.downloads}">删除</a>
						</c:if>
					</td>
				</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table><br/>

	<c:forEach var="file" items="${fileList}" begin="0" end="0" varStatus="status">
		<c:set value="${file.uploaderRole }" var="uploadAuthor" scope="request"></c:set>	<!-- 设置文件上传者的权限 -->
		<%-- <c:out value="${uploadAuthor }"/> --%>
	</c:forEach>
	
 	<div id="paging">
		当前第&nbsp;${requestScope.pageNow }&nbsp;页,共&nbsp;${requestScope.pageCount }&nbsp;页&nbsp;&nbsp;
		<a href="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=1">[1]</a>&nbsp;  
		<c:if test="${pageCount != 1}">  
		    <c:choose>
		        <c:when test="${pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${pageNow}">  
		                <a href="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${pageNow - 3}"  
		                end="${pageNow}">  
		                <a href="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>
		    </c:choose>
		    <c:choose>
		        <c:when test="${pageNow>=pageCount-4   
		            || pageCount-4<=0}">
		            <c:forEach var="i" begin="${pageNow+1}"  
		                end="${pageCount}">  
		                <a href="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>
		        </c:when>
		        <c:otherwise>
		            <c:forEach var="i" begin="${pageNow+1}"  
		                end="${pageNow+3}">  
		                <a href="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;
		            <a href="manageFileAction_getSTRFiles?uploadAuthor=${sessionScope.USER_TYPE }&pageNow=${pageCount}">  
		                [${pageCount}]</a>&nbsp;  
		        </c:otherwise>
		    </c:choose>
		</c:if>  
	</div>
	<span id="selectRight">
			<a id="selectAll" href="#">全选</a>&nbsp;
			<a id="deleteAll" href="#">删除选中<input id="currentPage" type="hidden" value="${pageNow }"/><input id="uploadAuthor" type="hidden" value="${request.uploadAuthor}"/></a>
	</span>
	<textarea class="textArea" rows="3" cols="10">dfgd</textarea>
</body>
</html>