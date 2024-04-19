package com.pbl3.model;

import java.security.Timestamp;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import com.pbl3.service.CourseService;
import com.pbl3.service.RegisterCourseService;

public class RegisterCourseModel {
		private int courseID;
		private int userID;
		private Date date;
		private double amount;
		
		public Long getDayOfCourse() {
			Long miliLong=System.currentTimeMillis();
			Date endday =new Date(miliLong);
			LocalDate endDate = endday.toLocalDate();
			LocalDate startDate = this.date.toLocalDate();
			Long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
			int k = RegisterCourseService.getDuration(this.courseID);
			return k*30-daysBetween;
		}
		public RegisterCourseModel() {
			
		}
		
		
		public RegisterCourseModel(int courseID, int userID, Date date, double amount) {
			super();
			this.courseID = courseID;
			this.userID = userID;
			this.date = date;
			this.amount = amount;
		}


		public int getCourseID() {
			return courseID;
		}
		public void setCourseID(int courseID) {
			this.courseID = courseID;
		}
		public int getUserID() {
			return userID;
		}
		public void setUserID(int userID) {
			this.userID = userID;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public double getAmount() {
			return amount;
		}
		public void setAmount(double amount) {
			this.amount = amount;
		}
		
}
