/**
 * @Title MessageServiceImpl.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 该文件是管理员对留言的处理
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-17 15:05:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.service.impl;

import java.util.Date;
import java.util.List;

import cn.edu.cdu.lab.dao.impl.BasicDaoImpl;
import cn.edu.cdu.lab.model.Administrator;
import cn.edu.cdu.lab.model.Message;
import cn.edu.cdu.lab.model.Register;
import cn.edu.cdu.lab.model.Student;
import cn.edu.cdu.lab.model.Teacher;
import cn.edu.cdu.lab.service.MessageService;


/**
 * @ClassName: MessageServiceImpl 
 * @Description:该文件是管理员对留言的处理
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-15 18:26:40
 *
 */
public class MessageServiceImpl extends BasicDaoImpl implements MessageService{
	
	public List getMessages(int offset, int obtain){
		return pageQuery("from Message", offset, obtain, null);
	}

	@Override
	public List getMessages(int checkState, int offset, int obtain) {
		if(checkState == 0){
			return pageQuery("from Message message where message.checkState = 0 and message.teacherId is null", offset, obtain, null);
		}
		if(checkState ==  1){
			return pageQuery("from Message message where message.checkState = 1 and message.teacherId is null", offset, obtain, null);
		}
		return null;
	}

	@Override
	public void saveMessage(Message message) {
		this.save(message);
	}

	@Override
	public void deleteMessage(int messageId) {
		this.delete(this.getHibernateTemplate().load(Message.class, messageId));
	}

	@Override
	public void saveReplayMessage(int userType, String replayCon, String replayId,
			int messageState, int messageId) {
		Message message = (Message) this.getHibernateTemplate().load(Message.class, messageId);
		message.setReplayDate(new java.sql.Date(System.currentTimeMillis()));
		message.setReplyCon(replayCon);
		message.setCheckState(1); //把状态改为已回复
		message.setMessageState(messageState);
		if(userType == 8){
			message.setManagerId(replayId);
		}
		if(userType == 4){
			message.setTeacherId(replayId);
		}
		this.getHibernateTemplate().saveOrUpdate(message);
	}

	@Override
	public Integer getPageCount(int checkState, int obtain) {
		if(checkState == 0){
			int rowCount = this.getHibernateTemplate().find("from Message message where message.checkState = 0 and message.teacherId is null").size();
			return rowCount % obtain == 0 ? rowCount / obtain:rowCount / obtain + 1;
		}
		if(checkState == 1){
			int rowCount = this.getHibernateTemplate().find("from Message message where message.checkState = 1 and message.teacherId is null").size();
			return rowCount % obtain == 0 ? rowCount / obtain:rowCount / obtain + 1;
		}
		return 0;
	}

	@Override
	public List getTheacherMessages(Integer checkState, String teacherId,
			int offset, int obtain) {
		if(checkState == null){ //这里前台显示给老师的留言不管是否回复
			return pageQuery("from Message message where message.teacherId = ?", offset, obtain, new String[]{teacherId});
		}
		if(checkState == 0){
			return pageQuery("from Message message where message.checkState = 0 and message.teacherId = ?", offset, obtain, new String[]{teacherId});
		}
		if(checkState == 1){
			return pageQuery("from Message message where message.checkState = 1 and message.teacherId = ?", offset, obtain, new String[]{teacherId});
		}
		return null;
	}

	@Override
	public Integer getTeacherPageCount(Integer checkState, String teacherId,
			int obtain) {
		if(checkState == null){
			int rowCount = this.getHibernateTemplate().find("from Message message where message.teacherId = ?", new String[]{teacherId}).size();
			return rowCount % obtain == 0 ? rowCount / obtain:rowCount / obtain + 1;
		}
		if(checkState == 0){
			int rowCount = this.getHibernateTemplate().find("from Message message where message.checkState = 0 and message.teacherId = ?", new String[]{teacherId}).size();
			return rowCount % obtain == 0 ? rowCount / obtain:rowCount / obtain + 1;
		}
		if(checkState == 1){
			int rowCount = this.getHibernateTemplate().find("from Message message where message.checkState = 1 and message.teacherId = ?", new String[]{teacherId}).size();
			return rowCount % obtain == 0 ? rowCount / obtain:rowCount / obtain + 1;
		}
		return 0;
	}

	@Override
	public List getFrontMessage(int userType, int offset, int obtain) {
		return pageQuery("from Message message where message.checkState = 1 and message.messageState <= "+ userType +" and message.teacherId is null", 
				offset, obtain, null);
	}

	@Override
	public int getFrontPageCount(int userType, int obtain) {
		int rowCount = this.getHibernateTemplate().find("from Message message where message.checkState = 1 and message.messageState <= "+ userType +" and message.teacherId is null").size();
		return rowCount % obtain == 0 ? rowCount / obtain : rowCount / obtain + 1;
	}

	
}
