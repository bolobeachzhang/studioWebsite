package cn.edu.cdu.lab.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Article;
import cn.edu.cdu.lab.service.ArticleManageService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontDynamicAction extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ArticleManageService articleManageService;// 采用spring实现依赖注入
	public ArticleManageService getArticleManageService() {
		return articleManageService;
	}

	public void setArticleManageService(ArticleManageService articleManageService) {
		this.articleManageService = articleManageService;
	}

	public String getDynamic(){
		init();
		String section = request.getParameter("section");
		request.setAttribute("section", section);
		return "getDynamicSuccess";
	}
	
	public String part(){
		init();
		//最新动态   3
		int section = Integer.parseInt(request.getParameter("section"));
		//行业动态  18
		if(section == 1){
			//导航信息
			int firstId = 3;
			int secondId = 18;
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
			System.out.println("行业动态加载…………………………");
			return "partOne";
		}
		//实验室新闻  19
		if(section == 2){
			//导航信息
			int firstId = 3;
			int secondId = 19;
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
		//创新文化  20
		if(section == 3){
			//导航信息
			int firstId = 3;
			int secondId = 20;
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
			return "partThree";
		}
		//通知公告  21
		if(section == 4){
			//导航信息
			int firstId = 3;
			int secondId = 21;
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
			return "partFour";
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
