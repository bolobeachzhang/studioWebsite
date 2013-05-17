package cn.edu.cdu.lab.model;

import java.util.Date;
/**
 * 
 * @author xiujiang tan
 *主题表 该表和topicContent是一对多的关系
 *creatotype: 8 管理员，4 老师，2 学生，1 注册人员
 *一
 */
public class Topic {
	private Integer topicId;	//主题的ID 设置为自增长
	private String topic;		//主题
	private String creatorId;	//创建主题角色的ID号
	private String creator;		//发言者姓名
	private Integer creatorType;	//发言者角色
	private Date createTime;	//主题的创建时间
	private TopicContent topicContent;//
	public TopicContent getTopicContent() {
		return topicContent;
	}
	public void setTopicContent(TopicContent topicContent) {
		this.topicContent = topicContent;
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Integer getCreatorType() {
		return creatorType;
	}
	public void setCreatorType(Integer creatorType) {
		this.creatorType = creatorType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
