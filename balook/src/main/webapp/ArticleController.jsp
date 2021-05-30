<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.ArticleService" %>
<%
				request.setCharacterEncoding("UTF-8");
			%>
<jsp:useBean id="requestArticle" class="dto.RequestArticle"/>
<jsp:setProperty property="*" name="requestArticle"/>
<jsp:useBean id="responseArticle" class="dto.ResponseArticle"/>

<%
	if(request.getParameter("action").equals("read")){
		ArticleService articleService = new ArticleService();
		responseArticle= articleService.readOneArticle(Integer.parseInt(request.getParameter("articleNumber")));
		
	}else if(request.getParameter("action").equals("create")){
		ArticleService articleService = new ArticleService();
		String authorName = session.getAttribute("id").toString();
		requestArticle.setAuthor(authorName);
		articleService.createOneArticle(requestArticle);
		
		session.setAttribute("page","1");
		%>
		<script>location.replace("community.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("pagination")){
		session.setAttribute("page", request.getParameter("page"));
		%>
		<script>location.replace("community.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("updatePage")){
		%>
		<script>location.replace("updateArticle.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("update")){
		System.out.println("hello");
		System.out.println(requestArticle.getAuthor());
		System.out.println(requestArticle.getTitle());
		System.out.println(requestArticle.getContents());
		%>
		<script>location.replace("community.jsp")</script>
		<%
	}
%>

