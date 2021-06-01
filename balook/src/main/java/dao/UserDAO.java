package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.RequestUser;
import entity.User;
import ifs.DAO;

public class UserDAO extends BaseDAO implements DAO<entity.User> {

	@Override
	public void create(User data) {
		String query = "INSERT INTO CUSTOMER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement prepared_statement = this.connection.prepareStatement(query);
			prepared_statement.setInt(1,  data.getId());
			prepared_statement.setString(2, data.getUserId());
			prepared_statement.setString(3, data.getPassword());
			prepared_statement.setString(4, data.getName());
			prepared_statement.setString(5, data.getPhone());
			prepared_statement.setString(6, data.getEmail());
			prepared_statement.execute();
			System.out.println("INSERT INTO CUSTOMER 성공");
			System.out.println();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.printf("%s", "INSERT INTO CUSTOMER 비성공");
			System.out.println();
		}
		
	}

	@Override
	public User read(int id) {
		User user = new User();
		String query = "SELECT * FROM CUSTOMER WHERE ID="+id;
		ResultSet resultSet = runSQL(query);
		
		try {
			if(resultSet.next()) {
					user.setId(resultSet.getInt(1));
					user.setUserId(resultSet.getString(2));
					user.setPassword(resultSet.getString(3));
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

	@Override
	public void update(User data) {
		// TODO Auto-generated method stub
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}
	
	public User findByUserId(String userId) {
		User user = new User();
		String query = "SELECT * FROM CUSTOMER WHERE USERID LIKE \'" + userId + "\'";
		ResultSet resultSet = runSQL(query);
		
		try {
			if(resultSet.next()) {
				user.setId(resultSet.getInt(1));
				user.setUserId(resultSet.getString(2));
				user.setPassword(resultSet.getString(3));
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
	
	public User findByUserIdAndPassword(RequestUser requestUser) {
		User user = new User();
		String query = "SELECT * FROM CUSTOMER WHERE USERID LIKE \'" + requestUser.getId() + "\' AND PASSWORD LIKE \'" + requestUser.getPassword() +"\'";
		ResultSet resultSet = runSQL(query);
		
		try {
			if(resultSet.next()) {
				user.setId(resultSet.getInt(1));
				user.setUserId(resultSet.getString(2));
				user.setPassword(resultSet.getString(3));
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

	public ResultSet findByNameAndPhoneAndEmail(User user) {
		String query = "SELECT * FROM CUSTOMER WHERE NAME LIKE \'"+ user.getName() +"\' AND PHONE LIKE \'"+ user.getPhone() +"\' AND EMAIL LIKE \'"+ user.getEmail()+"\'";
		
		ResultSet resultSet = runSQL(query);
		return resultSet;
	}
	
	public int getMaxId() {
		String query = "SELECT MAX(id) FROM CUSTOMER";
		ResultSet resultSet = runSQL(query);
		int maxNumber=0;
		try {
			if(resultSet.next()) {
					maxNumber = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxNumber;
	}
}
