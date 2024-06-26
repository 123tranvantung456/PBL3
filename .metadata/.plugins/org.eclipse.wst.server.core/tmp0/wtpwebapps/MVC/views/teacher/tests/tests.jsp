<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.TestsModel"%>
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
	
}

.inner-content {
	padding: 20px;
	border: 1px solid red;
}
</style>
	<div class="container">
		<h1>DAY LA TRANG SHOW DE THI TEACHER</h1>
		<div class="row">

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal">Them de thi</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Them</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form method="post" action="/MVC/teacher/tests/create">
								<div class="form-group">
									<label for="1">Ten de thi</label> <input type="text"
										class="form-control" id="1" aria-describedby="emailHelp"
										name="testsName">
								</div>
								<div class="form-group">
									<label for="2">Nam</label> <input type="number"
										class="form-control" id="2" min="2020" max="2024">
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>

						</div>
					</div>
				</div>
			</div>
			<%
			LinkedList<TestsModel> testsModels = (LinkedList<TestsModel>) request.getAttribute("testsModels");
			if (testsModels != null) {
				for (TestsModel t : testsModels) {
			%>
			<div class="col-xl-3">
				<div class="inner-wrap">
					<div class="inner-content">
						<a style="display: block;"
							href="/MVC/teacher/question?testsID=<%=t.getTestsID()%>">
							<h3 class="inner-listname">
								<%=t.getTestsName()%>
							</h3>
							<p class="inner-desc">
								Năm:
								<%=t.getYear()%></p>
						</a>
						<!-- <p class="inner-number">số lượng</p> -->
						<form action="" method="post">
							<%
							if (t.getStatus()) {
							%>
							<button type="submit" class="button-detail">ẨN ĐỀ THI</button>
							<%
							} else {
							%>
							<button type="submit" class="button-detail">XUẤT BẢN</button>
							<%
							}
							%>

						</form>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>

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
