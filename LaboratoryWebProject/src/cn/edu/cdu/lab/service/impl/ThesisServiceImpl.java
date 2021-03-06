/**
 * @Title ThesisServiceImpl.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员管理论文
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-12 16:58:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.service.impl;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Properties;

import cn.edu.cdu.lab.dao.impl.BasicDaoImpl;
import cn.edu.cdu.lab.model.Thesis;
import cn.edu.cdu.lab.service.ThesisService;

/**
 * @ClassName: ThesisServiceImpl 
 * @Description: 管理员对论文的管理
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-12 16:58:30
 *
 */
public class ThesisServiceImpl extends BasicDaoImpl implements ThesisService{
	
	public List getThesis(Integer checkState, int offset, int obtain ,String teacherId){
		if(checkState == null){ //处理特定老师的,这里不区分是否被审核
			if(teacherId != null){
				return this.pageQuery("from Thesis thesis where thesis.teacherId = ?", offset, obtain, new String[]{teacherId});
			}
		}
		if(checkState == 0){ //未审核留言
			if(teacherId == null){
				return this.pageQuery("from Thesis thesis where thesis.checkState = 0", offset, obtain, null);
			}  
		}
		if(checkState == 1){ //已审核留言，前台显示的都是已审核的留言
			if(teacherId == null){
				return this.pageQuery("from Thesis thesis where thesis.checkState = 1", offset, obtain, null);
			}  
		}
		return null;
	}

	@Override
	public Integer getPageCount(Integer checkState, int obtain, String teacherId) {
		if(checkState == null){ //处理特定老师
			if(teacherId != null){
				int rowCount = this.getHibernateTemplate().find("from Thesis thesis where thesis.teacherId = '"+teacherId+"'").size();
				return rowCount % obtain == 0 ? rowCount / obtain : rowCount / obtain + 1;
			}
		}
		if(checkState == 0){ //处理未审核
			int rowCount = this.getHibernateTemplate().find("from Thesis thesis where thesis.checkState = 0").size();
			return rowCount % obtain == 0 ? rowCount / obtain : rowCount / obtain + 1; 
		}
		if(checkState == 1){ //处理已审核
			int rowCount = this.getHibernateTemplate().find("from Thesis thesis where thesis.checkState = 1").size();
			return rowCount % obtain == 0 ? rowCount / obtain : rowCount / obtain + 1; 
		}
		return null;
	}

	@Override
	public void saveThesis(Thesis thesis) throws Exception{
//		Field[] fields = thesis.getClass().getDeclaredFields();
//		for(int i = 0; i < fields.length; i++){
//			fields[i].setAccessible(true);
//			System.out.println("属性=" + fields[i].getName());
//			System.out.println("值=" + fields[i].get(thesis));
//		}
		this.save(thesis);
	}

	@Override
	public void deleteThesis(int id) {
		this.delete(this.getHibernateTemplate().load(Thesis.class, id));
	}

	@Override
	public void getVerify(int id) {
		Thesis thesis = (Thesis) getHibernateTemplate().load(Thesis.class, id);
		thesis.setCheckState(1);
		this.getHibernateTemplate().saveOrUpdate(thesis);
	}

	@Override
	public Thesis getThesis(int id) {
		return (Thesis) this.getHibernateTemplate().load(Thesis.class, id);
	}

	@Override
	public void updateThesis(Thesis thesis) {
		System.out.println("headLine=" +thesis.getHeadLine()); 
		System.out.println("id=" + thesis.getId()); 
		Thesis mThesis = (Thesis) this.getHibernateTemplate().load(Thesis.class, thesis.getId());
		mThesis.setHeadLine(thesis.getHeadLine());
		mThesis.setType(thesis.getType());
		mThesis.setJournalTitle(thesis.getJournalTitle());
		mThesis.setTime(thesis.getTime());
		mThesis.setAuthor(thesis.getAuthor());
		mThesis.setDownrole(thesis.getDownrole());
		mThesis.setDigest(thesis.getDigest());
		mThesis.setUrl(thesis.getUrl());
		this.getHibernateTemplate().saveOrUpdate(mThesis);
	}

	@Override
	public List getThesisBytTeacherId(String teacherId) {
		return this.query("from Thesis thesis where thesis.teacherId = ?", new String[] {teacherId});
	}
}









