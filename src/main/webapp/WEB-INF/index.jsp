<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<body>
	<h2>Student Registration</h2>
	<form action="add" method="get">
		<table>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name" value="${student.name} "></td>
			</tr>
			<tr>
				<td>MOBILE NUMBER</td>
				<td><input type="number" name="number" value="${student.number}"></td>
			</tr>
			<tr>
				<td><a href="list">Show Student</a></td>
				<td></button><input type="submit" value="${isFromEdit?'save':'edit'}" name="action"></td>
				
			</tr>
		</table>
		${message}
	</form>
	
</body>

</html>
