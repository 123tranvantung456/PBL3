<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
  	<div class="container">
  		<h1>DAY LA trang Quan Li user cua ADMIN</h1>
  		<%for(UserModel u : (LinkedList<UserModel>)request.getAttribute("userModels")){%>
  			<h1>Ten:<%=u.getName()%></h1>
  			<h1>Email:<%=u.getEmail()%></h1>
  			<h1>ID:<%=u.getUserID()%></h1>
  			<h1>ID ACC: <%=u.getUserID()%></h1>
  			<h1>Phone:<%=u.getPhone()%></h1>
  			<h1>gender:<%=u.getGender()%></h1>
  			<h1>email:<%=u.getEmail()%></h1>
  		<%} %>
  	</div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>