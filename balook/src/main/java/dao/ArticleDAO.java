package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ResponseArticle;
import entity.Article;
import ifs.DAO;

public class ArticleDAO extends BaseDAO implements DAO<Article>{

	@Override
	public void create(Article data) {
		String query = "INSERT INTO ARTICLE VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement prepared_statement = this.connection.prepareStatement(query);
			prepared_statement.setInt(1,  data.getId());
			prepared_statement.setInt(2, data.getAuthor());
			prepared_statement.setString(3, data.getTitle());
			prepared_statement.setString(4, data.getContents());
			prepared_statement.setDate(5, Date.valueOf(data.getBoardTime()));
			
			prepared_statement.execute();
			System.out.println("INSERT INTO ARTICLE 성공");
		
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.printf("%s", "INSERT INTO ARTICLE 비성공");
			System.out.println();
		}
		
	}

	@Override
	public Article read(int id) {
		Article article = new Article();
		String query = "SELECT * FROM ARTICLE WHERE ID="+id;
		ResultSet resultSet = runSQL(query);
		
		try {
			if(resultSet.next()) {
					article.setId(resultSet.getInt(1));
					article.setAuthor(resultSet.getInt(2));
					article.setTitle(resultSet.getString(3));
					article.setContents(resultSet.getString(4));
					article.setBoardTime(resultSet.getDate(5).toLocalDate());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return article;
	}

	@Override
	public void update(Article data) {
		String query = "UPDATE ARTICLE SET TITLE=(?), CONTENTS=(?) WHERE ID=(?)";
		try {
			PreparedStatement prepared_statement = this.connection.prepareStatement(query);
			prepared_statement.setString(1,  data.getTitle());
			prepared_statement.setString(2, data.getContents());
			prepared_statement.setInt(3, data.getId());
			
			prepared_statement.execute();
			System.out.println("INSERT INTO ARTICLE 성공");
		
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.printf("%s", "INSERT INTO ARTICLE 비성공");
			System.out.println();
		}
	}

	@Override
	public void delete(int id) {
		String query = "DELETE FROM ARTICLE WHERE ID = " +id;
		ResultSet resultSet4rowNumber = runSQL(query);
	}
	
	public List<ResponseArticle> readAllArticle() {
		String query4rowNumber = "SELECT COUNT(*) FROM ARTICLE, CUSTOMER WHERE ARTICLE.AUTHOR=CUSTOMER.ID";
		ResultSet resultSet4rowNumber = runSQL(query4rowNumber);
		int rowNumber=0;
		try {
			resultSet4rowNumber.next();
			rowNumber = resultSet4rowNumber.getInt(1);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		List<ResponseArticle> resList = new ArrayList<ResponseArticle>();
		String query = "SELECT * FROM ARTICLE, CUSTOMER WHERE ARTICLE.AUTHOR=CUSTOMER.ID ORDER BY ARTICLE.ID DESC";
		ResultSet resultSet = runSQL(query);
		
		try {
			for(int i =0 ; i<rowNumber; i++) {
				if(resultSet.next()) {
					ResponseArticle responseArticle = new ResponseArticle();
					responseArticle.setAuthor(resultSet.getString(7));
					responseArticle.setNumber(resultSet.getInt(1));
					responseArticle.setTitle(resultSet.getString(3));
					responseArticle.setDate(resultSet.getDate(5).toLocalDate());
					
					resList.add(responseArticle);
					
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resList;
	}
	public int getTotArticleNumber() {
		String query = "select count(*) from article";
		ResultSet resultSet = runSQL(query);
		int cntNumber=0;
		try {
			if(resultSet.next()) {
				cntNumber = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cntNumber;
	}
	public int getMaxId() {
		String query = "SELECT MAX(id) FROM ARTICLE";
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

	
