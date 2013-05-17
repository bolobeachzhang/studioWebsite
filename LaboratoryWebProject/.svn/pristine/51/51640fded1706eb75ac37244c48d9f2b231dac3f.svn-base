/**
 * @Title ManageForumAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员操作论坛
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-14 18:18:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Forum;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.edu.cdu.lab.service.*;
/**
 * @ClassName: ManageForumAction 
 * @Description: 管理员对论坛管理
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-14 18:18:40
 *
 */
public class ManageForumAction extends ActionSupport {
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ForumService forumService;//set 注入
	private int pageNow = 1;//设计为成员变量，有效解决删除或者其他操作重新定位到当前页面
	public ForumService getForumService() {
		return forumService;
	}

	public void setForumService(ForumService forumService) {
		this.forumService = forumService;
	}

	/**
	 * 获取论坛资源
	 * @return 获取成功页面
	 */
	public String get(){
		
		return "getSuccess";
	}
	
	/**
	 * 获取论坛单个发帖
	 * @return 获取成功页面
	 */
	public String getOne(){
		
		return "getOneSuccess";
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
	/**
	 * 主题显示
	 */
	public String showTopicThemeByPage()
	{
		init();
		//设置分页显示数据的基本属性
		int parentId = 0;
		//pageNow = 1;
		int pageSize = 10;
		int pageCount = 0;//对应的记录条数
		List<Forum> ForumList = new ArrayList<Forum>();//获取分页显示的list集合
		if(request.getParameter("pageNow") != null)
		{
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		ForumList = forumService.showTopicThemeByPage(pageNow, pageSize,parentId);
		request.setAttribute("ForumList", ForumList);
		pageCount = forumService.getPageCount(pageSize,parentId);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "getSuccess";
	}
	/**
	 * 显示特定主题下的回帖信息
	 * @return
	 */
	public String getTopic_content()
	{
		init();
		int parentId = Integer.valueOf(request.getParameter("parentId"));
		//根据id加载主题的标题内容
		Forum froumByid = forumService.getForumByid(parentId);
		//加载主题下的回帖信息
		//int pageNow = 1;
		int pageSize = 4;	//一页显示4条记录
		int pageCount = 0;	//对应的记录条数
		List<Forum> ForumList = new ArrayList<Forum>();//获取分页显示的list集合
		if(request.getParameter("pageNow") != null)
		{
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		ForumList = forumService.showTopicThemeByPage(pageNow, pageSize,parentId);
		HttpSession session = request.getSession();
		session.setAttribute("ForumList", ForumList);
		//request.setAttribute("ForumList", ForumList);
		//注册一个session
		
		
		request.setAttribute("froumByid", froumByid);//仅仅只是为了显示所有回帖内容的主题
		pageCount = forumService.getPageCount(pageSize,parentId);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "showTopic_content";
	}
	//删除主题下的某一个回帖信息
	public String deleteOne_TC()
	{
		
		init();
		//根据id属性获取一个实例
		int id = Integer.valueOf(request.getParameter("id"));
		Forum forum = forumService.getForumByid(id);
		//删除操作
		forumService.deleteOne_TC(forum);
		//获取pageNow从新回到当前删除的页面
		pageNow = Integer.valueOf(request.getParameter("pageNow"));
		//this.getTopic_content();
		return "afterDe_C";
	}
	//ajax删除单条的回帖信息
	public void deleteOne_C() throws IOException
	{
		init();
		int id = Integer.valueOf(request.getParameter("id"));
		Forum forum = forumService.getForumByid(id);
		//删除操作
		forumService.deleteOne_TC(forum);
		//返回OK告诉ajax删除成功
		response.getWriter().write("ok");
		response.flushBuffer();
		response.getWriter().close();
	}
	
	
	
	//删除某一个主题  和主题下的全部信息
	public String deleteOne_T_allC()
	{
		init();
		int id = Integer.valueOf(request.getParameter("id"));
		//获取pageNow重新定位到当前删除页面
		pageNow = Integer.valueOf(request.getParameter("pageNow"));
		/*
		 * 判断pageNow是否小于pageCount，如果大于需要从新赋值，就是说还需要返回pageNow
		 */
		
		
		Forum fourm = forumService.getForumByid(id);
		//借用删除单个回帖的方法删除某一个主题
		forumService.deleteOne_TC(fourm);
		//删除主题下的所有回帖
		forumService.deleteOneT_allC(id);
		//重新加载到主题的页面
		//showTopicThemeByPage();把这个提到struts.xml中继续传递
		return "afterDe_T";
	}
	
	//删除多条主题和多条主题下分别对应的所有回帖信息
	public void deleteCheckedMany_TC() throws IOException{
		init();
		//获取需要删除的主题的id
		String resoult = request.getParameter("resoult");
		//将字符串转化成字符数组
		String[] strings = resoult.split(",");
		
		for(String id :strings)
		{	
			//将每个id从字符串转化成int类型的
			int delId = Integer.valueOf(id);
			//循环删除每个满足条件的主题
			//1.获取一条主题下的所有回帖
			//2.删除所有的回帖信息
			forumService.deleteOneT_allC(delId);
			//删除id对应的所有的主题信息
			forumService.deleteOne_TC(forumService.getForumByid(delId));
		}
		response.getWriter().write("ok");
		response.flushBuffer();
		response.getWriter().close();
	}
	
	//删除多条选中的回帖信息
	public void deleteChecked() throws IOException{
		init();
		String resoult = request.getParameter("resoult");
		String[] strings = resoult.split(",");
		for(String id :strings)
		{
			int delId = Integer.valueOf(id);
			forumService.deleteOne_TC(forumService.getForumByid(delId));
		}
		response.getWriter().write("ok");
		response.flushBuffer();
		response.getWriter().close();
	}
}
