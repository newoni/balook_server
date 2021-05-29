<%@page import="dto.ResponseArticle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.ArticleService" %>
<jsp:useBean id="articleList" class="dto.ResponseArticleList"/>
<% 
//게시글 불러오기
ArticleService articleService = new ArticleService();
articleList.setArticleList( articleService.readAll() ); 

	//로그인 확인 
	if(session.getAttribute("id") ==null){
	%>
	
	<script>
	alert("로그인이 필요한 서비스입니다");
	location.replace("mainPageController.jsp");
	</script>

<%
	}
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <title>함께 즐기는 바둑 플랫폼 Balook</title>

    <meta name="title" content="함께 즐기는 바둑 플랫폼 Balook">
    <meta name="description" content="함께 즐기는 바둑 플랫폼 Balook 입니다">

    <!-- og tag 넣기 -->
    <meta property="og:image" content="./img/page/p2Uy3c.jpg"> 
    <meta property="og:title" content="함께 즐기는 바둑 플랫폼 Balook">
    <meta property="og:description" content="함께 즐기는 바둑 플랫폼 Balook 입니다">

    <!-- favicon 넣기 -->
    <link rel="shortcut icon" href="./img/favicon/다운로드.png">

    <!-- css 연결 -->
    <link rel="stylesheet" type="text/css" href="css/container.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/footer.css">

    <link rel="stylesheet" type="text/css" href="css/communityBody.css">

    <!-- js 연결-->
    <script src="./js/menuBtn.js" defer></script>
    <script src="./js/alert.js" defer></script>
    <script src="./js/request.js" defer></script>

    <!-- 구글 폰트 연결-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- font awesome 연결-->
    <script src="https://kit.fontawesome.com/1d8780591f.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
      <div class="navbar">
        <div class="navbar__logo">
            <i class="fas fa-dice"></i>
            <a href="./mainPageController.jsp">balook</a>
        </div>
        <ul class="navbar__menu">
            <li><a href="./mainPageController.jsp">Home</a></li>
            <li><a href="./community.jsp">Community</a></li>
            <li><a href="#" onclick= "tmpMessage()">test</a></li>
            <li><a href="#" onclick= "tmpMessage()">test2</a></li>
            <li><a href="#" onclick= "tmpMessage()">test3</a></li>
        </ul> 
        <ul class="navbar__links">
            <li><%=session.getAttribute("id") %> 님 환영합니다</li>
            <li><a href="./mainPageController.jsp?action=signOut">sign-out</a></li>
        </ul>

        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>    
      </div>
    </header>

    <div class="communityContainer">  
        <div class="div4Absolute">
            <section class="communitySection">
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th class="articleAuthor">작성자</th>
                            <th >작성일</th>
                            <th>조회</th>
                            <th>추천</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    	<%for(ResponseArticle resArticle: articleList.getArticleList()){%>
                        	
	                        <tr>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>">  <%= resArticle.getNumber() %> </a></td>
	                        	<td><%= resArticle.getTitle() %></td>
	                        	<td><%= resArticle.getAuthor() %></td>
	                        	<td><%= resArticle.getDate() %></td>
	                        	<td><%= 0 %></td>
	                        	<td><%= 0 %></td>
							</tr>
							
						
                        <%} %>
                        
                    </tbody>
                    <tfoot></tfoot>
                </table>
                

                <div class="pagenationBox">
                    <ul class="pagenation">
                        <li><a href="http://www.naver.com">1</a></li>
                        <li><a href="http://www.naver.com">2</a></li>
                        <li><a href="http://www.naver.com">3</a></li>
                        <li><a href="http://www.naver.com">4</a></li>
                    </ul>
                </div>
            </section>

            <aside class="communitySideBar">
                <ul class="articleBoard">
                    <li>전체 게시물</li>
                    <li>인기 게시물</li>
                </ul>

                <div class="board">
                    <button class="sideBarBtn" onclick= "location='insertArticle.jsp'"> 글쓰기</button>
                    <button class="sideBarBtn" onclick= "tmpMessage()"> 내 게시물</button>
                </div>
            </aside>
        </div>
    </div>

    <footer>

        <div class="footerBox">
            <div class="footerLogo">
                <i class="fas fa-dice"></i>
                <a href="./mainPageController.jsp">balook</a>
            </div>

            <ul class="footerMenu">
                <li><a href="./mainPageController.jsp">Home</a></li>
                <li><a href="./community.jsp">Community</a></li>
                <li><a href="#">test1</a></li>
                <li><a href="#">test2</a></li>
                <li><a href="#">test3</a></li>
            </ul>
            
            <button class="topButton" onclick="topBtnAction()">top</button>

            <ul class="footerTail">
                <li><a href="#" onclick= "tmpMessage()">개발자 소개</a></li>
                <li><a href="#" onclick= "tmpMessage()">contact</a></li>
                <li><a href="#" onclick= "tmpMessage()">광고 안내</a></li>
            </ul>

            <p>Copyright 2021-2021 kanghyeok heo. all rights reserved.</p>
        </div>

    </footer>
</body>
</html>