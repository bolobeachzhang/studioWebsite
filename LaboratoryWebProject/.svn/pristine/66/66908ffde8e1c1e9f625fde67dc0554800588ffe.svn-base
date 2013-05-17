/**
 * @Title ManageConnectionAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员操作关于我们模块的类 
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-11 10:43:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.AboutUs;
import cn.edu.cdu.lab.service.ConnectionService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ManageConnectionAction 
 * @Description: 管理员对关于我们的所有操作
 * @author 李华 【643444070@qq.com】
 * @date 2013-2-27 10:52:40
 *
 */
public class ManageConnectionAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private ConnectionService connectionService; //这是要采用依赖注入的
	private static List<AboutUs> aboutUslist; //设为静态变量，用于缓存
	private AboutUs aboutUs;
	
	public void setConnectionService(ConnectionService connectionService) {
		this.connectionService = connectionService;
	}

	/**
	 * 获取原始的connection信息
	 * @return 获取成功页面
	 */
	public String get(){
		init();
		if(aboutUslist == null){ //缓存起来
			aboutUslist = new ArrayList<AboutUs>();
			aboutUslist.add(connectionService.getConnenction()); //这里主要是为了jsp页面的迭代
		}
		
		request.setAttribute("aboutUslist", aboutUslist);
		return "getSuccess";
	}
	
	public String update(){
		System.out.println("更新方法");
		
		init(); //初始化一些对象
		aboutUs = new AboutUs();
		
		aboutUs.setCopyRight(isStringOrNull(request.getParameter("copyright")));
		aboutUs.setAddress(isStringOrNull(request.getParameter("address")));
		aboutUs.setPostCode(isStringOrNull(request.getParameter("zipcode")));
		aboutUs.setPhoneNuber(isStringOrNull(request.getParameter("telephone")));
		aboutUs.setFax(isStringOrNull(request.getParameter("fax")));
		aboutUs.setMailBox(isStringOrNull(request.getParameter("email")));
		aboutUs.setWebSite(isStringOrNull(request.getParameter("website")));
		aboutUs.setIcpRecode(isStringOrNull(request.getParameter("ipcrecord")));
		
		connectionService.updateConnection(aboutUs);
		aboutUslist = null; //更新后重新获取
		return "updateSuccess";
	}
	
	public void init(){
		ActionContext act =  ActionContext.getContext();
		request = (HttpServletRequest) act.get(ServletActionContext.HTTP_REQUEST);
		response = (HttpServletResponse) act.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html");//设置返回相应格式，很重要 
		response.setCharacterEncoding("utf-8");
	}
	
	/**
	 * 判断输入字符串是否为空，为空就返回""
	 * @param string
	 * @return string
	 */
	public String isStringOrNull(String string){
		return string == null ? "": string;
	}
}
