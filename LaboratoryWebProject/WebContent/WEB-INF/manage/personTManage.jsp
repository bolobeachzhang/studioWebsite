<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function mdelete(obj,type){
		var id = $(obj).parent("td").siblings(".id").text();
		$.ajax({
			type: "POST",
			url: "managePersonAction_deleteOne",
			data: "id="+id+"&type="+type,
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
	function deleteChecked(type){
		var resoult = new Array();
		$("[name = mcheckbox]:checkbox").each(function(){
			if($(this).is(":checked")){
				resoult.push($(this).attr("value"));
			}
		});
		
		$.ajax({
			type: "POST",
			url: "managePersonAction_deleteChecked",
			data: "resoult="+resoult+"&type="+type,
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
</script>
<link href="css/base/bootstrap_modify_for_lab.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		height: auto !important;
		min-height: 600px;
		height: 600px;
	}
	#choose{
		margin-top: 20px;
		margin-left: 20px;
	}
	.mTable{
		width: 700px;
		margin-left: 25px;
		margin-top: 20px;
		float: left;
	}
	.mTable th{
		padding: 0px;
		padding-left: 5px;
	}
	.mTable td{
		padding: 0px;
		padding-left: 5px;
	}
	.mBtn{
		margin-left: 50x;
		margin-right: 100px;
	}
	.headImg{
		width: 102px;
		height: 102px;
		border: 2px solid #CCCCCC;
		float: left;
		margin-top: 20px;
		margin-left: 20px;
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
		<c:when test="${requestScope.teachers == null }">
			<span>暂时无更多信息</span>
		</c:when>
		<c:otherwise>
				<table id="teacher"  class="table table-striped table-bordered mTable">
					<thead>
						<tr><th>选择</th><th>教师ID</th><th>教师名字</th><th>电话</th><th>邮箱</th><th>详情</th><th>操作</th></tr>
					</thead>
					<tbody>
						<c:forEach var="teacher" items="${requestScope.teachers }" varStatus="status">
							<tr><td style="width: 40px;"><input style="margin-top: 0px;margin-left: 10px;" type="checkbox" name="mcheckbox" value="${teacher.teacherId }"></td><td class="id">${teacher.teacherId }</td><td>${teacher.name }</td><td>${teacher.phoneNumber }</td><td>${teacher.email }</td><td><a href="managePersonAction_updateT?teacherId=${teacher.teacherId  }">详情</a></td><td><a href="javascript:;" onclick="mdelete(this,8)">删除</a></td></tr>
						</c:forEach>
					</tbody>
				</table>
		</c:otherwise>
	</c:choose>
	<!-- ==================================分页======================================== -->
	<div id="paging">
		当前第${requestScope.pageNow }页,共${requestScope.pageCount }页&nbsp;&nbsp;
		<a href="managePersonAction_teacherManage?&pageNow=1">[1]</a>&nbsp;  
		<c:if test="${requestScope.pageCount != 1}">  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow <= 5}">  
		            <c:forEach var="i" begin="2" end="${requestScope.pageNow}">  
		                <a href="managePersonAction_teacherManage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            ...&nbsp;  
		            <c:forEach var="i" begin="${requestScope.pageNow - 3}"  
		                end="${requestScope.pageNow}">  
		                <a href="managePersonAction_teacherManage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:otherwise>  
		    </c:choose>  
		    <c:choose>  
		        <c:when test="${requestScope.pageNow>=requestScope.pageCount-4   
		            || requestScope.pageCount-4<=0}">  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageCount}">  
		                <a href="managePersonAction_teacherManage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		        </c:when>  
		        <c:otherwise>  
		            <c:forEach var="i" begin="${requestScope.pageNow+1}"  
		                end="${requestScope.pageNow+3}">  
		                <a href="managePersonAction_teacherManage?&pageNow=${i}">[${i }]</a>&nbsp;  
		            </c:forEach>  
		            ...&nbsp;  
		            <a href="managePersonAction_teacherManage?&pageNow=${requestScope.pageCount}">  
		                [${requestScope.pageCount}]</a>&nbsp;  
		        </c:otherwise>  
		    </c:choose>  
		</c:if>  
		<div id="mdelete"><a href="javascript:;" onclick="pickadd(this)">全选</a> <a href="javascript:;" onclick="deleteChecked(8)">删除选中</a></div>
	</div>
</body>
</html>