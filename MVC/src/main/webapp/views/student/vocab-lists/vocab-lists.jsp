<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabListsModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Study TOIEC</title>
</head>

<body>
<style>
 	<%@include file ="../../../assets/css/base.css"%>
  	<%@include file = "../../../assets/css/style.css"%>
</style>
	<style>
h1 {
	margin-bottom: 30px;
}

.box {
	width: 250px;
	height: 300px;
	color: red;
	border: 1px solid red;
}

.modal-form .modal-header {
	flex-direction: column;
	/* justify-content: center; */
	align-items: center;
	position: relative;
}

.modal-form .modal-header .close {
	position: absolute;
	top: -2px;
	right: -2px;
	opacity: .5;
	background-color: black;
	color: aliceblue;
	border-radius: 50%;
	/* padding: 10px; */
	width: 32px;
	height: 32px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-form .modal-header .inner-image {
	height: 40px;
	width: auto;
	margin-bottom: 6px;
}

.buttonBTN {
	background: -webkit-linear-gradient(-30deg, #f57f20, #d62b08 100%);
	color: #fff;
	border-radius: 10px;
	border: 1px solid;
	padding: 10px 30px;
	width: 100%;
	font-weight: 600;
}
/*bo gốc cho form*/
.modal-form .modal-content {
	border-radius: 10px;
}

textarea {
	width: 100%;
	height: 200px;
}
</style>
	
		<header class="header">
	<div class="top-header">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-contact">
					<ul>
						<li><span>Following Us On:</span></li>
						<li><a href="#"> <i class="fa-brands fa-facebook-f"></i>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-twitter"></i>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-instagram"></i>
						</a></li>
					</ul>
				</div>
				<div class="inner-button">
					<a href="#">Create an Account</a>
					<%
					//lấy session
					UserModel userModel = (UserModel) session.getAttribute("user");
					// nếu session = null thì chưa đăng nhập nên dùng button đăng nhập
					if (userModel == null) {
					%>
					<a href="login" class=" button button-one">Log In</a>
					<%
					}
					// ngược lại là khác sesstion khác null : đã đăng nhập nên dùng button trang cá nhân 		
					else {
					%>
					<a href="logout" class=" button button-one">Log Out</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<div class="main-header">
		<div class="container">
			<div class="inner-main">
				<div class="inner-logo">
					<a href=""> <img
						src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F"
						alt="logo">
					</a>
				</div>
				<div class="inner-menu">
					<ul>
						
						<li><a href="/MVC/" class="trang-chu" <%if(request.getRequestURI().equals("/MVC/views/student/homepage.jsp")) {%> style="color: var(--color-one);<%}%>"> Trang Chủ </a></li>
						<li><a href="#" class="khoa-hoc"> Khóa Học </a></li>
						<li><a href="tests" class="de-thi" <%if(request.getRequestURI().equals("/MVC/views/student/tests/tests.jsp")){ %> style="color: var(--color-one);<%}%>"> Đề Thi </a></li>
						<li><a href="vocab-lists" class="tu-vung" <%if(request.getRequestURI().equals("/MVC/views/student/vocab-lists/vocab-lists.jsp")) {%> style="color: var(--color-one);"<%}%>> Từ Vựng </a></li>
					</ul>
				</div>
				<div class="inner-user">
					<a href="my-account">
						<div class="inner-img">
							<img
								src="data:image/jpeg;base64,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"
								alt="avatar">
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</header>
	
	
	<div class="container">

		<h1 style="text-align: center;">DAY LA TRANG DANH SACH TU VUNG</h1>
		<div class="row">

			<div class="col-3">
				<div class="box">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal">Them DSTV</button>

					<!-- Modal -->
					<div class="modal fade modal-form" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">

									<h5 class="inner-title" id="exampleModalLabel">THEM DS TU
										VUNG</h5>
									<p class="inner-desc"></p>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" action="/MVC/vocab-lists/create">
										<div class="row">
											<div class="col-12">

												<div class="form-group">
													<input name="name" type="text" class="form-control"
														placeholder="Ten">
												</div>

												<textarea name="desc" id="" cols="30" rows="10"></textarea>

												<button class="button">Gui Di</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			int i = 0;
			%>
			<%
			for (VocabListsModel v : (LinkedList<VocabListsModel>) request.getAttribute("vocabListsModels")) {
			%>
			<a href="vocab-lists/vocab?listID=<%=v.getListID()%>">

				<div class="col-3" id="vocabBox">
					<div class="box">
						<h5><%=v.getNameList()%></h5>
						<p><%=v.getDescription()%></p>
						<br> <a href="vocab-lists/delete?listID=<%=v.getListID()%>">
							XOA </a>


						<%
						//**********************************************
						%>
						<%
						i++;
						%>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal<%=i%>">SUA</button>

						</button>

						<!-- Modal -->
						<div class="modal fade modal-form" id="exampleModal<%=i%>"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">

										<h5 class="inner-title" id="exampleModalLabel">SUA DS TU
											VUNG</h5>
										<p class="inner-desc"></p>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<div class="row">
											<div class="col-12">
												<h1>day la form</h1>

												<form action="/MVC/vocab-lists/edit" method="post">

													<div class="row">
														<div class="col-12">
															<div class="form-group">

																<input type="text" class="form-control"
																	placeholder="Ten" name="nameList"
																	value="<%=v.getNameList()%>">
															</div>

															<div class="form-group">

																<input type="hidden" name="listID"
																	, value="<%=v.getListID()%>">
															</div>

															<div class="form-group">

																<input type="hidden" name="userID"
																	, value="<%=v.getUserID()%>">
															</div>

															<div class="form-group">

																<input type="hidden" name="CourseID"
																	, value="<%=v.getCourseID()%>">
															</div>

															<textarea name="description" id="" cols="30" rows="2">
                                    	<%=v.getDescription()%>
                                    </textarea>
															<button class="button">Gui Di</button>
														</div>
													</div>
												</form>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>

						<%
						//**********************************************
						%>


					</div>
				</div> <%
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