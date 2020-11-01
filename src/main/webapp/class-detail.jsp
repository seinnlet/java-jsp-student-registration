<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assignment | Class Detail</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5">
		<div class="mb-4">
			<h4 class="d-inline-block float-left">${classdetail.name } - Detail</h4>
			
			<c:url value="/classes" var="classes"></c:url>
			<a href="${classes }" class="btn btn-outline-dark float-right px-4">&#8826; Back</a>
			<div class="clearfix"></div>
		</div>
		
		<div class="shadow-sm px-md-5 px-3 py-4">
			
			<div class="row">
				<div class="col-md-6">
					<table class="table table-borderless table-sm">
						<tr>
							<td>Course Name:</td>
							<td>${classdetail.course.name } (${classdetail.course.level })</td>
						</tr>
						<tr>
							<td>Fees:</td>
							<td>Ks.${classdetail.course.fees }</td>
						</tr>
					</table>
				</div>
				<div class="col-md-6">
					<table class="table table-borderless table-sm">
						<tr>
							<td>Duration:</td>
							<td>${classdetail.course.duration }</td>
						</tr>
						<tr>
							<td>Registered Student:</td>
							<td>${classdetail.registration.size() }</td>
						</tr>
					</table>
				</div>
			</div>
			
			<h6 class="my-4">- Student List -</h6>
			
			<c:choose>
				<c:when test="${classdetail.registration.size() == 0 }">
					
					<p class="mb-4">There is no registered student.</p>
					
				</c:when>
				<c:otherwise>
				
					<div class="table-responsive mb-4">
						<table class="table">
							<thead>
								<tr>
									<th>No.</th>
									<th>Name</th>
									<th>Phone</th>
									<th>Register Date</th>
									<th>Paid Amount</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${classdetail.registration }" var="r" varStatus="loopCounter">
									<tr>
										<td>${loopCounter.count }.</td>
										<td>${r.student.name }</td>
										<td>${r.student.phone }</td>
										<td>${r.registerdate }</td>
										<td>${r.paidamount }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
				</c:otherwise>
			</c:choose>
					
		</div>
	</div>
	
</body>
</html>