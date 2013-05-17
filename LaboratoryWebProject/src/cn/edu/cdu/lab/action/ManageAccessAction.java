/**
 * @Title ManageAccessAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件主要是处理全部人员登录和退出操作类 
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-12 12:39:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.utils.BasicConstant;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ManageAccessAction 
 * @Description: 本文件主要是处理全部人员登录和退出操作类 
 * @author 李华 【643444070@qq.com】
 * @date 2013-2-27 12:39:40
 *
 */
public class ManageAccessAction extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session; 
	
	public String login(){
		init();
		session = request.getSession();
		final Integer managerType = Integer.parseInt(request.getParameter("parameter").toString());
		switch (managerType) {
		case 8: //这里还不能引用其他类的常量
			//登陆完成后基本的要在全部共享的信息
			session.setAttribute("USER_TYPE", BasicConstant.USER_TYPE_MANAGER); //登陆者类型
			session.setAttribute("USER_ID", "333"); //登陆者ID
			session.setAttribute("USER_NAME", "张三"); //登陆者名字
			session.setAttribute("USER_LOGIN", BasicConstant.USER_LOGIN); //是否登录标志，已登录
			return "MSuccess";
		case 4:
			session.setAttribute("USER_TYPE", BasicConstant.USER_TYPE_TEACHER);
			session.setAttribute("USER_ID", "123");
			session.setAttribute("USER_NAME", "张三");
			session.setAttribute("USER_LOGIN", BasicConstant.USER_LOGIN);
			return "TSuccess";
		case 2:
			session.setAttribute("USER_TYPE", BasicConstant.USER_TYPE_STUDENT);
			session.setAttribute("USER_ID", "123");
			session.setAttribute("USER_NAME", "张三");
			session.setAttribute("USER_LOGIN", BasicConstant.USER_LOGIN);
			return "SSuccess";
		case 1:
			session.setAttribute("USER_TYPE", BasicConstant.USER_TYPE_REGISTER);
			session.setAttribute("USER_ID", "111");
			session.setAttribute("USER_NAME", "张三");
			session.setAttribute("USER_LOGIN", BasicConstant.USER_LOGIN);
			return "RSuccess";
		default:
			session.setAttribute("USER_TYPE", BasicConstant.USER_TYPE_VISITOR);
			return NONE;
		}
	}
	
	/**
	 * 退出登陆操作
	 * @return
	 */
	public String logout(){
		init();
		session = request.getSession();
		
		//把登陆信息全部清除
		session.removeAttribute("USER_TYPE");
		session.removeAttribute("USER_ID");
		session.removeAttribute("USER_NAME");
		session.removeAttribute("USER_LOGIN");
		
		return "logoutSuccess";
	}
	
	public void init(){
		ActionContext act =  ActionContext.getContext();
		request = (HttpServletRequest) act.get(ServletActionContext.HTTP_REQUEST);
		response = (HttpServletResponse) act.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html");//设置返回相应格式，很重要 
		response.setCharacterEncoding("utf-8");
	}
}
