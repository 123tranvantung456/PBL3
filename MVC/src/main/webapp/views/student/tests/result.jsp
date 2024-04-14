<%@page import="com.pbl3.libs.Result"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="com.pbl3.model.HistoryOfTest_QuestionModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.QuestionModel"%>
<%@page import="com.pbl3.service.QuestionService"%>
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
	 	<%@ include file="../../../assets/css/base.css" %>
        <%@ include file="../../../assets/css/style.css" %>
</style>
	<style>
.data {
	margin-bottom: 20px;
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

</style>
	<%@include file="../re-use/header.jsp" %>
	<div class="container">
		<h2>
			diem: <%= ((Result)request.getAttribute("result")).getScore()%>,
			so cau dung: <%= ((Result)request.getAttribute("result")).getRightAnswer()%>,
			so cau sai :<%= ((Result)request.getAttribute("result")).getWrongAnswer()%>,
			so cau bo qua: <%= ((Result)request.getAttribute("result")).getSkip()%>
			
		</h2>
		<div class="row">
			<%
			for (QuestionModel q : (LinkedList<QuestionModel>) request.getAttribute("questionModels")) {
			%>
			<div class="col-6">
				<div class="data">
					<span> CAU <%=q.getOrderNumber()%>: <%=q.getAnswerCorrect()%></span>
					<%
					boolean check = true;
					for (HistoryOfTest_QuestionModel h : (LinkedList<HistoryOfTest_QuestionModel>) request
							.getAttribute("historyOfTest_QuestionModels")) {
						if (q.getQuestionID() == h.getQuestionID()) {
							check = false;
							if ((q.getAnswerCorrect()).equals(h.getAnswer())) {
					%>
					<span style="color: green;">Đúng: <%=h.getAnswer() %></span>
					<%
					} else {
					%>
					<span style="color: red;">SAI: <%=h.getAnswer() %></span>
					<%
					}
					break;
					}
					}
					if (check) {
					%>
					<span style="color: yellow;">chua tra loi</span>

					<%
					}
					%>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal<%=q.getQuestionID()%>">XEM CHI TIET</button>
					<div class="modal fade modal-form" id="exampleModal<%=q.getQuestionID()%>" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<img class="inner-image"
										src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F"
										alt="">
									<h5 class="inner-title" id="exampleModalLabel">DAP AN</h5>
									<p class="inner-desc"></p>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="">
										<div class="row">
											<div class="col-12">
												
												<h5><%=q.getOrderNumber()%>. <%=q.getQuestionContent() %></h5>
												<span <%if(q.getAnswerCorrect().equals("A")) {%> style="background-color: green;"<%} %> ><%=q.getContentAnswerA() %> </span>
												<br>
												<span <%if(q.getAnswerCorrect().equals("B")) {%> style="background-color: green;"<%} %> ><%=q.getContentAnswerB() %> </span>
												<br>
												<span <%if(q.getAnswerCorrect().equals("C")) {%> style="background-color: green;"<%} %> ><%=q.getContentAnswerC() %> </span>
												<br>
												<span <%if(q.getAnswerCorrect().equals("D")) {%> style="background-color: green;"<%} %> ><%=q.getContentAnswerD() %> </span>
												<div class="section-one">
													<div class="container">
														<div class="row">
															<div class="col-12">
																<div class="inner-main">
																	<div class="inner-body">
																		<div class="accordion" id="accordionExample">
																			<div class="card">
																				<div class="card-header" id="headingOne">
																					<h2 class="mb-0">
																						<button class="btn btn-link btn-block text-left"
																							type="button" data-toggle="collapse"
																							data-target="#collapseOne" aria-expanded="true"
																							aria-controls="collapseOne">Xem chi tiet
																						</button>
																					</h2>
																				</div>
																				<div id="collapseOne" class="collapse collapsed"
																					aria-labelledby="headingOne"
																					data-parent="#accordionExample">
																					<div class="card-body">
																						<%=q.getAnswerExplain()%>
																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
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
			}
			%>

		</div>
	</div>
	<%@include file="../re-use/footer.jsp" %> 
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