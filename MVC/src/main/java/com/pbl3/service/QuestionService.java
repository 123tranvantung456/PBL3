package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.pbl3.model.PartModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.TypeQuestionModel;
import com.pbl3.model.VocabListsModel;

public class QuestionService extends BaseService{
	// query all question in 1 test
	public static LinkedList<QuestionModel> all(int testID) {
		LinkedList<QuestionModel> questionModels = new LinkedList<QuestionModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM question WHERE TestID = ? ORDER BY OrderNumber ASC;");
			preparedStatement.setInt(1, testID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int questionID = resultSet.getInt(1);
				Integer typeQuestionID = resultSet.getInt(2);
//				Integer testID;
				String questionContent = resultSet.getString(4);
				String contentAnswerA = resultSet.getString(5);
				String contentAnswerB = resultSet.getString(6);
				String contentAnswerC = resultSet.getString(7);
				String ContentAnswerD = resultSet.getString(8);
				String AnswerCorrect = resultSet.getString(9);
				String AnswerExplain = resultSet.getString(10) ;
				int OrderNumber = resultSet.getInt(11);
				String Image = resultSet.getString(12);
				String audio = resultSet.getString(13);
				QuestionModel questionModel = new QuestionModel(questionID, typeQuestionID, testID, questionContent, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, Image, audio);   
				questionModels.add(questionModel);    
			}
			System.out.println("size cua tests: " + questionModels.size());
			return questionModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questionModels;
	}
	
	// query all question and type question in 1 test  
	public static void allQuestionAndType(int testID, QuestionModel[] questionModels) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT Question.*, TypeQuestion.TypeQuestionName,TypeQuestion.PartID, Part.PartName, Part.OrderNumber  FROM Question INNER JOIN TypeQuestion ON Question.TypeQuestionID = TypeQuestion.TypeQuestionID INNER JOIN Part ON TypeQuestion.PartID = Part.PartID   WHERE Question.TestID = ? ORDER BY Question.OrderNumber ASC");
	        preparedStatement.setInt(1, testID);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int questionID = resultSet.getInt(1);
	            System.out.println("QuestionID: " + questionID);
	            Integer typeQuestionID = resultSet.getInt(2);
	            String questionContent = resultSet.getString(4);
	            String contentAnswerA = resultSet.getString(5);
	            String contentAnswerB = resultSet.getString(6);
	            String contentAnswerC = resultSet.getString(7);
	            String ContentAnswerD = resultSet.getString(8); 
	            String AnswerCorrect = resultSet.getString(9);
	            String AnswerExplain = resultSet.getString(10); 
	            int OrderNumber = resultSet.getInt(11);
	            String image = resultSet.getString(12);
	            String audio = resultSet.getString(13);
	            String typeQuestionName = resultSet.getString(14);
	            int PartID = resultSet.getInt(15);
	            String partName = resultSet.getString(16);
	            int OrderNumberPart = resultSet.getInt(17);
	            PartModel partModel = new PartModel(PartID, partName, OrderNumberPart);
	            TypeQuestionModel typeQuestionModel = new TypeQuestionModel(typeQuestionID, typeQuestionName, PartID, partModel);
	            QuestionModel questionModel = new QuestionModel(questionID, typeQuestionID, testID, questionContent, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, typeQuestionModel, image, audio);

	            // Gán QuestionModel vào mảng 
	            questionModels[questionModel.getOrderNumber() - 1] = questionModel;
	        }

	        System.out.println("size cua questionModels: " + questionModels.length);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// add question
	public static void add(QuestionModel questionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Question (TypeQuestionID, TestID, QuestionContent, ContentAnswerA, ContentAnswerB, ContentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber, Image, Audio) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"); 
	        preparedStatement.setInt(1, questionModel.getTypeQuestionID());
	        preparedStatement.setInt(2, questionModel.getTestID());
	        preparedStatement.setString(3, questionModel.getQuestionContent());
	        preparedStatement.setString(4, questionModel.getContentAnswerA());
	        preparedStatement.setString(5, questionModel.getContentAnswerB());
	        preparedStatement.setString(6, questionModel.getContentAnswerC());
	        preparedStatement.setString(7, questionModel.getContentAnswerD());
	        preparedStatement.setString(8, questionModel.getAnswerCorrect());
	        preparedStatement.setString(9, questionModel.getAnswerExplain());
	        preparedStatement.setInt(10, questionModel.getOrderNumber());
	        preparedStatement.setString(11, questionModel.getImage());
	        preparedStatement.setString(12, questionModel.getAudio());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// edit 
	public static void edit(QuestionModel questionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE question SET TypeQuestionID = ?, QuestionContent = ?, ContentAnswerA = ?, ContentAnswerB = ?, ContentAnswerC = ?, ContentAnswerD = ?, AnswerCorrect = ?, AnswerExplain = ?, Image = ?, Audio = ? WHERE QuestionID = ?");
	        
	        // In ra giá trị của từng trường trong questionModel
	        System.out.println("QuestionID: " + questionModel.getQuestionID());
	        System.out.println("TypeQuestionID: " + questionModel.getTypeQuestionID());
	        System.out.println("QuestionContent: " + questionModel.getQuestionContent());
	        System.out.println("ContentAnswerA: " + questionModel.getContentAnswerA());
	        System.out.println("ContentAnswerB: " + questionModel.getContentAnswerB());
	        System.out.println("ContentAnswerC: " + questionModel.getContentAnswerC());
	        System.out.println("ContentAnswerD: " + questionModel.getContentAnswerD());
	        System.out.println("AnswerCorrect: " + questionModel.getAnswerCorrect());
	        System.out.println("AnswerExplain: " + questionModel.getAnswerExplain());
	        System.out.println("QuestionID: " + questionModel.getQuestionID());
	        System.out.println("image: " + questionModel.getImage());
	        preparedStatement.setInt(1, questionModel.getTypeQuestionID()); 
	        preparedStatement.setString(2, questionModel.getQuestionContent());
	        preparedStatement.setString(3, questionModel.getContentAnswerA());
	        preparedStatement.setString(4, questionModel.getContentAnswerB());
	        preparedStatement.setString(5, questionModel.getContentAnswerC());
	        preparedStatement.setString(6, questionModel.getContentAnswerD());
	        preparedStatement.setString(7, questionModel.getAnswerCorrect());
	        preparedStatement.setString(8, questionModel.getAnswerExplain());
	        preparedStatement.setString(9, questionModel.getImage());
	        preparedStatement.setString(10, questionModel.getAudio());
	        preparedStatement.setInt(11, questionModel.getQuestionID()); 
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// delete
	public static void delete(int questionID) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM question WHERE questionID = ?"); 
	        preparedStatement.setInt(1, questionID);
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}



}