package com.app.StudentService;

import java.sql.SQLException;
import java.util.List;

import com.app.model.Student;

public interface StudentService {

	public boolean insertStudent(Student student) throws SQLException;
	
	public List<Student> getAllStudents();
	
	public Student getStudentById(int studentId) throws SQLException  ;
	
	public boolean editStudent(Student student) throws SQLException;
	
	public boolean deleteStudent(int studentId);

}