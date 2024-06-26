<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>Hello, world!</title>
</head>

<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #0EDC8D;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.pag {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}
</style>

<body>
	<div class="container">
		<div class="content">    
			<div class="top">
				<a href="/MVC/admin/users/create" class="btn btn-primary"
					style="margin-top: 30px; margin-bottom: 20px;">Thêm</a>
				<form class="d-flex" role="search">
					<input
						value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>"
						name="keyword" class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>UserName</th>
						<th>Name</th>
						<th>Email</th>
						<th>ID</th>
						<th>Phone</th>
						<th>ID ACC</th>
						<th>gender</th>
						<th>Role Name</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (UserModel u : (LinkedList<UserModel>) request.getAttribute("userModels")) {
					%>
					<tr>
						<td><%=u.getAccountModel().getUserName()%></td>
						<td><%=u.getName()%></td>
						<td><%=u.getEmail()%></td>
						<td><%=u.getUserID()%></td>
						<td><%=u.getPhone()%></td>
						<td><%=u.getAccountID()%></td>
						<td>
							<%
							if (u.getGender() == null)
							%> N/A <%
							else if (!u.getGender())
							%> Nữ <%
							else
							%> Nam
						</td>
						<td><%=u.getAccountModel().getRoleModel().getRoleName()%></td>
						<td><a href="/MVC/admin/users/edit?userID=<%=u.getUserID()%>"
							class="btn btn-primary">sửa</a>
							<form method="post" action="/MVC/admin/users">
								<input type="hidden" name="accountID"
									value="<%=u.getAccountID()%>">
								<button type="submit" class="btn btn-danger">Xóa</button>
							</form></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div class="pag">
				<div class="pagination">
				<%int totalPage = (Integer)request.getAttribute("totalPage"); %> 
					<%if(request.getParameter("page") == null) {%>
						<%//if()%>
						<%for(int i = 1; i <= totalPage; i++){ %>
							<a href="/MVC/admin/users?page=<%=i%>" <%if(i == 1){%>class="active"<%}%>> <%=i%></a>
						<%} %>
					<%if(totalPage != 1){%>	
					<a href="/MVC/admin/users?page=<%=2%>">&raquo;</a>														
					<%} %>
					<%} 
					else if (Integer.parseInt(request.getParameter("page")) > totalPage) {%>
						
					<%}
					else {%>
					<%if(Integer.parseInt(request.getParameter("page")) != 1){ %>
					<a href="/MVC/admin/users?page=<%=Integer.parseInt(request.getParameter("page")) - 1%>">&laquo;</a>
					<% }%>
					<%for(int i = 1; i <= totalPage; i++){ %>
						<a href="/MVC/admin/users?page=<%=i%>" <%if(request.getParameter("page").equals(Integer.toString(i))){%> class="active" <%} %>><%=i%></a>
						<%} %> 
					<%if(Integer.parseInt(request.getParameter("page")) != totalPage){ %>
					<a href="/MVC/admin/users?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">&raquo;</a>
					<%}%> 
					<%}%>        
				</div>  
			</div> 
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>