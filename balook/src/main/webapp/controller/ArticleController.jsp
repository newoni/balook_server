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
		session.setAttribute("articleNumber", Integer.parseInt(request.getParameter("articleNumber")));
		responseArticle= articleService.readOneArticle(Integer.parseInt(request.getParameter("articleNumber")));
		
	}else if(request.getParameter("action").equals("create")){
		ArticleService articleService = new ArticleService();
		String authorName = session.getAttribute("id").toString();
		requestArticle.setAuthor(authorName);
		articleService.createOneArticle(requestArticle);
		
		session.setAttribute("page","1");
		%>
		<script>location.replace("../page/community.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("pagination")){
		session.setAttribute("page", request.getParameter("page"));
		%>
		<script>location.replace("../page/community.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("updatePage")){
		session.setAttribute("articleTitle", requestArticle.getTitle());
		session.setAttribute("articleContents",requestArticle.getContents());
		
		%>
		<script>location.replace("../page/updateArticle.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("update")){
		ArticleService articleService = new ArticleService();
		int id = (Integer)session.getAttribute("articleNumber");
		articleService.updateOneArticle(id, requestArticle);
		
		
		%>
		<script>location.replace("../page/community.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("delete")){
		ArticleService articleService = new ArticleService();
		articleService.deleteOneArticle((Integer)session.getAttribute("articleNumber"));
		%>
		<script>location.replace("../page/community.jsp")</script>
		<%
	}else if(request.getParameter("action").equals("changeArticleNumber")){
		session.setAttribute("batch", request.getParameter("batchNumber"));
		%>
		<script>location.replace("../page/community.jsp")</script>
		<%
	}

%>