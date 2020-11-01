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
<title>Assignment | Register</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="resources/menu.jsp"></jsp:include>
	
	<div class="container py-5">
		<h4 class="mb-4">Registration</h4>
		
		<div class="shadow-sm px-md-5 px-3 py-4">
		
			<c:url value="/register" var="save"></c:url>
			<form action="${save }" method="post">
				
				<div class="row">
					<div class="col-lg-6">
						<h6 class="mb-4">- Class Info -</h6>
						
						<div class="form-group mb-4">
							<label for="classid">Class Name</label>
							<select name="classid" id="classid" class="form-control" required>
								<option selected disabled value="">Select Class</option>
								<c:forEach items="${classes }" var="c">
									<option value="${c.id }">${c.name } - ${c.course.name }</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group mb-4">
							<label for="studentid">Student</label>
							<select name="studentid" id="studentid" class="form-control" required>
								<option selected disabled value="">Select Student</option>
								<c:forEach items="${students }" var="s">
									<option value="${s.id }">${s.name }</option>
								</c:forEach>
							</select>
						</div>
						
					</div>
					
					<div class="col-lg-6">
						<h6 class="mb-4">- Register Info -</h6>
						
						<div class="form-group mb-4">
							<label for="registerdate">Register Date</label>
							<input type="date" name="registerdate" id="registerdate" class="form-control bg-white" readonly value='<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />'/>
						</div>
						
						<div class="form-group mb-4">
							<label for="paidamount">Paid Amount</label>
							<div class="input-group">
							  <div class="input-group-prepend">
							    <span class="input-group-text">Ks.</span>
							  </div>
							  <input type="number" class="form-control" min="0" required name="paidamount" id="paidamount" placeholder="0" >
							</div>	
						</div>
						
						<div class="form-group mb-4 pt-3 text-lg-right">
							<button type="submit" class="btn btn-dark px-5">Register</button>
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	
</body>
</html>