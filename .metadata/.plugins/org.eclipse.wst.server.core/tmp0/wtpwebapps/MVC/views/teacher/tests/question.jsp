<%@page import="com.pbl3.model.DataQuestionModel"%>
<%@page import="com.pbl3.model.TypeTwoQuestionModel"%>
<%@page import="com.pbl3.model.TypeOneQuestionModel"%>
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
		<form action="/MVC/teacher/tests/edit-audio?testsID=<%=request.getParameter("testsID")%>" method="POST" enctype="multipart/form-data">
			<%
			TestsModel testsModel = (TestsModel) request.getAttribute("testsModel");
       
			if (testsModel.getAudio() == null) {    
			%>
			<div class="form-group">
				<label for="audioTEST">Audio</label> <input id="audioTEST"
					name="audio" type="file" class="form-control" placeholder="Audio"
					required="required">
			</div>
			<%
			} else {
			%>
			<div class="form-group">
				<label for="Audio1TEST">Audio</label> <br>
				<audio controls>
					<source src="/MVC/<%=testsModel.getAudio()%>" type="audio/mpeg">
				</audio>
			</div>
			<div class="form-group">
				<input type="hidden" name="audioString"
					value="<%=testsModel.getAudio()%>">
			</div>
			<div class="form-group">
				<label for="Audio2TEST">Thay Doi Audio</label> <input
					id="Audio2TEST" name="audio" type="file" class="form-control"
					placeholder="thay doi audio">
			</div>
			<%
			}
			%>
			<button type="submit">nop</button>
		</form>

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
			int count = 0;
			TypeOneQuestionModel typeOneQuestionModel = null;
			TypeTwoQuestionModel typeTwoQuestionModel = null;
			if (i == 1 || i == 2 || i == 5) {
				for (int index = first - 1; index < last; index++) {
					if (i == 1 || i == 2) {
				typeOneQuestionModel = (TypeOneQuestionModel) arr[index];
					} else {
				typeTwoQuestionModel = (TypeTwoQuestionModel) arr[index];
					}
					if ((arr[index].getQuestionID() != 0)) {
				count++;
			%>
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="heading<%=index%>">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left" type="button"
								data-toggle="collapse" data-target="#collapse<%=index%>">
								<h3>
									Cau
									<%=index + 1%>
								</h3>
							</button>
						</h2>
					</div>
				</div>
				<div id="collapse<%=index%>" class="collapse collapsed cl"
					aria-labelledby="heading<%=index%>" data-parent="#accordionExample">
					<div class="card-body">
						<form method="POST" enctype="multipart/form-data"
							action="/MVC/teacher/question/edit?testsID=<%=request.getParameter("testsID")%> ">
							<!-- ordernumber -->
							<label for="ordernumber<%=index%>">So Thu Tu</label>
							<div class="form-group">
								<input name="orderNumber" type="number" max="<%=last%>"
									min="<%=first%>" placeholder="<%=arr[index].getOrderNumber()%>"
									value="<%=arr[index].getOrderNumber()%>">
							</div>

							<!-- loai cau hoi -->
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

							<!-- audio -->
							<%
							if (i == 1 || i == 2) {
							%>
							<%
							if ((typeOneQuestionModel.getAudio() == null)) {
							%>
							<div class="form-group">
								<label for="img<%=index%>">Audio</label> <input
									id="Audio<%=index%>" name="audio" type="file"
									class="form-control" placeholder="Audio" required="required">
							</div>
							<%
							} else {
							%>
							<div class="form-group">
								<label for="Audio1<%=index%>">Audio</label> <br>
								<audio controls>
									<source
										src="/MVC/<%=((TypeOneQuestionModel) arr[index]).getAudio()%>"
										type="audio/mpeg">
								</audio>
							</div>
							<div class="form-group">
								<input type="hidden" name="audioString"
									value="<%=((TypeOneQuestionModel) arr[index]).getAudio()%>">
							</div>
							<div class="form-group">
								<label for="Audio2<%=index%>">Thay Doi Audio</label> <input
									id="Audio2<%=index%>" name="audio" type="file"
									class="form-control" placeholder="thay doi audio">
							</div>
							<%
							}
							}
							%>

							<!-- transcript -->
							<%
							if (i == 1 || i == 2) {
							%>
							<div class="form-group">
								<label for="Transcript<%=index%>">Transcript</label>
								<textarea name="transcript" class="form-control"
									id="Transcript<%=index%>" rows="2"><%=typeOneQuestionModel.getTranscript()%></textarea>
							</div>
							<%
							}
							%>

							<!-- anh mo ta -->
							<%
							if (i == 1) {
							%>
							<%
							if ((arr[index].getImage() == null)) {
							%>
							<div class="form-group">
								<label for="img<%=index%>">Anh Mo Ta</label> <input
									id="img<%=index%>" name="image" type="file"
									class="form-control" placeholder="anh mo ta" <%if (i == 1) {%>
									required="required" <%}%>>
							</div>
							<%
							} else {
							%>
							<div class="form-group">
								<label for="img1<%=index%>">Anh Mo Ta</label> <img
									style="width: 100%;" alt="anh mo ta"
									src="/MVC/<%=arr[index].getImage()%>">
							</div>
							<div class="form-group">
								<input type="hidden" name="imageString"
									value="<%=arr[index].getImage()%>">
							</div>
							<div class="form-group">
								<label for="img2<%=index%>">Thay Doi Anh Mo Ta</label> <input
									id="img2<%=index%>" name="image" type="file"
									class="form-control" placeholder="thay doi anh mo ta">
							</div>
							<%
							}
							}
							%>

							<!-- testsID -->
							<div class="form-group">
								<input type="hidden" name="testsID"
									value="<%=request.getParameter("testsID")%>">
							</div>

							<%
							if (i == 5) {
							%>
							<!-- nội dung câu hỏi -->
							<div class="form-group">
								<label for="content<%=index%>">Noi Dung Cau Hoi</label>
								<textarea name="questionContent" class="form-control"
									id="content<%=index%>" rows="2"> <%=typeTwoQuestionModel.getQuestionContent()%></textarea>
							</div>

							<!-- noi dung dap an-->
							<div class="form-group">
								<label for="answerA<%=index%>">Noi Dung Dap An A</label> <input
									type="text" class="form-control" id="answerA<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerA"
									value="<%=typeTwoQuestionModel.getContentAnswerA()%>">
							</div>

							<div class="form-group">
								<label for="answerB<%=index%>">Noi Dung Dap An B</label> <input
									type="text" class="form-control" id="answerB<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerB"
									value="<%=typeTwoQuestionModel.getContentAnswerB()%>">
							</div>

							<div class="form-group">
								<label for="answerC<%=index%>">Noi Dung Dap An C</label> <input
									type="text" class="form-control" id="answerC<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerC"
									value="<%=typeTwoQuestionModel.getContentAnswerC()%>">
							</div>

							<div class="form-group">
								<label for="answerD<%=index%>">Noi Dung Dap An D</label> <input
									type="text" class="form-control" id="answerD<%=index%>"
									aria-describedby="emailHelp" name="contentAnswerD"
									value="<%=typeTwoQuestionModel.getContentAnswerD()%>">
							</div>
							<%
							}
							%>

							<!-- đáp án đúng -->
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
									<%
									if (i != 2) {
									%>
									<option value="D"
										<%if ((arr[index].getAnswerCorrect()).equals("D")) {%>
										selected="selected" <%}%>>D</option>
									<%
									}
									%>
								</select>
							</div>

							<!-- giải thích -->
							<div class="form-group">
								<label for="explain<%=index%>">Giai Thich</label>
								<textarea name="answerExplain" class="form-control"
									id="explain<%=index%>" rows="2"><%=arr[index].getAnswerExplain()%></textarea>
							</div>

							<!-- questionID -->
							<div class="form-group">
								<input name="questionID" type="hidden"
									value="<%=arr[index].getQuestionID()%>">
							</div>
							<button type="submit" class="btn btn-primary">Sửa</button>
						</form>
						<%
						if (arr[index].getQuestionID() != 0) {
						%>
						<form method="post" action="/MVC/teacher/question/delete">
							<div class="form-group">

								<input type="hidden" name="questionID"
									value="<%=arr[index].getQuestionID()%>"> <input
									type="hidden" name="testsID"
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
			if ((index == last - 1) && (count < last)) {
			%>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal<%=index%>">THEM</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal<%=index%>" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">THEM CAU HOI</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form method="POST" enctype="multipart/form-data"
								action="/MVC/teacher/question/create?testsID=<%=request.getParameter("testsID")%>">

								<!-- ordernumber -->
								<label for="ordernumber<%=index%>">So Thu Tu</label>
								<div class="form-group">
									<input name="orderNumber" type="number" max="<%=last%>"
										min="<%=first%>">
								</div>

								<!-- loai cau hoi -->
								<div class="form-group">
									<label for="type<%=index%>">Loai Cau Hoi</label> <select
										class="form-control custom-autofill-selected"
										id="type<%=index%>" name="typeQuestionID">
										<%
										LinkedList<TypeQuestionModel> typeQuestionModels = (LinkedList<TypeQuestionModel>) request
												.getAttribute("typeQuestionModels" + i);
										for (TypeQuestionModel t : typeQuestionModels) {
										%>
										<option value="<%=t.getTypeQuestionID()%>"><%=t.getTypeQuestionName()%></option>
										<%
										}
										%>
									</select>
								</div>

								<!-- audio -->
								<%
								if (i == 1 || i == 2) {
								%>
								<div class="form-group">
									<label for="img<%=index%>">Audio</label> <input
										id="Audio<%=index%>" name="audio" type="file"
										class="form-control" placeholder="Audio" required="required">
								</div>
								<%
								}
								%>

								<!-- transcript -->
								<%
								if (i == 1 || i == 2) {
								%>
								<div class="form-group">
									<label for="Transcript<%=index%>">Transcript</label>
									<textarea name="transcript" class="form-control"
										id="Transcript<%=index%>" rows="2"><%=typeOneQuestionModel.getTranscript()%></textarea>
								</div>
								<%
								}
								%>

								<!-- anh mo ta -->
								<%
								if (i == 1) {
								%>
								<div class="form-group">
									<label for="img<%=index%>">Anh Mo Ta</label> <input
										id="img<%=index%>" name="image" type="file"
										class="form-control" placeholder="anh mo ta" <%if (i == 1) {%>
										required="required" <%}%>>
								</div>
								<%
								}
								%>

								<!-- testsID -->
								<div class="form-group">
									<input type="hidden" name="testsID"
										value="<%=request.getParameter("testsID")%>">
								</div>
								<%
								if (i == 5) {
								%>
								<!-- nội dung câu hỏi -->
								<div class="form-group">
									<label for="content<%=index%>">Noi Dung Cau Hoi</label>
									<textarea name="questionContent" class="form-control"
										id="content<%=index%>" rows="2"></textarea>
								</div>

								<!-- noi dung dap an-->
								<div class="form-group">
									<label for="answerA<%=index%>">Noi Dung Dap An A</label> <input
										type="text" class="form-control" id="answerA<%=index%>"
										aria-describedby="emailHelp" name="contentAnswerA">
								</div>

								<div class="form-group">
									<label for="answerB<%=index%>">Noi Dung Dap An B</label> <input
										type="text" class="form-control" id="answerB<%=index%>"
										aria-describedby="emailHelp" name="contentAnswerB">
								</div>

								<div class="form-group">
									<label for="answerC<%=index%>">Noi Dung Dap An C</label> <input
										type="text" class="form-control" id="answerC<%=index%>"
										aria-describedby="emailHelp" name="contentAnswerC">
								</div>

								<div class="form-group">
									<label for="answerD<%=index%>">Noi Dung Dap An D</label> <input
										type="text" class="form-control" id="answerD<%=index%>"
										aria-describedby="emailHelp" name="contentAnswerD">
								</div>
								<%
								}
								%>

								<!-- đáp án đúng -->
								<div class="form-group">
									<label for="answerCorrect<%=index%>">Dap An Dung</label> <select
										class="form-control custom-autofill-selected"
										id="answerCorrect<%=index%>" name="answerCorrect">
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<%
										if (i != 2) {
										%>
										<option value="D">D</option>
										<%
										}
										%>
									</select>
								</div>

								<!-- giải thích -->
								<div class="form-group">
									<label for="explain<%=index%>">Giai Thich</label>
									<textarea name="answerExplain" class="form-control"
										id="explain<%=index%>" rows="2"></textarea>
								</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">OK</button>
						</div>
		</form>
	</div>
	</div>
	</div>

	<%
	}
	}
	} else {
	if (((LinkedList<DataQuestionModel>) request.getAttribute("dataQuestionModels" + i)) != null) {
	for (DataQuestionModel d : (LinkedList<DataQuestionModel>) request.getAttribute("dataQuestionModels" + i)) {
	%>
	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left" type="button"
						data-toggle="collapse"
						data-target="#collapseOne<%=d.getDataQuestionID()%>"
						aria-expanded="true" aria-controls="collapseOne">
						DATA<%=d.getOrderNumber()%></button>
				</h2>
			</div>

			<div id="collapseOne<%=d.getDataQuestionID()%>" class="collapse"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
					<form action="/MVC/teacher/question/edit-data" method="POST"
						enctype="multipart/form-data">
						<!-- dataQuestionID -->
						<div class="form-group">
							<input type="hidden" name="dataQuestionID"
								value="<%=d.getDataQuestionID()%>">
						</div>

						<!-- orderNumber -->

						<label>SoThu Tu</label>
						<div class="form-group">
							<input name="orderNumber" type="number"
								placeholder="<%=d.getOrderNumber()%>"
								value="<%=d.getOrderNumber()%>">
						</div>

						<!-- data question -->
						<%
						if (i == 6 || i == 7) {
						%>
						<div class="form-group">
							<label for="img1<%=d.getDataQuestionID()%>">Anh Mo Ta</label> <img
								style="width: 100%;" alt="anh mo ta"
								src="/MVC/<%=d.getDataQuestion()%>">
						</div>

						<div class="form-group">
							<input type="hidden" name="dataQuestionString"
								value="<%=d.getDataQuestion()%>">
						</div>
						<div class="form-group">
							<label for="img2<%=d.getDataQuestionID()%>">Thay Doi Anh
								Mo Ta</label> <input id="img2<%=d.getDataQuestionID()%>"
								name="dataQuestion" type="file" class="form-control"
								placeholder="thay doi anh mo ta">
						</div>
						<%
						} else if (i == 3 || i == 4) {
						System.out.print("vao vi day co i = : " + i);
						%>
						<div class="form-group">
							<label for="audio<%=d.getDataQuestionID()%>">Audio</label>
							<audio controls>
								<source src="/MVC/<%=d.getDataQuestion()%>" type="audio/mpeg">
							</audio>
						</div>

						<div class="form-group">
							<input type="hidden" name="dataQuestionString"
								value="<%=d.getDataQuestion()%>">
						</div>
						<div class="form-group">
							<label for="audio1<%=d.getDataQuestionID()%>">Thay Doi
								Audio</label> <input id="audio1<%=d.getDataQuestionID()%>"
								name="dataQuestion" type="file" class="form-control"
								placeholder="thay doi audio">
						</div>
						<%
						}
						%>
						<!-- transcript -->
						<div class="form-group">
							<label for="Transcript<%=d.getDataQuestion()%>">Transcript</label>
							<textarea name="transcript" class="form-control"
								id="Transcript<%=d.getDataQuestion()%>" rows="2"><%=d.getTranscript()%></textarea>
						</div>

						<!-- testsID -->
						<div class="form-group">
							<input type="hidden" name="testsID"
								value="<%=request.getParameter("testsID")%>">
						</div>

						<div class="form-group">
							<button class="btn btn-primary" type="submit">SUA</button>
						</div>
					</form>

					<form method="post"
						action="/MVC/teacher/question/delete-data?testsID=<%=request.getParameter("testsID")%>">
						<input type="hidden" name="dataQuestionID"
							value="<%=d.getDataQuestionID()%>">
						<button type="submit" class="btn btn-danger">XOA</button>
					</form>
					<br>
					<%
					for (int j = first - 1; j < last; j++) {
						typeTwoQuestionModel = (TypeTwoQuestionModel) arr[j];
						if (typeTwoQuestionModel.getDataQuestionID() != null
						&& (typeTwoQuestionModel.getDataQuestionID() == d.getDataQuestionID())) {
					%>

					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header" id="heading<%=j%>">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left" type="button"
										data-toggle="collapse" data-target="#collapse<%=j%>">
										<h3>
											Cau
											<%=j + 1%>
										</h3>
									</button>
								</h2>
							</div>
						</div>
						<div id="collapse<%=j%>" class="collapse collapsed cl"
							aria-labelledby="heading<%=j%>" data-parent="#accordionExample">
							<div class="card-body">
								<form method="POST" enctype="multipart/form-data"
									action="/MVC/teacher/question/edit?testsID=<%=request.getParameter("testsID")%> ">
									<!-- ordernumber -->
									<label for="ordernumber<%=j%>">So Thu Tu</label>
									<div class="form-group">
										<input name="orderNumber" type="number" max="<%=last%>"
											min="<%=first%>" placeholder="<%=arr[j].getOrderNumber()%>"
											value="<%=arr[j].getOrderNumber()%>">
									</div>

									<!-- loai cau hoi -->
									<div class="form-group">
										<label for="type<%=j%>">Loai Cau Hoi</label> <select
											class="form-control custom-autofill-selected" id="type<%=j%>"
											name="typeQuestionID">
											<%
											LinkedList<TypeQuestionModel> typeQuestionModels = (LinkedList<TypeQuestionModel>) request
													.getAttribute("typeQuestionModels" + i);
											for (TypeQuestionModel t : typeQuestionModels) {
											%>
											<option value="<%=t.getTypeQuestionID()%>"
												<%if ((t.getTypeQuestionName()).equals(arr[j].getTypeQuestionModel().getTypeQuestionName())) {%>
												selected="selected" <%}%>><%=t.getTypeQuestionName()%></option>
											<%
											}
											%>
										</select>
									</div>

									<!-- anh mo ta -->
									<%
									if (i == 3 || i == 4) {
									%>
									<%
									if ((arr[j].getImage() == null)) {
									%>
									<div class="form-group">
										<label for="img<%=j%>">Anh Mo Ta</label> <input id="img<%=j%>"
											name="image" type="file" class="form-control"
											placeholder="anh mo ta" <%if (i == 1) {%> required="required"
											<%}%>>
									</div>
									<%
									} else {
									%>
									<div class="form-group">
										<label for="img1<%=j%>">Anh Mo Ta</label> <img
											style="width: 100%;" alt="anh mo ta"
											src="/MVC/<%=arr[j].getImage()%>">
									</div>
									<div class="form-group">
										<input type="hidden" name="imageString"
											value="<%=arr[j].getImage()%>">
									</div>
									<div class="form-group">
										<label for="img2<%=j%>">Thay Doi Anh Mo Ta</label> <input
											id="img2<%=j%>" name="image" type="file" class="form-control"
											placeholder="thay doi anh mo ta">
									</div>
									<%
									}
									}
									%>

									<!-- testsID -->
									<div class="form-group">
										<input type="hidden" name="testsID"
											value="<%=request.getParameter("testsID")%>">
									</div>

									<!-- nội dung câu hỏi -->
									<%
									if (i != 6) {
									%>
									<div class="form-group">
										<label for="content<%=j%>">Noi Dung Cau Hoi</label>
										<textarea name="questionContent" class="form-control"
											id="content<%=j%>" rows="2"> <%=typeTwoQuestionModel.getQuestionContent()%></textarea>
									</div>
									<%
									}
									%>
									<!-- noi dung dap an-->
									<div class="form-group">
										<label for="answerA<%=j%>">Noi Dung Dap An A</label> <input
											type="text" class="form-control" id="answerA<%=j%>"
											aria-describedby="emailHelp" name="contentAnswerA"
											value="<%=typeTwoQuestionModel.getContentAnswerA()%>">
									</div>

									<div class="form-group">
										<label for="answerB<%=j%>">Noi Dung Dap An B</label> <input
											type="text" class="form-control" id="answerB<%=j%>"
											aria-describedby="emailHelp" name="contentAnswerB"
											value="<%=typeTwoQuestionModel.getContentAnswerB()%>">
									</div>

									<div class="form-group">
										<label for="answerC<%=j%>">Noi Dung Dap An C</label> <input
											type="text" class="form-control" id="answerC<%=j%>"
											aria-describedby="emailHelp" name="contentAnswerC"
											value="<%=typeTwoQuestionModel.getContentAnswerC()%>">
									</div>

									<div class="form-group">
										<label for="answerD<%=j%>">Noi Dung Dap An D</label> <input
											type="text" class="form-control" id="answerD<%=j%>"
											aria-describedby="emailHelp" name="contentAnswerD"
											value="<%=typeTwoQuestionModel.getContentAnswerD()%>">
									</div>

									<!-- đáp án đúng -->
									<div class="form-group">
										<label for="answerCorrect<%=j%>">Dap An Dung</label> <select
											class="form-control custom-autofill-selected"
											id="answerCorrect<%=j%>" name="answerCorrect">
											<option value="A"
												<%if ((arr[j].getAnswerCorrect()).equals("A")) {%>
												selected="selected" <%}%>>A</option>
											<option value="B"
												<%if ((arr[j].getAnswerCorrect()).equals("B")) {%>
												selected="selected" <%}%>>B</option>
											<option value="C"
												<%if ((arr[j].getAnswerCorrect()).equals("C")) {%>
												selected="selected" <%}%>>C</option>
											<%
											if (i != 2) {
											%>
											<option value="D"
												<%if ((arr[j].getAnswerCorrect()).equals("D")) {%>
												selected="selected" <%}%>>D</option>
											<%
											}
											%>
										</select>
									</div>

									<!-- giải thích -->
									<div class="form-group">
										<label for="explain<%=j%>">Giai Thich</label>
										<textarea name="answerExplain" class="form-control"
											id="explain<%=j%>" rows="2"><%=arr[j].getAnswerExplain()%></textarea>
									</div>

									<!-- questionID -->
									<div class="form-group">
										<input name="questionID" type="hidden"
											value="<%=arr[j].getQuestionID()%>">
									</div>
									<button type="submit" class="btn btn-primary">Sửa</button>
								</form>
								<%
								if (arr[j].getQuestionID() != 0) {
								%>
								<form method="post" action="/MVC/teacher/question/delete">
									<div class="form-group">

										<input type="hidden" name="questionID"
											value="<%=arr[j].getQuestionID()%>"> <input
											type="hidden" name="testsID"
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


					<%
					}
					%>


					<!-- them ch -->



					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#addExampleModal<%=d.getDataQuestionID()%>">THEM</button>

					<!-- Modal -->
					<div class="modal fade"
						id="addExampleModal<%=d.getDataQuestionID()%>" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">THEM CAU
										HOI</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="POST" enctype="multipart/form-data"
										action="/MVC/teacher/question/create?testsID=<%=request.getParameter("testsID")%>">
										<!-- dataquestionID -->
										<div class="form-group">
											<input type="hidden" name="dataQuestionID"
												value="<%=d.getDataQuestionID()%>">
										</div>

										<!-- ordernumber -->

										<div class="form-group">
											<label for="ordernumber<%=d.getDataQuestionID()%>">So
												Thu Tu</label> <input name="orderNumber" type="number"
												max="<%=last%>" min="<%=first%>">
										</div>

										<!-- loai cau hoi -->
										<div class="form-group">
											<label for="type<%=d.getDataQuestionID()%>">Loai Cau
												Hoi</label> <select class="form-control custom-autofill-selected"
												id="type<%=d.getDataQuestionID()%>" name="typeQuestionID">
												<%
												LinkedList<TypeQuestionModel> typeQuestionModels = (LinkedList<TypeQuestionModel>) request
														.getAttribute("typeQuestionModels" + i);
												for (TypeQuestionModel t : typeQuestionModels) {
												%>
												<option value="<%=t.getTypeQuestionID()%>"><%=t.getTypeQuestionName()%></option>
												<%
												}
												%>
											</select>
										</div>


										<!-- anh mo ta -->
										<%
										if (i == 3 || i == 4) {
										%>
										<div class="form-group">
											<label for="img<%=d.getDataQuestionID()%>">Anh Mo Ta</label>
											<input id="img<%=d.getDataQuestionID()%>" name="image"
												type="file" class="form-control" placeholder="anh mo ta"
												<%if (i == 1) {%> required="required" <%}%>>
										</div>
										<%
										}
										%>

										<!-- testsID -->
										<div class="form-group">
											<input type="hidden" name="testsID"
												value="<%=request.getParameter("testsID")%>">
										</div>
										<%
										if (i != 6) {
										%>
										<!-- nội dung câu hỏi -->
										<div class="form-group">
											<label for="content<%=d.getDataQuestionID()%>">Noi
												Dung Cau Hoi</label>
											<textarea name="questionContent" class="form-control"
												id="content<%=d.getDataQuestionID()%>" rows="2"></textarea>
										</div>
										<%
										}
										%>
										<!-- noi dung dap an-->
										<div class="form-group">
											<label for="answerA<%=d.getDataQuestionID()%>">Noi
												Dung Dap An A</label> <input type="text" class="form-control"
												id="answerA<%=d.getDataQuestionID()%>"
												aria-describedby="emailHelp" name="contentAnswerA">
										</div>

										<div class="form-group">
											<label for="answerB<%=d.getDataQuestionID()%>">Noi
												Dung Dap An B</label> <input type="text" class="form-control"
												id="answerB<%=d.getDataQuestionID()%>"
												aria-describedby="emailHelp" name="contentAnswerB">
										</div>

										<div class="form-group">
											<label for="answerC<%=d.getDataQuestionID()%>">Noi
												Dung Dap An C</label> <input type="text" class="form-control"
												id="answerC<%=d.getDataQuestionID()%>"
												aria-describedby="emailHelp" name="contentAnswerC">
										</div>

										<div class="form-group">
											<label for="answerD<%=d.getDataQuestionID()%>">Noi
												Dung Dap An D</label> <input type="text" class="form-control"
												id="answerD<%=d.getDataQuestionID()%>"
												aria-describedby="emailHelp" name="contentAnswerD">
										</div>

										<!-- đáp án đúng -->
										<div class="form-group">
											<label for="answerCorrect<%=d.getDataQuestionID()%>">Dap
												An Dung</label> <select
												class="form-control custom-autofill-selected"
												id="answerCorrect<%=d.getDataQuestionID()%>"
												name="answerCorrect">
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<%
												if (i != 2) {
												%>
												<option value="D">D</option>
												<%
												}
												%>
											</select>
										</div>

										<!-- giải thích -->
										<div class="form-group">
											<label for="explain<%=d.getDataQuestionID()%>">Giai
												Thich</label>
											<textarea name="answerExplain" class="form-control"
												id="explain<%=d.getDataQuestionID()%>" rows="2"></textarea>
										</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">OK</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<%
	}
	%>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModalAddData<%=i%>">THEM DATA</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalAddData<%=i%>" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">THEMDATA</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/MVC/teacher/question/create-data" method="POST"
					enctype="multipart/form-data">
					<div class="modal-body">
						<!-- part -->
						<div class="form-group">
							<input type="hidden" name="orderNumberPart" value="<%=i%>">
						</div>

						<!-- orderNumber -->

						<label>SoThu Tu</label>
						<div class="form-group">
							<input name="orderNumber" type="number">
						</div>
						<!-- transcript -->
						<div class="form-group">
							<label for="TranscriptDATA">Transcript</label>
							<textarea name="transcript" class="form-control"
								id="TranscriptDATA" rows="2"></textarea>
						</div>
						<%
						System.out.println("i =========================================== " + i);
						if (i == 6 || i == 7) {
						%>
						<!-- anh mo ta -->

						<div class="form-group">
							<label for="imgDESC">Anh Mo Ta</label> <input id="imgDESC"
								name="data" type="file" class="form-control"
								placeholder="anh mo ta" required="required">
						</div>
						<%
						} else if (i == 3 || i == 4) {
						System.out.println("vao vi day co i = : " + i);
						%>
						<div class="form-group">
							<label for="audioDESC">Audio</label> <input name="data"
								type="file" id="audioDESC" class="form-control"
								placeholder="audio" required="required">
						</div>
						<%
						}
						%>
						<!-- testsID -->
						<div class="form-group">
							<input type="hidden" name="testsID"
								value="<%=request.getParameter("testsID")%>">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-secondary">DONG Y</button>
					</div>
				</form>
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