package com.pbl3.model;

import java.time.Year;
import java.time.YearMonth;

public class TestsModel {
	private int testsID;
	private String testsName;
	private int year;
	private boolean status;
	private int teacherID;
	
	public TestsModel(int testsID, String testsName, int year, boolean status, int teacherID) {
		super();
		this.testsID = testsID;
		this.testsName = testsName;
		this.year = year;
		this.status = status;
		this.teacherID = teacherID;
	}

	public TestsModel(int testsID, String testsName, int year) {
		super();
		this.testsID = testsID; 
		this.testsName = testsName;
		this.year = year;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getTestID() {
		return testsID;
	}

	public void setTestID(int testID) {
		this.testsID = testID;
	}

	public String getTestName() {
		return testsName;
	}

	public void setTestName(String testName) {
		this.testsName = testName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(int teacherID) {
		this.teacherID = teacherID;
	}
	
	
}
