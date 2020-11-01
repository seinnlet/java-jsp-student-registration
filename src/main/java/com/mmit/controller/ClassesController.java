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
import com.mmit.controller.service.CourseService;
import com.mmit.entity.Classes;
import com.mmit.entity.Course;

@WebServlet({"/classes", "/class-add", "/class-edit", "/class-delete", "/class-detail"})

public class ClassesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ClassesService classService;
	private CourseService courseService;
	
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
		courseService = new CourseService(EMF.createEntityManager());
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
		if ("/classes".equals(path)) {
			
			List<Classes> classlist = classService.findAll();
			req.setAttribute("classes", classlist);
			
			getServletContext().getRequestDispatcher("/class.jsp").forward(req, resp);
		
		} else if ("/class-add".equals(path) || "/class-edit".equals(path)) {
			
			List<Course> courselist = courseService.findAll();
			req.setAttribute("courses", courselist);
			
			if ("/class-edit".equals(path)) {
				
				String id = req.getParameter("classid");
				Classes c = classService.findById(Integer.parseInt(id));
				req.setAttribute("eclass", c);
			}
			
			getServletContext().getRequestDispatcher("/class-add.jsp").forward(req, resp);
		
		} else if ("/class-delete".equals(path)) {
			
			String id = req.getParameter("classid");
			classService.delete(Integer.parseInt(id));
			resp.sendRedirect(req.getContextPath().concat("/classes"));
		
		} else if ("/class-detail".equals(path)) {
			
			String id = req.getParameter("classid");
			Classes c = classService.findById(Integer.parseInt(id));
			req.setAttribute("classdetail", c);
			
			getServletContext().getRequestDispatcher("/class-detail.jsp").forward(req, resp);
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getServletPath();
		if ("/class-add".equals(path)) {
			
			String id = req.getParameter("id");
			String courseId = req.getParameter("courseid");
			String name = req.getParameter("name");
			String startdate = req.getParameter("startdate");
			
			Classes c = (id.equals("") ? new Classes() : classService.findById(Integer.parseInt(id)));
			c.setName(name);
			c.setStartdate(LocalDate.parse(startdate));
			c.setCourse(courseService.findById(Integer.parseInt(courseId)));
			
			classService.save(c);
			
			resp.sendRedirect(req.getContextPath().concat("/classes"));
		
		} 
	}
}
