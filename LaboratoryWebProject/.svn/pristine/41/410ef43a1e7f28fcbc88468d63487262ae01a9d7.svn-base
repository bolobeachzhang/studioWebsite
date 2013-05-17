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
import cn.edu.cdu.lab.model.Administrator;
import cn.edu.cdu.lab.model.Message;
import cn.edu.cdu.lab.service.ConnectionService;
import cn.edu.cdu.lab.service.MessageService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ManageConnectionAction 
 * @Description: 管理员对关于我们的所有操作
 * @author 李华 【643444070@qq.com】
 * @date 2013-2-27 10:52:40
 *
 */
public class ManageMessageAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private List<Message> messages;
	private MessageService messageService;
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	/**
	 * 获取为审核留言
	 * @return
	 */
	public String showMUncheck(){
		init();
		
		messages = new ArrayList<Message>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		messages = messageService.getMessages(0,pageSize*(pageNow - 1), pageSize);
		pageCount = messageService.getPageCount(0, pageSize);
		
		request.setAttribute("messages", messages);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		
		return "showMUncheckSuccess";
	}
	
	
	
	/**
	 * 获取已审核留言
	 * @return
	 */
	public String showMUnchecked(){
		init();
		
		messages = new ArrayList<Message>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		messages = messageService.getMessages(1,pageSize*(pageNow - 1), pageSize);
		pageCount = messageService.getPageCount(1, pageSize);
		
		request.setAttribute("messages", messages);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		
		return "showMUncheckedSuccess";
	}
	
	/**
	 * 获取特定教师未审核留言
	 * @return
	 */
	public String showTUncheck(){
		init();
		
		String teacherId = request.getSession().getAttribute("USER_ID").toString();
		
		messages = new ArrayList<Message>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		messages = messageService.getTheacherMessages(0,teacherId,pageSize*(pageNow - 1), pageSize);
		pageCount = messageService.getTeacherPageCount(0, teacherId, pageSize);
		
		request.setAttribute("messages", messages);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		
		return "showTUncheckSuccess";
	}
	
	/**
	 * 获取已审核特定教师的留言
	 * @return
	 */
	public String showTUnchecked(){
		init();
		String teacherId = request.getSession().getAttribute("USER_ID").toString();
		
		messages = new ArrayList<Message>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		messages = messageService.getTheacherMessages(1,teacherId,pageSize*(pageNow - 1), pageSize);
		pageCount = messageService.getTeacherPageCount(1, teacherId, pageSize);
		
		request.setAttribute("messages", messages);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		
		return "showTUncheckedSuccess";
	}
	
	/**
	 * 删除选中的message
	 * @return
	 */
	public String deleteOne(){
		init();
		String id = request.getParameter("id");
		try {
			messageService.deleteMessage(Integer.parseInt(id));
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 删除选中的message
	 * @return
	 */
	public String deleteChecked(){
		init();
		String resoult = request.getParameter("resoult");
		String[] messageIds = resoult.split(",");
		for(String messageId : messageIds){
			try {
				messageService.deleteMessage(Integer.parseInt(messageId));
				response.getWriter().write("ok");
				response.flushBuffer();
				response.getWriter().close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return NONE;
	}
	
	/**
	 * 管理员回复留言
	 * @return
	 */
	public String replay(){
		init();
		String replayCon = request.getParameter("replayCon");
		Integer messageId = Integer.parseInt(request.getParameter("messageId"));
		Integer messageState = Integer.parseInt(request.getParameter("messageState"));
		Integer userType = Integer.parseInt(request.getSession().getAttribute("USER_TYPE").toString());
		String replayId = request.getSession().getAttribute("USER_ID").toString();
		
		try {
			messageService.saveReplayMessage(userType, replayCon, replayId, messageState, messageId);
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
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
