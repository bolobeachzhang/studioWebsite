/**
 * interfaceName: MenuService
 * author: chenliang
 * description: 这是菜单管理的接口
 * date: 2013-03-14
 */
package cn.edu.cdu.lab.service;

import java.util.List;

import cn.edu.cdu.lab.model.Navigation;

public interface MenuManageService {
	/**
	 * description:这个方法是用来获取所有的菜单
	 * @return
	 * @throws Exception
	 */
	public abstract List<Navigation> getMenuItems(String hql) throws Exception;
	
	/**@method:updateNavigation
	 * @param navigation
	 * @description:用来更新菜单的名字
	 * @throws Exception
	 */
	public abstract void updateNavigation(Navigation navigation) throws Exception;
	
	/**
	 * @method:addNavigation
	 * @param navigation
	 * @description:添加一个菜单选项
	 * @throws Exception
	 */
	public abstract void addNavigation(Navigation navigation) throws Exception;
	
	/**
	 * @method:deleteNavigation
	 * @param navigation
	 * @description:删除指定的对象
	 * @throws Exception
	 */
	public abstract void deleteNavigation(Navigation navigation) throws Exception;
	
	/**
	 * @method:getJosnNavigationFromList
	 * @param hql
	 * @description:将返货的list对象的数据转成json数据格式
	 * @throws Exception
	 */
	public abstract String getJosnNavigationFromList(String hql) throws Exception;
}