/**
 * @Title ManageMenuAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员操作菜单管理模块
 * @author chenliang
 * @Date 2013-3-11 10:43:10
 * @Version 1.0
 * @菜单管理action:
 */
package cn.edu.cdu.lab.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Navigation;
import cn.edu.cdu.lab.service.MenuManageService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @ClassName: ManagMenuAction 
 * @Description: 管理员对菜单操作
 * @author chenlaing
 * @date 2013-03-17 10:52:40
 *
 */
public class ManageMenuAction extends ActionSupport implements ModelDriven{
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	//生成MenuManageService的get和set方法,用来注入它的实现类
	private MenuManageService menuManageService;
	
	public MenuManageService getMenuManageService() {
		return menuManageService;
	}

	public void setMenuManageService(MenuManageService menuManageService) {
		this.menuManageService = menuManageService;
	}

	//这个是用来DrivenModel传值的
	Navigation navigation =  new Navigation();
	Navigation navigationUpdate = null ;	//用来保存从数据库中load出的要更新的对象
	Navigation navigationDelete = null ;	//用来保存从数据库中load出的要删除的对象
	//这个是用来存储方法的Navigation菜单对象的集合
	private List<Navigation> menuItems;
	public List<Navigation> getMenuItems() {
		return menuItems;
	}

	public void setMenuItems(List<Navigation> menuItems) {
		this.menuItems = menuItems;
	}

	public String mainPage(){
		return "mainPage";
	}
	
	/**
	 * 获取全部menu信息
	 * @return 获取成功页面
	 */
	public String get(){
		try {

			String hql = null;
			if(navigation.getId() != null){	//如果当前没有值,那就默认显示一级菜单
				hql = "from Navigation where parentId="+navigation.getId();
			}else{
				hql = "from Navigation where parentId=0";
			}
			menuItems =	menuManageService.getMenuItems(hql);	//调用getNavigationItems方法获得Navigation对象
			//System.out.println("menuItems:"+menuItems);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "getSuccess";
	}
	
	public String update(){
		try {
			
			System.out.println("parentId:"+navigation.getParentId());
			System.out.println("actionUrl:"+navigation.getActionUrl());
			System.out.println("Id:"+navigation.getId());
			System.out.println("name:"+navigation.getName());
			
			//根据页面穿过来的Id好load出这个对象
			navigationUpdate = menuManageService.getMenuItems("from Navigation where id="+navigation.getId()).get(0);
			//重新设置这个对象的name属性的值为页面传来的新的名字
			navigationUpdate.setName(navigation.getName());
			//调用写好的update方法来更新一个对象
			menuManageService.updateNavigation(navigationUpdate);
			//下面是返货到当前的这个修改页面，即拿出当前页面的数据
			menuItems =	menuManageService.getMenuItems("from Navigation where parentId="+navigation.getParentId());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "getSuccess";
	}
	
	public String add(){
		try {
			//将菜单添加到数据库中
			menuManageService.addNavigation(navigation);
			//显示添加子菜单后的所有子菜单选项
			menuItems =	menuManageService.getMenuItems("from Navigation where parentId="+navigation.getParentId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "getSuccess";
	}
	
	public String delete(){
		
		try {
			//如果这个菜单项还有子菜单,那么就不能删除此项
			List<Navigation> listChrilden = menuManageService.getMenuItems("from Navigation where parentId="+navigation.getId());
			if(listChrilden.size() <= 0){
				navigationDelete = menuManageService.getMenuItems("from Navigation where id="+navigation.getId()).get(0);
				menuManageService.deleteNavigation(navigationDelete);
				//this.setSuccessed(true);
				//下面是返货到当前的这个修改页面，即拿出当前页面的数据
			}
			menuItems =	menuManageService.getMenuItems("from Navigation where parentId="+navigation.getParentId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "getSuccess";
	}
	
public String cascade(){

		try {
			init();
			PrintWriter pt = response.getWriter();
			String hql = "from Navigation where parentId="+navigation.getParentId();
			String jsonNavigationString = menuManageService.getJosnNavigationFromList(hql);
			//System.out.println("jsonNavigationString:"+jsonNavigationString);
			pt.println(jsonNavigationString);
			pt.flush();
			pt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "getSuccess";
		//return null;
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
		return navigation;
	}
}
