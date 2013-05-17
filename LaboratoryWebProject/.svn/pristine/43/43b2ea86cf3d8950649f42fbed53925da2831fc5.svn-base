/**
 * @Title fManageThesisAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员管理论文
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-12 16:58:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Message;
import cn.edu.cdu.lab.model.Thesis;
import cn.edu.cdu.lab.service.ArticleManageService;
import cn.edu.cdu.lab.service.ThesisService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: fManageThesisAction 
 * @Description: 管理员对论文的管理
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-12 16:58:30
 *
 */
public class ManageThesisAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private ThesisService thesisService;
	private List<Thesis> thesiss;
	private Thesis thesis;
	private File mfile; //上传的文件
	private String mfileFileName; //上传的文件名
	
	public Thesis getThesis() {
		return thesis;
	}

	public void setThesis(Thesis thesis) {
		this.thesis = thesis;
	}

	public File getMfile() {
		return mfile;
	}

	public void setMfile(File mfile) {
		this.mfile = mfile;
	}

	public String getMfileFileName() {
		return mfileFileName;
	}

	public void setMfileFileName(String mfileFileName) {
		this.mfileFileName = mfileFileName;
	}

	public ThesisService getThesisService() {
		return thesisService;
	}

	public void setThesisService(ThesisService thesisService) {
		this.thesisService = thesisService;
	}

	/**
	 * 跳转到管理员管理论文页面
	 * @return
	 */
	public String getMUnCheck(){
		init();
		thesiss = new ArrayList<Thesis>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		thesiss = thesisService.getThesis(0,pageSize*(pageNow - 1), pageSize,null);
		pageCount = thesisService.getPageCount(0,pageSize ,null);
		
		request.setAttribute("thesiss", thesiss);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "getMUnCheckSuccess";
	}
	
	/**
	 * 跳转到管理员管理论文页面
	 * @return
	 */
	public String getMChecked(){
		init();
		thesiss = new ArrayList<Thesis>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		thesiss = thesisService.getThesis(1,pageSize*(pageNow - 1), pageSize,null);
		pageCount = thesisService.getPageCount(1,pageSize ,null);
		
		request.setAttribute("thesiss", thesiss);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "getMCheckedSuccess";
	}
	
	/**
	 * 跳转到教师管理论文页面
	 * @return
	 */
	public String getT(){
		init();
		thesiss = new ArrayList<Thesis>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		String teacherId = request.getSession().getAttribute("USER_ID").toString();
		
		
		thesiss = thesisService.getThesis(null,pageSize*(pageNow - 1), pageSize, teacherId);
		pageCount = thesisService.getPageCount(null,pageSize ,teacherId);
		
		request.setAttribute("thesiss", thesiss);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		
		return "getTSuccess";
	}
	
	/**
	 * 跳转教师上传论文页面
	 * @return
	 */
	public String upload(){

		return "uploadSuccess";
	}
	
	//删除一篇论文
	public String deleteOne(){
		init();
		Integer id = Integer.parseInt(request.getParameter("id"));
		String url = request.getParameter("url");
		
		try {
			thesisService.deleteThesis(id);
			File file = new File(url);
			file.delete();
			
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return NONE;
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String deleteChecked(){
		init();
		String resoultId = request.getParameter("resoultId");
		String resoultUrl = request.getParameter("resoultUrl");
		
		try {
			String[] ids = resoultId.split(",");
			String[] urls = resoultUrl.split(",");
			for(int i = 0; i < ids.length; i++){
				thesisService.deleteThesis(Integer.parseInt(ids[i]));
				File file = new File(urls[i]);
				file.delete();
			}
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return NONE;
	}
	
	/**
	 * 管理员通过审核
	 * @return
	 */
	public String pass(){
		init();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			thesisService.getVerify(id);
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 教师更新一个论文
	 * @return
	 */
	public String updateT(){
		init();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Thesis thesis = thesisService.getThesis(id);
		request.setAttribute("thesis", thesis);
		
		return "updateSuccess"; 
	}
	
	
	/**
	 * 处理论文上传
	 * @return
	 * @throws Exception 
	 */
	public String uploadDeal() throws Exception{
		init();
		String filePath = fileUpload();
		if(filePath != null){
			thesis.setUrl(filePath);
			String format = filePath.substring(filePath.lastIndexOf(".") + 1);
			thesis.setFormat(format);
			
			DecimalFormat decimalFormat = new DecimalFormat("#.##");
			float size = getMfile().length();
			thesis.setSize(decimalFormat.format(size/1024.0/1024.0));
		}
		String teacherId = request.getSession().getAttribute("USER_ID").toString();
		thesis.setTeacherId(teacherId);
		thesisService.saveThesis(thesis);
		
		request.setAttribute("success", "论文上传成功，请等待管理员审核");
		return "uploadSuccess";
	}
	
	/**
	 * 处理论文更新
	 * @return
	 * @throws Exception 
	 */
	public String updateDeal() throws Exception{
		init();
		String filePath = fileUpload();
		if(filePath != null){
			thesis.setUrl(filePath);
			String format = filePath.substring(filePath.lastIndexOf(".") + 1);
			thesis.setFormat(format);
			
			DecimalFormat decimalFormat = new DecimalFormat("#.##");
			float size = getMfile().length();
			thesis.setSize(decimalFormat.format(size/1024.0/1024.0));
		}
		String teacherId = request.getSession().getAttribute("USER_ID").toString();
		thesis.setTeacherId(teacherId); 
		thesisService.updateThesis(thesis);
		
		request.setAttribute("success", "论文修改成功");
		return "updateSuccess";
	}
	
	/**
	 * 
	 * @return
	 */
	public String showDetail(){
		return NONE;
	}
	
	/**
	 * 处理论文文件
	 * @return
	 * @throws Exception
	 */
	private String fileUpload() throws Exception{
		init();
		String filePath = null;
		if(mfile != null){
			try {
				InputStream inputStream = new FileInputStream(getMfile());
				String dir = request.getSession().getServletContext().getRealPath("/File/thesis");
				File dirFile = new File(dir);
				if(!dirFile.exists()){ //文件夹不存在就创建
					dirFile.mkdirs();
				}
				filePath = dir + "\\"+ getMfileFileName();
				System.out.println(filePath);
				File file = new File(filePath);
				OutputStream outputStream = new FileOutputStream(file);
				byte[] buffer = new byte[1024];
				int count = 0;
				while((count = inputStream.read(buffer)) > 0){
					outputStream.write(buffer,0,count);
				}
				outputStream.close();
				inputStream.close();
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
		return filePath; 
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
