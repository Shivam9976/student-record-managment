<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
      <title>Student Record</title>
   </head>
   <body>
   <div class="row">
    	<div class="col">
      		<h1>Student Records Application</h1> 
      	</div>
       <div class="col">
      		<button  type="button" class="btn btn-primary addNew" data-bs-toggle="modal" data-bs-target="#exampleModal">Add New</button>
       </div>
   </div>
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
                  <td class="studentIdCls">${student.id}</td>
                  <td class="studentNameCls">${student.name}</td>
                  <td class="studentNumberCls">${student.number}</td>
                 
                  <td>
                <a href="delete?id=${student.id}"> 
                     <button  type="button" class="btn btn-info">Delete</button>
					</a>
                     <button type="button" class="btn btn-primary editStudent" data-bs-toggle="modal" data-bs-target="#exampleModal">Edit</button>
                  
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <form action="save" method="POST">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Edit Student</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Name</label> 
                        <input type="text" name="name" id="studentNameId" class="form-control" id="exampleFormControlInput1" placeholder="Enter your name">
                     </div>
                     <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Number</label> 
                        <input type="text" name="number" id="studentNumberId" class="form-control" id="exampleFormControlInput1" placeholder="Enter your Number">
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <input type="hidden" value="0" name="id" id="studentId">
                     <button type="submit" name="action" class="addEditBtn btn btn-primary" value="add">Edit changes</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
      
      <script type="text/javascript">
      	$(".editStudent").click(function() {
      		$(".addEditBtn").val("edit");
      		$("#exampleModalLabel").text("Edit Student Details");
      		$(".addEditBtn").text("Edit Student");
      		$("#studentId").val($(this).closest( "tr" ).find(".studentIdCls").text());
      		$("#studentNameId").val($(this).closest( "tr" ).find(".studentNameCls").text());
      		$("#studentNumberId").val($(this).closest( "tr" ).find(".studentNumberCls").text());
      	});
      	$(".addNew").click(function() {
      		$("#exampleModalLabel").text("Add Student Details");
      		$(".addEditBtn").val("add");
      		$(".addEditBtn").text("Add Student");
      		$("#studentId").val("0");
      		$("#studentNameId").val("");
      		$("#studentNumberId").val("");
      	});
      </script>
      
   </body>
</html>