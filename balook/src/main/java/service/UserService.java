package service;

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
}
