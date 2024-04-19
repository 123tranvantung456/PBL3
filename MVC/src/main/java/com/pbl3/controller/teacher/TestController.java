package com.pbl3.controller.teacher;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.QuestionService;
import com.pbl3.service.TestsService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/teacher/tests", "/teacher/tests/create", "/teacher/tests/edit", "/teacher/tests/delete" }) 
public class TestController extends HttpServlet{ 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do get la: " + actionString);
		switch (actionString) {
		case "/teacher/tests": {
			System.out.println("goi case /tests - dogest");
			show(req, resp);
			break; 
		}
		
		}
	}
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int teacherID = userModel.getUserID();   
		LinkedList<TestsModel> testsModels = TestsService.all(teacherID);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/tests/tests.jsp");
		req.setAttribute("testsModels", testsModels);
		requestDispatcher.forward(req, resp);
	}
	
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham create");  
		
	}
	
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham edit");
		
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("Gọi hàm delete");
	  
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do post la: " + actionString);
		switch (actionString) {
		case "/teacher/tests/create": {
			System.out.println("goi case /teacher/tests/create - do post");
			create(req, resp);
			break;
		}
		case "/teacher/tests/edit": {
			System.out.println("goi case /teacher/tests/edit - post");
			edit(req, resp);
			break;
		}
		case "/teacher/tests/delete": {
			System.out.println("goi case /teacher/question/delete - post");
			delete(req, resp);
			break;
		}
		}
	}
}  
