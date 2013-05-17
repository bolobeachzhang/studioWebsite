package cn.edu.cdu.lab.model;

import static org.junit.Assert.*;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.orm.hibernate3.LocalSessionFactoryBean;

public class AutoCreateTable{

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void test() {
		ApplicationContext applicationContext = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
		LocalSessionFactoryBean factoryBean = (LocalSessionFactoryBean) applicationContext.getBean("&sessionFactory");
		Configuration configuration = factoryBean.getConfiguration();
		SchemaExport export = new SchemaExport(configuration);
		export.create(true, true);
	}

}
