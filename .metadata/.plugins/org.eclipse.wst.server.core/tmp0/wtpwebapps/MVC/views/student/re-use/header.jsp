<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.pbl3.model.UserModel"%>
 <header class="header">
    <div class="top-header">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-contact">
                    <ul>
                        <li>
                            <span>Following Us On:</span>
                        </li>
                        <li>
                            <a href="https://www.facebook.com/Anhvubro/" target="_blank" >
                                <i class="fa-brands fa-facebook-f" target="_blank"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" >
                                <i class="fa-brands fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <i class="fa-brands fa-instagram"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="inner-button">
                    <a href="#">Create an Account</a>
                                      <% //lấy session
          UserModel userModel = (UserModel) session.getAttribute("user");
          // nếu session = null thì chưa đăng nhập nên dùng button đăng nhập
          if (userModel == null) {%>
                    <a href="/MVC/login" class=" button button-one">Log In</a>
                    <% }
         // ngược lại là khác sesstion khác null : đã đăng nhập nên dùng button trang cá nhân 		
          else {%>
                    <a href="/MVC/logout" class=" button button-one">Log Out</a>
                <%} %>
                </div>
            </div>
        </div>
    </div>
    <div class="main-header"> 
        <div class="container">
            <div class="inner-main">
                <div class="inner-logo">
                    <a href="/MVC/">
                        <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F" alt="logo">
                    </a>
                </div>
                <div class="inner-menu">
                    <ul>
                        <li> 
                            <a href="/MVC/" class="trang-chu">
                                Trang Chủ
                            </a>
                        </li>
                        <li> 
                            <a href="/MVC/courses" class="khoa-hoc"> 
                                Khóa Học  
                            </a>
                        </li>
                        <li> 
                            <a href="/MVC/tests" class="de-thi">
                                Đề Thi
                            </a>
                        </li>
                        <li> 
                            <a href="/MVC/vocab-lists" class="tu-vung">
                                Từ Vựng
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="inner-user">
                    <a href="/MVC/my-account">
                        <div class="inner-img">
                        	<img src="https://scontent.fdad3-1.fna.fbcdn.net/v/t1.15752-9/438271424_363628142750726_982160961036786015_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHkYs5D6zVd2CobOzv17Q-CghzjkuK_nIiCHOOS4r-ciPpq3LA3YzM8SDgsA1cd9eiwpRC36kSmzjm0TzN1lUsC&_nc_ohc=poSTrCaVAV0Ab7PCeUg&_nc_ht=scontent.fdad3-1.fna&oh=03_Q7cD1QEqPf93u7Qm4giDR7jfyN0LaJfqodwt601AMFz9Bqc6hA&oe=664ED094"  alt="avatar">   
                        </div> 
                    </a> 
                </div>    
            </div>
        </div>
    </div>
</header>