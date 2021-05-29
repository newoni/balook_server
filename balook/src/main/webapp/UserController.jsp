<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.UserService" %>
<jsp:useBean id="requestUser" class="dto.RequestUser"/>
<jsp:useBean id="responseUser" class="dto.ResponseUser"/>
<jsp:setProperty name="requestUser" property="*" />

<%
UserService userService = new UserService();
responseUser = userService.SignIn(requestUser);

if(responseUser.getId() ==null){
	%>
	<script>
	alert("로그인 실패")
	location.replace("signIn.jsp");
	</script>
	<%
}
else{
	session.setAttribute("id", responseUser.getId());
	
	response.sendRedirect("mainPageController.jsp");
	}
%>