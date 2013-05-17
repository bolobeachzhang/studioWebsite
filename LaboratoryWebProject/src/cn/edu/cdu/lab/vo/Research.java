package cn.edu.cdu.lab.vo;

import java.util.List;

import cn.edu.cdu.lab.model.Teacher;

/**
 * @ClassName: Research 
 * @Description: 用于前台研究队伍的研究方向的数据传递
 * @author:chenliang
 * @date：2013-03-24
 */
public class Research {
	private List<Teacher> academicLeaders; //学术带头人
	private List<Teacher> directors; //主任
	private List<Teacher> members; //成员
	
	public List<Teacher> getAcademicLeaders() {
		return academicLeaders;
	}
	public void setAcademicLeaders(List<Teacher> academicLeaders) {
		this.academicLeaders = academicLeaders;
	}
	public List<Teacher> getDirectors() {
		return directors;
	}
	public void setDirectors(List<Teacher> directors) {
		this.directors = directors;
	}
	public List<Teacher> getMembers() {
		return members;
	}
	public void setMembers(List<Teacher> members) {
		this.members = members;
	}
}
