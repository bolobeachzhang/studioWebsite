/**   
* @Title: BasicDao.java 
* @Package cn.edu.cdu.lab.dao.impl 
* @Description: 该文件包含dao层基本的数据处理的抽象方法定义和使用说明 
* @author 李华
* @date 2013-2-27 23:30:10 
* @version V1.0   成都大学信息科学与技术学院
*/
package cn.edu.cdu.lab.dao;

/** 
 * @ClassName: BasicDaoImpl 
 * @Description: 该类是以后dao层的基类抽象类
 * @author 李华
 * @date 2013-2-27 23:31:20 
 *  
 */
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface BasicDao {
	
	/**
	 * 保存一个对象
	 * @param entity 持久化对象
	 */
	@Transactional(propagation = Propagation.REQUIRED)//spring事务管理注解
	public void save(Object entity);
	
	/**
	 * 更新一个对象
	 * hibernate的更新对象需要先从数据库中拿出来才能更新
	 * @param entity 持久化对象
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(Object entity);
	
	/**
	 * 删除一个对象
	 * hibernate的更新对象需要先从数据库中拿出来才能删除
	 * @param entity 持久化对象
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(Object entity);
	
	/**
	 * 根据持久化类来全部删除
	 * @param clazz 持久化类
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteAll(Class clazz);
	
	/**
	 * 根据持久化类查询全部
	 * @param clazz 持久化类
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List loadAll(Class clazz);
	
	/**
	 * 根据hql语句查询结果
	 * @param hql 查询语句
	 * @return 返回结果集
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List query(String hql);
	
	/**
	 * 根据hql语句查询结果
	 * @param hql 查询语句
	 * @param param 一个查询参数
	 * @return 返回结果集
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List query(String hql, Object param);
	
	/**
	 * 根据hql语句查询结果
	 * @param hql 查询语句
	 * @param params 一个参数列表
	 * @return 返回结果集
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List query(String hql, Object[] params);
	
	/**
	 * 分页查询
	 * @param hql 条件查询语句
	 * @param offset 跳过记录数
	 * @param obtain 查询记录数
	 * @param params 查询参数列表
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List pageQuery(String hql, int offset, int obtain, Object[] params);
	
	/**
	 * 获取条件查询结果的记录数
	 * 这个作用比单独用于分页更通用，比如还可以用于登录验证
	 * @param hql 查询条件
	 * @param params 查询参数列表
	 * @return 结果集的
	 */
	public int affectNumber(String hql, Object[] params);

}