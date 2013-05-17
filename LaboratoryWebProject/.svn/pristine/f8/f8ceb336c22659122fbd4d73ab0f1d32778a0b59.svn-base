package cn.edu.cdu.lab.service;

import java.util.List;

import cn.edu.cdu.lab.model.Files;

public interface FileManageService {

	public abstract void saveFile(Files file) throws Exception;

	public abstract void deleteFile(Files file) throws Exception;

	public abstract List<Files> listFiles (String hql) throws Exception;

	public abstract void downloadFile() throws Exception;
	
	public abstract void updateFile(Files file) throws Exception;

	public abstract String getFileSize(long length) throws Exception;
	
	public abstract void check(int fileId) throws Exception;
	
	public abstract int getPageCount(String hqlCount, int pageSize) throws Exception;
	
	public abstract int getRowCount(String hqlCount) throws Exception;
	
	public abstract List<Files> listPageFiles(String hql, int offset, int pageSize) throws Exception;

}