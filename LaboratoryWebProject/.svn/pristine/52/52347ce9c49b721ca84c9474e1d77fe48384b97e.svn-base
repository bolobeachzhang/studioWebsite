/**
 * @Title ManagePersonAction.java
 * @Package cn.edu.cdu.lab.action
 * @Description [简要描述本文件的作用] 本文件是后台管理员操作人员管理类
 * @author 李华 【643444070@qq.com】
 * @Date 2013-3-14 9:26:10
 * @Version 1.0
 * 
 */
package cn.edu.cdu.lab.action;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.cdu.lab.model.Administrator;
import cn.edu.cdu.lab.model.Register;
import cn.edu.cdu.lab.model.Student;
import cn.edu.cdu.lab.model.Teacher;
import cn.edu.cdu.lab.service.PersonService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ManagePersonAction 
 * @Description: 本文件是后台管理员操作人员管理类
 * @author 李华 【643444070@qq.com】
 * @date 2013-3-14 9:26:30
 *
 */
public class ManagePersonAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private PersonService personService;
	private List<Administrator> administrators;
	private List<Teacher> teachers;
	private List<Student> students;
	private List<Register> registers;
	
	private Teacher teacher; //管理员添加的教师
	private Student student; //管理员添加的学生
	private Register register; // 管理员添加的注册人员
	private File picture; //头像
	
	private String oldPicturePath = null; //保存头像的物理地址，如果头像有更改就根绝这个值删除原来的图像
	
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Register getRegister() {
		return register;
	}

	public void setRegister(Register register) {
		this.register = register;
	}

	public File getPicture() {
		return picture;
	}

	public void setPicture(File picture) {
		this.picture = picture;
	}

	/**
	 * @see 跳转到人员添加页面
	 * @return
	 */
	public String add(){
		
		return "addSuccess";
	}
	
	/**
	 * 处理添加管理员
	 * @return
	 */
	public String addM(){
		init();
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		
		personService.saveManager(userid, username, userpass);
		
		request.setAttribute("SUCCESS", "添加管理员成功");
		return "addSuccess"; //这里依然返回添加人员页面
	}
	
	/**
	 * 添加一个教师信息
	 * @return
	 */
	public String addT() throws Exception{
		
		if(pictureUpload() != null){
			teacher.setPictureUrl(pictureUpload());
		}
		personService.saveTeacher(teacher);
		request.setAttribute("SUCCESS", "添加教师成功");
		return "addSuccess";
	}
	
	/**
	 * 添加一个学生信息
	 * @return
	 * @throws Exception 
	 */
	public String addS() throws Exception{
		init();
		if(pictureUpload() != null){
			student.setImageUrl(pictureUpload());
		}
		
		personService.saveStudent(student);
		request.setAttribute("SUCCESS", "添加学生成功");
		return "addSuccess";
	}
	
	/**
	 * 添加一个注册人员信息
	 * @return
	 * @throws Exception 
	 */
	public String addR() throws Exception{
		init();
		if(pictureUpload() != null){
			register.setImageUrl(pictureUpload());
		}
		
		personService.saveReister(register);
		request.setAttribute("SUCCESS", "添加注册人员成功");
		return "addSuccess";
	}
	
	/**
	 * 管理员对管理员进行管理
	 * @return
	 */
	public String managerManage(){
		init();
		administrators = new ArrayList<Administrator>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		administrators = personService.getList(Administrator.class, pageSize*(pageNow - 1), pageSize, null);
		pageCount = personService.getPageCount(Administrator.class, pageSize);
		
		request.setAttribute("administrators", administrators);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		
		return "managerManageSuccess";
	}
	
	/**
	 * 管理员对教师进行管理
	 * @return
	 */
	public String teacherManage(){
		init();
		teachers = new ArrayList<Teacher>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		teachers = personService.getList(Teacher.class, pageSize*(pageNow - 1), pageSize, null);
		pageCount = personService.getPageCount(Teacher.class, pageSize);
		
		request.setAttribute("teachers", teachers);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "teacherManageSuccess";
	}
	
	/**
	 * 管理员对学生进行管理
	 * @return
	 */
	public String studentManage(){
		init();
		students = new ArrayList<Student>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		students = personService.getList(Student.class, pageSize*(pageNow - 1), pageSize, null);
		pageCount = personService.getPageCount(Student.class, pageSize);
		
		request.setAttribute("students", students);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "studentManageSuccess";
	}
	
	/**
	 * 管理员对注册人员进行管理
	 * @return
	 */
	public String registerManage(){
		init();
		registers = new ArrayList<Register>();
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 10;
		if(request.getParameter("pageNow") != null){
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
		}
		
		registers = personService.getList(Register.class, pageSize*(pageNow - 1), pageSize, null);
		pageCount = personService.getPageCount(Register.class, pageSize);
		
		request.setAttribute("registers", registers);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		return "registerManageSuccess";
	}
	
	
	
	/**
	 * 对教师信息的修改，可以是教师本身或者管理员
	 * @return
	 */
	public String updateT(){
		init();
		String teacherId = request.getParameter("teacherId"); //从请求参数过来的是老师更改
		if(teacherId == null){
			teacherId = request.getSession().getAttribute("USER_ID").toString(); // 从session获得的是老师更改的
		}
		Teacher teacher = personService.getTeacher(teacherId);
		String imageUrl = teacher.getPictureUrl(); //服务器绝对地址
		if(imageUrl != null){
			oldPicturePath = imageUrl; //保存一个地址，用于和更新后的比较是否有变化，有变化就删除原来的图片
			imageUrl = imageUrl.substring(imageUrl.lastIndexOf("\\") + 1);
			String relativeUrl = "File/images/" + imageUrl; //浏览器相对地址
			teacher.setPictureUrl(relativeUrl);
		}
		
		
		request.setAttribute("teacher", teacher);
		
		return "updateTSuccess";
	}
	
	/**
	 * 处理教师信息的修改
	 * @return
	 * @throws IOException 
	 * @throws Exception 
	 */
	public String updateTDeal() throws Exception{
		init();
		if(pictureUpload() != null){
			teacher.setPictureUrl(pictureUpload());
			if(oldPicturePath != null){ //设置了新的图片就删除原来的图片
				File file = new File(oldPicturePath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		personService.updateTeacher(teacher);
		response.getWriter().write("<script type='text/javascript'> alert('修改教师信息成功')</script>");
		response.flushBuffer();
		response.getWriter().close();
		return NONE;
	}
	
	/**
	 * 对学生信息的修改，可以是学生本身或者管理员
	 * @return
	 * @throws Exception 
	 */
	public String updateS() throws Exception{
		init();
		String studentId = request.getParameter("studentId"); //从请求参数过来的是老师更改
		if(studentId == null){
			studentId = request.getSession().getAttribute("USER_ID").toString(); // 从session获得的是学生更改的
		}
		Student student = personService.getStudent(studentId);
		
		
		String imageUrl = student.getImageUrl();
		if(imageUrl != null){
			oldPicturePath = imageUrl;
			imageUrl = imageUrl.substring(imageUrl.lastIndexOf("\\") + 1);
			String relativeUrl = "File/images/" + imageUrl;
			student.setImageUrl(relativeUrl);
		}
		
		
		request.setAttribute("student", student);
		
		return "updateSSuccess";
	}
	
	/**
	 * 处理学生信息的修改
	 * @return
	 * @throws Exception 
	 */
	public String updateSDeal() throws Exception{
		init();
		if(pictureUpload() != null){
			student.setImageUrl(pictureUpload());
			if(oldPicturePath != null){ //设置了新的图片就删除原来的图片
				File file = new File(oldPicturePath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		personService.updateStudent(student);
		response.getWriter().write("<script type='text/javascript'> alert('修改学生信息成功')</script>");
		response.flushBuffer();
		response.getWriter().close();
		
		return NONE;
	}
	
	/**
	 * 对注册人员信息的修改，可以是注册人员本身或者管理员
	 * @return
	 */
	public String updateR(){
		init();
		String registerId = request.getParameter("registerId"); //从请求参数过来的是老师更改
		if(registerId == null){
			registerId = request.getSession().getAttribute("USER_ID").toString(); // 从session获得的是注册人员更改的
		}
		Register register = personService.getRegister(registerId);
		request.setAttribute("register", register);
		
		String imageUrl = register.getImageUrl();
		if(imageUrl != null){
			oldPicturePath = imageUrl;
			imageUrl = imageUrl.substring(imageUrl.lastIndexOf("\\") + 1);
			String relativeUrl = "File/images/" + imageUrl;
			register.setImageUrl(relativeUrl);
		}
		
		return "updateRSuccess";
	}
	
	/**
	 * 处理注册人员信息的修改
	 * @return
	 * @throws Exception 
	 */
	public String updateRDeal() throws Exception{
		init();
		if(pictureUpload() != null){
			register.setImageUrl(pictureUpload());
			if(oldPicturePath != null){ //设置了新的图片就删除原来的图片
				File file = new File(oldPicturePath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		personService.updateRegister(register);
		response.getWriter().write("<script type='text/javascript'> alert('修改注册人员信息成功')</script>");
		response.flushBuffer();
		response.getWriter().close();
		
		return NONE;
	}
	
	/**
	 * 检查ID是否可用
	 * @return
	 */
	public String checkID(){
		init();
		
		String userID = request.getParameter("id");
		Integer userType = Integer.parseInt(request.getParameter("type"));
		
		if(personService.checkID(userID, userType)){
			try {
				response.getWriter().write("ok");
				response.flushBuffer();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return NONE;
	}
	
	/**
	 * 删除一条记录
	 * @return
	 */
	public String deleteOne(){
		init();
		String id = request.getParameter("id");
		Integer type = Integer.parseInt(request.getParameter("type"));
		
		try {
			personService.deleteOne(id, type);
			
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	public String deleteChecked(){
		init();
		Integer type = Integer.parseInt(request.getParameter("type"));
		String resoult = request.getParameter("resoult");
		String[] strings = resoult.split(",");
		
		try {
			for(String string : strings){
				personService.deleteOne(string, type);
			}
			
			response.getWriter().write("ok");
			response.flushBuffer();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
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
	
	private  String filePath = null;
	private  String narrowPath = null;
	/**
	 * 处理添加人员的头像
	 * @return
	 * @throws Exception
	 */
	private final String pictureUpload() throws Exception{
		init();
		
		String relativePath = null;
		if(picture != null){ 
			try {
				InputStream inputStream = new FileInputStream(getPicture());
				String dir = request.getSession().getServletContext().getRealPath("/File/images");
				File dirFile = new File(dir);
				if(!dirFile.exists()){ //文件夹不存在就创建
					dirFile.mkdirs();
				}
				long time = System.currentTimeMillis();
				filePath = dir + "\\"+ time + ".jpg"; //这个地址是图片的服务器物理地址
				narrowPath = dir + "\\" + time + "min.jpg"; //缩小图
				relativePath = "File/images/"+time+".jpg";
				File file = new File(filePath);
				
				OutputStream outputStream = new FileOutputStream(file);
				byte[] buffer = new byte[1024];
				int count = 0;
				while((count = inputStream.read(buffer)) > 0){
					outputStream.write(buffer,0,count);
				}
				outputStream.close();
				inputStream.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
		return filePath;
	}
	
	private final void pictureCut(String srcImageFile, String descDir,
			int destWidth, int destHeight){
		try {
			if(destWidth <= 0){destWidth = 100;} //切片宽度
			if(destHeight <= 0){destHeight = 100;} //切片高度
			
			BufferedImage bufferedImage = ImageIO.read(new File(srcImageFile)); //读取源图像
			int srcWidth = bufferedImage.getWidth();
			int srcHeight = bufferedImage.getHeight();
			if(srcHeight > destHeight && srcWidth > destWidth){
				Image img;
				ImageFilter imageFilter;
				Image image = bufferedImage.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
				
				int cols = 0;
				int rows = 0;
				
				cols = srcWidth % destWidth == 0 ? srcWidth / destWidth : (int)Math.floor(srcWidth / destWidth) + 1;
				rows = srcHeight % destHeight == 0 ? srcHeight / destHeight : (int)Math.floor(srcHeight / destHeight) + 1;
				for(int i = 0; i < rows; i++){
					for(int j = 0; j < cols; i++){
						imageFilter = new CropImageFilter(j*destWidth, i*destHeight, destWidth, destHeight);
						img = Toolkit.getDefaultToolkit().createImage(
								new FilteredImageSource(image.getSource(),imageFilter));
						BufferedImage tag = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_BGR);
						Graphics graphics = tag.getGraphics();
						graphics.drawImage(img,0,0,null);
						graphics.dispose();
						ImageIO.write(tag, "JEPG", 
								new File(descDir + "_r" + i + "_c" + j + ".jpg"));
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
