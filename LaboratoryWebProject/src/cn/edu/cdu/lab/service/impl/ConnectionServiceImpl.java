/**
 * @Title ManageConnectionAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 该文件是关于我们模块相关操作的service实现类 
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-11 10:43:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.service.impl;

import java.util.List;

import cn.edu.cdu.lab.dao.impl.BasicDaoImpl;
import cn.edu.cdu.lab.model.AboutUs;
import cn.edu.cdu.lab.service.ConnectionService;

/**
 * @ClassName: ManageConnectionAction 
 * @Description: 管理员对关于我们的所有操作的实现类
 * @author 李华 【643444070@qq.com】
 * @date 2013-2-27 10:52:40
 *
 */
public class ConnectionServiceImpl extends BasicDaoImpl implements ConnectionService { 
	private AboutUs aboutUs;
	public AboutUs getConnenction(){
		List list = (List) this.query("from AboutUs");
		if(list.size() <= 0){ //第一次数据库为空的时候
			return new AboutUs();
		}
		
		return (AboutUs) list.get(0);//返回第一个元素，这个表也只有一个记录
	}
	
	public void updateConnection(AboutUs aboutUs){
		List list = (List) this.query("from AboutUs");
		if(list.size() <= 0){ //第一次数据库为空的时候
			this.save(aboutUs);
		} else {
			this.aboutUs = (AboutUs) list.get(0);
			this.aboutUs.setCopyRight(aboutUs.getCopyRight());
			this.aboutUs.setAddress(aboutUs.getAddress());
			this.aboutUs.setPostCode(aboutUs.getPostCode());
			this.aboutUs.setPhoneNuber(aboutUs.getPhoneNuber());
			this.aboutUs.setFax(aboutUs.getFax());
			this.aboutUs.setMailBox(aboutUs.getMailBox());
			this.aboutUs.setWebSite(aboutUs.getWebSite());
			this.aboutUs.setIcpRecode(aboutUs.getIcpRecode());
			this.update(this.aboutUs);
		}
	}
}
