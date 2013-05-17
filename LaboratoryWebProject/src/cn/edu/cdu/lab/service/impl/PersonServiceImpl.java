/**
 * @Title PersonServiceImpl.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 该文件是管理员处理人员管理模块的业务实现
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-15 18:26:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import cn.edu.cdu.lab.dao.impl.BasicDaoImpl;
import cn.edu.cdu.lab.model.Administrator;
import cn.edu.cdu.lab.model.Register;
import cn.edu.cdu.lab.model.Student;
import cn.edu.cdu.lab.model.Teacher;
import cn.edu.cdu.lab.service.PersonService;
import cn.edu.cdu.lab.vo.Post;
import cn.edu.cdu.lab.vo.Research;
import cn.edu.cdu.lab.vo.Title;

/**
 * @ClassName: PersonServiceImpl 
 * @Description:该文件是管理员处理人员管理模块的业务实现
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-15 18:26:40
 *
 */
public class PersonServiceImpl extends BasicDaoImpl implements PersonService {
	
	public boolean checkID(String id, Integer type){
		switch (type) {
		case 16:
			Integer resoult1 = this.query("from Administrator where adminId = ?", new String[]{id}).size();
			if(resoult1 <= 0){
				return true;
			}
			break;
		case 8:
			Integer resoult2 = this.query("from Teacher where teacherId = ?", new String[]{id}).size();
			if(resoult2 <= 0){
				return true;
			}
			break;
		case 4:
			Integer resoult3 = this.query("from Student where studentId = ?", new String[]{id}).size();
			if(resoult3 <= 0){
				return true;
			}
			break;
		case 2:
			Integer resoult4 = this.query("from Register where registerId = ?", new String[]{id}).size();
			if(resoult4 <= 0){
				return true;
			}
			break;
		}
		return false;
	}
	
	public void saveManager(String userid,String username, String userpass){
		Administrator administrator = new Administrator();
		administrator.setAdminId(userid);
		administrator.setName(username);
		administrator.setPassword(userpass);
		save(administrator);
	}

	@Override
	public void saveTeacher(Teacher teacher) {
		this.save(teacher);
	}

	@Override
	public void saveStudent(Student student) {
		this.save(student);
	}

	@Override
	public void saveReister(Register register) {
		this.save(register);
	}

	@Override
	public List getList(Object entity, int offset, int obtain, Object[] params) {
		if(entity.equals(Administrator.class)){
			return pageQuery("from Administrator", offset, obtain, params);
		}
		
		if(entity.equals(Teacher.class)){
			return pageQuery("from Teacher", offset, obtain, params);
		}
		
		if(entity.equals(Student.class)){
			return pageQuery("from Student", offset, obtain, params);
		}
		
		if(entity.equals(Register.class)){
			return pageQuery("from Register", offset, obtain, params);
		}
		return null;
	}

	@Override
	public Integer getPageCount(Object entity, int obtain) {
		if(entity.equals(Administrator.class)){
			int rowSize = this.affectNumber("from Administrator", null);
			return rowSize%obtain == 0 ? rowSize/obtain : rowSize/obtain + 1; 
		}
		
		if(entity.equals(Teacher.class)){
			int rowSize = this.affectNumber("from Teacher", null);
			return rowSize%obtain == 0 ? rowSize/obtain : rowSize/obtain + 1; 
		}
		
		if(entity.equals(Student.class)){
			int rowSize = this.affectNumber("from Student", null);
			return rowSize%obtain == 0 ? rowSize/obtain : rowSize/obtain + 1; 
		}
		
		if(entity.equals(Register.class)){
			int rowSize = this.affectNumber("from Register", null);
			return rowSize%obtain == 0 ? rowSize/obtain : rowSize/obtain + 1; 
		}
		return null;
	}

	@Override
	public void deleteOne(String id, int type) {
		switch (type) {
		case 16: 
			this.delete(getHibernateTemplate().load(Administrator.class, id));
			break;
		case 8:
			Teacher teacher = (Teacher) getHibernateTemplate().load(Teacher.class, id);
			if(teacher.getPictureUrl() != null){
				File file = new File(teacher.getPictureUrl());
				if(file.exists()){
					file.delete();
				}
			}
			this.delete(teacher);
			break;
		case 4:
			Student student = (Student) getHibernateTemplate().load(Student.class, id);
			if(student.getImageUrl() != null){
				File file = new File(student.getImageUrl());
				if(file.exists()){
					file.delete();
				}
			}
			this.delete(student);
			break;
		case 2:
			Register register = (Register) getHibernateTemplate().load(Register.class, id);
			if(register.getImageUrl() != null){
				File file = new File(register.getImageUrl());
				if(file.exists()){
					file.delete();
				}
			}
			this.delete(register);
			break;
		}
	}

	@Override
	public void updatePass(int userType, String userID, String pass) {
		switch (userType) {
		case 16:
			Administrator administrator = (Administrator) this.getHibernateTemplate().get(Administrator.class, userID);
			administrator.setPassword(pass);
			this.update(administrator);
			break;
		case 8:
			Teacher teacher = (Teacher) this.getHibernateTemplate().get(Teacher.class, userID);
			teacher.setPassword(pass);
			this.update(teacher);
			break;
		case 4:
			Student student = (Student) this.getHibernateTemplate().get(Student.class, userID);
			student.setPassword(pass);
			this.update(student);
			break;
		case 2:
			Register register = (Register) this.getHibernateTemplate().get(Register.class, userID);
			register.setPassword(pass);
			this.update(register);
			break;
		}
	}

	@Override
	public boolean checkPass(int userType, String userID, String pass) {
		switch (userType) {
		case 16:
			Administrator administrator = (Administrator) this.getHibernateTemplate().get(Administrator.class, userID);
			if(administrator.getPassword().equals(pass)){
				return true;
			}
			break;
		case 8:
			Teacher teacher = (Teacher) this.getHibernateTemplate().get(Teacher.class, userID);
			if(teacher.getPassword().equals(pass)){
				return true;
			}
			break;
		case 4:
			Student student = (Student) this.getHibernateTemplate().get(Student.class, userID);
			if(student.getPassword().equals(pass)){
				return true;
			}
			break;
		case 2:
			Register register = (Register) this.getHibernateTemplate().get(Register.class, userID);
			if(register.getPassword().equals(pass)){
				return true;
			}
			break;
		}
		return false;
	}

	@Override
	public Teacher getTeacher(String teacherId) {
		return (Teacher) this.getHibernateTemplate().get(Teacher.class, teacherId);
	}

	@Override
	public Student getStudent(String studentId) {
		return (Student) this.getHibernateTemplate().get(Student.class, studentId);
	}

	@Override
	public Register getRegister(String registerId) {
		return (Register) this.getHibernateTemplate().get(Register.class, registerId);
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		Teacher mteacher = (Teacher) this.getHibernateTemplate().get(Teacher.class, teacher.getTeacherId());
		mteacher.setName(teacher.getName());
		mteacher.setEmail(teacher.getEmail());
		mteacher.setTitle(teacher.getTitle());
		mteacher.setPhoneNumber(teacher.getPhoneNumber());
		mteacher.setSex(teacher.getSex());
		mteacher.setPictureUrl(teacher.getPictureUrl());
		mteacher.setAge(teacher.getAge());
		mteacher.setResearch(teacher.getResearch());
		mteacher.setPost(teacher.getPost());
		mteacher.setIntroduction(teacher.getIntroduction());
		this.getHibernateTemplate().update(mteacher);
	}

	@Override
	public void updateStudent(Student student) {
		Student mstudent = (Student) this.getHibernateTemplate().get(Student.class, student.getStudentId());
		mstudent.setName(student.getName());
		mstudent.setEmail(student.getEmail());
		mstudent.setStudyDirection(student.getStudyDirection());
		mstudent.setType(student.getType());
		mstudent.setImageUrl(student.getImageUrl());
		mstudent.setIntroduction(student.getIntroduction());
		this.getHibernateTemplate().update(mstudent);
	}

	@Override
	public void updateRegister(Register register) {
		Register mregister = (Register) this.getHibernateTemplate().get(Register.class, register.getRegisterId());
		mregister.setName(register.getName());
		mregister.setEmail(register.getEmail());
		mregister.setPhoneNumber(register.getPhoneNumber());
		mregister.setIdNumber(register.getIdNumber());
		mregister.setSex(register.getSex());
		mregister.setImageUrl(register.getImageUrl());
		mregister.setResearch(register.getResearch());
		mregister.setWorkUnit(register.getWorkUnit());
		mregister.setContent(register.getContent());
		this.getHibernateTemplate().update(mregister);
	}

	@Override
	@SuppressWarnings("unchecked")
	public Research getResearch(int type) {
		if(type == 1){ //图形处理与模式识别研究方向
			Research research = new Research();
			
			List<Teacher> academicLeaders = this.query("from Teacher teacher where teacher.research = ? and teacher.post = ?", 
					new String[]{"图形处理与模式识别","学术带头人"});
			research.setAcademicLeaders(academicLeaders);
			List<Teacher> directors = this.query("from Teacher teacher where teacher.research = ? and teacher.post = ?", 
					new String[]{"图形处理与模式识别","主任"});
			research.setDirectors(directors);
			List<Teacher> members = this.query("from Teacher teacher where teacher.research = ? and teacher.post in ('办公室','组长','教师')", 
					new String[]{"图形处理与模式识别"});
			research.setMembers(members);
			
			return research;
  		}
		if(type == 2){ //计算机网络与嵌入式研究方向
			Research research = new Research();
			
			List<Teacher> academicLeaders = this.query("from Teacher teacher where teacher.research = ? and teacher.post = ?", 
					new String[]{"计算机网络与嵌入式","学术带头人"});
			research.setAcademicLeaders(academicLeaders);
			List<Teacher> directors = this.query("from Teacher teacher where teacher.research = ? and teacher.post = ?", 
					new String[]{"计算机网络与嵌入式","主任"});
			research.setDirectors(directors);
			List<Teacher> members = this.query("from Teacher teacher where teacher.research = ? and teacher.post in ('办公室','组长','教师')",  
					new String[]{"计算机网络与嵌入式"});
			research.setMembers(members);
			
			return research;		
		}
		if(type == 3){ //数据库与空间信息研究方向
			Research research = new Research();
			
			List<Teacher> academicLeaders = this.query("from Teacher teacher where teacher.research = ? and teacher.post = ?", 
					new String[]{"数据库与空间技术","学术带头人"});
			research.setAcademicLeaders(academicLeaders);
			List<Teacher> directors = this.query("from Teacher teacher where teacher.research = ? and teacher.post = ?", 
					new String[]{"数据库与空间技术","主任"});
			research.setDirectors(directors);
			List<Teacher> members = this.query("from Teacher teacher where teacher.research = ? and teacher.post in ('办公室','组长','教师')", 
					new String[]{"数据库与空间技术"});
			research.setMembers(members);
			
			return research;
		}
		return null;
	}

	@Override
	@SuppressWarnings("unchecked")
	public Title getTitle() {
		Title title = new Title();
		List<Teacher> doctors = this.query("from Teacher teacher where teacher.title = ?", 
				new String[]{"博士讲师"});
		title.setDoctors(doctors);
		List<Teacher> professors = this.query("from Teacher teacher where teacher.title = ?", 
				new String[]{"教授"});
		title.setProfessors(professors);
		List<Teacher> assistprofessors = this.query("from Teacher teacher where teacher.title = ?", 
				new String[]{"副教授"});
		title.setAssistprofessors(assistprofessors);
		List<Teacher> others = this.query("from Teacher teacher where teacher.title = ?", 
				new String[]{"其他"});
		title.setOthers(others);
		return title;
	}

	@Override
	@SuppressWarnings("unchecked")
	public Post getPost() {
		Post post = new Post();
		List<Teacher> academicLeaders = this.query("from Teacher teacher where teacher.post = ?", 
				new String[]{"学术带头人"});
		post.setAcademicLeaders(academicLeaders);
		List<Teacher> directors = this.query("from Teacher teacher where teacher.post = ?", 
				new String[]{"主任"});
		post.setDirectors(directors);
		List<Teacher> offices = this.query("from Teacher teacher where teacher.post = ?", 
				new String[]{"办公室"});
		post.setOffices(offices);
		List<Teacher> leaders = this.query("from Teacher teacher where teacher.post = ?", 
				new String[]{"组长"});
		post.setLeaders(leaders);
		List<Teacher> teachers = this.query("from Teacher teacher where teacher.post = ?", 
				new String[]{"教师"});
		post.setTeachers(teachers);
		return post;
	}

	@Override
	public List<Student> getOutstandingStudent(int offset, int obtain) {
		return this.pageQuery("from Student student where student.type = 2", offset, obtain, null);
	}
	
	@Override
	public int getOutstandingStudentPageCount(int obtain) {
		int rowCount = this.affectNumber("from Student student where student.type = 2", null);
		return rowCount % obtain == 0 ? rowCount / obtain : rowCount / obtain + 1;
	}
	
	@Override
	public List<Student> getGraduate(int offset, int obtain) {
		return this.pageQuery("from Student student where student.type = 4", offset, obtain, null);
	}
	
	@Override
	public int getGraduatePageCount(int obtain) {
		int rowCount = this.affectNumber("from Student student where student.type = 4", null);
		return rowCount % obtain == 0 ? rowCount / obtain : rowCount / obtain + 1;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List login(int userType, String userid, String password) {
		switch (userType) {
		case 16:
			List<Administrator> administrators = this.query("from Administrator admin where admin.adminId = ? and admin.password = ?", 
					new String[]{userid, password});
			if(administrators != null && administrators.size() == 1){
				return administrators;
			}
			break;
		case 8:
			List<Teacher> teachers = this.query("from Teacher teacher where teacher.teacherId = ? and teacher.password = ?", 
					new String[]{userid, password});
			if(teachers != null && teachers.size() == 1){
				return teachers;
			}
			break;
		case 4:
			List<Student> students = this.query("from Student student where student.name = ? and student.password = ?", 
					new String[]{userid, password});
			if(students != null && students.size() == 1){
				return students;
			}
			break;
		case 2:
			List<Register> registers = this.query("from Register register where register.registerId = ? and register.password = ?", 
					new String[]{userid, password});
			if(registers != null && registers.size() == 1){
				return registers;
			}
			break;
		}
		return null;
	}

	

	
}





