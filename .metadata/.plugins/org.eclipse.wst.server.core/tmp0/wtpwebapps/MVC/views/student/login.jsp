<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <body>
    <style>
  		<%@include file ="../../assets/css/base.css"%>
 	    <%@include file = "../../assets/css/style.css"%>
	</style>
 <%@include file="re-use/header.jsp" %>
  <!-- section-login -->
  <div class="section-login">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="form-login">
            <h4 class="title">Đăng Nhập</h4>  
            <form method="post">
              <div class="form-group">
                <label for="exampleFullName1">Tên Đăng Nhập</label>
                <input name="email" type="text" class="form-control" id="exampleFullName1" aria-describedby="emailHelp">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Mật Khẩu</label>
                <input name="password" type="password" class="form-control" id="exampleInputPassword1">
              </div>
              <button class="button-main button-main-two button-login">Đăng Nhập</button>
              <p class="outer-link">Chưa có tài khoản? 
              <a href="register">Đăng kí</a>
            </p> 
            </form>    
          </div>  
        </div>
      </div>
    </div>
  </div>
  <!-- end section-login -->
  <%@include file="re-use/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
  </script>
</body>

</html>