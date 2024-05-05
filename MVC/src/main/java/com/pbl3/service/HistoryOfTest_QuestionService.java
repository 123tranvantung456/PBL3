package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import com.pbl3.model.HistoryOfTest_QuestionModel;

public class HistoryOfTest_QuestionService extends BaseService{
	// add
	public static void add(HistoryOfTest_QuestionModel historyOfTest_QuestionModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO historyoftest_question (historyOfTestID, questionID, answer) VALUES (?, ?, ?)");
			preparedStatement.setInt(1, historyOfTest_QuestionModel.getHistoryOfTestID());
			preparedStatement.setInt(2, historyOfTest_QuestionModel.getQuestionID());
			preparedStatement.setString(3, historyOfTest_QuestionModel.getAnswer());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//query all question 
	public static void all(int historyOfTestID, HistoryOfTest_QuestionModel[] historyOfTest_QuestionModels) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM historyoftest_question WHERE historyOfTestID = ?;");
			preparedStatement.setInt(1, historyOfTestID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				System.out.println("vao while");
				int historyOftestID = resultSet.getInt(1);
				int questionID = resultSet.getInt(2);
				String answer = resultSet.getString(3);
				HistoryOfTest_QuestionModel historyOfTest_QuestionModel = new HistoryOfTest_QuestionModel(historyOftestID, questionID, answer); 
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}