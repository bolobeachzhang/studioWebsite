package cn.edu.cdu.lab.service;

import java.util.List;

import cn.edu.cdu.lab.model.Forum;

public interface ForumService {

	/**
	 * 分页显示论坛主题
	 */
	/**
	 * 根据条件得到总的记录数
	 */
	public List<Forum> showTopicThemeByPage(int pageNow,int pageSize,int parentId);
	public Integer getPageCount(int pageSize,int parentId);
	public Forum getForumByid(int id);
	public void deleteOne_TC(Forum forum);
	public List<Forum> getForumByid_many_C(int id);
	public void deleteOneT_allC(int id);
	public void saveForum_T(Forum forum);
	public int addForum(Forum forum);
}