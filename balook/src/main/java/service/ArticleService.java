package service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dao.ArticleDAO;
import dao.UserDAO;
import dto.RequestArticle;
import dto.ResponseArticle;
import entity.Article;
import entity.User;

public class ArticleService {
	
	public List<ResponseArticle> readPageOfArticles(int batchSize, Integer pageNumber){
		ArticleDAO articleDAO = new ArticleDAO();
		
		//��ü article list read
		List<ResponseArticle> articleList =  articleDAO.readAllArticle();
		
		int totalListSize = articleList.size();
		int totalPage = (int)Math.ceil((double)totalListSize/batchSize);
		
		//����¡ ���� return�� list ����
		List<ResponseArticle> resArticleList = new ArrayList<ResponseArticle>();
		
		//������ �������� �ƴ� ���
		if(pageNumber != totalPage) {
			for(int i=batchSize*(pageNumber-1); i<batchSize*pageNumber; i++) {
				resArticleList.add(articleList.get(i));
			}
		}else {
			for(int i=batchSize*(pageNumber-1); i<totalListSize;i++) {
				resArticleList.add(articleList.get(i));
			}
		}
		articleDAO.disconnectionDB();
		return resArticleList;
	}
	
	public void createOneArticle(RequestArticle data) {
		
		ArticleDAO articleDAO = new ArticleDAO();
		Article article = new Article();
		
		article.setId(articleDAO.getMaxId() +1 );
		
//		User ������ ����
		UserDAO userDAO = new UserDAO();
		User user = userDAO.findByUserId(data.getAuthor());
		article.setAuthor(user.getId());
		
		//System.out.println(data.getAuthor());
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
		
		//userId �� ������ ����
		User user = userDAO.read(article.getAuthor());
		responseArticle.setAuthor(user.getUserId());
		
		articleDAO.disconnectionDB();
		userDAO.disconnectionDB();
		return responseArticle;
	}

	public void updateOneArticle(int id, RequestArticle data) {
		ArticleDAO articleDAO = new ArticleDAO();
		Article article = new Article();
		
		article.setId(id);
		article.setTitle(data.getTitle());
		article.setContents(data.getContents());
		articleDAO.update(article);
		articleDAO.disconnectionDB();
	}
	
	public int getTotPage(int batchSize) {
		ArticleDAO articleDAO = new ArticleDAO();
		int totArticleNumber= articleDAO.getTotArticleNumber();
		int totPage = (int)Math.ceil((double)totArticleNumber/batchSize);
		articleDAO.disconnectionDB();
		return totPage;
	}
	
	public void deleteOneArticle(int id) {
		ArticleDAO articleDAO = new ArticleDAO();
		articleDAO.delete(id);
		articleDAO.disconnectionDB();
	}

	public List<ResponseArticle> readPageOfMyArticles(int batchSize, Integer pageNumber, String userId){
		ArticleDAO articleDAO = new ArticleDAO();
		
		//��ü article list read
		List<ResponseArticle> articleList =  articleDAO.readMyAllArticle(userId);
		
		int totalListSize = articleList.size();
		
		//�Խñ��� ���� ���
		if(totalListSize == 0 ) {
			return articleList;
		}
		
		int totalPage = (int)Math.ceil((double)totalListSize/batchSize);
		
		//����¡ ���� return�� list ����
		List<ResponseArticle> resArticleList = new ArrayList<ResponseArticle>();
		
		//������ �������� �ƴ� ���
		if(pageNumber != totalPage) {
			for(int i=batchSize*(pageNumber-1); i<batchSize*pageNumber; i++) {
				resArticleList.add(articleList.get(i));
			}
		}else {
			for(int i=batchSize*(pageNumber-1); i<totalListSize;i++) {
				resArticleList.add(articleList.get(i));
			}
		}
		articleDAO.disconnectionDB();
		return resArticleList;
	}
	
	public int getMyTotPage(int batchSize, String userId) {
		ArticleDAO articleDAO = new ArticleDAO();
		int totArticleNumber= articleDAO.getMyTotArticleNumber(userId);
		int totPage = (int)Math.ceil((double)totArticleNumber/batchSize);
		articleDAO.disconnectionDB();
		return totPage;
	}
}
