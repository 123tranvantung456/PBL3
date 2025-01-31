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
        <%@ include file="../../../assets/admin-css/style-editCourse.css" %>
	</style>   
</head>
 	
<body>
		<%CourseModel courseModel = (CourseModel)request.getAttribute("courseModel");%>
		<%@ include file="../re-use/sidebar.jsp" %>
    	<div class="main">
		<%@ include file="../re-use/header.jsp" %>
         <div class="container">
    <div class="section-one" style="margin-top: 95px; margin-bottom: 10px;">       
      <div class="head">
        <h2 class="add">Sửa Khóa Học</h2>
      </div>
      <div class="main-create"> 
        <div class="wrap"> 
          <form action="/MVC/admin/course/edit" method="post" enctype="multipart/form-data">    

            <div class="form-group" >
              <label for="name" name="courseName">Tên khóa học</label>
              <input name="courseName" type="text" class="form-control" id="name" value="<%=courseModel.getCourseName()%>">
            </div>    

            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label >Giáo Viên</label>
                  <br>
                  <input name="teacherID" list="encodings" value="<%=courseModel.getTeacherID() %>" class="col-sm-6 custom-select custom-select-sm">
                  <datalist id="encodings"> 
                  <%LinkedList<UserModel> userModels = (LinkedList<UserModel>)request.getAttribute("userModels");%>
                    <%for (UserModel u : userModels){%>
                    <option value="<%=u.getUserID()%>"></option>
                    <%} %>
                  </datalist>  
                </div>  
              </div>

              <div class="col-6">
              	<a href="/MVC/<%=courseModel.getImage()%>" target="blank">Ảnh hiện tại</a>
                <div class="form-group">
                  <label for="file">Thay đổi ảnh mô tả</label>
                  <input name="image" type="file" class="form-control" id="file">
                </div>
              </div>
            </div> 

            <div class="form-group">
              <label for="desc">Mô tả</label>
              <textarea name ="courseDesc" class="form-control" id="desc" rows="5"><%=courseModel.getCourseDesc()%></textarea>
            </div>

            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label for="duration">Thời hạn (Tháng)</label>
                  <input name="duration" type="number" class="form-control" id="duration" value="<%=courseModel.getDuration()%>">
                </div>
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="price">Giá</label>
                  <input name="price" type="number" class="form-control" id="name" step="price" value="<%=courseModel.getPrice()%>">
                </div>
              </div>
            </div>

            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label for="input">Đầu vào</label>
                  <input name="input" type="number" class="form-control" id="input" value="<%=courseModel.getInput()%>">
                </div>
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="output">Đầu ra</label>
                  <input name="target" type="number" class="form-control" id="output" value="<%=courseModel.getTarget()%>">
                </div>
              </div>
            </div>
            
             <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label for="percentSalary">Phần Trăm Tiền Trả Cho Giáo Viên</label>
                  <input name="percentSalary" type="number" class="form-control" id="percentSalary" value="<%=courseModel.getPercentSalary()%>">
                </div> 
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="percentDiscount">Phầm Trăm Tiền Giảm Gía Khi Gia Hạn Khóa Học</label>
                  <input name="percentDiscount" type="number" class="form-control" id="percentDiscount" value="<%=courseModel.getPercentSalary()%>">
                </div>
              </div>
            </div>
            <div class="wrap-button">
				<button type="submit" class="btn btn-success">Sửa</button>
          		<a href="/MVC/admin/course" type="button" class="btn btn-danger">Quay lại</a>
          	</div>  
          	<input type="hidden" name="courseID" value="<%=courseModel.getCourseID()%>"> 
          	<input type="hidden" name="imageString" value="<%=courseModel.getImage()%>"> 
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