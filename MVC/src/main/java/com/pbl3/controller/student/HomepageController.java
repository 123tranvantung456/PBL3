package com.pbl3.controller.student;
import java.io.IOException;

import javax.swing.text.StringContent;

import com.pbl3.libs.*;
import com.pbl3.model.RoleModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.UserService;
import com.pbl3.util.Email;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/" ,"/register", "/login", "/logout" , "/forgot-password", "/reset-password"})
public class HomepageController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet HomepageController user");
		HttpSession session = req.getSession();
		String actionString = req.getServletPath(); // lấy ở phần sau
		switch (actionString) {

		case "/register": {
			System.out.println("goi doget register");
			register(req, resp);
			break;
		}

		case "/login": {
//			if();
			if (session.getAttribute("user") != null) {
					
			}
			System.out.println("goi doget login"); 
			login(req, resp);
			break;
		}

		case "/logout": {
			System.out.println("goi doget logout");
			logout(req, resp);
			break;
		}

		case "/":{
			if (session.getAttribute("user") == null) {
				System.out.println("chua dang nhap");
			}
			if (session.getAttribute("user") != null) {
				System.out.println("da dang nhap");
			}
			System.out.println("vao trang chu");
			System.out.println(actionString);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/homepage.jsp");
			requestDispatcher.forward(req, resp);
			break;
		}
		case "/reset-password": {
			System.out.println("goi doget logout");
			resetPassword(req, resp);
			break;
		}
		
		case "/forgot-password": {
			System.out.println("goi doget logout");
			forgotPassword(req, resp);
			break;
		}
		}
	}
	//
	public void forgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi forgotPassword");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/forgot-password.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	public void resetPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi forgotPassword");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/reset-password.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	public void submitForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi submitForgotPassword");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/reset-password.jsp");
		String email = req.getParameter("email");
		// check xem email co hop le khong ....
		String password = Coupon.createCode();
		String passwordString = MD5.getMD5(password);
		if(UserService.editPassword(passwordString, email) == 0) {
			forgotPassword(req, resp);
		}
		//
		String Content = "Mật khẩu mới của bạn là: " + password + ", bạn có thể đăng nhập bằng mật khẩu này, sau đó vào trang cá nhân và đổi mật khẩu!";
		Email.sendEmail(email, "MẬT KHẨU MỚI", Content);
		requestDispatcher.forward(req, resp);
	}
	
	// chuyen den form dang ki 
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi register");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/register.jsp");
		requestDispatcher.forward(req, resp);
	}

	// an nut dang ki
	public void submitRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int roleID = 3;   
		String userName = req.getParameter("name");
		String password = MD5.getMD5(req.getParameter("password"));
		String email = req.getParameter("email"); 
		RoleModel roleModel = new RoleModel(roleID, "");
		UserModel userModel = new UserModel(email, userName, password, roleModel);
		UserService.add(userModel);
		resp.sendRedirect(req.getContextPath() + "/login"); // getContextPath()
	}

	// chuyen den form dang nhap
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/login.jsp");
		requestDispatcher.forward(req, resp);
	}

	// duoc goi khi an dang nhap
	public void submitLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String emailString = req.getParameter("email");
		String hashedPasswoString = MD5.getMD5(req.getParameter("password"));
		UserModel userModel = UserService.login(emailString, hashedPasswoString);
		// ko dang nhap thanh cong
		if (userModel.getUserID() == 0) {
			login(req, resp);
		} 
		// NEU DANG NHAP THANH CONG
		else {
			// set session
			System.out.println("user da dang nhap co UserID: " + userModel.getUserID());
			HttpSession session = req.getSession();
			session.setAttribute("user", userModel);
			// 
			// chuyen huonng ve trang chu tuy vao role : day la authen
			System.out.println("role nguoi vua login la: " +userModel.getRoleModel().getRoleName());
			if ((userModel.getRoleModel().getRoleName()).equals("Quản Trị Viên")) {
				resp.sendRedirect(req.getContextPath() + "/admin"); 
			}
			else if ((userModel.getRoleModel().getRoleName()).equals("Giáo Viên")) {
				resp.sendRedirect(req.getContextPath() + "/teacher"); 
			}
			else  resp.sendRedirect(req.getContextPath() + "/"); // getContextPath() lấy đường dẫn cơ bản
		}
	}

	// dang xuat
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		resp.sendRedirect(req.getContextPath() + "/");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost HomepageController user");
		String actionString = req.getServletPath();
		switch (actionString) {
		case "/register": {
			System.out.println("GOI DO POST register");
			submitRegister(req, resp);
			break;
		}
		case "/login": {
			System.out.println("GOI DO POST login");
			submitLogin(req, resp);
			break;
		}
		case "/forgot-password": {
			System.out.println("goi doget logout");
			submitForgotPassword(req, resp);
			break;
		}
		default:
			System.out.println(actionString);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/homepage.jsp");
			requestDispatcher.forward(req, resp);
		}
	}

}
