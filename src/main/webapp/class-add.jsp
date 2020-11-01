<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assignment | ${not empty eclass ? 'Edit' : 'Add' } Class</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5">
		<div class="mb-4">
			<h4 class="d-inline-block float-left">${not empty eclass ? 'Edit' : 'Add New' } Class</h4>
			
			<c:url value="/classes" var="classes"></c:url>
			<a href="${classes }" class="btn btn-outline-dark float-right px-4">&#8826; Back</a>
			<div class="clearfix"></div>
		</div>
		
		<div class="shadow-sm px-md-5 px-3 py-4">
		
			<c:url value="/class-add" var="save"></c:url>
			<form action="${save }" method="post">
				
				<input type="hidden" name="id" value="${eclass.id}"/>
				
				<div class="form-row form-group mb-4">
					<label for="name" class="col-form-label col-lg-3">Class Name:</label>
					<div class="col-lg-9">
						<input type="text" name="name" id="name" class="form-control" placeholder="Enter Class Name" required value="${eclass.name }"/>
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="courseid" class="col-form-label col-lg-3">Course:</label>
					<div class="col-lg-9">
						<select name="courseid" id="courseid" class="form-control">
							<c:forEach items="${courses }" var="c">
								<option value="${c.id }" ${eclass.course.id == c.id ? 'selected' : '' }>${c.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-row form-group mb-4">
					<label for="startdate" class="col-form-label col-lg-3">Start Date:</label>
					<div class="col-lg-9">
						<input type="date" name="startdate" value="${eclass.startdate }" id="startdate" class="form-control" required min='<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />'/>
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