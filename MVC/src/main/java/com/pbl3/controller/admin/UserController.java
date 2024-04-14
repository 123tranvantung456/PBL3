package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.MD5;
import com.pbl3.model.AccountModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.AccountService;
import com.pbl3.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/users", "/admin/users/create", "/admin/users/edit"})
public class UserController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet UserController - admin");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: "+actionString);
		switch (actionString) {
		case "/admin/users": {
			System.out.println("goi doget /admin/users");
			show(req, resp);
			break;
		}
		case "/admin/users/create" : {
			System.out.println("goi doget /admin/users/create");
			create(req, resp);
			break;
		}
		
		case "/admin/users/edit" : {
			System.out.println("goi doget /admin/users/edit");
			edit(req, resp);
			break;
		} 
		}
	}
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users/users.jsp");
		String keyword = req.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		int page = 1;
		if (req.getParameter("page") != null && req.getParameter("page") != "") {
			page = Integer.parseInt(req.getParameter("page"));
		}
		int limit = 3;
		LinkedList<UserModel> userModels = UserService.all(keyword, limit, page);
		int totalRecord = UserService.count();
		int totalPage = (int)Math.ceil(1.0 * totalRecord/limit);
		System.out.println("totalRecord: " +totalRecord);
		System.out.println("totalPage: " +totalPage);
		req.setAttribute("totalPage", totalPage);  
		req.setAttribute("userModels", userModels);
		requestDispatcher.forward(req, resp); 
	}
	
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham create");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users/create-users.jsp");
		requestDispatcher.forward(req, resp); 
	}
	
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham edit");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users/edit-users.jsp");
		int userID = Integer.parseInt(req.getParameter("userID"));
		UserModel userModel = UserService.find(userID); 
		req.setAttribute("userModel", userModel);
		requestDispatcher.forward(req, resp); 
	}
	
	protected void createSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham createSubmit");
		String userName = req.getParameter("username");
		String password = MD5.getMD5(req.getParameter("password"));
		int roleID = Integer.parseInt(req.getParameter("roleID"));
		AccountModel accountModel = new AccountModel(roleID, userName, password);
		int accountID = AccountService.add(accountModel);
		System.out.println("acc vua them co accountID: " + accountID);
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		Boolean gender;
		if(req.getParameter("gender") != null) gender = Boolean.parseBoolean(req.getParameter("gender"));
		else {
			gender = null;
		}
		UserModel userModel = new UserModel(accountID, name, phone, email, gender);
		UserService.add(userModel);
		resp.sendRedirect(req.getContextPath() + "/admin/users");
	}
	
	protected void editSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham editSubmit");
		int userID = Integer.parseInt(req.getParameter("userID"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		Boolean gender;
		if(req.getParameter("gender") != null) 
			gender = Boolean.parseBoolean(req.getParameter("gender"));
		else {
			gender = null;
		}
		UserModel userModel = new UserModel(userID, 0, name, phone, email, gender);
		UserService.update(userModel); 
		resp.sendRedirect(req.getContextPath() + "/admin/users");
	}
	
	protected void deleteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham deleteSubmit");
		int accountID = Integer.parseInt(req.getParameter("accountID")); 
		AccountService.delete(accountID); 
		doGet(req, resp);
	} 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost UserController - admin");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: "+actionString);
		switch (actionString) {
		case "/admin/users/create" : {
			System.out.println("goi doget /admin/users/create");
			createSubmit(req, resp);
			break;
		}
		
		case "/admin/users/edit" : {
			System.out.println("goi doget /admin/users/edit");
			editSubmit(req, resp);
			break;
		} 
		
		case "/admin/users" : {
			System.out.println("goi doget /admin/users/delete");
			deleteSubmit(req, resp);
			break;
		}
		}
	}
}