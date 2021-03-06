package cn.edu.cdu.lab.service.impl;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import cn.edu.cdu.lab.service.ThesisService;

public class ThesisServiceImplTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void test() {
		ApplicationContext applicationContext = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
		ThesisService thesisService = (ThesisService) applicationContext.getBean("thesisService");
	}

}
