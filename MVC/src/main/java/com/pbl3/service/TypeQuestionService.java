package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.model.TestsModel;
import com.pbl3.model.TypeQuestionModel;

// 
public class TypeQuestionService extends BaseService{
	// query all typeQuestion in 1 part
	public static LinkedList<TypeQuestionModel> all(int ordernumber) {
		LinkedList<TypeQuestionModel> typeQuestionModels = new LinkedList<TypeQuestionModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT typequestion.* FROM typequestion INNER JOIN Part ON typequestion.PartID = part.PartID WHERE part.OrderNumber = ?");
			preparedStatement.setInt(1, ordernumber); 
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int typeQuestionID = resultSet.getInt(1);   
				String typeQuestionName = resultSet.getString(2);
				int partID = resultSet.getInt(3); 
				TypeQuestionModel typeQuestionModel = new TypeQuestionModel(typeQuestionID, typeQuestionName, partID);            
				typeQuestionModels.add(typeQuestionModel);
			}
			System.out.println("size cua typeQuestionModels: " + typeQuestionModels.size());
			return typeQuestionModels; 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		}
		return typeQuestionModels;
	}
}