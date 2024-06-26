package com.pbl3.model;

public class TeacherModel extends UserModel{
	private String description;
	private Double accountBalance;
	
	public TeacherModel(int userID, String name, String phone, String email, Boolean gender, String image,
			String userName, String password, RoleModel roleModel, String description, Double accountBalance) {
		super(userID, name, phone, email, gender, image, userName, password, roleModel);
		this.description = description;
		this.accountBalance = accountBalance;
	}
	
	public TeacherModel(String name, String phone, String email, Boolean gender, String image, String userName,
			String password, RoleModel roleModel, String description, Double accountBalance) {
		super(name, phone, email, gender, image, userName, password, roleModel);
		this.description = description;
		this.accountBalance = accountBalance;
	} 
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getAccountBalance() {
		return accountBalance;
	}
	public void setAccountBalance(Double accountBalance) {
		this.accountBalance = accountBalance;
	}
}
