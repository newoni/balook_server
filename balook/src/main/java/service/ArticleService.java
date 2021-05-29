package service;

import java.time.LocalDate;
import java.util.List;

import dao.ArticleDAO;
import dao.UserDAO;
import dto.RequestArticle;
import dto.ResponseArticle;
import entity.Article;
import entity.User;

public class ArticleService {
	
	public List<ResponseArticle> readAll(){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.readAllArticle();
	}

	public void createOneArticle(RequestArticle data) {
		
		ArticleDAO articleDAO = new ArticleDAO();
		Article article = new Article();
		
		
		article.setId(articleDAO.getMaxId() +1 );
		
//		User 데이터 설정
		UserDAO userDAO = new UserDAO();
		User user = userDAO.findByUserId(data.getAuthor());
		article.setAuthor(user.getId());
		
		System.out.println(data.getAuthor());
		userDAO.disconnectionDB();
		
		article.setTitle(data.getTitle());
		article.setContents(data.getContents());
		article.setBoardTime(LocalDate.now());
		
		
		articleDAO.create(article);
		articleDAO.disconnectionDB();
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
