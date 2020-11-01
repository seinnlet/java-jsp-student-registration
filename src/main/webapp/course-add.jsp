<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assignment | ${not empty course ? 'Edit' : 'Add' } Course</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5">
		<div class="mb-4">
			<h4 class="d-inline-block float-left">${not empty course ? 'Edit Course' : 'Add New Course' }</h4>
			
			<c:url value="/courses" var="courses"></c:url>
			<a href="${courses }" class="btn btn-outline-dark float-right px-4">&#8826; Back</a>
			<div class="clearfix"></div>
		</div>
		
		<div class="shadow-sm px-md-5 px-3 py-4">
		
			<c:url value="/course-add" var="save"></c:url>
			<form action="${save }" method="post">
				
				<input type="hidden" name="id" value="${course.id}"/>
			
				<div class="form-row form-group mb-4">
					<label for="name" class="col-form-label col-lg-3">Course Name:</label>
					<div class="col-lg-9">
						<input type="text" name="name" id="name" class="form-control" placeholder="Enter Course Name" required value="${course.name }"/>
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="fees" class="col-form-label col-lg-3">Fees:</label>
					<div class="col-lg-9">
						<div class="input-group">
						  <div class="input-group-prepend">
						    <span class="input-group-text">Ks.</span>
						  </div>
						  <input type="number" class="form-control" min="0" required name="fees" id="fees" placeholder="0" value="${course.fees }">
						</div>	
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="level" class="col-form-label col-lg-3">Level:</label>
					<div class="col-lg-9">
						<select name="level" id="level" class="form-control">
							<option value="Beginner" ${course.level == 'Beginner' ? 'selected' : '' }>Beginner</option>
							<option value="Intermediate" ${course.level == 'Intermediate' ? 'selected' : '' }>Intermediate</option>
							<option value="Advanced" ${course.level == 'Advanced' ? 'selected' : '' }>Advanced</option>
						</select>
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="duration" class="col-form-label col-lg-3">Duration:</label>
					<div class="col-lg-6 col-6">
						<input type="number" name="duration" id="duration" class="form-control" required min="0" placeholder="0" value="${course.duration.split('-')[0] }"/>
					</div>
					<div class="col-lg-3 col-6">
						<select name="durationtype" class="form-control">
							<option value="Hour" ${course.duration.split('-')[1] == 'Hour' ? 'selected' : '' }>Hours</option>
							<option value="Day"  ${course.duration.split('-')[1] == 'Day' ? 'selected' : '' }>Days</option>
							<option value="Month" ${course.duration.split('-')[1] == 'Month' ? 'selected' : '' }>Months</option>
						</select>
					</div>
				</div>
				
				<div class="form-row form-group my-4 pt-3">
					<div class="col-lg-9 ml-auto">
						<button type="submit" class="btn btn-dark px-5">Save</button>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	
</body>
</html>