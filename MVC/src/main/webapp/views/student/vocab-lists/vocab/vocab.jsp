<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabModel"%>
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
    	<%@include file="../../../../assets/css/base.css"%>
    	<%@include file="../../../../assets/css/style-vocab.css"%>
    	
        .header .main-header .tu-vung{
            color: var(--color-one);
        }      
    </style>
    <!-- header  -->
	<%@include file="../../re-use/header.jsp" %>
    <!--end  header  -->
  	
  	
    <div class="container">
        <div class="row">
            <div class="col-xl-8">
                <div class="row">
                    <div class="col-12">
                        <div class="section-one">
                            <div class="container">
                                <!-- lấy tên và mô tả từ dâtbase -->
                              <div class="inner-title">
                                  <h1>Danh sách: Tên danh sách</h1>      
                              </div>
                              <div class="inner-desc">
                                  <p>Mô tả danh sách...</p>
                              </div>
                      
                      
                                  <a class="insert" data-toggle="modal"
                                  data-target="#insert-vocab">
                                      Thêm từ vựng
                                  </a>
                      
                              <!-- button  -->
                                  <a href="vocab/review?listID=<%=request.getAttribute("listID")%>"class="inner-train">Luyện tập</a>
                              
                              <!-- đếm số từ trong db -->
                              <div class="inner-number">
                                  <p>Danh sách có ... từ</p>
                              </div>
                          </div>
                        </div>
                    </div>
                    <%
			int i = 0;
			for (VocabModel v : (LinkedList<VocabModel>) request.getAttribute("vocabModels")) {

					i++;
					%>
                    <div class="col-12">
                        <div class="vocab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inner-wrap">
                                            <div class="inner-main">
                                                <div class="inner-content">
                                                    <h2 class="english-mean"><%=v.getVocab()%> ( <%=v.getWordType()%> )
                                                        <a class="playButton">
                                                            <i class="fa-solid fa-volume-high"></i>
                                                        </a>
                                                    <a class="edit" data-toggle="modal"
                                                    data-target="#edit-vocab<%=i%>">
                                                        <i class="fa-regular fa-pen-to-square"></i>
                                                    </a>
                                                      <div class="modal-edit">
        <!-- Modal sửa -->
<!-- <div class="modal fade modal-form" id="exampleModal<%=i%>" -->
            <div class="modal fade modal-form" id="edit-vocab<%=i%>"

            tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">

                        <h5 class="inner-title" id="exampleModalsua">Sửa từ vựng</h5>
                        <p class="inner-desc"></p>
                        <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post"
                             action="/MVC/vocab-lists/vocab/edit?listID=<%=request.getParameter("listID")%>">
                            <div class="row">
                                <div class="col-12">

                                    <div class="form-group">
                                        <input name="vocabID" type="hidden" class="form-control"
                                             value="<%=v.getVocabID()%>">

                                    </div>

                                    <div class="form-group">
                                        <input name="vocab" type="text" class="form-control"
                                            placeholder="Nghia tieng anh" value="<%=v.getVocab()%>">

                                    </div>
                                    <div class="form-group">
                                        <input name="mean" type="text" class="form-control"
                                            placeholder="Nghia tieng viet" value="<%=v.getMean()%>">

                                    </div>

                                    <div class="form-group">
                                        <input name="wordType" type="text" class="form-control"
                                            placeholder="Tu Loai" value="<%=v.getWordType()%>">

                                    </div>

                                    <div class="form-group">
                                        <input name="wordType" type="text" class="form-control"
                                            placeholder="Từ loại" value="<%=v.getWordType()%>">
                                    </div>

                                    <textarea name="example" id="" cols="30" rows="10" value=""><%=v.getExample()%></textarea>

                                    <label >Ảnh mô tả:</label>
                                        <div class="form-group">
                                            <input name="file" type="file" class="form-control"
                                                placeholder="file" value="">
    
                                        </div>

                                    <button class="button">Sửa</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
         </div>
                                                    
                                                    
                                                    <audio class="myAudio" src="https://dict.youdao.com/dictvoice?audio=<%=v.getVocab()%>&type=1" type="audio/mpeg" controls></audio>
                                                    </h2>
                                                    <h3>Định nghĩa:
                                                    </h3>
                                                    <p><%=v.getMean()%></p>
                                                    <div class="inner-ex">
                                                        <h3>Ví dụ</h3>
                                                        <ul>
                                                            <li>
                                                                <p> <%=v.getExample()%></p>
                                                            </li>
                                                            <li>
                                                                <p> <%=v.getExample()%></p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="inner-img">
                                                    <img src="https://e-talk.vn/wp-content/uploads/2019/04/cach-hoc-tu-vung-tieng-anh-sieu-toc-1024x1024.png" alt="Anhmota">
                                                </div>
                                             </div>
                                            <div class="delete">
                                                <form
                                                action="/MVC/vocab-lists/vocab/delete?vocabID=<%=v.getVocabID()%>&listID=<%=request.getParameter("listID")%>"
                                                method="post">
                                                <input class="button-submit" type="submit" value="Xóa" />
                                                <label for="submit">
                                                    <i class="fa-solid fa-trash-can"></i>
                                                </label>
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
                </div>
            </div>
            <div class="col-xl-4">
                <div class="row">
                    <div class="col-12">
                        <div class="inner-sidebar">
                            <p>Dây là sidebar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  
         <div class="modal-insert">
            <!-- Modal thêm -->
    <!-- <div class="modal fade modal-form" id="exampleModal<%=i%>" -->
                <div class="modal fade modal-form" id="insert-vocab"
    
                tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
    
                            <h5 class="inner-title" id="exampleModalLabel">Thêm từ vựng</h5>
                            <p class="inner-desc"></p>
                            <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post"
                                action="/MVC/vocab-lists/vocab/create?listID=<%=request.getParameter("listID")%>">
                                <div class="row">
                                    <div class="col-12">
    
                                        <div class="form-group">
                                            <input name="vocabID" type="hidden" class="form-control"
                                                 value="">
    
                                        </div>
    
                                        <div class="form-group">
                                            <input name="vocab" type="text" class="form-control"
                                                placeholder="Nghĩa tiếng anh" value="">
    
                                        </div>
                                        <div class="form-group">
                                            <input name="mean" type="text" class="form-control"
                                                placeholder="Nghĩa tiếng việt" value="">
    
                                        </div>
    
                                        <div class="form-group">
                                            <input name="wordType" type="text" class="form-control"
                                                placeholder="Từ loại" value="">
                                        </div>

                                        <div class="form-group">
                                            <input name="phien-am" type="text" class="form-control"
                                                placeholder="Phiên âm" value="">
    
                                        </div>

    
                                        <textarea name="example" id="" cols="30" rows="10" value=""></textarea>

                                        <label >Ảnh mô tả:</label>
                                        <div class="form-group">
                                            <input name="file" type="file" class="form-control"
                                                placeholder="file" value="">
    
                                        </div>
    
                                        <button class="button">Thêm</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                </div>
             </div>

        <!-- <footer> -->
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3">
                            <div class="inner-intro">
                                <div class="inner-img">
                                    <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F" alt="logo">
                                </div>
                                <p class="inner-desc">
                                    © 2024
                                </p>
                            <div class="inner-list">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="fa-brands fa-facebook-f"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa-brands fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa-brands fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="inner-box">
                                <h3 class=".inner-title">
                                    Về StudyTOEIC
                                </h3>
                                <a href="#">Về chúng tôi</a>
                                <a href="#">Điều khoản dịch vụ</a>
                                <a href="#">Chính sách bảo mật</a>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="inner-box">
                                <h3 class=".inner-title">
                                    Thông tin StudyTOEIC
                                </h3>
                                <a href="#">Danh sách khóa học</a>
                                <a href="tests">Danh sách đề thi</a>
                                <a href="#">Hướng dẫn thanh toán</a>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="inner-box">
                                <h3 class=".inner-title">
                                    Hỗ trợ
                                </h3>
                                <a href="#">Hướng dẫn sử dụng khóa học</a>
                                <a href="#">Câu hỏi thường gặp</a>
                                <a href="#">Liên hệ</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-footer">
                    <p>@ 2024 - Bản quyền thuộc về nhóm 68</p>
                </div>
            </footer>
            <!-- end footer -->

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
    <script>

    var audioElements = document.querySelectorAll(".myAudio");
    var playButtons = document.querySelectorAll(".playButton");

    // Duyệt qua mỗi cặp phần tử audio và nút
    playButtons.forEach(function(playButton, index) {
        var audio = audioElements[index];

        // Thêm sự kiện click cho mỗi nút
        playButton.addEventListener("click", function() {
            if (audio.paused) {
                audio.play(); // Nếu đang tạm dừng, tiếp tục phát
            } else {
                audio.pause(); // Nếu đang phát, tạm dừng
            }
        });
    });

        $(document).ready(function(){
            $(window).scroll(function(){
                if($(this).scrollTop()){
                    $('header').addClass('hidentop');
                }
                else
                $('header').removeClass('hidentop');
            });
        });
    </script>
  </body>
</html>