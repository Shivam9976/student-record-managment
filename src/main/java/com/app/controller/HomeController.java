package com.app.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.StudentService.StudentService;
import com.app.StudentServiceImpl.StudentServiceImpl;
import com.app.model.Student;

@Controller
public class HomeController {

	static final Logger log = Logger.getLogger(HomeController.class);
	StudentService service = new StudentServiceImpl();

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		log.info("Loading homepage..");
		mv.addObject("student", service.getAllStudents());
		mv.setViewName("studentList");
		return mv;
	}

	@GetMapping("/add")
	public ModelAndView insertStudent(HttpServletRequest request, ModelMap m) throws SQLException {
		Student student = new Student();
		ModelAndView mv = new ModelAndView();
		String message = null;
		student.setId((Integer.parseInt(request.getParameter("id"))));
		student.setName(request.getParameter("name"));
		student.setNumber(Integer.parseInt(request.getParameter("number")));
		if (request.getParameter("action").equals("save")) {
			if (service.insertStudent(student)) {
				message = "record added";
			} else {
				message = "record not added";
			}
		} else if (request.getParameter("action").equals("edit")) {
			if (service.editStudent(student)) {
				message = "Record updated";
			} else {
				message = "Record not updated";
			}
		}
		mv.addObject("message", message);
		mv.setViewName("index");
		return mv;
	}

	@GetMapping("/list")
	public ModelAndView getAllStudents(ModelMap m) {
		ModelAndView mv = new ModelAndView();
		List<Student> list = new ArrayList<Student>();
		list = service.getAllStudents();
		mv.addObject("student", list);
		mv.setViewName("studentList");
		return mv;
	}

	@PostMapping("/save")
	public ModelAndView getStudentById(@ModelAttribute Student student, HttpServletRequest req,ModelMap m) {
		ModelAndView mv = new ModelAndView();
		student.setName(req.getParameter("name"));
		student.setNumber(Integer.parseInt(req.getParameter("number")));
		try {
			if (req.getParameter("action").equals("add")) {
				if (service.insertStudent(student)) {
					mv.addObject("message", "record added");
				} else {
					mv.addObject("message", "record not added");
				}
			} else if (req.getParameter("action").equals("edit")) {
				if (service.editStudent(student)) {
					mv.addObject("message", "Record updated");
				} else {
					mv.addObject("message", "Record not updated");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("studentList");
		mv.addObject("student", service.getAllStudents());
		return mv;
	}
	@GetMapping("/delete")
	public ModelAndView deletStudent(HttpServletRequest request,ModelMap m) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("delete",service.deleteStudent(Integer.parseInt(request.getParameter("id"))));
		mv.addObject("student",service.getAllStudents());
		mv.setViewName("studentList");
		return mv;
	}
}
