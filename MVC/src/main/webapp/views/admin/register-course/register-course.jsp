<%@page import="com.pbl3.model.Register_CourseModel"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="com.pbl3.libs.Pair"%>
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
	</style>  
</head>
 
<body>
	<%@ include file="../re-use/sidebar.jsp" %>
    <div class="main">
		<%@ include file="../re-use/header.jsp" %>

        <h3 class="name">Quản lí khoá học</h3>

        <div class="container">
            <div class="card-header">
            	   <table class="table verticle-middle table-responsive-md" id="mytable">
                    <thead>
                        <tr>
                            <th onclick="sortTable(0)" scope="col">ID Học viên</th>
                            <th onclick="sortTable(1)" scope="col">Tên Học Viên</th>
                            <th onclick="sortTable(2)" scope="col">ID Khóa học</th>
                            <th onclick="sortTable(3)" scope="col">Tên Khóa Học</th>
                            <th onclick="sortTable(4)" scope="col">Gía Khóa Học</th>
                            <th onclick="sortTable(5)" scope="col">Thành Tiền</th>
                            <th onclick="sortTable(6)" scope="col">Tiền Trả GV</th>
                            <th onclick="sortTable(7)" scope="col">Lợi Nhuận</th>
                            <th onclick="sortTable(8)" scope="col">Ngày Xác nhận</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%for(Pair<UserModel, Pair<CourseModel, Register_CourseModel>> p : (LinkedList<Pair<UserModel, Pair<CourseModel, Register_CourseModel>>>)request.getAttribute("registerCourses")){%>
                        <tr>
                        	<td> 
                        		<%=p.getFirst().getUserID() %>
                        	</td>
                            <td> 
                        		<%=p.getFirst().getUserName() %>
                        	</td>
                        	
                        </tr>
                       <%}%>
                    </tbody>  
                </table>
            </div>
    </div>

    <!-- end main -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>


</body>

</html>