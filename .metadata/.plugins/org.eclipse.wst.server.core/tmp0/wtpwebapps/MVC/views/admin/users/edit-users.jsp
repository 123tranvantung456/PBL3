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
<body>
	<style>
.container {
	max-width: 800px;
}

.form-control:focus {
	border-color: #0EDC8D; /* Màu của border khi focus */
	box-shadow: 0 0 0 0.2rem rgba(0, 255, 255, 0.25);
	/* Đổ bóng khi focus */
}
</style>
	<%
	UserModel userModel = (UserModel) request.getAttribute("userModel");
	%>  
	<%boolean admin = false; 
	  boolean teacher = false;
	  boolean student = false;
	  if ((userModel.getAccountModel().getRoleModel().getRoleName()).equals("Quản Trị Viên")) admin = true;
	  if ((userModel.getAccountModel().getRoleModel().getRoleName()).equals("Học Viên")) student = true;
	  if ((userModel.getAccountModel().getRoleModel().getRoleName()).equals("Giáo Viên")) teacher = true;
	%>    
	<div class="container">
		<form method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">Ten Dang Nhap</label> <input
					type="text" class="form-control custom-autofill-selected"
					id="exampleFormControlInput1" name="username"
					value="<%=userModel.getAccountModel().getUserName()%>">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput2">Mat Khau</label> <input
					type="password" class="form-control custom-autofill-selected"
					id="exampleFormControlInput2" name="password" value="*******">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect4">Quyền Truy Cập</label> <select
					class="form-control custom-autofill-selected"
					id="exampleFormControlSelect4" name="roleID">
					<option value="1"
						<%if (admin) {%>
						selected="selected" <%}%>>Quản trị viên</option>
					<option value="2"
						<%if (teacher) {%>
						selected="selected" <%}%>>Giáo viên</option>
					<option value="3"
						<%if (student) {%>
						selected="selected" <%}%>>Học viên</option>
				</select>

			</div>
			<div class="form-group">
				<label for="exampleFormControlInput6">Name</label> <input
					type="text" class="form-control custom-autofill-selected"
					id="exampleFormControlInput6" name="name"
					value="<%=userModel.getName()%>">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput7">Email</label> <input
					type="email" class="form-control custom-autofill-selected"
					id="exampleFormControlInput7" name="email"
					value="<%=userModel.getEmail()%>">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput8">Phone</label> <input
					type="text" class="form-control custom-autofill-selected"
					id="exampleFormControlInput8" name="phone"
					value="<%=userModel.getPhone()%>">
			</div>
			<div class="form-group">
				<label for="" class="form-label">Gender</label>
				<div class="mb-3 form-check">
					<input type="radio"
						class="form-check-input custom-autofill-selected"
						id="exampleCheck1" name="gender" value="true"
						<%if (userModel.getGender() != null && userModel.getGender()) {%>
						checked <%}%>> <label class="form-check-label"
						for="exampleCheck1">Nam</label>
				</div>
				<div class="mb-3 form-check">
					<input type="radio"
						class="form-check-input custom-autofill-selected"
						id="exampleCheck2" name="gender" value="false"
						<%if (userModel.getGender() != null && !userModel.getGender()) {%>
						checked <%}%>> <label class="form-check-label"
						for="exampleCheck2">Nu</label>
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Sua</button>
			</div>
			<div class="form-group">
				<a href="/MVC/admin/users"><button type="submit"
						class="btn btn-primary">Back</button> </a>
			</div>
		</form>
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