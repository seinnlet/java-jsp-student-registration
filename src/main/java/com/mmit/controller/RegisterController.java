package com.mmit.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mmit.controller.service.ClassesService;
import com.mmit.controller.service.RegisterService;
import com.mmit.controller.service.StudentService;
import com.mmit.entity.Classes;
import com.mmit.entity.Registration;
import com.mmit.entity.Student;

@WebServlet({"/register"})

public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ClassesService classService;
	private StudentService studentService;
	private RegisterService registerService;
	
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
		
		classService = new ClassesService(EMF.createEntityManager());
		studentService = new StudentService(EMF.createEntityManager());
		registerService = new RegisterService(EMF.createEntityManager());
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
		if ("/register".equals(path)) {
			
			List<Classes> classlist = classService.findAll();
			req.setAttribute("classes", classlist);
			
			List<Student> studentlist = studentService.findAll();
			req.setAttribute("students", studentlist);
			
			getServletContext().getRequestDispatcher("/register.jsp").forward(req, resp);
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getServletPath();
		if ("/register".equals(path)) {
			
			String classId = req.getParameter("classid");
			String studentId = req.getParameter("studentid");
			String registerdate = req.getParameter("registerdate");
			String paidamount = req.getParameter("paidamount");
			
			Registration reg = new Registration();
			reg.setPaidamount(Integer.parseInt(paidamount));
			reg.setRegisterdate(LocalDate.parse(registerdate));
			reg.setClasses(classService.findById(Integer.parseInt(classId)));
			reg.setStudent(studentService.findById(Integer.parseInt(studentId)));
			
			registerService.save(reg);
			
			resp.sendRedirect(req.getContextPath().concat("/register"));
		}
	}
	
}
