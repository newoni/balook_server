package service;

import java.util.List;

import dao.ArticleDAO;
import dao.UserDAO;
import dto.ResponseArticle;
import entity.Article;
import entity.User;

public class ArticleService {
	
	public List<ResponseArticle> readAll(){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.readAllArticle();
	}
	
	public ResponseArticle readOneArticle(int id) {
		ArticleDAO articleDAO = new ArticleDAO();
		UserDAO userDAO = new UserDAO();
		ResponseArticle responseArticle = new ResponseArticle();
		
		Article article = articleDAO.read(id);
		responseArticle.setTitle(article.getTitle());
		responseArticle.setContents(article.getContents());
		responseArticle.setDate(article.getBoardTime());
		
		//userId 값 가지고 오기
		User user = userDAO.read(article.getAuthor());
		responseArticle.setAuthor(user.getUserId());
		
		articleDAO.disconnectionDB();
		userDAO.disconnectionDB();
		return responseArticle;
	}
}
