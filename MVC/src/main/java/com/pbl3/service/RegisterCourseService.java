package com.pbl3.service;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.LinkedList;

import com.pbl3.model.CourseModel;
import com.pbl3.model.RegisterCourseModel;
import com.pbl3.model.UserModel;

public class RegisterCourseService extends BaseService {
	public static LinkedList<RegisterCourseModel> all() {
		LinkedList<RegisterCourseModel> r = new LinkedList<RegisterCourseModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM register_course");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				Integer userID = resultSet.getInt("UserID");
				Date date =resultSet.getDate("Date");
				Double Amount = resultSet.getDouble("TotalAmount");
				RegisterCourseModel registerCourseModel=new RegisterCourseModel(courseID, userID, date, Amount);
				r.add(registerCourseModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}
	public static LinkedList<RegisterCourseModel> find(int UserID) {
		LinkedList<RegisterCourseModel> r = new LinkedList<RegisterCourseModel>();
		try {
			Connection connection = getConnection();
			String sqlString="SELECT * FROM register_course WHERE UserID="+Integer.toString(UserID);
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				Integer userID = resultSet.getInt("UserID");
				Date date =resultSet.getDate("Date");
				Double Amount = resultSet.getDouble("TotalAmount");
				RegisterCourseModel registerCourseModel=new RegisterCourseModel(courseID, userID, date, Amount);
				r.add(registerCourseModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}
	public static LinkedList<CourseModel> listCourseModels(int userID){
		LinkedList<CourseModel> courseModels = new LinkedList<CourseModel>();
		String sqlString="select * from course inner join register_course on course.courseID=register_course.courseID where register_course.userID="+Integer.toString(userID);
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				String courseName =resultSet.getString("CourseName");
				String courseDesc =resultSet.getString("CourseDesc");
				Double price = resultSet.getDouble("Price");
				Integer duration =resultSet.getInt("Duration");
				Integer teacherID =resultSet.getInt("ID_teacher");
				CourseModel courseModel=new CourseModel(userID, courseName, courseDesc, price, duration,teacherID);
				courseModels.add(courseModel);
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return courseModels;
	}
	
	public static int getDuration(int courseID) {
		String sqlString="SELECT * FROM course WHERE CourseID="+Integer.toString(courseID);
		int k=0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next())
				 k= resultSet.getInt("Duration");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return k;
	}
	public static long getDayOfCoure(UserModel userModel, CourseModel courseModel) {
		long k=0;
		Date startDay;
		String sqlString="select * from  register_course where register_course.userID="+Integer.toString(userModel.getUserID())+ " and register_course.courseid="+Integer.toString(courseModel.getCourseID());
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				startDay=resultSet.getDate("Date");
				Long miliLong=System.currentTimeMillis();
				Date endday =new Date(miliLong);
				LocalDate endDate = endday.toLocalDate();
				LocalDate startDate = startDay.toLocalDate();
				Long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
				k= (long)courseModel.getDuration()*30 - daysBetween;
			}	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return k;
	}
	public static RegisterCourseModel isRegistered(int userID,int courseID) {
		RegisterCourseModel registerCourseModel= new RegisterCourseModel();
		String sqlString="SELECT * FROM register_course WHERE CourseID="+Integer.toString(courseID) +" and userID="+Integer.toString(userID);
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(!resultSet.next()) return null;
			else {
				registerCourseModel.setCourseID(courseID);
				registerCourseModel.setUserID(userID);
				registerCourseModel.setDate(resultSet.getDate("Date"));
				registerCourseModel.setAmount(resultSet.getDouble("TotalAmount"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return registerCourseModel;
	}

}
