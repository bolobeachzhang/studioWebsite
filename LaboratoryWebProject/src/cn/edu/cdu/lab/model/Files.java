package cn.edu.cdu.lab.model;

import java.util.Date;

public class Files {
	private Integer id;   //文件ID
	private String title;	//文件标题
	private String fileName;	//文件名
	private String uploaderId;	//上传者的Id号
	private String uploaderName;	//上传者的姓名
	private Integer uploaderRole;	//上传者的权限
	private Integer downloaderRole;	//下载者类型
	private String time;	//上传时间
	private Integer checks;	//是否审核
	private String size;	//文件大小
	private Integer type;	//类型，课件，工具软件，文档
	private String fileUrl;	//在服务器上的存放路径
	private Integer downloads;	//下载次数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploaderId() {
		return uploaderId;
	}
	public void setUploaderId(String uploaderId) {
		this.uploaderId = uploaderId;
	}
	public String getUploaderName() {
		return uploaderName;
	}
	public void setUploaderName(String uploaderName) {
		this.uploaderName = uploaderName;
	}
	public Integer getUploaderRole() {
		return uploaderRole;
	}
	public void setUploaderRole(Integer uploaderRole) {
		this.uploaderRole = uploaderRole;
	}
	public Integer getDownloaderRole() {
		return downloaderRole;
	}
	public void setDownloaderRole(Integer downloaderRole) {
		this.downloaderRole = downloaderRole;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getChecks() {
		return checks;
	}
	public void setChecks(Integer checks) {
		this.checks = checks;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public Integer getDownloads() {
		return downloads;
	}
	public void setDownloads(Integer downloads) {
		this.downloads = downloads;
	}
	
}
