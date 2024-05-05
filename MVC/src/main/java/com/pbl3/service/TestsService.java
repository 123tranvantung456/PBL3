package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.pbl3.model.TestsModel;

public class TestsService extends BaseService {

	// query all tests
	public static LinkedList<TestsModel> all() {
		LinkedList<TestsModel> testsModels = new LinkedList<TestsModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM test WHERE status = 1 ORDER BY testID DESC;");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int testID = resultSet.getInt(1);
				String testsName = resultSet.getString(2);
				Integer year = resultSet.getInt(3);
				TestsModel testsModel = new TestsModel(testID, testsName, year);   
				testsModels.add(testsModel);             
			}
			System.out.println("size cua tests: " + testsModels.size());
			return testsModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return testsModels;
	}
	
	// query all tests of teacher 
	public static LinkedList<TestsModel> all(int teacherID) {
		LinkedList<TestsModel> testsModels = new LinkedList<TestsModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM test WHERE teacherID = ? ORDER BY testID DESC;");
			preparedStatement.setInt(1, teacherID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int testID = resultSet.getInt(1);
				String testsName = resultSet.getString(2);
				Integer year = resultSet.getInt(3);
				String audio = resultSet.getString(4);
				boolean status = resultSet.getBoolean(5);
//				int teacherID = resultSet.getInt(6); 
				TestsModel testsModel = new TestsModel(testID, testsName, year, status, teacherID, audio);   
				testsModels.add(testsModel);             
			}
			System.out.println("size cua tests: " + testsModels.size());
			return testsModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return testsModels;
	}
	
	// add tests
	  public void add(TestsModel testsModel) {
	        try {
	            Connection connection = getConnection(); // Thay thế getConnection() bằng phương thức lấy kết nối tới cơ sở dữ liệu của bạn
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO test (TestName, Year, Status, TeacherID) VALUES (?, ?, ?, ?)");
	            preparedStatement.setString(1, testsModel.getTestsName());
	            preparedStatement.setInt(2, testsModel.getYear());
	            preparedStatement.setBoolean(3, testsModel.getStatus());
	            preparedStatement.setInt(4, testsModel.getYear());
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	  
	  // edit
	  public static void edit (TestsModel testsModel) {	
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE test SET TestName = ?, Year = ?, audio = ?, status = ? WHERE testID =?"); 
				preparedStatement.setString(1, testsModel.getTestsName());
	            preparedStatement.setInt(2, testsModel.getYear());
	            preparedStatement.setString(3, testsModel.getAudio());
	            preparedStatement.setBoolean(4, testsModel.getStatus());
	            preparedStatement.setInt(5, testsModel.getYear());
				preparedStatement.setInt(6,testsModel.getTestsID());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
	  
	  // edit audio
		public static void editAudio (TestsModel testsModel) {	
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE test SET audio = ? WHERE testID =?"); 
				preparedStatement.setString(1, testsModel.getAudio());
				preparedStatement.setInt(2,testsModel.getTestsID());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		public static TestsModel find (int testsID) {
			TestsModel testsModel= new TestsModel();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("Select * From test Where testID = ?");
				preparedStatement.setInt(1, testsID);
				ResultSet resultSet =preparedStatement.executeQuery();
				resultSet.next();
				testsModel.setTestsID(testsID);
				testsModel.setTestsName(resultSet.getString(2));
				testsModel.setYear(resultSet.getInt(3)); 
				testsModel.setAudio(resultSet.getString(4));
				testsModel.setStatus(resultSet.getBoolean(5));
				testsModel.setTeacherID(resultSet.getInt(6));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return testsModel;
		}
}
