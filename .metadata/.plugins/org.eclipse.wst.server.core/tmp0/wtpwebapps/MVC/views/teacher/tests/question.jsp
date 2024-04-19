<%@page import="java.util.ArrayList"%>
<%@page import="com.pbl3.model.TypeQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
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
h1 {
	text-align: center;
}

.box {
	width: 250px;
	height: 300px;
	color: red;
	border: 1px solid red;
}

.col-12 {
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #EAF0E4;
}

.container {
	margin-top: 40px;
	max-width: 800px;
}

.card-header {
	margin-bottom: 20px;
}

.cl {
	background-color: #F7F7F4; /* Added missing '#' */
}

.inner-wrap {
	margin-bottom: 100px;
}

.inner-wrap h1 {
	background-color: green;
}
</style>
	<div class="container">
		<%
		int first = 0, last = 0;
		for (int i = 1; i <= (Integer) request.getAttribute("totalPart"); i++) {
		%>
		<div class="inner-wrap">
			<h1>
				PART:
				<%=i%></h1>
			<%
			if (i == 1) {
				first = 1;
				last = 6;
			} else if (i == 2) {
				first = 7;
				last = 31;
			} else if (i == 3) {
				first = 32;
				last = 70;
			} else if (i == 4) {
				first = 71;
				last = 100;
			} else if (i == 5) {
				first = 101;
				last = 130;
			} else if (i == 6) {
				first = 131;
				last = 146;
			} else if (i == 7) {
				first = 147;
				last = 200;
			}
			QuestionModel[] arr = (QuestionModel[]) request.getAttribute("questionModels");

			for (int index = first - 1; index < last; index++) {
			%>
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="heading<%=index%>"
						<%if (arr[index].getQuestionID() == 0) {%>
						style="background: #FFB294" <%}%>>
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left" type="button"
								data-toggle="collapse" data-target="#collapse<%=index%>"
								aria-expanded="true" aria-controls="collapseOne">
								<h3>

									Câu
									<%=index + 1%>.


								</h3>

							</button>
						</h2>
					</div>
				</div>


				<div id="collapse<%=index%>" class="collapse collapsed cl"
					aria-labelledby="heading<%=index%>" data-parent="#accordionExample">
					<div class="card-body">
						<form method="POST" <%if (arr[index].getQuestionID() == 0) {%>
							action="/MVC/teacher/question/create?testsID=<%=request.getParameter("testsID")%>" <%} else {%>
							action="/MVC/teacher/question/edit?testsID=<%=request.getParameter("testsID")%> " <%}%>>

							<div class="form-group">
								<label for="type<%=index%>">Loai Cau Hoi</label> <select
									class="form-control custom-autofill-selected"
									id="type<%=index%>" name="typeQuestionID">
									<%
									LinkedList<TypeQuestionModel> typeQuestionModels = (LinkedList<TypeQuestionModel>) request
											.getAttribute("typeQuestionModels" + i);
									for (TypeQuestionModel t : typeQuestionModels) {
									%>
									<option value="<%=t.getTypeQuestionID()%>"
										<%if ((t.getTypeQuestionName()).equals(arr[index].getTypeQuestionModel().getTypeQuestionName())) {%>
										selected="selected" <%}%>><%=t.getTypeQuestionName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<input type="hidden" name="testsID"
									value="<%=request.getParameter("testsID")%>">
							</div>

							<div class="form-group">
								<label for="content<%=index%>">Noi Dung Cau Hoi</label>
								<textarea name="questionContent" class="form-control" id="content<%=index%>" rows="2"><%=arr[index].getQuestionContent()%></textarea>
							</div>

							<div class="form-group">
								<label for="answerA<%=index%>">Noi Dung Dap An A</label> <input
									type="text" class="form-control" id="answerA<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerA"
									value="<%=arr[index].getContentAnswerA()%>">
							</div>

							<div class="form-group">
								<label for="answerB<%=index%>">Noi Dung Dap An B</label> <input
									type="text" class="form-control" id="answerB<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerB"
									value="<%=arr[index].getContentAnswerB()%>">
							</div>

							<div class="form-group">
								<label for="answerC<%=index%>">Noi Dung Dap An C</label> <input
									type="text" class="form-control" id="answerC<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerC"
									value="<%=arr[index].getContentAnswerC()%>">
							</div>

							<div class="form-group">
								<label for="answerD<%=index%>">Noi Dung Dap An D</label> <input
									type="text" class="form-control" id="answerD<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerD"
									value="<%=arr[index].getContentAnswerD()%>">
							</div>
							<div class="form-group">
								<label for="answerCorrect<%=index%>">Dap An Dung</label> <select
									class="form-control custom-autofill-selected"
									id="answerCorrect<%=index%>" name="answerCorrect">
									<option value="A"
										<%if ((arr[index].getAnswerCorrect()).equals("A")) {%>
										selected="selected" <%}%>>A</option>
									<option value="B"
										<%if ((arr[index].getAnswerCorrect()).equals("B")) {%>
										selected="selected" <%}%>>B</option>
									<option value="C"
										<%if ((arr[index].getAnswerCorrect()).equals("C")) {%>
										selected="selected" <%}%>>C</option>
									<option value="D"
										<%if ((arr[index].getAnswerCorrect()).equals("D")) {%>
										selected="selected" <%}%>>D</option>
								</select>
							</div>

							<div class="form-group">
								<label for="explain<%=index%>">Giai Thich</label>
								<textarea name="answerExplain" class="form-control" id="explain<%=index%>" rows="2"><%=arr[index].getAnswerExplain()%></textarea>
							</div>
							
							<div class="form-group">
								<input name="orderNumber" type="hidden" value="<%=index + 1%>">
							</div>
							<div class="form-group">
								<input name="questionID" type="hidden" value="<%=arr[index].getQuestionID()%>"> 
							</div>
							<%
							if (arr[index].getQuestionID() != 0) {
							%>
							<button type="submit" class="btn btn-primary">Sửa</button>
							<form action="#">
								<%
								} else {
								%>
								<button type="submit" class="btn btn-primary">Thêm</button>
								<%
								}
								%>
							</form>
							<%
							if (arr[index].getQuestionID() != 0) {
							%>
							<form method="post"
								action="/MVC/teacher/question/delete">
								<div class="form-group">
								
								<input type="hidden" name="questionID"
									value="<%=arr[index].getQuestionID()%>">
									
								<input type="hidden" name="testsID"
									value="<%=request.getParameter("testsID")%>">	
							</div>
								<button type="submit" class="btn btn-danger">Xóa</button>
								
							</form>
							<%
							}
							%>
						
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<%
		}
		%>
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