<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.UserService" %>
<jsp:useBean id="requestUser" class="dto.RequestUser"/>
<jsp:useBean id="responseUser" class="dto.ResponseUser"/>
<jsp:setProperty name="requestUser" property="*" />

<%
UserService userService = new UserService();
responseUser = userService.SignIn(requestUser);

session.setAttribute("id", responseUser.getId());

response.sendRedirect("index.html");
%>