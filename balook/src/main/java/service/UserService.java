package service;

import dao.UserDAO;
import dto.RequestUser;
import dto.ResponseUser;
import entity.User;

public class UserService {
	UserDAO userDAO = new UserDAO();
	
	public ResponseUser SignIn(RequestUser requestUser) {
		User user = userDAO.findByUserIdAndPassword(requestUser);
		
		ResponseUser responseUser = new ResponseUser();
		responseUser.setId(user.getUserId());
		
		return responseUser;
	}
}
