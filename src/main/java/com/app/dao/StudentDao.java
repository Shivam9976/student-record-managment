package com.app.dao;

import static com.app.config.DBCon.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.app.model.Student;

public class StudentDao {

	private static final Logger log = Logger.getLogger(StudentDao.class);

	public boolean inserStudent(Student student) throws SQLException {
		log.info("Adding student..");
		String query = "insert into student(name,number) values (?,?) ";
		log.info("Preparing statement..");
		PreparedStatement pstmt = connection().prepareStatement(query);
		pstmt.setString(1, student.getName());
		pstmt.setLong(2, student.getNumber());
		log.info("Executing statement..");
		return pstmt.executeUpdate() > 0;
	}

	public List<Student> getStudents() {
		List<Student> list = new ArrayList<Student>();
		String query = "SELECT * FROM STUDENT";
		Student student;
		new Student();
		try {
			Connection conn = connection();
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				student = new Student();
				student.setId(rs.getInt(1));
				student.setName(rs.getString(2));
				student.setNumber(rs.getLong(3));
				list.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Student getStudentById(int studentId) throws SQLException {
		String query = "SELECT id,name,number from  student where id =2;";
		Student s = new Student();
		Connection conn = connection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, studentId);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			s.setName(query);
			s.setNumber(rs.getInt("number"));
		}
		return s;
	}

	public boolean editStudent(Student student) throws SQLException {
		String query = "UPDATE  student SET name = ?, `number` = ? WHERE (id = ?);";
		Connection conn = connection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(3, student.getId());
		pstmt.setString(1, student.getName());
		pstmt.setLong(2, student.getNumber());
		return (pstmt.executeUpdate() > 0);
	}

	public boolean deleteStudent(int studentId) {
		boolean status = false;
		String query = " DELETE  FROM student2.student WHERE id =?;";
		try {
			Connection conn = connection();
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, studentId);
			status = (pstmt.executeUpdate()>0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
}
