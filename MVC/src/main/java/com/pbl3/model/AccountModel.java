package com.pbl3.model;

public class AccountModel{
	private int accountID;
	private int roleID;
	private String userName;
	private String password;
	RoleModel roleModel;

	public AccountModel(int accountID, int roleID, String userName, String password, RoleModel roleModel) {
		super();
		this.accountID = accountID;
		this.roleID = roleID;
		this.userName = userName;
		this.password = password;
		this.roleModel = roleModel;
	}

	public AccountModel(){
		
	}
	
	public AccountModel(int roleID, String userName, String password) {
		super();
		this.roleID = roleID;
		this.userName = userName;
		this.password = password;
	}

	public AccountModel(int accountID, int roleID, String userName, String password) {
		super();
		this.accountID = accountID;
		this.roleID = roleID;
		this.userName = userName;
		this.password = password;
	}
	
	public RoleModel getRoleModel() {
		return roleModel;
	}

	public void setRoleModel(RoleModel roleModel) {
		this.roleModel = roleModel;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		roleID = roleID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
