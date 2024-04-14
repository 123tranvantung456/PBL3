package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.model.UserModel;
import com.pbl3.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/users", "/admin/users/create", "/admin/users/edit", "/admin/users/delete" })
public class UserController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet UserController - admin");
		String actionString = req.getServletPath();
		switch (actionString) {
		case "/admin/users": {
			System.out.println("goi doget /admin/users");
			show(req, resp);
			break;
		}
		
		case "/admin/users/create" : {
			
		}
		
		case "/admin/users/edit" : {
			
		}
		
		case "/admin/users/delete" : {
			
		}
		
		}
	}
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users.jsp");
		LinkedList<UserModel> userModels = UserService.all();
		req.setAttribute("userModels", userModels);
		requestDispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}