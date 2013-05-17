package cn.edu.cdu.lab.model;

import java.util.Date;

/**
 * 
 * @author xiujiang tan
 *针对每条主题的具体帖子
 *对应关系   "多" 
 */
public class TopicContent {
	private Integer id;				//自增长
	private String spkoerId;	//回帖的ID号
	private String spoker;		//回帖姓名
	private Integer spokerType;	//回帖者类型
	private Date spokerTime;	//回帖时间
	private String contet;		//回帖内容
	private Topic topic;	//主要是生成外键topicId
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSpkoerId() {
		return spkoerId;
	}
	public void setSpkoerId(String spkoerId) {
		this.spkoerId = spkoerId;
	}
	public String getSpoker() {
		return spoker;
	}
	public void setSpoker(String spoker) {
		this.spoker = spoker;
	}
	public Integer getSpokerType() {
		return spokerType;
	}
	public void setSpokerType(Integer spokerType) {
		this.spokerType = spokerType;
	}
	public Date getSpokerTime() {
		return spokerTime;
	}
	public void setSpokerTime(Date spokerTime) {
		this.spokerTime = spokerTime;
	}
	public String getContet() {
		return contet;
	}
	public void setContet(String contet) {
		this.contet = contet;
	}
}
