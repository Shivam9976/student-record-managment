<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<table class="table table-striped table-hover">
		<thead>
			<th>id</th>
			<th>name</th>
			<th>number</th>
			<th>Action</th>
		</thead>
		<tbody>
			<c:forEach var="student" items="${student}">
				<tr>
					<td>${student.id}</td>
					<td>${student.name}</td>
					<td>${student.number}</td>
					<td>
					
					<td>
					<a href="editById ">
					<button>Delete</button></a></td>
					<td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
 Edit
</button>
</td>
			</c:forEach>
		</tbody>
	</table>
	<!-- Scrollable modal -->
<div id="#exampleModal" class="modal-dialog modal-dialog-scrollable">
  ...
</div>
<script type="text/javascript">
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})
</script>
</body>
</html>