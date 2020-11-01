<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assignment | Home</title>
<jsp:include page="resources/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5 text-center" id="welcome">
		<h1 class="text-dark mt-5 mb-4 font-italic">Student Registration System</h1>
		<p class="font-italic mb-5 text-secondary">(JSP JPA CRUD Sample Project)</p>
		
		<div class="arrow-container mb-4">
      <div class="arrow-down"></div>
    </div>
    
		<c:url value="/courses" var="courses"></c:url>
		<a href="${courses }" class="btn btn-outline-dark px-5">Start Now</a>
	</div>
</body>
</html>