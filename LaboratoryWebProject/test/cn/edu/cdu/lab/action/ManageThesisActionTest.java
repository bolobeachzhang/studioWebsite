package cn.edu.cdu.lab.action;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class ManageThesisActionTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void test() throws Exception {
		ApplicationContext applicationContext = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
		ManageThesisAction manageThesisAction = (ManageThesisAction) applicationContext.getBean("manageThesisAction");
		manageThesisAction.uploadDeal();
	}

}
