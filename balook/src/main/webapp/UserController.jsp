<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.UserService" %>

<%
				request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="requestUser" class="dto.RequestUser"/>
<jsp:useBean id="responseUser" class="dto.ResponseUser"/>
<jsp:setProperty name="requestUser" property="*" />

<%
	// 회원가입의 경우
	if(request.getParameter("action").equals("signUp")){
		UserService userService = new UserService();
		userService.SignUp(requestUser);
		%>
		<script>
		alert("회원가입 완료");
		location.replace("index.jsp");
		</script><%
		
	//로그인의 경우
	}else if(request.getParameter("action").equals("signIn")){
		UserService userService = new UserService();
		responseUser = userService.SignIn(requestUser);
		
		//로그인 실패
		if(responseUser.getId() ==null){
			%>
			<script>
			alert("로그인 실패")
			location.replace("signIn.jsp");
			</script>
			<%
		}
		//로그인 성공
		else{
			session.setAttribute("id", responseUser.getId());
			response.sendRedirect("mainPageController.jsp");
			}	
	}else{
		
	}
%>