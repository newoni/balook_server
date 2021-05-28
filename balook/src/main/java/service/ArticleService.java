package service;

import java.util.List;

import dao.ArticleDAO;
import dto.ResponseArticle;

public class ArticleService {
	
	public List<ResponseArticle> readAll(){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.readAllArticle();
	}
}
