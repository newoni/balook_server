<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="request" class="dto.RequestUser"/>
<jsp:setProperty name="user" property="*"/>

<%
	
%>


<%= user.getId() %>
<%= user.getPassword() %>