<%@page import="com.pbl3.model.UserModel"%>
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
    <style type="text/css">
    <%@include file="../../assets/css/base.css" %>
    <%@include file="../../assets/css/style.css" %>
    </style>
    <style>
      .header .inner-main ul .trang-chu {
        color: var(--color-one);
      }
    </style>
  </head>
  <body>
    <%@include file="re-use/header.jsp" %>

    <div class="welcome">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="inner-main">
              <h5 class="inner-welcome">Học Ngay Từ Hôm Nay</h5>
              <h1 class="inner-title">Khóa Học Và Luyện Đề TOEIC Hàng Đầu</h1>
              <p class="inner-desc">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vel reprehenderit molestiae perspiciatis asperiores. Qui assumenda nostrum ipsa quos ad excepturi alias, molestias fuga odit, repellendus laudantium eum consequuntur, quo velit!</p>
              <div class="inner-button">
                <div class="button-two button-1">
                  <a href="/MVC/courses" class="button1">Khóa Học</a>
                </div>
                <div class="button-two button-2">
                  <a href="/MVC/tests" class="button2">Đề Thi</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	    <div class="about-us">
        <div class="container">
            <div class="row">
                <div class="col-xl-6">
                    <div class="inner-content">
                        <div class="inner-tag">Về StudyTOEIC</div>
                        <div class="inner-title">Chào Mừng Đến Với StudyTOEIC</div>
                        <div class="inner-desc">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore fugit, sit quis possimus nesciunt molestiae animi commodi molestias odio fuga, aperiam ex ullam repellat impedit, accusamus distinctio repellendus. Soluta, fugit!</div>
                        <div class="inner-tick">
                            <ul>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Đội ngũ giảng viên giàu kinh nghiệm</span>
                                </li>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Bài giảng hiệu quả đa dạng</span>
                                </li>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Cập nhập những đề thi mới nhất</span>
                                </li>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Kho từ vựng phong phú</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="inner-img">
                        <img src="https://demo.graygrids.com/themes/edugrids/assets/images/about/about-img2.png" alt="img1">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="courses">
        <div class="container">
            <div class="row">
                <div class="col-12 text-a">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-graduation-cap"></i>
                        </div>
                        <h1 class="inner-title">
                            Các Khóa Học Nổi Bật
                        </h1>
                        <div class="inner-bar"> </div>
                        <p class="inner-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse cumque velit natus, tenetur earum quidem temporibus quibusdam dolore quo eos tempore delectus molestiae rerum magni repellat similique deserunt officiis sapiente?</p>
                    </div>
                </div>
                <div class="col-xl-4">
                    <a href="#">
                        <div class="inner-main">
                            <div class="inner-img">
                                <img src="https://demo.graygrids.com/themes/edugrids/assets/images/courses/courses-1.jpg" alt="picCourses">
                            </div>
                            <h2 class="inner-title">Tên Khóa Học</h2>
                            <p class="inner-desc">Mô tả khóa học</p>
                            <div class="inner-quality">
                                <p class="quality">Số lượng học viên</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xl-4">
                    <a href="#">
                        <div class="inner-main">
                            <div class="inner-img">
                                <img src="https://demo.graygrids.com/themes/edugrids/assets/images/courses/courses-1.jpg" alt="picCourses">
                            </div>
                            <h2 class="inner-title">Tên Khóa Học</h2>
                            <p class="inner-desc">Mô tả khóa học</p>
                            <div class="inner-quality">
                                <p class="quality">Số lượng học viên</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xl-4">
                    <a href="#">
                        <div class="inner-main">
                            <div class="inner-img">
                                <img src="https://demo.graygrids.com/themes/edugrids/assets/images/courses/courses-1.jpg" alt="picCourses">
                            </div>
                            <h2 class="inner-title">Tên Khóa Học</h2>
                            <p class="inner-desc">Mô tả khóa học</p>
                            <div class="inner-quality">
                                <p class="quality">Số lượng học viên</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
      <div class="teacher">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-ranking-star"></i>
                        </div>
                        <h1 class="inner-title">
                            Giảng Viên Giàu Kinh Nghiệm
                        </h1>
                        <div class="inner-bar"> </div>
                        <p class="inner-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse cumque velit natus, tenetur earum quidem temporibus quibusdam dolore quo eos tempore delectus molestiae rerum magni repellat similique deserunt officiis sapiente?</p>
                    </div>
                </div>
                <%for (int i = 0; i < 4; i++){ %>
                <div class="col-xl-6">
                    <div class="inner-info">
                        <div class="inner-img">
                            <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/285153159_1427683054412741_8625096137060604296_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFFa7bVIyZtIoTz15-aKR3jZuPSz15-RlRm49LPXn5GVD97JmHx3uPnuk49fTva3jYwcmhPrtw-weMZVJ1xb_lo&_nc_ohc=pKdEh3BotUQAb42Em9_&_nc_ht=scontent.fdad2-1.fna&oh=00_AfCvMKNTHBEhlbBDFh-HyqN4r6HqK3rybNjkM2zy-XboBw&oe=66298C69" alt="eimi fukada">
                        </div>
                        <div class="inner-main">
                            <div class="inner-name">Trần Văn Tùng</div>
                            <div class="inner-desc">Top 1 giáo viên Việt Nam: Toiec 990, IELTS 9.0 và nhiều thành tích khác.</div>
                            <div class="inner-email">
                                <i class="fa-regular fa-envelope"></i>
                                <span>tranvantung.@gmail.com</span>
                            </div>
                        </div> 
                    </div>
                </div>
				<%} %>
            </div>
        </div>
    </div>

    <div class="utility">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>
                        <h1 class="inner-title">
                            Tại Sao Bạn Nên Học Với StudyTOEIC
                        </h1>
                        <div class="inner-bar"> </div>
                       
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-box">
                        <div class="inner-img">
                            <img src="https://www.ngoaingu24h.vn/resources/images/Icon-NN24H/icon1.png" alt="">
                        </div>
                        <p class="inner-desc">
                            Học từ vựng hiệu quả với Flash card độc quyền.
                        </p>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-box">
                        <div class="inner-img">
                            <img src="https://www.ngoaingu24h.vn/resources/images/Icon-NN24H/icon2.png" alt="">
                        </div>
                        <p class="inner-desc">
                            Luôn được hỗ trợ nhanh nhất bởi đội ngũ chuyên môn giỏi, nhiệt tình.
                        </p>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-box">
                        <div class="inner-img">
                            <img src="https://www.ngoaingu24h.vn/resources/images/Icon-NN24H/icon4.png" alt="">
                        </div>
                        <p class="inner-desc">
                            Nội dung khóa học luôn được cập nhật theo xu hướng ra đề.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Remainder of your HTML content -->

     <%@include file="re-use/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function(){
        $(window).scroll(function(){
          if($(this).scrollTop()){
            $('header').addClass('hidentop');
          } else {
            $('header').removeClass('hidentop');
          }
        });
      });
    </script>
  </body>
</html>
