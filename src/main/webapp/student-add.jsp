<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assignment | ${not empty student ? 'Edit' : 'Add' } Student</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5">
		<div class="mb-4">
			<h4 class="d-inline-block float-left">${not empty student ? 'Edit' : 'Add New' } Student</h4>
			
			<c:url value="/students" var="students"></c:url>
			<a href="${students }" class="btn btn-outline-dark float-right px-4">&#8826; Back</a>
			<div class="clearfix"></div>
		</div>
		
		<div class="shadow-sm px-md-5 px-3 py-4">
		
			<c:url value="/student-add" var="save"></c:url>
			<form action="${save }" method="post">
				
				<input type="hidden" name="id" value="${student.id}"/>
			
				<div class="form-row form-group mb-4">
					<label for="name" class="col-form-label col-lg-3">Student Name:</label>
					<div class="col-lg-9">
						<input type="text" name="name" id="name" class="form-control" placeholder="Enter Student Name" required value="${student.name }"/>
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="email" class="col-form-label col-lg-3">Email:</label>
					<div class="col-lg-9">
						<input type="email" name="email" id="email" class="form-control" placeholder="Enter Email Address" required value="${student.email }"/>
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="phone" class="col-form-label col-lg-3">Phone No:</label>
					<div class="col-lg-9">
						<input type="text" name="phone" id="phone" class="form-control" placeholder="Enter Phone Number" required value="${student.phone }"/>
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