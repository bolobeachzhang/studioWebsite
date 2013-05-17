package cn.edu.cdu.lab.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Article;
import cn.edu.cdu.lab.service.ArticleManageService;


import cn.edu.cdu.lab.model.Thesis;
import cn.edu.cdu.lab.service.ThesisService;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontAchieveAction extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ArticleManageService articleManageService;// 采用spring实现依赖注入
	public ArticleManageService getArticleManageService() {
		return articleManageService;
	}

	public void setArticleManageService(ArticleManageService articleManageService) {
		this.articleManageService = articleManageService;
	}

	private ThesisService thesisService;
	private List<Thesis> thesiss;
	
	public void setThesisService(ThesisService thesisService) {
		this.thesisService = thesisService;
	}

	public String getAchieve(){
		init();
		String section = request.getParameter("section");
		
		request.setAttribute("section", section);
		return "getAchieveSuccess";
	}
	
	public String part(){
		init();
		//科研成果    6
		int section = Integer.parseInt(request.getParameter("section"));
		//科研论文   35  李华做
		if(section == 1){

			int pageNow = 1;
			int pageCount = 0;
			int pageSize = 5;
			thesiss = new ArrayList<Thesis>();
			
			if(request.getParameter("pageNow") != null){
				pageNow = Integer.parseInt(request.getParameter("pageNow"));
			}
			
			thesiss = thesisService.getThesis(1,pageSize*(pageNow - 1), pageSize, null);
			pageCount = thesisService.getPageCount(1,pageSize, null);
			
			request.setAttribute("thesiss", thesiss);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			
			return "partOne";
		}
		//获奖情况 36  谭秀江做
		if(section == 2){
			//导航信息
			int firstId = 6;
			int secondId = 36;
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
		//其他成果  37 谭秀江做
		if(section == 3){
			//导航信息
			int firstId = 6;
			int secondId = 37;
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
		return NONE;
	}
	
	/**
	 * 跳转到详细介绍论文页面
	 * @return
	 */
	public String getThesisInfo(){
		init();
		int id = Integer.parseInt(request.getParameter("id"));
		Thesis thesis = thesisService.getThesis(id);
		//把论文的下载地址转换为网站根目录的相对地址
		String url = thesis.getUrl();
		if(url != null){
			url = url.substring(url.lastIndexOf("\\") + 1);
			String relativeUrl = "File/thesis/" + url;
			thesis.setUrl(relativeUrl);
		}
		
		request.setAttribute("thesis", thesis);
		return "getThesisInfo";
	}
	
	public void init(){
		ActionContext act =  ActionContext.getContext();
		request = (HttpServletRequest) act.get(ServletActionContext.HTTP_REQUEST);
		response = (HttpServletResponse) act.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html");//设置返回相应格式，很重要 
		response.setCharacterEncoding("utf-8");
	}
}
