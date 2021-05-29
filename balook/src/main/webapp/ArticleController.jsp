<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.ArticleService" %>

<jsp:useBean id="responseArticle" class="dto.ResponseArticle"/>

<%
	if(request.getParameter("action").equals("read")){
		ArticleService articleService = new ArticleService();
		responseArticle= articleService.readOneArticle(Integer.parseInt(request.getParameter("articleNumber")));
		
	}
%>

