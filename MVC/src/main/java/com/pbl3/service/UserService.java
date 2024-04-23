package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.util.LinkedList;

import com.pbl3.model.AccountModel;
import com.pbl3.model.RoleModel;
import com.pbl3.model.UserModel;

public class UserService extends BaseService {
	// add user
	public static void add(UserModel userModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO user (AccountID, Name, Phone, Gmail, Gender) VALUES (?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, userModel.getAccountID());
			preparedStatement.setString(2, userModel.getName());
			preparedStatement.setString(3, userModel.getPhone());
			preparedStatement.setString(4, userModel.getEmail());
			if (userModel.getGender() == null) {
				preparedStatement.setObject(5, null);
			} else
				preparedStatement.setBoolean(5, userModel.getGender());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// login
	// truy van ra trong data base account vua dang nhap, ko co thi tra ve 1
	// UserModel voi UserModel = 0
	// co thi tra ve accountModel do
	public static UserModel login(String usernameString, String passwordString) {
		UserModel userModel = new UserModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"SELECT User.*, Account.username, Account.roleID, Role.rolename FROM User INNER JOIN Account ON User.AccountID = Account.AccountID INNER JOIN Role ON Account.RoleID = Role.RoleID WHERE account.username = ? AND account.password = ?");
			preparedStatement.setString(1, usernameString);
			preparedStatement.setString(2, passwordString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int userID = resultSet.getInt(1);
				int accountID = resultSet.getInt(2);
				String name = resultSet.getString(3);
				String phone = resultSet.getString(4);
				String email = resultSet.getString(5);
				Boolean gender;
				if (resultSet.getObject(6) == null) {
					gender = null;
				} else
					gender = resultSet.getBoolean(6);
				String userName = resultSet.getString(7);
				int roleID = resultSet.getInt(8);
				String roleName = resultSet.getString(9);
				RoleModel roleModel = new RoleModel(roleID, roleName);
				AccountModel accountModel = new AccountModel(accountID, roleID, userName, "******", roleModel);
				userModel = new UserModel(userID, accountID, name, phone, email, gender, accountModel);
				System.out.println(userModel.getGender());
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModel;
	}

	// query all
	public static LinkedList<UserModel> all(String keyword, int limit, int page) {
		LinkedList<UserModel> userModels = new LinkedList<UserModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"SELECT User.*, Account.username, Account.roleID, Role.rolename FROM User INNER JOIN Account ON User.AccountID = Account.AccountID INNER JOIN Role ON Account.RoleID = Role.RoleID WHERE name LIKE ? ORDER BY userID DESC LIMIT ? OFFSET ?");
			preparedStatement.setString(1, "%" + keyword + "%");
			preparedStatement.setInt(2, limit);
			// tính offset
			int offset = (page - 1)*limit;
			preparedStatement.setInt(3, offset);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int userID = resultSet.getInt(1);
				int accountID = resultSet.getInt(2);
				String name = resultSet.getString(3);
				String phone = resultSet.getString(4);
				String email = resultSet.getString(5);
				Boolean gender;
				if (resultSet.getObject(6) == null) {
					gender = null;
				} else
					gender = resultSet.getBoolean(6);
				String userName = resultSet.getString(7);
				int roleID = resultSet.getInt(8);
				String roleName = resultSet.getString(9);
				RoleModel roleModel = new RoleModel(roleID, roleName);
				AccountModel accountModel = new AccountModel(accountID, roleID, userName, "******", roleModel);
				UserModel userModel = new UserModel(userID, accountID, name, phone, email, gender, accountModel);
				System.out.println(userModel.getGender());
				userModels.add(userModel);
			}
			System.out.println("size cua user la: " + userModels.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModels;
	}

	// find theo id de update
	public static UserModel find(int userID) {
		UserModel userModel = new UserModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"SELECT User.*, Account.username, Account.roleID, Role.rolename FROM User INNER JOIN Account ON User.AccountID = Account.AccountID INNER JOIN Role ON Account.RoleID = Role.RoleID WHERE userID = ?");
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
//			int userID = resultSet.getInt(1);
			int accountID = resultSet.getInt(2);
			String name = resultSet.getString(3);
			String phone = resultSet.getString(4);
			String email = resultSet.getString(5);
			Boolean gender;
			if (resultSet.getObject(6) == null) {
				gender = null;
			} else {
				gender = resultSet.getBoolean(6);
			}
			String userName = resultSet.getString(7);
			int roleID = resultSet.getInt(8);
			String roleName = resultSet.getString(9);
			RoleModel roleModel = new RoleModel(roleID, roleName);
			AccountModel accountModel = new AccountModel(accountID, roleID, userName, "******", roleModel);
			userModel.setUserID(userID);
			userModel.setAccountID(accountID);
			userModel.setName(name);
			userModel.setPhone(phone);
			userModel.setEmail(email);
			userModel.setGender(gender);
			userModel.setAccountModel(accountModel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("thang cu can chinh sua: name: " + userModel.getName() + " username: "
				+ userModel.getAccountModel().getUserName());
		return userModel;
	}

	// edit
	public static void update(UserModel userModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE user SET Name = ?, Phone= ?, Gmail = ?, Gender = ? WHERE userID =?");
			preparedStatement.setString(1, userModel.getName());
			preparedStatement.setString(2, userModel.getPhone());
			preparedStatement.setString(3, userModel.getEmail());
			if (userModel.getGender() != null) {
				preparedStatement.setBoolean(4, userModel.getGender());
			} else
				preparedStatement.setObject(4, null);
			preparedStatement.setInt(5, userModel.getUserID());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	// delete
//	public static void delete(int userID) {
//		try {
//			Connection connection = getConnection();
//			PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM user WHERE userID = ?"); 
//			preparedStatement.setInt(1, userID);
//			preparedStatement.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
	
	// count
	public static int count () {
		int cnt = 0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) AS result FROM user"); 
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			cnt = resultSet.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return cnt;
	} 

}
