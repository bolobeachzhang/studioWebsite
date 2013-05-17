/**
* @author: chenliang
* @actionName: FrontDownloadAction
* @description: 前台文件下载业务逻辑
*/
package cn.edu.cdu.lab.action;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import cn.edu.cdu.lab.model.Files;
import cn.edu.cdu.lab.model.Navigation;
import cn.edu.cdu.lab.service.FileManageService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontDownloadAction extends ActionSupport{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private FileManageService fileManageService;	//注入service
	private List<Files> fileList = new ArrayList<Files>();
	private List<Files> fileList3 = new ArrayList<Files>();	//用来存储文件str的文件对象
	private int pageNow;
	private int pageCount;
	private int section;
	 private String downloadFileName;
	public String getDownloadFileName() {
		return downloadFileName;
	}

	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}

	public List<Files> getFileList() {
		return fileList;
	}

	public void setFileList(List<Files> fileList) {
		this.fileList = fileList;
	}

	public List<Files> getFileList3() {
		return fileList3;
	}

	public void setFileList3(List<Files> fileList3) {
		this.fileList3 = fileList3;
	}

	public FileManageService getFileManageService() {
		return fileManageService;
	}

	public void setFileManageService(FileManageService fileManageService) {
		this.fileManageService = fileManageService;
	}

	/**
	* @author: chenliang
	* @methodName: getDownload
	* @description: 加载页面时获得前台显示的文件数据
	*/
	public String getDownload(){
		init();
		String section = request.getParameter("section");
		request.setAttribute("section", section);
		return "getDownloadSuccess";
	}
	public String part(){
		init();
		int section = Integer.parseInt(request.getParameter("section"));	//获得传入的游客可以下载的文件类型的选项
		String hql = "";
		int currentPageNow = 1;	//初始化显示第一页的记录数
		int pageSize = 11;	//每一页显示多少条记
		try {
			String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
			if(pageNo != null){
				this.pageNow = Integer.parseInt(pageNo);
			}
			if(this.pageNow > 0){
				currentPageNow = this.pageNow;
			}
				hql = "from Files where checks=1 and type="+section+"order by time desc";	//查询所有文件,在和当前权限位运算
				List<Files> fileList2 = fileManageService.listFiles(hql);
				Iterator<Files> it = fileList2.iterator();
				while(it.hasNext()){
					Files file = it.next();
					int downId = file.getDownloaderRole();	//获得当前文件的下载权限
					if(1 == (downId & 1)){	//与预算来获得当前权限用户可下载的文件,用户权限是从前台页面传来的
						fileList3.add(file);
					}
				}
				pageCount = ((fileList3.size()-1)/pageSize)+1;	//计算有多少页
				request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
				request.setAttribute("pageCount",pageCount);
				request.setAttribute("section",section);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
		int rowCount = fileList3.size();	//过滤都有多少条记录
		int lastPageSize = rowCount%pageSize;	//求得最后一页的记录数,用来判断是显示最有一页的记录数
		int offsetSize ;	//每页显示的记录数
		if(currentPageNow != pageCount){	//如果不是最后一页
			offsetSize = offset+pageSize;
			for(int i = offset; i< offsetSize; i++){
				//System.out.println(i);
				fileList.add(fileList3.get(i));
			}
		}else{	//如果是最后一页
			if(lastPageSize != 0){	//如果是最后一页,且求得模不是零，证明最有一页有数据
				offsetSize = offset+lastPageSize;
				for(int i = offset; i< offsetSize; i++){
				//	System.out.println(i);
					fileList.add(fileList3.get(i));
				}
			}else{
				offsetSize = offset+pageSize;
				for(int i = offset; i< offsetSize; i++){
				//	System.out.println("d"+i);
					fileList.add(fileList3.get(i));
				}
			}
		}
		return "partOne";
	}
	
	public InputStream getInputStream() throws Exception { //获得下载文件输入流入口
		init();
		String filePath = request.getParameter("fileUrl");
		int lastIndex = filePath.lastIndexOf("\\");
		String fileName = filePath.substring(lastIndex+1);
		return ServletActionContext.getServletContext().getResourceAsStream("/Files/uploadFiles/"+fileName); 
	}
	public String fontDownload(){	//下载文件,并更新下载次数
		init();
		int fileId = Integer.parseInt(request.getParameter("id"));
		String hql = "from Files where id="+fileId;
		//System.out.println(hql);
		try {
			Files  file = fileManageService.listFiles(hql).get(0);
			int newDownloads = file.getDownloads()+1;
			file.setDownloads(newDownloads);	//重新设置现在次数,加一次
			fileManageService.updateFile(file);
			this.setDownloadFileName(request.getParameter("fileName"));	//设置文件的下载名字
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "download";
	}
	
	public void loadFontPage(){
		init();
		String hql = null;
		int currentPageNow = 1;	//初始化显示第一页的记录数
		int pageSize = 11;	//每一页显示多少条记
		try {
			String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
			if(pageNo != null){
				this.pageNow = Integer.parseInt(pageNo);
			}
			if(this.pageNow > 1){
				currentPageNow = this.pageNow;
			}
			String sc = request.getParameter("section");
			if(sc != null){
				this.section = Integer.parseInt(sc);	//获得传入的游客可以下载的文件类型的选项
			}
				hql = "from Files where checks=1 and type="+section+"order by time desc";	//查询所有文件,在和当前权限位运算
				List<Files> fileList2 = fileManageService.listFiles(hql);
				Iterator<Files> it = fileList2.iterator();
				while(it.hasNext()){
					Files file = it.next();
					int downId = file.getDownloaderRole();	//获得当前文件的下载权限
					if(1 == (downId & 1)){	//与预算来获得当前权限用户可下载的文件,用户权限是从前台页面传来的
						fileList3.add(file);
					}
				}
				pageCount = ((fileList3.size()-1)/pageSize)+1;	//计算有多少页
				request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
				request.setAttribute("pageCount",pageCount);
				request.setAttribute("section",this.section);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
		int rowCount = fileList3.size();	//过滤都有多少条记录
		int lastPageSize = rowCount%pageSize;	//求得最后一页的记录数,用来判断是显示最有一页的记录数
		int offsetSize ;	//每页显示的记录数
		System.out.println("fileList3:"+fileList3.size());
		if(currentPageNow != pageCount){	//如果不是最后一页
			offsetSize = offset+pageSize;
			for(int i = offset; i< offsetSize; i++){
				//System.out.println(i);
				fileList.add(fileList3.get(i));
			}
		}else{	//如果是最后一页
			if(lastPageSize != 0){	//如果是最后一页,且求得模不是零，证明最有一页有数据
				offsetSize = offset+lastPageSize;
				for(int i = offset; i< offsetSize; i++){
					fileList.add(fileList3.get(i));
				}
			}else{
				offsetSize = offset+pageSize;
				for(int i = offset; i< offsetSize; i++){
					//System.out.println(i);
					fileList.add(fileList3.get(i));
				}
			}
		}
		PrintWriter pw;
		try {
			pw = response.getWriter();
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			String jsonFileString = gson.toJson(fileList,new TypeToken<List<Navigation>>(){}.getType());
			System.out.println("json:"+jsonFileString);
			pw.println(jsonFileString);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void init(){
		ActionContext act =  ActionContext.getContext();
		request = (HttpServletRequest) act.get(ServletActionContext.HTTP_REQUEST);
		response = (HttpServletResponse) act.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html");//设置返回相应格式，很重要 
		response.setCharacterEncoding("utf-8");
	}
}
