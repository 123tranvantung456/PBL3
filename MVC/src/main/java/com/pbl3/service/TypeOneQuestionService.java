package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.pbl3.model.DataQuestionModel;
import com.pbl3.model.PartModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.TypeOneQuestionModel;
import com.pbl3.model.TypeQuestionModel;
import com.pbl3.model.VocabListsModel;
import jakarta.servlet.http.Part;

public class TypeOneQuestionService extends BaseService{
	
	// query all question type one and type question in 1 test  
	public static void allTypeOneQuestion(int testID, QuestionModel[] questionModels) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT Question.*, TypeQuestion.TypeQuestionName, TypeOneQuestion.Audio, TypeOneQuestion.Transcript FROM TypeQuestion INNER JOIN Question ON TypeQuestion.TypeQuestionID = Question.TypeQuestionID INNER JOIN TypeOneQuestion ON Question.QuestionID = TypeOneQuestion.questionID WHERE Question.TestID = ?");
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
	            System.out.println(typeQuestionName);
	            String audio = resultSet.getString("audio"); 
	            String transcript = resultSet.getString("transcript");
	            Integer dataQuestionID = resultSet.getInt("DataQuestionID");
	            TypeQuestionModel typeQuestionModel = new TypeQuestionModel(typeQuestionID, typeQuestionName);
//	            String dataQuestion = resultSet.getString("dataQuestion");
//	            int orderNumberPart = resultSet.getInt("orderNumberPart");
//	            int orderNumberData = resultSet.getInt("orderNumber");
//	            DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, dataQuestion, transcript, testID, orderNumberPart, orderNumberData);
	            TypeOneQuestionModel typeOneQuestionModel = new TypeOneQuestionModel(questionID, typeQuestionID, 0, answerCorrect, answerExplain, orderNumber, image, typeQuestionModel, dataQuestionID, null, audio, transcript) ;
	            //Gán QuestionModel vào mảng 
	            questionModels[typeOneQuestionModel.getOrderNumber() - 1] = typeOneQuestionModel;
	        } 
	        System.out.println("size cua typeOneQuestionModels: " + questionModels.length);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// add type one question
	public static void add(TypeOneQuestionModel typeOneQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO TypeOneQuestion (QuestionID, Audio, Transcript) VALUES (?, ?, ?)"); 
	        preparedStatement.setInt(1, typeOneQuestionModel.getQuestionID());
	        preparedStatement.setString(2, typeOneQuestionModel.getAudio());
	        preparedStatement.setString(3, typeOneQuestionModel.getTranscript());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {  
	        e.printStackTrace();
	    }
	}
	
	// edit type one question
	
	public static void edit(TypeOneQuestionModel typeOneQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE TypeOneQuestion SET Audio = ?, Transcript = ? WHERE QuestionID = ?");
	        preparedStatement.setString(1, typeOneQuestionModel.getAudio()); 
	        preparedStatement.setString(2, typeOneQuestionModel.getTranscript()); 
	        preparedStatement.setInt(3, typeOneQuestionModel.getQuestionID());
	        preparedStatement.executeUpdate();   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}