var timoutid;
$(document).ready(function(){
/**
 * 左侧导航的事件处理
 * 
 */
	$requestNum = 1;//从主页相应模块中点击传来的不同的值,用来改变加载哪一块
	
	$realcontentID = $("#realcontent");//得到载入页面的ID
	$line= $("#contentsecondLine");//得到间隔线
	$childMenu = $("#childMenu");//得到三级菜单childMenu
	/**下面定义不同的子页面链接**/
	$menuURIOne = "LaboratoryGaiK.jsp";
	$menuURITwo = "Organization.jsp";
	$menuURIThree = "XueShuTop.jsp";
	$menuURIFour = "LaboratoryMaster.jsp";
	/**下面定义间隔线的四种不同的样式**/
	$classContentsecondLineOne = "contentsecondLine";
	$classContentsecondLineTwo = "contentsecondLineTwo";
	$classContentsecondLineThree = "contentsecondLineThree";
	$classContentsecondLineFour = "contentsecondLineFour";
	
	$line.removeClass();//移除以前间隔线的样式然后在下面添加新的样式
	//在整个页面装入完成后，装入默认的页面，根据链接传来的值$requestNum判断来装载哪一个
	if ($requestNum == 1) {
		$line.addClass($classContentsecondLineOne);
		$realcontentID.load($menuURIOne);
	} else if($requestNum == 2){
		$line.addClass($classContentsecondLineTwo);
		$realcontentID.load($menuURITwo);
	}else if($requestNum == 3){
		$line.addClass($classContentsecondLineThree);
		$realcontentID.load($menuURIThree);
	}else if($requestNum == 4){
		$line.addClass($classContentsecondLineFour);
		$realcontentID.load($menuURIFour);
	}
	
	//找到标签效果对应的标签，注册鼠标点击事件
	$("#tabsecond li").each(function(index){
		//是否有三级，无则然后隐藏
		if($(this).find('b').length){
			$childMenu.show();
		}else{
			$childMenu.hide();
		}
		$(this).click(function(){
			$line.removeClass();//移除以前间隔线的样式然后在下面添加新的样式
			//根据点击的索引不同改变间隔线的颜色
			if (index == 0) {
				$line.addClass($classContentsecondLineOne);
				$realcontentID.load($menuURIOne);
			} else if (index == 1) {
				$line.addClass($classContentsecondLineTwo);
				$realcontentID.load($menuURITwo);
			} else if (index == 2) {
				$line.addClass($classContentsecondLineThree);
				$realcontentID.load($menuURIThree);
			}else if (index == 3) {
				$line.addClass($classContentsecondLineFour);
				$realcontentID.load($menuURIFour);
			}
			//如果二级中有三级，用找到b标签来表示是否显示三级
			if($(this).find('b').length){
				$childMenu.show();
			}else{
				$childMenu.hide();
			}
		});
	});
	//鼠标移向三级菜单显示的样式改变
	$("#childMenu ul li").each(function(index){
		$(this).hover(function(){
			$(this).css("background-color","#8383CE");
		},function(){
			$(this).css("background-color","#B6B6E0");
		});
	});
	//对于loading图片绑定ajax请求开始和交互结束的事件
	$("#contentsecond img").bind("ajaxStart",function(){
		//把div里面的内容清空
		$realcontentID.html("");
		//整个页面中任意ajax交互开始前，function中的内容会被执行
		$(this).show();
	}).bind("ajaxStop",function(){
		//整个页面中任意ajax交互结束后，function中的内容会被执行	
		$(this).slideUp("1000");
	});
	
/**
 * 右边菜单的事件处理
 * 
 * */
	$(".mTable tr td").each(function(){
		$(this).hover(function () {
			$(this).removeClass("op");
			$(this).addClass("tdChangeBg"); 
		  },function () {
			$(this).addClass("op");
			$(this).removeClass("tdChangeBg");
		  }
		);
	});
});
