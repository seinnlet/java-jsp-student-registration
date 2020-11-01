<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" />

<!-- menu links -->
<c:url value="/index.jsp" var="home"></c:url>		
<c:url value="/courses" var="courses"></c:url>	
<c:url value="/classes" var="classes"></c:url>	
<c:url value="/students" var="students"></c:url>	
<c:url value="/register" var="register"></c:url>	

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand mr-4 font-weight-bold" href="${home }">Assignment.</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item ${pagina.endsWith('/courses') ? 'active' : ''}">
					<a class="nav-link" href="${courses }">Courses</a>
				</li>
				<li class="nav-item ${pagina.endsWith('/classes') ? 'active' : ''}">
					<a class="nav-link" href="${classes }">Classes</a>
				</li>
				<li class="nav-item ${pagina.endsWith('/students') ? 'active' : ''}">
					<a class="nav-link" href="${students }">Students</a>
				</li>
				<li class="nav-item ${pagina.endsWith('/register') ? 'active' : ''}">
					<a class="nav-link" href="${register }">Registration</a>
				</li>
			</ul>
		</div>
	</div>
</nav>