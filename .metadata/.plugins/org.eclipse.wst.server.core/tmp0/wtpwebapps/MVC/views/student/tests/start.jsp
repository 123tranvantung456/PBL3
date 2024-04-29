<%@page import="com.pbl3.model.TypeTwoQuestionModel"%>
<%@page import="com.pbl3.model.TypeOneQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!doctype html>
<%@page import="com.pbl3.model.TestsModel"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Study TOIEC</title>
</head>

<body>
	<style>
 		<%@include file ="../../../assets/css/base.css"%>
  		<%@include file = "../../../assets/css/start.css"%>
	</style>
    <!-- header  -->
   <%@include file="../re-use/header.jsp" %> 
    <!--end  header  -->
	<%TestsModel testsModel = (TestsModel)request.getAttribute("testsModel");
	QuestionModel[] arr = (QuestionModel[]) request.getAttribute("questionModels");%>
    <div class="section-one">
        <div class="container">  
            <div class="name-test" style="margin-bottom: 20px;"><%=testsModel.getTestsName()%></div>
            <div class="row"> 
                <div class="col-xl-10">
                    <form action="" method="post" id="form-test">
                        <div class="content-wrap">
                            <!-- <div class="button-hightlight">
                        hightlight 
                    </div> -->
                            <div class="audio">
                                <audio src="/MVC/<%=testsModel.getAudio()%>" controls></audio>
                            </div>
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-part-1-tab" data-toggle="pill"
                                        data-target="#pills-part-1" type="button" role="tab"
                                        aria-controls="pills-part-1" aria-selected="true">Part 1</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-part-2-tab" data-toggle="pill"
                                        data-target="#pills-part-2" type="button" role="tab"
                                        aria-controls="pills-part-2" aria-selected="false">Part 2</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-part-3-tab" data-toggle="pill"
                                        data-target="#pills-part-3" type="button" role="tab"
                                        aria-controls="pills-part-3" aria-selected="false">Part 3</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-part-4-tab" data-toggle="pill"
                                        data-target="#pills-part-4" type="button" role="tab"
                                        aria-controls="pills-part-4" aria-selected="false">Part 4</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-part-5-tab" data-toggle="pill"
                                        data-target="#pills-part-5" type="button" role="tab"
                                        aria-controls="pills-part-5" aria-selected="false">Part 5</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-part-6-tab" data-toggle="pill"
                                        data-target="#pills-part-6" type="button" role="tab"
                                        aria-controls="pills-part-6" aria-selected="false">Part 6</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-part-7-tab" data-toggle="pill"
                                        data-target="#pills-part-7" type="button" role="tab"
                                        aria-controls="pills-part-7" aria-selected="false">Part 7</button>
                                </li>
                            </ul>
                            <!-- part1 -->
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-part-1" role="tabpanel"
                                    aria-labelledby="pills-part-1-tab">
                                    <%for(int i = 1; i <= 6; i++) {
                                    	if(arr != null && arr[i] != null){
                                    %>
                                    <div class="question-group">
                                        <div class="inner-img">
                                            <img src="/MVC/<%=((TypeOneQuestionModel)arr[i]).getImage()%>" alt="anh_mo_ta">
                                        </div>
                                        <div class="question" id="question<%=i%>">
                                            <div class="order-number">
                                                <p class="order-number-text"><%=i%></p>
                                            </div>             
                                            <div class="answer">
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=arr[i].getQuestionID()%>" value="A" id="q<%=i%>-a">
                                                    <label for="q<%=i%>-a">A.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="B" id="q<%=i%>-b">
                                                    <label for="q<%=i%>-b">B.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="C" id="q<%=i%>-c">
                                                    <label for="q<%=i%>-c">C.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="D" id="q<%=i%>-d">
                                                    <label for="q<%=i%>-d">D.</label>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    <%}}%>
                                </div>
                                
                                <!-- part 2 -->
                                <div class="tab-pane fade" id="pills-part-2" role="tabpanel"
                                    aria-labelledby="pills-part-2-tab">
									<%for(int i = 7; i <= 31; i++) {
                                    	if(arr != null && arr[i] != null){
                                    %>
                                    <div class="question-group">
                                        <div class="inner-img">
                                            <img src="/MVC/<%=((TypeOneQuestionModel)arr[i]).getImage()%>" alt="anh_mo_ta">
                                        </div>
                                        <div class="question" id="question<%=i%>">
                                            <div class="order-number">
                                                <p class="order-number-text"><%=i%></p>
                                            </div>             
                                            <div class="answer">
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="A" id="q<%=i%>-a">
                                                    <label for="q<%=i%>-a">A.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="B" id="q<%=i%>-b">
                                                    <label for="q<%=i%>-b">B.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="C" id="q<%=i%>-c">
                                                    <label for="q<%=i%>-c">C.</label>
                                                </div>  
                                            </div> 
                                        </div>
                                    </div>
                                    <%}}%>
                                </div>
                                
                                 <!-- part 3 -->
                                <div class="tab-pane fade" id="pills-part-3" role="tabpanel"
                                    aria-labelledby="pills-part-3-tab">
                                   <%for(int i = 32; i <= 70; i++) {
                                    	if(arr != null && arr[i] != null){
                                    		if(((TypeTwoQuestionModel)arr[i]).getImage() != ""){
                                    %>
                                    <div class="question-group">
                                        <div class="inner-img">
                                            <img src="/MVC/<%=((TypeOneQuestionModel)arr[i]).getImage()%>" alt="anh_mo_ta">
                                        </div>
                                        <div class="question" id="question<%=i%>">
                                            <div class="order-number">
                                                <p class="order-number-text"><%=i%></p>
                                            </div>             
                                            <div class="answer">
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="A" id="q<%=i%>-a">
                                                    <label for="q<%=i%>-a">A.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="B" id="q<%=i%>-b">
                                                    <label for="q<%=i%>-b">B.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="C" id="q<%=i%>-c">
                                                    <label for="q<%=i%>-c">C.</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="answer<%=((TypeOneQuestionModel)arr[i]).getImage()%>" value="D" id="q<%=i%>-d">
                                                    <label for="q<%=i%>-d">D.</label>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    <%}}}%>
                                </div>
                                
                                 <!-- part 4 -->
                                <div class="tab-pane fade" id="pills-part-4" role="tabpanel"
                                    aria-labelledby="pills-part-4-tab">
                                    <div class="question-group">
                                        <div class="question" id="question71">
                                            <div class="order-number">
                                                <p class="order-number-text">71</p>
                                            </div>
                                            <div class="answer">
                                                <p class="question-text">Why is the woman calling?</p>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q71" value="A" id="q71-a">
                                                    <label for="q71-a">A. To request a ticket change</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q71" value="B" id="q71-b">
                                                    <label for="q71-b">B. To make a dinner reservation</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q71" value="C" id="q71-c">
                                                    <label for="q71-c">C. To order merchandise</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q71" value="D" id="q71-d">
                                                    <label for="q71-d">D. To plan a vacation</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="questions-group">
                                        <div class="row">
                                            <div class="col-xl-7">
                                                <div class="inner-wrap-img">
                                                    <div class="inner-img">
                                                        <img src="https://study4.com/media/ets2023/img/1/image14.png"
                                                            alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-5">
                                                <div class="inner-wrap-question">
                                                    <div class="question" id="question98">
                                                        <div class="order-number">
                                                            <p class="order-number-text">98</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q98" value="A" id="q98-a">
                                                                <label for="q98-a">A. To request a ticket change</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q98" value="B" id="q98-b">
                                                                <label for="q98-b">B. To make a dinner
                                                                    reservation</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q98" value="C" id="q98-c">
                                                                <label for="q98-c">C. To order merchandise</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q98" value="D" id="q98-d">
                                                                <label for="q98-d">D. To plan a vacation</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question99">
                                                        <div class="order-number">
                                                            <p class="order-number-text">99</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q99" value="A" id="q99-a">
                                                                <label for="q99-a">A. To request a ticket change</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q99" value="B" id="q99-b">
                                                                <label for="q99-b">B. To make a dinner
                                                                    reservation</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q99" value="C" id="q99-c">
                                                                <label for="q99-c">C. To order merchandise</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q99" value="D" id="q99-d">
                                                                <label for="q99-d">D. To plan a vacation</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question100">
                                                        <div class="order-number">
                                                            <p class="order-number-text">100</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q100" value="A" id="q100-a">
                                                                <label for="q100-a">A. To request a ticket
                                                                    change</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q100" value="B" id="q100-b">
                                                                <label for="q100-b">B. To make a dinner
                                                                    reservation</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q100" value="C" id="q100-c">
                                                                <label for="q100-c">C. To order merchandise</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q100" value="D" id="q100-d">
                                                                <label for="q100-d">D. To plan a vacation</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                 <!-- part 5 -->
                                <div class="tab-pane fade" id="pills-part-5" role="tabpanel"
                                    aria-labelledby="pills-part-5-tab">
                                    <div class="question-group">
                                        <div class="question" id="question101">
                                            <div class="order-number">
                                                <p class="order-number-text">101</p>
                                            </div>
                                            <div class="answer">
                                                <p class="question-text">When she held her last meeting, Ms. Toba
                                                    -------
                                                    her sales staff to perform even better next quarter.</p>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q101" value="A" id="q101-a">
                                                    <label for="q101-a">A. To request a ticket change</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q101" value="B" id="q101-b">
                                                    <label for="q101-b">B. To make a dinner reservation</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q101" value="C" id="q101-c">
                                                    <label for="q101-c">C. To order merchandise</label>
                                                </div>
                                                <div class="wrap-answer">
                                                    <input type="radio" name="q101" value="D" id="q101-d">
                                                    <label for="q101-d">D. To plan a vacation</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                 <!-- part 6 -->
                                <div class="tab-pane fade" id="pills-part-6" role="tabpanel"
                                    aria-labelledby="pills-part-6-tab">
                                    <div class="questions-group">
                                        <div class="row">
                                            <div class="col-xl-7">
                                                <div class="inner-wrap-img">
                                                    <div class="inner-img">
                                                        <img src="https://study4.com/media/ets2023/img/1/image15.png"
                                                            alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-5">
                                                <div class="inner-wrap-question">
                                                    <div class="question" id="question131">
                                                        <div class="order-number">
                                                            <p class="order-number-text">131</p>
                                                        </div>
                                                        <div class="answer">
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q131" value="A" id="q131-a">
                                                                <label for="q131-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q131" value="A" id="q131-b">
                                                                <label for="q131-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q131" value="A" id="q131-c">
                                                                <label for="q131-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q131" value="A" id="q131-d">
                                                                <label for="q131-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question132">
                                                        <div class="order-number">
                                                            <p class="order-number-text">132</p>
                                                        </div>
                                                        <div class="answer">
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q132" value="A" id="q132-a">
                                                                <label for="q132-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q132" value="A" id="q132-b">
                                                                <label for="q132-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q132" value="A" id="q132-c">
                                                                <label for="q132-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q132" value="A" id="q132-d">
                                                                <label for="q132-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                 <!-- part 7 -->
                                <div class="tab-pane fade" id="pills-part-7" role="tabpanel"
                                    aria-labelledby="pills-part-7-tab">
                                    <div class="questions-group">
                                        <div class="row">
                                            <div class="col-xl-7">
                                                <div class="inner-wrap-img">
                                                    <div class="inner-img">
                                                        <img src="https://study4.com/media/ets2023/img/1/image26.png"
                                                            alt="">
                                                    </div>
                                                    <div class="inner-img">
                                                        <img src="https://study4.com/media/ets2023/img/1/image27.png"
                                                            alt="">
                                                    </div>
                                                    <div class="inner-img">
                                                        <img src="https://study4.com/media/ets2023/img/1/image28.png"
                                                            alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-5">
                                                <div class="inner-wrap-question">
                                                    <div class="question" id="question191">
                                                        <div class="order-number">
                                                            <p class="order-number-text">191</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q191" value="A" id="q191-a">
                                                                <label for="q191-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q191" value="A" id="q191-b">
                                                                <label for="q191-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q191" value="A" id="q191-c">
                                                                <label for="q191-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q191" value="A" id="q191-d">
                                                                <label for="q191-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question192">
                                                        <div class="order-number">
                                                            <p class="order-number-text">192</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q192" value="A" id="q192-a">
                                                                <label for="q192-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q192" value="A" id="q192-b">
                                                                <label for="q192-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q192" value="A" id="q192-c">
                                                                <label for="q192-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q192" value="A" id="q192-d">
                                                                <label for="q192-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question193">
                                                        <div class="order-number">
                                                            <p class="order-number-text">193</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q193" value="A" id="q193-a">
                                                                <label for="q193-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q193" value="A" id="q193-b">
                                                                <label for="q193-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q193" value="A" id="q193-c">
                                                                <label for="q193-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q193" value="A" id="q193-d">
                                                                <label for="q193-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question194">
                                                        <div class="order-number">
                                                            <p class="order-number-text">194</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q194" value="A" id="q194-a">
                                                                <label for="q194-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q194" value="A" id="q194-b">
                                                                <label for="q194-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q194" value="A" id="q194-c">
                                                                <label for="q194-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q194" value="A" id="q194-d">
                                                                <label for="q194-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="question" id="question195">
                                                        <div class="order-number">
                                                            <p class="order-number-text">195</p>
                                                        </div>
                                                        <div class="answer">
                                                            <p class="question-text">Why is the woman calling?</p>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q195" value="A" id="q195-a">
                                                                <label for="q195-a">A. The results will be announced
                                                                    later
                                                                    this month.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q195" value="A" id="q195-b">
                                                                <label for="q195-b">B. We are proud to serve our
                                                                    community
                                                                    with excellence.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q195" value="A" id="q195-c">
                                                                <label for="q195-c">C. Pat and Kenny’s shop excelled in
                                                                    all
                                                                    four categories.</label>
                                                            </div>
                                                            <div class="wrap-answer">
                                                                <input type="radio" name="q195" value="A" id="q195-d">
                                                                <label for="q195-d">D. Please call in advance to
                                                                    schedule an
                                                                    appointment.</label>
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
                <div class="col-xl-2" id="sidebar">
                    <div class="sidebar top">
                        <p>Thời gian còn lại: <br> <span id="countdown"></span></p>
                        <button id="submit" type="submit">Nộp bài</button>
                        <p class="number-part">Part 1</p>
                        <ul class="sidebar-1">
                        	<%for(int i = 1; i <= 6; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                        <p class="number-part">Part 2</p>

                        <ul class="sidebar-2">
                        	<%for(int i = 7; i <= 31; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                        <p class="number-part">Part 3</p>
                        <ul class="sidebar-3">
                            <%for(int i = 32; i <= 70; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                        <p class="number-part">Part 4</p>
                        <ul class="sidebar-4">
                        	<%for(int i = 71; i <= 100; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                        <p class="number-part">Part 5</p>

                        <ul class="sidebar-5">
                           <%for(int i = 100; i <= 130; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                        <p class="number-part">Part 6</p>

                        <ul class="sidebar-6">
                            <%for(int i = 131; i <= 146; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                        <p class="number-part">Part 7</p>

                        <ul class="sidebar-7">
                            <%for(int i = 147; i <= 200; i++){%>
                            <li><a href="#question<%=i%>"><%=i%></a></li>
                        	<%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- <footer> -->
	<%@include file="../re-use/footer.jsp" %> 
    <!-- end footer -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('hidentop');
                }
                else
                    $('header').removeClass('hidentop');
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-1 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-1-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-1').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-2 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-2-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-2').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-3 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-3-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-3').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-4 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-4-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-4').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-5 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-5-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-5').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-6 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-6-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-6').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-7 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-7-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-7').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });


        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi chọn đáp án
            document.querySelectorAll('.question input[type="radio"]').forEach(radio => {
                radio.addEventListener('change', function () {
                    const questionId = this.closest('.question').getAttribute('id');
                    const sidebarLink = document.querySelector(`.sidebar a[href="#${questionId}"]`);
                    if (sidebarLink) {
                        sidebarLink.classList.add('selected');
                    }
                });
            })
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi chọn đáp án
            document.querySelectorAll('.question .order-number-text').forEach(ordernumber => {
                ordernumber.addEventListener('click', function () {
                    if (ordernumber.classList.contains('ticked')) {
                        ordernumber.classList.remove('ticked');
                    }
                    else {
                        ordernumber.classList.add('ticked');
                    }
                    const questionId = this.closest('.question').getAttribute('id');
                    const sidebarLink = document.querySelector(`.sidebar a[href="#${questionId}"]`);
                    if (sidebarLink) {
                        if (sidebarLink.classList.contains('ticked')) { sidebarLink.classList.remove('ticked'); }
                        else { sidebarLink.classList.add('ticked'); }
                    }
                });
            })
        });


        // đồng hồ đếm giờ
        // Lấy thời gian hiện tại
        const startTime = new Date().getTime();

        // Thời gian kết thúc là 120 phút sau thời điểm bắt đầu
        const endTime = startTime + (120 * 60 * 1000 + 2000);
        // const endTime = startTime + (5 * 1000);


        // Phần tử HTML chứa thời gian đếm ngược
        const countdownElement = document.getElementById('countdown');

        // Cập nhật thời gian đếm ngược mỗi giây
        const countdownInterval = setInterval(function () {
            // Lấy thời gian hiện tại
            const currentTime = new Date().getTime();

            // Tính toán thời gian còn lại
            const timeRemaining = endTime - currentTime;

            // Kiểm tra xem thời gian còn lại có âm không
            if (timeRemaining <= 0) {
                clearInterval(countdownInterval); // Dừng đếm ngược nếu đã kết thúc
                // Gọi sự kiện khi hết thời gian
                timeUpEvent();
            } else {
                // Chuyển thời gian từ mili giây thành giờ, phút và giây
                const hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

                // Hiển thị thời gian đếm ngược
                countdownElement.textContent = hours + ":" + minutes + ":" + seconds;
            }
        }, 1000); // Mỗi giây

        // Hàm sự kiện khi hết thời gian
        function timeUpEvent() {
            // Thực hiện các hành động cần thiết khi hết thời gian
            document.getElementById('submit').click();
        }

        // Lấy phần tử nút submit và form
        const submitButton = document.getElementById('submit');
        const form = document.getElementById('form-test');

        // Thêm sự kiện click cho nút submit
        submitButton.addEventListener('click', function (event) {
            // Ngăn chặn hành động mặc định của nút submit
            event.preventDefault();
            // Gọi phương thức submit() của form khi nút được nhấn
            form.submit();
        });
    </script>
</body>

</html>