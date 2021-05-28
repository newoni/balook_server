package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.RequestUser;
import entity.User;
import ifs.DAO;

public class UserDAO extends BaseDAO implements DAO<entity.User> {

	@Override
	public User create(User data) {
		String query = "INSERT INTO ARTICLE VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement prepared_statement = this.connection.prepareStatement(query);
			prepared_statement.setInt(1,  data.getId());
			prepared_statement.setString(2, data.getUserId());
			prepared_statement.setString(3, data.getPassWord());
			prepared_statement.setString(4, data.getName());
			prepared_statement.setString(5, data.getPhone());
			prepared_statement.setString(5, data.getEmail());
			/*
			//현재 시간을 넣기 위한 date 형변환
			Calendar cal = Calendar.getInstance();
			Date d = new Date(cal.getTimeInMillis());
			
			prepared_statement.setDate(5, d);
			*/
			prepared_statement.execute();
			System.out.println("INSERT INTO ARTICLE 성공");
			System.out.println();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.printf("%s", "INSERT INTO ARTICLE 비성공");
			System.out.println();
		}
		
		return null;
	}

	@Override
	public User read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User update(User data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}
	
	public User findByUserIdAndPassword(RequestUser requestUser) {
		User user = new User();
		String query = "SELECT * FROM CUSTOMER WHERE USERID LIKE \'" + requestUser.getId() + "\' AND PASSWORD LIKE \'" + requestUser.getPassword() +"\'";
		ResultSet resultSet = runSQL(query);
		
		try {
			if(resultSet.next()) {
				user.setId(resultSet.getInt(1));
				user.setUserId(resultSet.getString(2));
				user.setPassWord(resultSet.getString(3));
				user.setName(resultSet.getString(4));
				user.setPhone(resultSet.getString(5));
				user.setEmail(resultSet.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
