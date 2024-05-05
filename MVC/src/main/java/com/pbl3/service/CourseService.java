package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.model.CourseModel;

public class CourseService extends BaseService {

	public static LinkedList<CourseModel> all() {
		LinkedList<CourseModel> courseModels = new LinkedList<CourseModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM course ORDER BY courseID DESC");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				String courseName = resultSet.getString("CourseName");
				String courseDesc = resultSet.getString("CourseDesc");
				Double price = resultSet.getDouble("Price");
				Integer duration = resultSet.getInt("Duration");
				Integer target = resultSet.getInt("target");
				String image = resultSet.getString("image");
				Integer input = resultSet.getInt("input");
				Integer tacherID = resultSet.getInt("teacherID");
				CourseModel courseModel = new CourseModel(courseID, courseName, courseDesc,price, duration, target, image ,input, tacherID);
				courseModels.add(courseModel);      
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courseModels;
	}
	public static int count(int courseID) {
		int k=0;
		try {
			Connection connection = getConnection();
			String sqlString="select count(*) from register_course where CourseID ="+Integer.toString(courseID);
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			 k=resultSet.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return k;
	}
	
	// add
	public static void addCourse(CourseModel courseModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Course (CourseName, CourseDesc, Price, Duration, TeacherID, Target, Input, Image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
	        preparedStatement.setString(1, courseModel.getCourseName());
	        preparedStatement.setString(2, courseModel.getCourseDesc());
	        preparedStatement.setDouble(3, courseModel.getPrice());
	        preparedStatement.setInt(4, courseModel.getDuration());
	        preparedStatement.setInt(5, courseModel.getTeacherID());
	        preparedStatement.setInt(6, courseModel.getTarget());
	        preparedStatement.setInt(7, courseModel.getInput());
	        preparedStatement.setString(8, courseModel.getImage());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// find
	public static CourseModel find(int courseID) {
	    CourseModel courseModel = new CourseModel();
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Course WHERE CourseID = ?");
	        preparedStatement.setInt(1, courseID);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            int courseId = resultSet.getInt("CourseID");
	            String courseName = resultSet.getString("CourseName");
	            String courseDesc = resultSet.getString("CourseDesc");
	            double price = resultSet.getDouble("Price");
	            int duration = resultSet.getInt("Duration");
	            int teacherID = resultSet.getInt("TeacherID");
	            int target = resultSet.getInt("Target");
	            int input = resultSet.getInt("Input");
	            String image = resultSet.getString("Image");
	            // Set thông tin vào CourseModel
	            courseModel.setCourseID(courseId);
	            courseModel.setCourseName(courseName);
	            courseModel.setCourseDesc(courseDesc);
	            courseModel.setPrice(price);
	            courseModel.setDuration(duration);
	            courseModel.setTeacherID(teacherID);
	            courseModel.setTarget(target);
	            courseModel.setInput(input);
	            courseModel.setImage(image);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return courseModel;
	}
	
	// edit
	public static void edit(CourseModel courseModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Course SET CourseName = ?, CourseDesc = ?, Price = ?, Duration = ?, TeacherID = ?, Target = ?, Input = ?, Image = ? WHERE CourseID = ?");
	        preparedStatement.setString(1, courseModel.getCourseName());
	        preparedStatement.setString(2, courseModel.getCourseDesc());
	        preparedStatement.setDouble(3, courseModel.getPrice());
	        preparedStatement.setInt(4, courseModel.getDuration());
	        preparedStatement.setInt(5, courseModel.getTeacherID());
	        preparedStatement.setInt(6, courseModel.getTarget());
	        preparedStatement.setInt(7, courseModel.getInput());
	        preparedStatement.setString(8, courseModel.getImage());
	        preparedStatement.setInt(9, courseModel.getCourseID());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {   
	        e.printStackTrace();
	    }
	}

	
	public static CourseModel findCourse(int courseID) {
		CourseModel courseModel=new CourseModel();
		try {
			Connection connection = getConnection();
			String sqlString="select * from course where CourseID ="+Integer.toString(courseID);
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
//				int courseID= resultSet.getInt("courseID");
				String nameString=resultSet.getString("CourseName");
				String descString=resultSet.getString("CourseDesc");
				double price = resultSet.getDouble("Price");
				int duration=resultSet.getInt("Duration"); 
				int teacherid=resultSet.getInt("teacherID");   
				courseModel.setCourseID(courseID);
				courseModel.setCourseName(nameString);
				courseModel.setCourseDesc(descString);
				courseModel.setPrice(price);
				courseModel.setDuration(duration);
				courseModel.setTeacherID(teacherid);
			} 
		} catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
		}
		return courseModel;
	}
	
	// query 
	public static LinkedList<CourseModel> allRecent(int courseCurrentID) {
		LinkedList<CourseModel> courseModels = new LinkedList<CourseModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM course Where courseID <> ? ");
			preparedStatement.setInt(1, courseCurrentID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				String courseName = resultSet.getString("CourseName");
				String courseDesc = resultSet.getString("CourseDesc");
				Double price = resultSet.getDouble("Price");
				Integer duration = resultSet.getInt("Duration");
				Integer target = resultSet.getInt("target");
				String image = resultSet.getString("image");
				Integer input = resultSet.getInt("input");
				Integer tacherID = resultSet.getInt("teacherID");
				CourseModel courseModel = new CourseModel(courseID, courseName, courseDesc,price, duration, target, image ,input, tacherID);
				courseModels.add(courseModel);      
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courseModels;
	}
}
