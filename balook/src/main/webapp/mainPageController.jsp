<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//else의 경우에만 그냥 통과
	try{
	if(request.getParameter("action").equals("signOut")){
		session.setAttribute("id", null);
	}
	
	}catch(Exception e){
	}



	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("indexAfterSignIn.jsp");
	}
%>