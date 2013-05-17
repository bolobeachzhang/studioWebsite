/*
* pointer 1.0
* Date: 2013-03-20
* Author: lihua
* Email: lihuabest@gmail.com
*/
$(function(){
	var self = $("td[limit],li[limit],p[limit],span[limit],a[limit]");
	self.each(function(){
		var objString = $.trim($(this).text()); //去掉首尾空格
		var objLength = objString.length;
		var num = $(this).attr("limit");
		if(objLength > num){
			objString = $(this).text(objString.substring(0,num) + "...");
		}
	});
});