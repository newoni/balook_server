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
}
