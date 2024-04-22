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
		// lay part anh ve 
		Part part = req.getPart("image"); 
		String image = null;
		// neu co form-group img (kh phai part 2, 5) 
		if (part != null) { 
		System.out.println("part != null");
		String realPart = req.getServletContext().getRealPath("/data");
		image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len  
 		} 
		System.out.println("image: " +image); 
		
		// lay part audio ve 
		Part partAudio = req.getPart("audio"); 
		String audio = null;
		// neu co form-group audio (kh phai phan doc) 
		if (partAudio != null) { 
		System.out.println("partAudio != null");
		String realPart = req.getServletContext().getRealPath("/data");
		audio = FileData.add(partAudio, realPart); // tra ve null neu co form-group audio nhung ko tai len  
 		} 
		System.out.println("audio: " +audio); 
		
		QuestionModel questionModel = new QuestionModel(typeQuestionID, testsID, questionContent, contentAnswerA,
				contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, image, audio);
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
		
		String imageString = null;
		// lay duong dan anh can sua ve
		Part partImageChange = req.getPart("image");
		System.out.println("partImageChange: " +partImageChange);
		if (partImageChange != null) {
		// xóa ảnh củ đi cu ơi ....
	
		// thêm ảnh mới vào 
		String realPartImageChange = req.getServletContext().getRealPath("/data"); 
		imageString = FileData.add(partImageChange, realPartImageChange); 
		}
		// neu ma ko sua anh thi lay lai duong dan cu
		if (imageString == null) {
			imageString = req.getParameter("imageString"); 
		}
		
		String audioString = null;
		// lay duong dan audio can sua ve
		Part partAudioChange = req.getPart("audio");
		System.out.println("partAudioChange: " +partAudioChange);
		if(partAudioChange != null) {
		// xóa audio củ đi cu ơi ....
	
		// thêm audio mới vào 
		String realPartAudioChange = req.getServletContext().getRealPath("/data"); 
		audioString = FileData.add(partAudioChange, realPartAudioChange); // tra ve null neu ko sua
		}    
		// neu ma ko sua audio thi lay lai duong dan cu
		if (audioString == null) {
			audioString = req.getParameter("audioString"); 
		} 
		
		QuestionModel questionModel = new QuestionModel(questionID, typeQuestionID, testsID, questionContent, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, imageString, audioString);
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
