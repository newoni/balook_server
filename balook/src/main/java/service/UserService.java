package service;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDAO;
import dto.RequestUser;
import dto.ResponseUser;
import entity.User;

public class UserService {
	
	public ResponseUser SignIn(RequestUser requestUser) {
		UserDAO userDAO = new UserDAO();
		User user = userDAO.findByUserIdAndPassword(requestUser);
		
		ResponseUser responseUser = new ResponseUser();
		responseUser.setId(user.getUserId());
		
		userDAO.disconnectionDB();
		return responseUser;
	}

	public void SignUp(RequestUser requestUser) {
		User user = new User();
		UserDAO userDAO = new UserDAO();
		
		int id = userDAO.getMaxId();
		
		user.setId(id+1);
		user.setUserId(requestUser.getId());
		user.setPassword(requestUser.getPassword());
		user.setName(requestUser.getUserName());
		user.setPhone(requestUser.getPhoneNumber());
		user.setEmail(requestUser.getEmail() +"@" + requestUser.getDomain());
		
		userDAO.create(user);
	}

	public ResponseUser findId(RequestUser requestUser) {
		User user = new User();
		
		user.setName(requestUser.getUserName());
		user.setPhone(requestUser.getPhoneNumber());
		user.setEmail(requestUser.getEmail()+ "@" + requestUser.getDomain());;
		
		UserDAO userDAO = new UserDAO();
		ResultSet resultSet = userDAO.findByNameAndPhoneAndEmail(user);
		
		ResponseUser responseUser = new ResponseUser();
		
		try {
			resultSet.next();
			responseUser.setId(resultSet.getString(2));
			System.out.println("아이디 검색 결과:"+ responseUser.getId());
		} catch (SQLException e) {
		}
		userDAO.disconnectionDB();
		return responseUser;
	}
}
