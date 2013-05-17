<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/second/Organization.css" type="text/css"></link>
<!-- 对话框的的相关导入文件 -->
<link rel="stylesheet" href="css/skins/blue.css" type="text/css"></link>
<script type="text/javascript" src="js/front/jumpWindow.js"></script>

<!-- 以下是对话框的的js函数 -->
<script type="text/javascript">
  function test(op){
	  if(op=="0"){
		  art.dialog({ width:400,height:300,title:' 学术委员会',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  if(op=="1"){
	  art.dialog({ width:400,height:300,title:' 研发部',
	  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
	  });
	  }
	  if(op=="2"){
		  art.dialog({ width:400,height:300,title:'会议室',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  if(op=="3"){
		  art.dialog({ width:400,height:300,title:'研究室',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  
	  if(op=="4"){
		  art.dialog({ width:400,height:300,title:'办公室',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  
	  if(op=="5"){
		  art.dialog({ width:400,height:300,title:'学术报告厅',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  
	  if(op=="6"){
		  art.dialog({ width:400,height:300,title:'模式识别与智能处理实验室',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  
	  if(op=="7"){
		  art.dialog({ width:400,height:300,title:'理论研究室',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
	  
	  if(op=="8"){
		  art.dialog({ width:400,height:300,title:'工程研究室',
		  	  content:'这里就写机构的内容sadasdsadsadsadsadsadsaaaaaaaaaa'
		  });
		  }
  }
  </script>
  </head>
  <!-- 这是一个组织机构的页面 -->
  <body>
	<!-- 这是一个整体框架 -->
	<div class="OrganizationFrame">
		<!-- 下面就是做那个结构图的部分内容 -->
		<div class="OrganizationJieGou">
			<!-- 下面我们就用热区来做这个超链接 -->
			<img src="images/organization.gif"  usemap="#planetmap" alt="Planets"  border="0" hidefocus="true"/>
			<map name="planetmap" id="planetmap">
				<area alt="学术委员会" href="#" shape="circle" coords="180,36,40" title="学术委员会" onclick="test('0')"/>
				<area alt="研发部" href="#" shape="circle" coords="42,105,42" title="研发部" onclick="test('1')"/>
				<area alt="会议室" href="#" shape="circle" coords="44,250,42" title="会议室" onclick="test('2')"/>
				<area alt="研究室" href="#" shape="circle" coords="178,320,30" title="研究室" onclick="test('3')"/>
				<area alt="办公室" href="#" shape="circle" coords="315,250,35" title="办公室" onclick="test('4')"/>
				<area alt="学术报告厅" href="#" shape="circle" coords="315,110,37" title="学术报告厅" onclick="test('5')"/>
				<area alt="模式识别与智能处理实验室" href="#" shape="circle" coords="180,180,50" title="模式识别与智能处理实验室" onclick="test('6')"/>
				<area alt="理论研究室" href="#" shape="circle" coords="71,422,20" title="理论研究室" onclick="test('7')"/>
				<area alt="工程研究室" href="#" shape="circle" coords="289,422,20" title="工程研究室" onclick="test('8')"/>
			</map>
		</div>
	</div>
  </body>
</html>