package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pbl3.model.DataQuestionModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TypeOneQuestionModel;
import com.pbl3.model.TypeQuestionModel;
import com.pbl3.model.TypeTwoQuestionModel;

public class TypeTwoQuestionService extends BaseService{
	// query all question type one and type question in 1 test  
	public static void allTypeTwoQuestion(int testID, QuestionModel[] questionModels) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT question.*, TypeQuestion.TypeQuestionName, typetwoquestion.ContentAnswerA, typetwoquestion.ContentAnswerB, typetwoquestion.ContentAnswerC, typetwoquestion.ContentAnswerD, typetwoquestion.QuestionContent, dataquestion.DataQuestion, dataquestion.Transcript, dataquestion.OrderNumberPart, dataquestion.OrderNumber FROM typequestion INNER JOIN  question ON typequestion.typequestionID = question.typequestionID INNER JOIN typetwoquestion ON question.questionID = typetwoquestion.questionID LEFT JOIN dataquestion ON question.DataQuestionID = dataquestion.DataQuestionID WHERE Question.TestID = ?");
	        preparedStatement.setInt(1, testID); 
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int questionID = resultSet.getInt("questionID");
	            Integer typeQuestionID = resultSet.getInt("typeQuestionID");
	            String answerCorrect = resultSet.getString("answerCorrect");
	            String answerExplain = resultSet.getString("answerExplain"); 
	            int orderNumber = resultSet.getInt("orderNumber");
	            String image = resultSet.getString("image");
	            String typeQuestionName = resultSet.getString("typeQuestionName");
	            int dataQuestionID = resultSet.getInt("dataQuestionID");   
	            String contentAnswerA = resultSet.getString("contentAnswerA");
	            String contentAnswerB = resultSet.getString("contentAnswerB");
	            String contentAnswerC = resultSet.getString("contentAnswerC");
	            String contentAnswerD = resultSet.getString("contentAnswerD");
	            String questionContent = resultSet.getString("questionContent");
	            String dataQuestion = resultSet.getString("dataQuestion");
	            String transcript = resultSet.getString("transcript");
	            int orderNumberPart = resultSet.getInt("orderNumberPart");
	            int orderNumberData = resultSet.getInt("orderNumber");
	            TypeQuestionModel typeQuestionModel = new TypeQuestionModel(typeQuestionID, typeQuestionName);
	            DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, dataQuestion, transcript, testID, orderNumberPart, orderNumberData);
	            TypeTwoQuestionModel typeTwoQuestionModel = new TypeTwoQuestionModel (questionID, typeQuestionID, typeQuestionID, answerCorrect, answerExplain, orderNumberData, image, typeQuestionModel, dataQuestionID, dataQuestionModel, contentAnswerA, contentAnswerB, contentAnswerC, contentAnswerD, questionContent);
	            questionModels[typeTwoQuestionModel.getOrderNumber() - 1] = typeTwoQuestionModel;
	            
	        }   
	        System.out.println(".................... "+questionModels[100].getOrderNumber());  
	        System.out.println("size cua typeOneQuestionModels: " + questionModels.length);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// add type two question  
	public static void add(TypeTwoQuestionModel typeTwoQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO TypeTwoQuestion (QuestionID, ContentAnswerA, ContentAnswerB, ContentAnswerC, ContentAnswerD, QuestionContent) VALUES (?, ?, ?, ?, ?, ?)"); 
	        preparedStatement.setInt(1, typeTwoQuestionModel.getQuestionID());  
	        preparedStatement.setString(2, typeTwoQuestionModel.getContentAnswerA()); 
	        preparedStatement.setString(3, typeTwoQuestionModel.getContentAnswerB()); 
	        preparedStatement.setString(4, typeTwoQuestionModel.getContentAnswerC());
	        preparedStatement.setString(5, typeTwoQuestionModel.getContentAnswerD());  
	        preparedStatement.setString(6, typeTwoQuestionModel.getQuestionContent());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {   
	        e.printStackTrace();  
	    }        
	}

	     
//	 edit type two question 
	public static void edit(TypeTwoQuestionModel typeTwoQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE TypeTwoQuestion SET ContentAnswerA = ?, ContentAnswerB = ?, ContentAnswerC = ?, ContentAnswerD = ?, QuestionContent = ? WHERE QuestionID = ?");
	        preparedStatement.setString(1, typeTwoQuestionModel.getContentAnswerA());   
	        preparedStatement.setString(2, typeTwoQuestionModel.getContentAnswerB());
	        preparedStatement.setString(3, typeTwoQuestionModel.getContentAnswerC());
	        preparedStatement.setString(4, typeTwoQuestionModel.getContentAnswerD());
	        preparedStatement.setString(5, typeTwoQuestionModel.getQuestionContent());
	        preparedStatement.setInt(6, typeTwoQuestionModel.getQuestionID());
	        preparedStatement.executeUpdate();   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}
