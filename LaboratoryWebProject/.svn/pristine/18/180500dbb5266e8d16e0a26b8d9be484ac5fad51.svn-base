package cn.edu.cdu.lab.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Message;
import cn.edu.cdu.lab.model.Teacher;
import cn.edu.cdu.lab.model.Thesis;
import cn.edu.cdu.lab.service.MessageService;
import cn.edu.cdu.lab.service.PersonService;
import cn.edu.cdu.lab.service.ThesisService;
import cn.edu.cdu.lab.vo.Post;
import cn.edu.cdu.lab.vo.Research;
import cn.edu.cdu.lab.vo.Title;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontTeamAction extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private PersonService personService;
	private ThesisService thesisService;
	private MessageService messageService;

	private Research research;
	private Title title;
	private Post post;
	
	private List<Thesis> thesiss;
	private List<Message> messages;
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	public void setThesisService(ThesisService thesisService) {
		this.thesisService = thesisService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public String getTeam(){
		init();
		String section = request.getParameter("section");
		
		request.setAttribute("section", section);
		return "getTeamSuccess";
	}
	
	public String part(){
		init();
		int section = Integer.parseInt(request.getParameter("section"));
		if(section == 1){
			research = personService.getResearch(1);
			request.setAttribute("research", research);
			return "partOne";
		}
		if(section == 2){
			if(title == null){
				title = personService.getTitle();
			}
			request.setAttribute("title", title);
			return "partTwo";
		}
		if(section == 3){
			if(post == null){
				post = personService.getPost();
			}
			request.setAttribute("post", post);
			return "partThree";
		}
		return NONE;
	}
	
	public String separt(){
		init();
		int section = Integer.parseInt(request.getParameter("section"));
		if(section == 1){ //图形处理与模式识别研究方向
			research = personService.getResearch(1);
			request.setAttribute("research", research);
			return "separtOne";
		}
		if(section == 2){
			research = personService.getResearch(2);
			request.setAttribute("research", research);
			return "separtTwo";
		}
		if(section == 3){
			research = personService.getResearch(3);
			request.setAttribute("research", research);
			return "separtThree";
		}
		return NONE;
	}
	
	/**
	 * 加载详细介绍老师页面
	 * @return
	 */
	public String getTeacherInclude(){
		init();
		String teacherId = request.getParameter("teacherId");
		Teacher teacher = personService.getTeacher(teacherId);
		String url = teacher.getPictureUrl();
		if(url != null){ //获取老师照片的服务器相对地址
			url = url.substring(url.lastIndexOf("\\") + 1);
			String relativeUrl = "File/images/" + url;
			teacher.setPictureUrl(relativeUrl);
		}
		
		thesiss = thesisService.getThesisBytTeacherId(teacherId);
		
		request.setAttribute("teacher", teacher); 
		request.setAttribute("thesiss", thesiss); 
		return "getTeacherInclude";
	}
	
	/**
	 * 跳转到给特定老师的留言页面
	 * @return
	 */
	public String getMessageForT(){
		init();
		String teacherId = request.getParameter("teacherId");
		
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 5;
		messages = new ArrayList<Message>();
		
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		messages = messageService.getTheacherMessages(null, teacherId, pageSize*(pageNow - 1), pageSize);
		pageCount = messageService.getTeacherPageCount(null, teacherId, pageSize);
		
		request.setAttribute("messages", messages);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("teacherId", teacherId);
		
		return "getMessageForT";
	}
	
	public String subMessage(){
		init();
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String teacherId = request.getParameter("teacherId");
		System.out.println("teacherId"+ teacherId); 
		Message message = new Message();
		message.setMessageCon(content);
		message.setMessager(name);
		message.setTeacherId(teacherId);
		messageService.saveMessage(message);
		
		try {
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 验证码验证
	 * @return
	 */
	public String verify(){
		init();
		String code = request.getParameter("code");
		String sessionCode = request.getSession().getAttribute("SESSION_SECURITY_CODE").toString();
		if(code.equals(sessionCode)){
			try {
				response.getWriter().write("ok");
				response.flushBuffer();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
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
}
