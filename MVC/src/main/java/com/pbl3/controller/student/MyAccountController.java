package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.model.HistoryOfTestModel;
import com.pbl3.model.Register_CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.HistoryOfTestService;
import com.pbl3.service.RegisterCourseService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// co khoa hoc, ket qua luyen thi
@WebServlet (urlPatterns = {"/my-account"})
public class MyAccountController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		req.setAttribute("userModel", userModel);
		LinkedList<Pair<HistoryOfTestModel, String>> historyOfTestModels = HistoryOfTestService.allHistoryOfTest(userID);
		req.setAttribute("historyOfTestModels", historyOfTestModels);
		LinkedList<CourseModel> list = RegisterCourseService.listCourseModels(userModel.getUserID());
		req.setAttribute("listCourseModel", list);
		for (CourseModel courseModel : list) {
			long days=RegisterCourseService.getDayOfCoure(userModel, courseModel);
			req.setAttribute("days"+Integer.toString(courseModel.getCourseID()), days);;
			System.out.println(days);
		}
		RequestDispatcher  requestDispatcher = req.getRequestDispatcher("views/student/my-account.jsp");
		requestDispatcher.forward(req, resp);
	}
} 
