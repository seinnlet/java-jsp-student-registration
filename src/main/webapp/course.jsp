<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Assignment | Course List</title>
	<jsp:include page="resources/common.jsp"></jsp:include>
	
	<c:url var="datatablesCSS" value="/resources/datatables/datatables.min.css"></c:url>
	<link href="${datatablesCSS}" rel="stylesheet" type="text/css"/>
	
</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5">
		<div class="mb-4">
			<h4 class="d-inline-block float-left">Course List</h4>
			
			<c:url value="/course-add.jsp" var="add"></c:url>
			<a href="${add }" class="btn btn-dark float-right px-4">&#43; Add New</a>
			<div class="clearfix"></div>
		</div>
		
		<div class="table-responsive shadow-sm px-md-5 px-3 py-4">
			<table class="table mb-5" id="dataTable">
				<thead>
					<tr>
						<th>No.</th>
						<th>Name</th>
						<th>Fees</th>
						<th>Level</th>
						<th>Duration</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses}" var="course" varStatus="loopCounter">
						<tr>
							<td>${loopCounter.count }.</td>
							<td>${course.name }</td>
							<td>${course.fees }</td>
							<td>${course.level }</td>
							<td>${course.duration }</td>
							<td>
								<c:url var="edit" value="/course-edit">
									<c:param name="courseid">${course.id }</c:param>
								</c:url>
								<a href="${edit }" class="btn btn-outline-dark btn-sm">Edit</a>
							
								<c:url var="delete" value="/course-delete">
									<c:param name="courseid">${course.id }</c:param>
								</c:url>
								<a href="${delete }" class="btn btn-outline-danger btn-sm"  onclick="return confirm('Are you sure to delete this course?');">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	
	<c:url var="datatablesJS" value="/resources/datatables/datatables.min.js"></c:url>
	<script type="text/javascript" src="${datatablesJS}"></script>
	<script>
		$(function () {
		    $('#dataTable').DataTable();
		});
	</script>
	
</body>
</html>