/**
 * @Title ManageFileAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员操作文件
 * @author chenlaing
 * @Date 2013-03-19
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Files;
import cn.edu.cdu.lab.service.FileManageService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @ClassName: ManageFileAction 
 * @Description: 管理员对文件的管理
 * @author:chenliang
 * @date：2013-03-19
 */
public class ManageFileAction extends ActionSupport implements ModelDriven{

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;

	private FileManageService fileManageService;	//注入service
	
	private List<Files> fileList = new ArrayList<Files>();
	private List<Files> fileList3 = new ArrayList<Files>();	//用来存储文件str的文件对象
	public List<Files> getFileList3() {
		return fileList3;
	}

	public void setFileList3(List<Files> fileList3) {
		this.fileList3 = fileList3;
	}

	Files fileModel = new Files();	//文件类的值对象，用来接收页面传来的值
	public FileManageService getFileManageService() {
		return fileManageService;
	}

	public void setFileManageService(FileManageService fileManageService) {
		this.fileManageService = fileManageService;
	}
	
	private File upload;	//上传到的临时文件
    private String uploadContentType;	//上传文件的类型
    private String uploadFileName;	//上传文件的名字
	
    private String fileName;	//提供下载的文件名字
    private String inputPath;	//体统下载的文件路劲
    private String downloadFileName;
    
    private int pageNow;	//当前页面
    private int pageCount;	//获得共有多少页
    private int uploadAuthor;	//管理员权限
    private String fileIds;	//前台传到后台的多个文件的id字符串
    
	public String getFileIds() {
		return fileIds;
	}

	public void setFileIds(String fileIds) {
		this.fileIds = fileIds;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getDownloadFileName() {
		return downloadFileName;
	}

	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}

	public File getUpload() {
		return upload;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public List<Files> getFileList() {
		return fileList;
	}

	public void setFileList(List<Files> fileList) {
		this.fileList = fileList;
	}

	/**
	 * 跳转到管理员管理文件页面
	 * @return
	 */
	public String getM(){	//管理员
		
		return "getMSuccess";
	}
	
	/**
	 * 跳转到管理员管理文件页面
	 * @return
	 */
	public String getSTR(){
		
		return "getSTRSuccess";
	}
	
	/**
	 * 所有角色的文件上传，
	 * @return
	 */
	public String uploadPage(){	//此方法用来在后台点击后跳转到上传页面
		return "uploadSuccess";
	}
	
	public String upload(){	//定义文件上传处理过程的方法
		init();
		InputStream is = null;
		OutputStream os = null;

		//System.out.println("fileName:"+this.uploadFileName);
		try{
			String path=ServletActionContext.getServletContext().getRealPath("/Files/uploadFiles");	//指定文件存放到服务器上的路径
			
			if((uploadFileName != null) || (uploadFileName != "")){
				request.setAttribute("isUploadSuccess","ok");
			}
			
			String fileType = uploadFileName.split("\\.")[1];	//获得文件的类型
			String newFileName = "";
			Random rnd = new Random();
	        for (int i=0; i<9; i++) {
	        	newFileName += rnd.nextInt(10);
	        }
			
	        String newFileFullName = newFileName+"."+fileType;	//字符串数字组成的文件名字
			File uploadDir = new File(path);
			
			if(!uploadDir.exists()){	//判断文件是否存在，如果不存在就创建一个保存文件的文件夹
				uploadDir.mkdirs();
	        }
			
			File savePath = new File(uploadDir, newFileFullName);	//创建一个指定路径和名字的文件,即写的文件
			is = new BufferedInputStream(new FileInputStream(upload)); 	//获得上传文件读取流
			os = new BufferedOutputStream(new FileOutputStream(savePath));	//获得文件输出流
			
			String fileSize = "";
			try {
				fileSize = fileManageService.getFileSize(upload.length());
			} catch (Exception e) {
				e.printStackTrace();
			}

			String filePath = path+"\\"+newFileFullName;	//文件的保存路径
			
			String upName = new String(fileModel.getUploaderName().getBytes("ISO8859-1"),"UTF-8");		//获得当前登录这的名字,转码
			
			fileModel.setFileName(uploadFileName);
			fileModel.setUploaderName(upName);	//设置上传至者的名字
			fileModel.setSize(fileSize);
	        fileModel.setFileUrl(filePath);//设置文件的保存路径
	        
	        fileModel.setDownloads(0);	//默认设置下载次数为0
	        if(fileModel.getUploaderRole() != 16){
	        	fileModel.setChecks(0);	//如果是0就是待审核的,1是审核了的
	        }else{
	        	fileModel.setChecks(1);	//如果是0就是待审核的,1是审核了的
	        }
	        try {
				if((fileModel.getFileUrl() != null) || (fileModel.getFileUrl() != "")){	//如果文件不为空代表选择了上传的文件
						fileManageService.saveFile(fileModel);
						byte[] buffer = new byte[1024];  //构建一个缓冲区
						int length = 0;
						while ((length = is.read(buffer)) > 0) {	//文件循环读取并写入到指定地方
				            os.write(buffer, 0, length);  
				        }
				}
				//System.out.println("文件保存成功");
				//System.out.println("user:"+upName+",fileName:"+uploadFileName);
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try {
				if(is != null){	//如果输入流不为空,最后关闭输入流
					is.close();	
					}
				if(os != null){	//如果输出流不为空，最后关闭输出流
					os.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		return "uploadSuccess";
	}

	public String getFiles(){	//初始化加载文件刘表
		init();
		String hql = null;
		int currentPageNow = 1;	//初始化显示第一页的记录数
		int pageSize = 11;	//每一页显示多少条记
		
		try {
			String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
			if(pageNo != null){
				this.pageNow = Integer.parseInt(pageNo);
			}
			String upAuthory = request.getParameter("uploadAuthor");
			if(upAuthory != null){
				this.uploadAuthor = Integer.parseInt(upAuthory); 
			}
			
			if(this.pageNow > 0){
				currentPageNow = this.pageNow;
			}

			int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
				if(fileModel.getUploaderRole() != null){
					hql = "from Files where uploaderRole="+fileModel.getUploaderRole();
				}else{
					hql = "from Files where uploaderRole="+this.uploadAuthor;
				}
				//System.out.println("速度:"+hql+"size:"+fileManageService.listFiles(hql).size());
				this.pageCount = fileManageService.getPageCount(hql, pageSize);
				request.setAttribute("pageNow", currentPageNow);
				request.setAttribute("pageCount", pageCount);
				fileList = fileManageService.listPageFiles(hql,offset,pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "listFiles";
	}

	public String getSTRFiles(){	//初始化加载文件刘表
		init();
		String hql = null;
		int currentPageNow = 1;	//初始化显示第一页的记录数
		int pageSize = 11;	//每一页显示多少条记
		
		try {
			
			String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
			if(pageNo != null){
				this.pageNow = Integer.parseInt(pageNo);
			}
			String upAuthory = request.getParameter("uploadAuthor");
			if(upAuthory != null){
				this.uploadAuthor = Integer.parseInt(upAuthory); 
			}
			if(this.pageNow > 0){
				currentPageNow = this.pageNow;
			}
				hql = "from Files where checks=1";	//查询所有文件,在和当前权限位运算
				List<Files> fileList2 = fileManageService.listFiles(hql);
				Iterator<Files> it = fileList2.iterator();
				
				while(it.hasNext()){
					Files file = it.next();
					int downId = file.getDownloaderRole();
					if(uploadAuthor == (downId & uploadAuthor)){	//与预算来获得当前权限用户可下载的文件,用户权限是从前台页面传来的
						fileList3.add(file);
					}
				}	//将数据封装另一个list中返回到前台

				pageCount = ((fileList3.size()-1)/pageSize)+1;	//计算有多少页
				request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
				request.setAttribute("pageCount",pageCount);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
		
		int rowCount = fileList3.size();	//过滤都有多少条记录
		int lastPageSize = rowCount%pageSize;	//求得最后一页的记录数,用来判断是显示最有一页的记录数
		int offsetSize ;
		//System.out.println("lastPageSize:"+lastPageSize);
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
					//System.out.println(i);
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
		
		//System.out.println("size2:"+fileList3.size()+",size3:"+fileList.size());
		//System.out.println("速度:"+hql+"uploadAuthor:"+uploadAuthor+"offset:"+offset+"rowCount:"+rowCount+"lastPageSize:"+lastPageSize);
		return "getSTRSuccess";
	}
	
public String delete(){		//删除单个文件
	init();
	String hql2 = "from Files where id="+fileModel.getId();
	try {
		Files deleteFile = fileManageService.listFiles(hql2).get(0);	//存放得到的数据库文件对象
		String diskFilePath = fileModel.getFileUrl();	//存放磁盘上文件的存放路径
		File diskFile = new File(diskFilePath); //存放磁盘上的文件
		if(deleteFile !=null){	//数据库文件对象不为空
			if(diskFile.exists()){	//磁盘文件存在
				fileManageService.deleteFile(deleteFile);	//删除数据库中的文件记录
				diskFile.delete();	//删除磁盘上的文件
			}else{
				fileManageService.deleteFile(deleteFile);	//删除数据库中的文件记录
			}
		}
		
		String hql = null;
		int currentPageNow = 1;	//初始化显示第一页的记录数
		int pageSize = 11;	//每一页显示多少条记
		
//		String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
//		if(pageNo != null){
//			this.pageNow = Integer.parseInt(pageNo);
//		}
		
		String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
		if(pageNo != null){
			this.pageNow = Integer.parseInt(pageNo);
		}
		String upAuthory = request.getParameter("uploadAuthor");
		if(upAuthory != null){
			this.uploadAuthor = Integer.parseInt(upAuthory); 
		} 
		if(this.pageNow > 0){
			currentPageNow = this.pageNow;
		}
			if(fileModel.getUploaderRole() !=null){
				hql = "from Files where uploaderRole="+fileModel.getUploaderRole();
			}else{
				hql = "from Files where uploaderRole="+this.uploadAuthor;
			}
			int rowCount = fileManageService.getRowCount(hql);	//所有的记录数
			if((rowCount%pageSize) == 0){	//如果是0就是删除后页数向前一页
				currentPageNow--;
			}
			int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
			
			fileList = fileManageService.listPageFiles(hql,offset,pageSize);
			request.setAttribute("pageNow",currentPageNow );
			request.setAttribute("pageCount", fileManageService.getPageCount(hql, pageSize));
			//System.out.println("page:"+fileManageService.getPageCount(hql, pageSize)+"pageNow:"+currentPageNow);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "listFiles";
}
	
public String deleteSTR(){		//删除STR单个文件
	init();
	String hql = null;
	int currentPageNow = 1;	//初始化显示第一页的记录数
	int pageSize = 11;	//每一页显示多少条记
	
	String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
	if(pageNo != null){
		this.pageNow = Integer.parseInt(pageNo);
	}
	String upAuthory = request.getParameter("uploadAuthor");
	if(upAuthory != null){
		this.uploadAuthor = Integer.parseInt(upAuthory); 
	}
	
	try {
		if(this.pageNow > 0){
			currentPageNow = this.pageNow;
		}
		String hql2 = "from Files where id="+fileModel.getId();
		Files deleteFile = fileManageService.listFiles(hql2).get(0);	//存放得到的数据库文件对象
		String diskFilePath = fileModel.getFileUrl();	//存放磁盘上文件的存放路径
		File diskFile = new File(diskFilePath); //存放磁盘上的文件
		if(deleteFile !=null){	//数据库文件对象不为空
			if(diskFile.exists()){	//磁盘文件存在
				fileManageService.deleteFile(deleteFile);	//删除数据库中的文件记录
				diskFile.delete();	//删除磁盘上的文件
			}else{
				fileManageService.deleteFile(deleteFile);	//删除数据库中的文件记录
			}
		}
		
		
		hql = "from Files where checks=1";	//查询所有文件,在和当前权限位运算
			List<Files> fileList2 = fileManageService.listFiles(hql);
			//System.out.println("size1:"+fileList2.size()+",currentPageNow:"+currentPageNow);
			Iterator<Files> it = fileList2.iterator();
			
			while(it.hasNext()){
				Files file = it.next();
				int downId = file.getDownloaderRole();
				if(uploadAuthor == (downId & uploadAuthor)){	//与预算来获得当前权限用户可下载的文件,用户权限是从前台页面传来的
					fileList3.add(file);
				}
			}	//将数据封装另一个list中返回到前台

			pageCount = ((fileList3.size()-1)/pageSize)+1;	//计算有多少页
			
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	int rowCount = fileList3.size();	//过滤都有多少条记录
	
	if((rowCount%pageSize) == 0){	//如果是0就是删除后页数向前一页
		currentPageNow--;
	}
	request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
	request.setAttribute("pageCount",pageCount);
	int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
	
	int lastPageSize = rowCount%pageSize;	//求得最后一页的记录数,用来判断是显示最有一页的记录数
	int offsetSize ;
	//System.out.println("lastPageSize:"+lastPageSize);
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
				//System.out.println(i);
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
	return "getSTRSuccess";
}
	
	public String deleteFiles(){
		init();
		String hql;	//查询文件对象的hql语句
		Files file;	//存放数据库查询到的文件对象
		String diskFilePath;	//构建磁盘文件的路径
		System.out.println("pageNow:"+this.pageNow);
		try{
			StringTokenizer st = new StringTokenizer(this.fileIds,"-");	//将前台传来的文件id字符串从解析出来
			        while(st.hasMoreTokens()){	//取得当前循环的一个文件Id号
			        	try {
			        		hql = "from Files where id="+Integer.parseInt(st.nextToken());	//查询文件对象的hql语句
							file = fileManageService.listFiles(hql).get(0);	//存放数据库查询到的文件对象
							diskFilePath = file.getFileUrl();
							
							System.out.println("fileName:"+file.getFileName());
							System.out.println("fileUrl:"+file.getFileUrl());
							
							File diskFile = new File(diskFilePath);	//存放磁盘上查询到的文件对象
							if(file !=null){	//判断数据库中有这个文件对象
								if(diskFile.exists()){	//如果磁盘上也存有这个
									diskFile.delete();	//删除磁盘上的文件
									fileManageService.deleteFile(file);	//删除数据库中的文件记录
								}else{	//如果磁盘上没有这个文件，数据库中有这个文件，那么文件对象从数据库中删除
									fileManageService.deleteFile(file);	//删除数据库中的文件记录
								}
							}
			        	} catch (Exception e) {
							e.printStackTrace();
						}
			        }
					String hql2 = null;
					int currentPageNow = 1;	//初始化显示第一页的记录数
					int pageSize = 11;	//每一页显示多少条记
					
					String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
					if(pageNo != null){
						this.pageNow = Integer.parseInt(pageNo);
					}
					if(this.pageNow > 0){	//如果页码大于0就赋给当前页
						currentPageNow = this.pageNow;
					}
					String uploadAuthory = request.getParameter("uploadAuthor");	//获得当管理员的权限
					if(uploadAuthory != null){
						this.uploadAuthor = Integer.parseInt(uploadAuthory);
					}
					
					int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
					
					hql2 = "from Files where uploaderRole="+this.uploadAuthor;
				
					this.pageCount = fileManageService.getPageCount(hql2, pageSize);	//获得删除文件后还有多少页
					int rowCount = fileManageService.listFiles(hql2).size();	//获得删除后还有多少条记录
					int lastPageCount  = rowCount%pageSize;	//获得最后一页的记录数
					if(this.pageNow > this.pageCount){
						if(lastPageCount == 0){	//判断是否是某一页的最后一条记录
							currentPageNow--;
						}
					}
					request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
					request.setAttribute("uploadAuthor", uploadAuthor);
					request.setAttribute("pageCount",pageCount);
					fileList = fileManageService.listPageFiles(hql2,offset,pageSize);
		}
		catch(Exception e){
			e.printStackTrace();
		}
						return "listFiles";
	}
	
	public String deleteSTRFiles(){
		init();
		String hql;	//查询文件对象的hql语句
		Files file;	//存放数据库查询到的文件对象
		String diskFilePath;	//构建磁盘文件的路径
		System.out.println("pageNow:"+this.pageNow);
		try{
			StringTokenizer st = new StringTokenizer(this.fileIds,"-");	//将前台传来的文件id字符串从解析出来
			        while(st.hasMoreTokens()){	//取得当前循环的一个文件Id号
			        	try {
			        		hql = "from Files where id="+Integer.parseInt(st.nextToken());	//查询文件对象的hql语句
							file = fileManageService.listFiles(hql).get(0);	//存放数据库查询到的文件对象
							diskFilePath = file.getFileUrl();
							
							System.out.println("fileName:"+file.getFileName());
							System.out.println("fileUrl:"+file.getFileUrl());
							
							File diskFile = new File(diskFilePath);	//存放磁盘上查询到的文件对象
							if(file !=null){	//判断数据库中有这个文件对象
								if(diskFile.exists()){	//如果磁盘上也存有这个
									diskFile.delete();	//删除磁盘上的文件
									fileManageService.deleteFile(file);	//删除数据库中的文件记录
								}else{	//如果磁盘上没有这个文件，数据库中有这个文件，那么文件对象从数据库中删除
									fileManageService.deleteFile(file);	//删除数据库中的文件记录
								}
							}
			        	} catch (Exception e) {
							e.printStackTrace();
						}
			        }
					String hql2 = null;
					int currentPageNow = 1;	//初始化显示第一页的记录数
					int pageSize = 11;	//每一页显示多少条记
					
					String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
					if(pageNo != null){
						this.pageNow = Integer.parseInt(pageNo);
					}
					if(this.pageNow > 0){	//如果页码大于0就赋给当前页
						currentPageNow = this.pageNow;
					}
					String uploadAuthory = request.getParameter("uploadAuthor");	//获得当管理员的权限
					if(uploadAuthory != null){
						this.uploadAuthor = Integer.parseInt(uploadAuthory);
					}
					
					hql2 = "from Files where checks=1";	//查询所有文件,在和当前权限位运算
					List<Files> fileList2 = fileManageService.listFiles(hql2);
					Iterator<Files> it = fileList2.iterator();
					
					while(it.hasNext()){
						Files files = it.next();
						int downId = files.getDownloaderRole();
						if(uploadAuthor == (downId & uploadAuthor)){	//与预算来获得当前权限用户可下载的文件,用户权限是从前台页面传来的
							fileList3.add(files);
						}
					}	//将数据封装另一个list中返回到前台
					
					int rowCount = fileList3.size();	//过滤都有多少条记录
					pageCount = ((fileList3.size()-1)/pageSize)+1;	//计算有多少页
					if(this.pageNow > this.pageCount){
						if((rowCount%pageSize) == 0){	//如果是0就是删除后页数向前一页
							currentPageNow--;
						}
					}
					request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
					request.setAttribute("pageCount",pageCount);
					request.setAttribute("uploadAuthor",uploadAuthor);
					
					int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
					int lastPageSize = rowCount%pageSize;	//求得最后一页的记录数,用来判断是显示最有一页的记录数
					int offsetSize ;
					
					System.out.println("listList3:"+fileList3.size());
					
					if(currentPageNow != pageCount){	//如果不是最后一页
						offsetSize = offset+pageSize;
						for(int i = offset; i< offsetSize; i++){
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
								fileList.add(fileList3.get(i));
							}
						}
					}
					System.out.println("SIZE:"+fileList.size());
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "getSTRSuccess";
	}
	
	public InputStream getInputStream() throws Exception { //获得下载文件输入流入口
		String filePath = fileModel.getFileUrl();
		int lastIndex = filePath.lastIndexOf("\\");
		String fileName = filePath.substring(lastIndex+1);
		return ServletActionContext.getServletContext().getResourceAsStream("/Files/uploadFiles/"+fileName); 
	}
	
	public String download(){	//下载文件,并更新下载次数
		int fileId = fileModel.getId();
		String hql = "from Files where id="+fileId;
		//System.out.println(hql);
		try {
			Files  file = fileManageService.listFiles(hql).get(0);
			
			int newDownloads = file.getDownloads()+1;
			
			file.setDownloads(newDownloads);	//重新设置现在次数,加一次
			//System.out.println("wenjian:"+file.getDownloads());
			fileManageService.updateFile(file);
			//System.out.println("fileModel.getFileName():"+fileModel.getFileName());
			this.setDownloadFileName(fileModel.getFileName());	//设置文件的下载名字
			
			//fileList = fileManageService.listFiles("from Files where uploaderRole="+fileModel.getUploaderRole());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "download";
	}

	
	public String check(){	//文件时否审核
		init();
		int checkId = fileModel.getId();	//获得文件id号
		try {
			
			fileManageService.check(checkId);	//根据文件id号来审核
			
			//String hql = null;
			//int currentPageNow = 1;	//初始化显示第一页的记录数
			int pageSize = 11;	//每一页显示多少条记
			
			String pageNo = request.getParameter("pageNow");	//获得页面传过来的页码，不为空就转化成数字
			if(pageNo != null){
				this.pageNow = Integer.parseInt(pageNo);
			}
			String upAuthory = request.getParameter("uploadAuthor");
			if(upAuthory != null){
				this.uploadAuthor = Integer.parseInt(upAuthory); 
			}
			int currentPageNow = this.pageNow;
		

			int offset = (currentPageNow-1)*pageSize;	//下一页的起始位置
				//if(fileModel.getUploaderRole() !=null){
			String hql = "from Files where uploaderRole="+fileModel.getUploaderRole();
				//}else{
				//	hql = "from Files where uploaderRole="+this.uploadAuthor;
				//}
				//System.out.println("速度:"+hql);
				pageCount = fileManageService.getPageCount(hql, pageSize);
				//this.pageNow = currentPageNow;
				request.setAttribute("pageNow", currentPageNow);	//返回到前端的pageNow,还应该有后台接收的方法
				request.setAttribute("pageCount",pageCount);
				//System.out.println("page:"+pageCount+"pageNow:"+currentPageNow);
				fileList = fileManageService.listPageFiles(hql,offset,pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}	//列出和它同权限的管理员上传的文件
		return "listFiles";
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

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return fileModel;
	}
}
