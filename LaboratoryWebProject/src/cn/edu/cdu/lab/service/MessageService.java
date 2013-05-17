package cn.edu.cdu.lab.service;

import java.util.List;

import cn.edu.cdu.lab.model.Message;

public interface MessageService {
	
	/**
	 * 管理员获取message
	 * @param checkState 是否被审核
	 * @param offset 跳过多少条
	 * @param obtain 取多少条
	 * @return
	 */
	public List getMessages(int checkState,int offset, int obtain);
	
	/**
	 * 根据checkState获取页数
	 * @param checkState 是否被审核
	 * @return
	 */
	public Integer getPageCount(int checkState, int obtain);
	
	/**
	 * 前台获取留言
	 * @param userType 查看用户类型
	 * @param offset 跳过多少条
	 * @param obtain 取多少条
	 * @return
	 */
	public List getFrontMessage(int userType, int offset, int obtain);
	
	/**
	 * 获取前台留言数
	 * @param userType 查看用户类型
	 * @param obtain 取多少条
	 * @return
	 */
	public int getFrontPageCount(int userType,int obtain);
	
	/**
	 * 获取特定教师留言
	 * @param checkState 是否被审核
	 * @param teacherId 教师Id
	 * @param offset 跳过多少条
	 * @param obtain 取多少条
	 * @return
	 */
	public List getTheacherMessages(Integer checkState,String teacherId, int offset, int obtain);
	
	/**
	 * 获取特定老师的留言数
	 * @param checkState 是否被审核
	 * @param teacherId 教师Id
	 * @param obtain 取多少条
	 * @return
	 */
	public Integer getTeacherPageCount(Integer checkState, String teacherId, int obtain);
	
	
	/**
	 * 保存一个message
	 * @param message
	 */
	public void saveMessage(Message message);
	
	/**
	 * 删除一个message
	 * @param messageId
	 */
	public void deleteMessage(int messageId);
	
	/**
	 * 回复一条留言
	 * @param userType 回复者类型，老师或者是管理员
	 * @param replayCon 回复内容
	 * @param replayId 回复者id
	 * @param messageState 留言的可见状态
	 */
	public void saveReplayMessage(int userType, String replayCon, String replayId, int messageState, int messageId);
	
	
	
}