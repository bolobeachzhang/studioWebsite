package cn.edu.cdu.lab.action;

import java.util.Date;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import cn.edu.cdu.lab.model.Forum;
import cn.edu.cdu.lab.model.Message;
import cn.edu.cdu.lab.service.ForumService;
import cn.edu.cdu.lab.service.MessageService;

public class ManageMessageActionTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void test() {
		ApplicationContext applicationContext = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
		MessageService messageService = (MessageService) applicationContext.getBean("messageService");
		
		for(int i = 0; i < 20; i++){
			Message message = new Message();
			message.setMessager("李华" + i);
			message.setMessageCon("这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据这里是测试数据" + i);
			messageService.saveMessage(message);
		}
	}
	
	
	@Test
	public void insrtFourm() {
		ApplicationContext applicationContext = new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
		ForumService forumService = (ForumService) applicationContext.getBean("forumService");
		
		for(int i = 0; i < 50; i++){
			Forum ff = new Forum();
			ff.setParentId(0);
			ff.setSpokerId("110");
			ff.setSpokerName("谭秀江");
		//	ff.setSpokerTime(new Date());
			ff.setSpokerType("学生");
			ff.setTopic_content("加油");
			forumService.saveForum_T(ff);
		}
	}

}
