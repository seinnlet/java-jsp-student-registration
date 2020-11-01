package com.mmit.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mmit.controller.service.StudentService;
import com.mmit.entity.Student;

@WebServlet({"/students", "/student-add", "/student-edit", "/student-delete"})

public class StudentController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private StudentService studentService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		super.init(config);
		EntityManagerFactory EMF = null;
		
		Object obj = getServletContext().getAttribute("emf");
		if (obj == null) {
			EMF = Persistence.createEntityManagerFactory("assignment");
			getServletContext().setAttribute("emf", EMF);
		} else {
			EMF = (EntityManagerFactory) obj;
		}
		studentService = new StudentService(EMF.createEntityManager());
	}
	
	@Override
	public void destroy() {
		
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getServletPath();
		if ("/students".equals(path)) {
			
			List<Student> studentlist = studentService.findAll();
			req.setAttribute("students", studentlist);

			getServletContext().getRequestDispatcher("/student.jsp").forward(req, resp);
		
		} else if ("/student-edit".equals(path)) {
			
			String id = req.getParameter("studentid");
			Student s = studentService.findById(Integer.parseInt(id));
			req.setAttribute("student", s);
			
			getServletContext().getRequestDispatcher("/student-add.jsp").forward(req, resp);
		
		} else if ("/student-delete".equals(path)) {
			
			String id = req.getParameter("studentid");
			studentService.delete(Integer.parseInt(id));
			resp.sendRedirect(req.getContextPath().concat("/students"));
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getServletPath();
		if ("/student-add".equals(path)) {
			
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			
			Student s = (id.equals("") ? new Student() : studentService.findById(Integer.parseInt(id)));
			s.setName(name);
			s.setEmail(email);
			s.setPhone(phone);
			
			studentService.save(s);
			
			resp.sendRedirect(req.getContextPath().concat("/students"));
		} 
	}
}
