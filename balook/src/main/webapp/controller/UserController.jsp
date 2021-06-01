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
		location.replace("../index.jsp");
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
			location.replace("../page/signIn.jsp");
			</script>
			<%
		}
		//로그인 성공
		else{
			session.setAttribute("id", responseUser.getId());
			response.sendRedirect("mainPageController.jsp");
			}	
		
		//아이디 찾기
	}else if(request.getParameter("action").equals("findId")){
		
		UserService userService = new UserService();
		responseUser = userService.findId(requestUser);
		%>
		<script>
		alert("아이디는\n <%=responseUser.getId()%> \n 입니다");
		location.replace("../page/signIn.jsp");
		</script>
		<%
		//비밀번호 찾기
	}else if(request.getParameter("action").equals("findPw")){
		
		UserService userService = new UserService();
		responseUser = userService.findPw(requestUser);
		
		%>
		<script>
		alert("비밀번호는\n <%=responseUser.getPassword()%> \n 입니다");
		location.replace("../page/signIn.jsp");
		</script>
		<%
	}
%>