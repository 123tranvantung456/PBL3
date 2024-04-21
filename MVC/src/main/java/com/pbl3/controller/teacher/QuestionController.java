package com.pbl3.controller.teacher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import com.pbl3.libs.FileData;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.PartService;
import com.pbl3.service.QuestionService;
import com.pbl3.service.TestsService;
import com.pbl3.service.TypeQuestionService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet(urlPatterns = { "/teacher/question", "/teacher/question/create", "/teacher/question/edit",
		"/teacher/question/delete" })
public class QuestionController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do get la: " + actionString);
		switch (actionString) {
		case "/teacher/question": {
			System.out.println("goi case /teacher/question - dogest");
			show(req, resp);
			break;
		}
		}
	}

	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println("testsID can truy van cac cau hoi la: " + testsID);

		// Khởi tạo mảng chứa 200 phần tử và đều là null
		QuestionModel[] questionModels = new QuestionModel[200];
		for (int i = 0; i < 200; i++) {
			questionModels[i] = new QuestionModel();
		}

		QuestionService.allQuestionAndType(testsID, questionModels);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/tests/question.jsp");
		int totalPart = PartService.count();
		req.setAttribute("totalPart", totalPart);
		for (int i = 1; i <= totalPart; i++) {
			req.setAttribute("typeQuestionModels" + i, TypeQuestionService.all(i));
		}
		req.setAttribute("questionModels", questionModels);
		requestDispatcher.forward(req, resp);
	}

	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham create");
		Integer typeQuestionID = Integer.parseInt(req.getParameter("typeQuestionID"));
		System.out.println(typeQuestionID);
		Integer testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println(testsID);
		String questionContent = req.getParameter("questionContent");
		System.out.println(questionContent);
		String contentAnswerA = req.getParameter("contentAnswerA");
		System.out.println(contentAnswerA);
		String contentAnswerB = req.getParameter("contentAnswerB");
		String contentAnswerC = req.getParameter("contentAnswerC");
		String ContentAnswerD = req.getParameter("contentAnswerD");
		String AnswerCorrect = req.getParameter("answerCorrect");
		String AnswerExplain = req.getParameter("answerExplain");
		int OrderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		Part part = req.getPart("image"); 
		String image = null;
		if (part != null) { 
		System.out.println("part != null");
		String realPart = req.getServletContext().getRealPath("/data");
		image = FileData.add(part, realPart);
		} 
		System.out.println("image: " +image);  
		QuestionModel questionModel = new QuestionModel(typeQuestionID, testsID, questionContent, contentAnswerA,
				contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, image);
		QuestionService.add(questionModel);
		resp.sendRedirect(req.getContextPath() + "/teacher/question?testsID=" + testsID);
	}

	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham edit");
		Integer questionID = Integer.parseInt(req.getParameter("questionID")); 
		Integer typeQuestionID = Integer.parseInt(req.getParameter("typeQuestionID"));
		Integer testsID = Integer.parseInt(req.getParameter("testsID"));
		String questionContent = req.getParameter("questionContent");
		System.out.println("questionContent" +questionContent);
		String contentAnswerA = req.getParameter("contentAnswerA");
		String contentAnswerB = req.getParameter("contentAnswerB") ;
		String contentAnswerC = req.getParameter("contentAnswerC");
		String ContentAnswerD = req.getParameter("contentAnswerD");
		String AnswerCorrect = req.getParameter("answerCorrect"); 
		String AnswerExplain = req.getParameter("answerExplain");
		int OrderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		String imageString = "";
		Part partImageChange = req.getPart("imageChange");
		System.out.println(partImageChange);
		if (partImageChange != null) {
			// xóa ảnh củ đi cu ơi ....
			
			// thêm ảnh mới vào
			String realPartImageChange = req.getServletContext().getRealPath("/data"); 
			imageString += FileData.add(partImageChange, realPartImageChange); 
		}
		else {
			System.out.println("vao else");
			imageString = req.getParameter("imageString");
		}
		QuestionModel questionModel = new QuestionModel(questionID, typeQuestionID, testsID, questionContent, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, imageString);
		QuestionService.edit(questionModel);   
		resp.sendRedirect(req.getContextPath() + "/teacher/question?testsID=" + testsID); 
	}

	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Gọi hàm delete");
		// xóa ảnh củ đi cu ơi....
		
		int questionID = Integer.parseInt(req.getParameter("questionID"));
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println("questionID cần xóa là: " + req.getParameter("questionID"));
		QuestionService.delete(questionID);
		resp.sendRedirect(req.getContextPath() + "/teacher/question?testsID=" + testsID);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do post la: " + actionString);
		switch (actionString) {
		case "/teacher/question/create": {
			System.out.println("goi case /teacher/question/create - do post");
			create(req, resp);
			break;
		}
		case "/teacher/question/edit": {
			System.out.println("goi case /teacher/question/create - dogest");
			edit(req, resp);
			break;
		}
		case "/teacher/question/delete": {
			System.out.println("goi case /teacher/question/create - dogest");
			delete(req, resp);
			break;
		}
		}
	}
}
