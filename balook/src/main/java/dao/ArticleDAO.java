package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ResponseArticle;
import entity.Article;
import ifs.DAO;

public class ArticleDAO extends BaseDAO implements DAO<Article>{

	@Override
	public Article create(Article data) {
		// TODO Auto-generated method stub
		return null;
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
	public Article update(Article data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}
	
	public List<ResponseArticle> readAllArticle() {
		List<ResponseArticle> resList = new ArrayList<ResponseArticle>();
		String query = "SELECT * FROM ARTICLE, CUSTOMER WHERE ARTICLE.AUTHOR=CUSTOMER.ID";
		ResultSet resultSet = runSQL(query);
		
		try {
			for(int i =0 ;  i<resultSet.getFetchSize();i++) {
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
}

	
