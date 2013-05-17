package cn.edu.cdu.lab.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Article;
import cn.edu.cdu.lab.model.Forum;
import cn.edu.cdu.lab.service.ArticleManageService;
import cn.edu.cdu.lab.service.ForumService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontExchangeAction extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session;
	private ArticleManageService articleManageService;//文章显示的service方法注入
	private ForumService forumService;  //对论坛列表的service的注入
	
	public ForumService getForumService() {
		return forumService;
	}

	public void setForumService(ForumService forumService) {
		this.forumService = forumService;
	}

	public ArticleManageService getArticleManageService() {
		return articleManageService;
	}

	public void setArticleManageService(ArticleManageService articleManageService) {
		this.articleManageService = articleManageService;
	}

	public String getExchange(){
		init();
		String section = request.getParameter("section");
		
		request.setAttribute("section", section);
		return "getExchangeSuccess";
	}
	
	public String part(){
		init();
		//合作交流   4
		
		//获取二级导航信息的参数值
		int section = Integer.parseInt(request.getParameter("section"));
		//开放课题 22
		if(section == 1){
			//导航信息
			int firstId = 4;
			int secondId = 22;
			int thirdId = 0;
			
			//设置分页显示数据的基本属性
			int pageNow = 1;
			int pageSize = 8;
			int pageCount = 0;//对应的记录条数
			
			List<Article>  articleList = new ArrayList<Article>();
			if(request.getParameter("pageNow") != null){
				pageNow = Integer.parseInt(request.getParameter("pageNow"));
			}
			articleList = articleManageService.loadArticleByPage_Navi(firstId, secondId, thirdId, pageSize*(pageNow - 1), pageSize);
			request.setAttribute("articleList", articleList);
			pageCount = articleManageService.getArticleCountByNavi(firstId, secondId, thirdId, pageSize);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			return "partOne";
		}
		//  合作项目23
		if(section == 2){
			//导航信息
			int firstId = 4;
			int secondId = 23;
			int thirdId = 0;
			
			//设置分页显示数据的基本属性
			int pageNow = 1;
			int pageSize = 8;
			int pageCount = 0;//对应的记录条数
			
			List<Article>  articleList = new ArrayList<Article>();
			if(request.getParameter("pageNow") != null){
				pageNow = Integer.parseInt(request.getParameter("pageNow"));
			}
			articleList = articleManageService.loadArticleByPage_Navi(firstId, secondId, thirdId, pageSize*(pageNow - 1), pageSize);
			request.setAttribute("articleList", articleList);
			pageCount = articleManageService.getArticleCountByNavi(firstId, secondId, thirdId, pageSize);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			
			return "partTwo";
		}
		//  学术交流 24               -->            学术会议    25   学术讲座  26
		if(section == 3){
			//获取分页的pageNow
			int pageNow = 1;
			int pageSize = 8;
			int pageCount = 0;//对应的记录条数
			if(request.getParameter("pageNow") != null){
				pageNow = Integer.parseInt(request.getParameter("pageNow"));
			}
			List<Article>  articleList = new ArrayList<Article>();
			//学术交流显示     合作交流 -->学术交流	   则一级导航的id是4  二级导航是24  三级导航为 学术会议25  学术讲座26
			//加载文章的列表
			articleList = articleManageService.loadArticleByPage_Navi(4, 24, 25, pageSize*(pageNow - 1), pageSize);
			//加载满足条件的pageCount
			pageCount = articleManageService.getArticleCountByNavi(4, 24, 25, pageSize);
			request.setAttribute("articleList", articleList);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			return "partThree";
		}
		// 学术论坛  27
		if(section == 4){
			//点击之后，如果没有登录就显示发帖须知，并且提示登陆  登陆成功之后则显示所有的主题给予权限进行发帖
			session = request.getSession();
			if(session.getAttribute("USER_LOGIN")!=null)//获取是否登陆信息
			{
				//学术论坛     不需要显示文章内容，仅仅只是显示论坛列表
				//列表分页封装
				int pageNow = 1;
				int pageSize = 5;
				int pageCount = 0;//对应的记录条数
				int parentId = 0;
				if(request.getParameter("pageNow") != null){
					pageNow = Integer.parseInt(request.getParameter("pageNow"));
				}
				List<Forum> ForumList = new ArrayList<Forum>();//获取分页显示的list集合
				ForumList = forumService.showTopicThemeByPage(pageNow, pageSize, parentId);//0表示是主题显示
				pageCount = forumService.getPageCount(pageSize, parentId);
				request.setAttribute("ForumList", ForumList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNow", pageNow);
				System.out.println("登陆");
				return "partFour";
			}
			else
			{
				//加载发帖须知
				int firstId= 4;
			    int secondId= 27;
			    int thirdId = 28;
				Article article = articleManageService.getOneArticleByNavi(firstId, secondId, thirdId);
				request.setAttribute("article", article);
				System.out.println("没登陆");
				return "partFour";
			}
		}
		return NONE;
	}
	//三级导航信息
	
	public String separt(){
		init();
		int section = Integer.parseInt(request.getParameter("section"));
		//表示学术会议   
		if(section == 1){
			int firstId = 4;//合作交流
			int secondId = 24;//学术交流
			int thirdId = 25;//学术会议
			
			//分页文章列表基本参数的封转
			int pageNow = 1;
			int pageSize = 8;
			int pageCount = 0;//对应的记录条数
			if(request.getParameter("pageNow") != null){
				pageNow = Integer.parseInt(request.getParameter("pageNow"));
			}
			List<Article>  articleList = new ArrayList<Article>();
			articleList = articleManageService.loadArticleByPage_Navi(firstId, secondId, thirdId, pageSize*(pageNow - 1), pageSize);
			//加载满足条件的pageCount
			pageCount = articleManageService.getArticleCountByNavi(firstId, secondId, thirdId, pageSize);
			request.setAttribute("articleList", articleList);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			
			return "separtOne";
		}
		//学术讲座
		if(section == 2){
			int firstId = 4;
			int secondId = 24;
			int thirdId = 26;
			//分页文章列表基本参数的封转
			int pageNow = 1;
			int pageSize = 8;
			int pageCount = 0;//对应的记录条数
			if(request.getParameter("pageNow") != null){
				pageNow = Integer.parseInt(request.getParameter("pageNow"));
			}
			List<Article>  articleList = new ArrayList<Article>();
			articleList = articleManageService.loadArticleByPage_Navi(firstId, secondId, thirdId, pageSize*(pageNow - 1), pageSize);
			//加载满足条件的pageCount
			pageCount = articleManageService.getArticleCountByNavi(firstId, secondId, thirdId, pageSize);
			request.setAttribute("articleList", articleList);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			return "separtTwo";
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
	//发帖
	public void addForum() throws IOException
	{
		init();
		//表单获取
		String title = request.getParameter("title");//主题
		String content = request.getParameter("content");//回帖
		//其余设置
		Forum forumT = new Forum();
		//父级ID
		forumT.setParentId(0);
		//假数据，从sesison中获取
		//16 管理员  8老师     4学生    2注册人员
		forumT.setSpokerId(session.getAttribute("USER_ID").toString());
		forumT.setSpokerName(session.getAttribute("USER_NAME").toString());
		if(session.getAttribute("USER_TYPE").toString().equals("16"))
		{
			forumT.setSpokerType("管理员");
		}
		else if(session.getAttribute("USER_TYPE").toString().equals("8"))
		{
			forumT.setSpokerType("老师");
		}
		else if(session.getAttribute("USER_TYPE").toString().equals("4"))
		{
			forumT.setSpokerType("学生");
		}
		else
		{
			forumT.setSpokerType("游客");
		}
		//
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		forumT.setSpokerTime(sdf.format(new Date()));
		forumT.setTopic_content(title);
		
		//插入回帖信息
		int parentId = forumService.addForum(forumT);//主题保存成功
		//保存主题的内容
		Forum forumC = new Forum();
		forumC.setParentId(parentId);
		//假数据，从sesison中获取
		session = request.getSession();
		
		forumC.setSpokerId(session.getAttribute("USER_ID").toString());
		forumC.setSpokerName(session.getAttribute("USER_NAME").toString());
		if(session.getAttribute("USER_TYPE").toString().equals("16"))
		{
			forumC.setSpokerType("管理员");
		}
		else if(session.getAttribute("USER_TYPE").toString().equals("8"))
		{
			forumC.setSpokerType("老师");
		}
		else if(session.getAttribute("USER_TYPE").toString().equals("4"))
		{
			forumC.setSpokerType("学生");
		}
		else
		{
			forumC.setSpokerType("游客");
		}
		
		
		forumC.setSpokerTime(sdf.format(new Date()));
		forumC.setTopic_content(content);
		forumService.saveForum_T(forumC);//保存回帖信息
		//返回给ajax前台页面提示
		PrintWriter out = response.getWriter();
		out.println("ok");
		out.flush();
		out.close();
	}
	//查看主题下的分页回帖信息
	public String queryContentByparentId()
	{
		init();
		//点击主题加载主题下的所有回帖信息
		int parentId = 0;
		if(request.getParameter("id") != null)
		{
			parentId = Integer.valueOf(request.getParameter("id"));
		}
		//分页属性的设置
		//列表分页封装
		int pageNow = 1;
		int pageSize = 6;
		int pageCount = 0;//对应的记录条数
		//分页显示
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		List<Forum> forumList = forumService.showTopicThemeByPage(pageNow, pageSize, parentId);
		pageCount = forumService.getPageCount(pageSize, parentId);
		//获取主题
		Forum forum = new Forum();
		forum = forumService.getForumByid(parentId);
		request.setAttribute("forumTitle", forum);
		
		request.setAttribute("forumList", forumList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "showContent";
	}
	//回帖
	public void addFourmContent() throws IOException
	{
		init();
		int parentId = Integer.valueOf(request.getParameter("parentId"));
		String content = request.getParameter("content");
		Forum forum_c = new Forum();
		forum_c.setParentId(parentId);
		//假数据，从sesison中获取
		forum_c.setSpokerId(session.getAttribute("USER_ID").toString());
		forum_c.setSpokerName(session.getAttribute("USER_NAME").toString());
		if(session.getAttribute("USER_TYPE").toString().equals("16"))
		{
			forum_c.setSpokerType("管理员");
		}
		else if(session.getAttribute("USER_TYPE").toString().equals("8"))
		{
			forum_c.setSpokerType("老师");
		}
		else if(session.getAttribute("USER_TYPE").toString().equals("4"))
		{
			forum_c.setSpokerType("学生");
		}
		else
		{
			forum_c.setSpokerType("游客");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		forum_c.setSpokerTime(sdf.format(new Date()));
		forum_c.setTopic_content(content);
		forumService.saveForum_T(forum_c);
		//返回给ajax前台页面提示
		PrintWriter out = response.getWriter();
		//回帖成功
		out.println("ok");
		out.flush();
		out.close();
	}
	//展示文章的详细内容  这个方法可以加载各个模块的文章详细的内容     还有一个任务就是点击浏览次数会增加
	public String showArticleDetail()
	{
		init();
		int id = 0;	//直接获取id属性 id是主键
		if(request.getParameter("id")!=null)
			{
			    id =  Integer.valueOf(request.getParameter("id"));
			}
		Article article = articleManageService.loadOneArticle(id);
		//对加载出来的文章次数 +1
		article.setTimes(article.getTimes()+1);
		//更新到数据库中
		articleManageService.updateArticle(article);
		//转发文章对象
		request.setAttribute("article", article);
		return "showArticleDetail";
	}
}
