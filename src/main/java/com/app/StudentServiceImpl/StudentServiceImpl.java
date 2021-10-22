package com.app.StudentServiceImpl;

import java.sql.SQLException;
import java.util.List;import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;

import com.app.StudentService.StudentService;
import com.app.dao.StudentDao;
import com.app.model.Student;

public   class StudentServiceImpl implements StudentService {
 
	StudentDao studentDao = new StudentDao();
	public boolean insertStudent(Student student) throws SQLException  {
		return studentDao.inserStudent(student) ;
	}
 
	public List<Student> getAllStudents() {
		return studentDao.getStudents();
	}

	public Student getStudentById(int studentId) throws SQLException{
		 return studentDao.getStudentById(studentId);
			 
		}

	public boolean editStudent(Student student) throws SQLException {
		return studentDao.editStudent(student);
	}

	public boolean deleteStudent(int studentId) {
		return studentDao.deleteStudent(studentId);
	}  
	} 
 