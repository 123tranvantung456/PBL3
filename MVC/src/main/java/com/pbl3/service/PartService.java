package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PartService extends BaseService{
	public static int count () {	
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM part;"); 
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			int countPart = resultSet.getInt(1);
			System.out.println("size cua part la: "+ countPart);
			return countPart; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
