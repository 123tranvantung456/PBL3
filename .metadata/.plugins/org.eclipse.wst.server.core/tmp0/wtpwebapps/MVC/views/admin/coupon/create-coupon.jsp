<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style> 
		<%@ include file="../../../assets/admin-css/base.css" %>
		<%@ include file="../../../assets/admin-css/style-course.css" %>  
        <%@ include file="../../../assets/admin-css/style-createCourse.css" %>
	</style>   
</head>
 	
<body>
		<%@ include file="../re-use/sidebar.jsp" %>
    <div class="main">
		<%@ include file="../re-use/header.jsp" %>
         <div class="container">
    <div class="section-one" style="margin-top: 95px; margin-bottom: 10px;">       
      <div class="head">
        <h2 class="add">Thêm Coupon</h2>
      </div>
				<div class="main-create">
					<div class="wrap">
						<form action="/MVC/admin/coupon/create" method="post">

							<div class="form-group">
								<label for="code">Code</label> <input name="code" type="text"
									class="form-control" id="name" readonly
									value="<%=request.getAttribute("code")%>">
							</div>

							<div class="form-group">
								<label for="startDate">Thời gian bắt đầu</label> 
								<br>
								<input type="date" id="startDate" name="startDate">
								   
							</div>

							<div class="form-group"> 
								<label for="endDate">Thời gian kết thúc</label> 
								<br>
								<input type="date" id="endDate" name="endDate">
								
							</div>

							<div class="form-group">
								<label for="quantity">Số Lượng</label> <input name="quantity"
									type="number" class="form-control" id="quantity" step="1">
							</div>
							
							<div class="form-group">
								<label for="percent">Phần Trăm</label> <input name="percent"
									type="number" class="form-control" id="percent" step="1">
							</div>
							
							<div class="wrap-button">
								<button type="submit" class="btn btn-success">Thêm</button>
								<a href="/MVC/admin/course" type="button" class="btn btn-danger">Quay
									lại</a>
							</div>
						</form>
					</div>
				</div>
    </div>
  </div>
		
    </div>
	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>


</body>

</html>