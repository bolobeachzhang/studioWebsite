package cn.edu.cdu.lab.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Article;
import cn.edu.cdu.lab.service.ArticleManageService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontIntroduceAction  extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ArticleManageService articleManageService;// 采用spring实现依赖注入
	
	public ArticleManageService getArticleManageService() {
		return articleManageService;
	}

	public void setArticleManageService(ArticleManageService articleManageService) {
		this.articleManageService = articleManageService;
	}

	public String getIntro(){
		init();
		String section = request.getParameter("section");
		
		request.setAttribute("section", section);
		
		return "getIntroSuccess";
	}
	
	public String part(){
		init();
		//实验室介绍 2  
		int section = Integer.parseInt(request.getParameter("section"));
		//实验室概况     13
		if(section == 1){
			//加载一篇文章即可
			int firstId = 2;
			int secondId = 13;
			int thirdId = 0;
			Article article = articleManageService.getOneArticleByNavi(firstId, secondId, thirdId);
			request.setAttribute("article", article);
			return "partOne";
		}
		//组织机构      14
		if(section == 2){
			int firstId = 2;
			int secondId = 14;
			int thirdId = 0;
			Article article = articleManageService.getOneArticleByNavi(firstId, secondId, thirdId);
			request.setAttribute("article", article);
			return "partTwo";
		}
		//学术带头人   15
		if(section == 3){
			int firstId = 2;
			int secondId = 15;
			int thirdId = 0;
			Article article = articleManageService.getOneArticleByNavi(firstId, secondId, thirdId);
			request.setAttribute("article", article);
			return "partThree";
		}
		//实验室主任  16
		if(section == 4){
			int firstId = 2;
			int secondId = 16;
			int thirdId = 0;
			Article article = articleManageService.getOneArticleByNavi(firstId, secondId, thirdId);
			request.setAttribute("article", article);
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
