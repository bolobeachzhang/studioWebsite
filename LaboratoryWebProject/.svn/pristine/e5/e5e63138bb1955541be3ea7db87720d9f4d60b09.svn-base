/**
 * @Title ManagePasswordAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员对密码进行管理
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-13 20:10:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.service.ArticleManageService;
import cn.edu.cdu.lab.service.PersonService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ManagePasswordAction 
 * @Description: 管理员对密码进行管理
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-14 20:10:30
 *
 */
public class ManagePasswordAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ArticleManageService articleManageService;//采用spring实现依赖注入

	private PersonService personService;

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	/**
	 * 跳转到密码管理
	 * @return
	 */
	public String get(){
		
		return "getSuccess";
	}
	
	/**
	 * 检查ID是否正确输入
	 * @return
	 */
	public String check(){
		init();
		String pass = request.getParameter("pass");
		String userId = request.getSession().getAttribute("USER_ID").toString();
		Integer userType = Integer.parseInt(request.getSession().getAttribute("USER_TYPE").toString());
		try {
			if(personService.checkPass(userType, userId, pass)){
				response.getWriter().write("ok");
				response.flushBuffer();
				response.getWriter().close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 更新密码
	 * @return
	 */
	public String updatePass(){
		init();
		String pass = request.getParameter("pass");
		String userId = request.getSession().getAttribute("USER_ID").toString();
		Integer userType = Integer.parseInt(request.getSession().getAttribute("USER_TYPE").toString());
		
		personService.updatePass(userType, userId, pass);
		request.setAttribute("SUCCESS", "密码修改成功");
		
		return "getSuccess";
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
