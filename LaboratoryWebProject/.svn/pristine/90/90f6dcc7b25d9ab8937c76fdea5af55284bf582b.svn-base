package cn.edu.cdu.lab.service.impl;

import java.util.List;

import cn.edu.cdu.lab.dao.impl.BasicDaoImpl;
import cn.edu.cdu.lab.model.Navigation;
import cn.edu.cdu.lab.service.MenuManageService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

public class MenuManageServiceImpl extends BasicDaoImpl implements MenuManageService {
	/* (non-Javadoc)
	 * @see cn.edu.cdu.lab.service.impl.MenuService#getMenuItems()
	 */
	@Override
	/**
	 * method:getMenuItems
	 * description:获得菜单集合
	 */
	public List<Navigation> getMenuItems(String hql) throws Exception{
		//List<Navigation> navigations = this.query(hql);
		return this.query(hql);
	}

	@Override
	public void updateNavigation(Navigation navigation) throws Exception {
		this.update(navigation);
		
	}

	@Override
	public void addNavigation(Navigation navigation) throws Exception {
		this.save(navigation);
	}

	@Override
	public void deleteNavigation(Navigation navigation) throws Exception {
		this.delete(navigation);
	}

	@Override
	public String getJosnNavigationFromList(String hql) throws Exception {
		List<Navigation> navigationList = this.query(hql);
		GsonBuilder builder = new GsonBuilder();
		//builder.excludeFieldsWithoutExposeAnnotation();	//如果加上这句就得不到值
		Gson gson = builder.create();
		String jsonNavigationString = gson.toJson(navigationList,new TypeToken<List<Navigation>>(){}.getType());
		return jsonNavigationString;
	}
}
