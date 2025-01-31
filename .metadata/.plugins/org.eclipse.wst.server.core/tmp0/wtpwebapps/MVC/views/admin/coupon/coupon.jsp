<%@page import="com.pbl3.model.CouponModel"%>
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

        <h3 class="name">Quản lí Coupon</h3>

        <div class="container">
            <div class="card-header">
                <a href="/MVC/admin/coupon/create" class="btn btn-primary">Thêm Mới</a>
                <div class="search">  
                    <i class="fa fa-search"></i>
                    <input type="text" placeholder="Tìm Kiếm">
                </div>
            </div>
			    <div class="last-main">
                <table class="table verticle-middle table-responsive-md" id="mytable">
                    <thead>
                        <tr>
                            <th onclick="sortTable(0)" scope="col">ID</th>
                            <th onclick="sortTable(1)" scope="col">Mã</th>
                            <th onclick="sortTable(2)" scope="col">Phần Trăm</th>
                            <th onclick="sortTable(3)" scope="col">Ngày Bắt Đầu</th>
                            <th onclick="sortTable(4)" scope="col">Ngày Kết Thúc</th>
                            <th onclick="sortTable(5)" scope="col">Số Lượng</th>
                            <th onclick="sortTable(6)" scope="col">Đã Nhập</th>
                            <th scope="col">Áp dụng</th>
                            <th scope="col">Mở rộng</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%for(CouponModel c : (LinkedList<CouponModel>)request.getAttribute("couponModels")){%>
                        <tr>
                        	<td> 
                        		<%=c.getCouponID()%>
                        	</td>
                            <td>
                        		<%=c.getCode()%>
                        	</td>
                        	<td>
                        		<%=c.getPercent()%> % 
                        	</td>
                        	
                            <td>
                        		<%=c.getFormattedStartDate("dd-MM-yyyy")%>
                        	</td>
                        	<td>
                        		<%=c.getFormattedEndDate("dd-MM-yyyy")%>
                        	</td>
              				<td>
              					<%=c.getQuantity() %>
              				</td>
              				<td>
              					<%=c.getQuantityUsed() %>
              				</td>
                            <td>
                            	<a href="/MVC/admin/coupon-course?couponID=<%=c.getCouponID()%>">Chi tiết</a>   
                            </td>
                            <td>
                                <div class="inner-td" style="display: inline-block;">
                                    <a href="/MVC/admin/coupon/edit?couponID=<%=c.getCouponID()%>" class="btn btn-primary"><i class="fa-solid fa-square-pen"></i></a>
                                </div>  
                                <form style="display: inline;" method="post" action="/MVC/admin/coupon/delete?couponID=<%=c.getCouponID()%>">
                                	<button type="submit" class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                                
                            </td>
                        </tr>
                       <%}%>
                    </tbody>  
                </table>
            </div>      
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

<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("mytable");
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                // Check if x and y are both numbers
                if (!isNaN(Number(x.innerHTML)) && !isNaN(Number(y.innerHTML))) {
                    if (dir == "asc") {
                        if (Number(x.innerHTML) > Number(y.innerHTML)) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (Number(x.innerHTML) < Number(y.innerHTML)) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                } else {
                    // If either x or y is not a number, compare them as strings
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }

</script> 

</html>