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

import com.mmit.controller.service.CourseService;
import com.mmit.entity.Course;

@WebServlet({"/courses", "/course-add", "/course-edit", "/course-delete"})

public class CourseController extends HttpServlet {

	private static final long serialVersionUID = 1L;
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
		if ("/courses".equals(path)) {
			
			List<Course> courselist = courseService.findAll();
			req.setAttribute("courses", courselist);

			getServletContext().getRequestDispatcher("/course.jsp").forward(req, resp);
		
		} else if ("/course-edit".equals(path)) {
			
			String id = req.getParameter("courseid");
			
			Course c = courseService.findById(Integer.parseInt(id));
			req.setAttribute("course", c);
			
			// forward page
			getServletContext().getRequestDispatcher("/course-add.jsp").forward(req, resp);
		
		} else if ("/course-delete".equals(path)) {
			
			String id = req.getParameter("courseid");
			courseService.delete(Integer.parseInt(id));
			resp.sendRedirect(req.getContextPath().concat("/courses"));
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getServletPath();
		if ("/course-add".equals(path)) {
			
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String fees = req.getParameter("fees");
			String level = req.getParameter("level");
			String duration = req.getParameter("duration") + '-' + req.getParameter("durationtype");
			
			Course c = (id.equals("") ? new Course() : courseService.findById(Integer.parseInt(id)));
			c.setName(name);
			c.setFees(Integer.parseInt(fees));
			c.setLevel(level);
			c.setDuration(duration);
			
			courseService.save(c);
			resp.sendRedirect(req.getContextPath().concat("/courses"));
		}
	}
}
