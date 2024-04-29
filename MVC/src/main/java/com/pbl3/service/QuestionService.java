package com.pbl3.service;

import com.pbl3.model.QuestionModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;


public class QuestionService extends BaseService{
	// add question
	public static int add(QuestionModel questionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Question (TypeQuestionID, TestID, AnswerCorrect, AnswerExplain, OrderNumber, Image, DataQuestionID) VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
	        preparedStatement.setInt(1, questionModel.getTypeQuestionID());
	        preparedStatement.setInt(2, questionModel.getTestID());
	        preparedStatement.setString(3, questionModel.getAnswerCorrect());
	        preparedStatement.setString(4, questionModel.getAnswerExplain());
	        preparedStatement.setInt(5, questionModel.getOrderNumber());
	        preparedStatement.setString(6, questionModel.getImage());
	        if (questionModel.getDataQuestionID() == null) {
	        	preparedStatement.setObject(7, questionModel.getDataQuestionID());
	        } 
	        else {
	        	preparedStatement.setInt(7, questionModel.getDataQuestionID());  
	        }  
	        preparedStatement.executeUpdate();
	        ResultSet rs = preparedStatement.getGeneratedKeys();
			int questionID = 0;
			if (rs.next()) {
				questionID = rs.getInt(1);
			}
			return questionID;
	    } catch (SQLException e) { 
	        e.printStackTrace();
	    }
	    return 0;
	}
	
	// edit question
	public static void edit(QuestionModel questionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE question SET TypeQuestionID = ?, AnswerCorrect = ?, AnswerExplain = ?, OrderNumber = ?, Image = ? WHERE QuestionID = ?");

	        preparedStatement.setInt(1, questionModel.getTypeQuestionID()); 
	        preparedStatement.setString(2, questionModel.getAnswerCorrect());
	        preparedStatement.setString(3, questionModel.getAnswerExplain());
	        preparedStatement.setInt(4, questionModel.getOrderNumber());
	        preparedStatement.setString(5, questionModel.getImage());
	        preparedStatement.setInt(6, questionModel.getQuestionID()); 
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
