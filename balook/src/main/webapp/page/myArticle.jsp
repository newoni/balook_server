<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.ResponseArticle"%>
<%@page import="service.ArticleService" %>
<%@page import="service.UserService" %>
<jsp:useBean id="articleList" class="dto.ResponseArticleList"/>
<% 
	//로그인 확인 
	if(session.getAttribute("id") ==null){
	%>
	
	<script>
	alert("로그인이 필요한 서비스입니다");
	location.replace("../controller/mainPageController.jsp");
	</script>

<%
	}
	%>
	
<%
	//내 게시물 서비스 불러오기
	ArticleService articleService = new ArticleService();
	
	int batchSize;
	try{
		batchSize = Integer.parseInt((String)session.getAttribute("batch"));
	}catch(Exception e){
		batchSize = 20;
	}
	String userId = (String)session.getAttribute("id");

	//전체 페이지 받아오기
	int totPage = articleService.getMyTotPage(batchSize, userId);
	//원하는 페이지 받아오고, 없을 경우 1페이지 출력 
	try{
		String pageNumber = (String)session.getAttribute("page");
		articleList.setArticleList(articleService.readPageOfMyArticles(batchSize, Integer.parseInt(pageNumber), userId));
	}catch(Exception e){
		articleList.setArticleList(articleService.readPageOfMyArticles(batchSize, 1, userId));
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
    <meta property="og:image" content="../img/page/p2Uy3c.jpg"> 
    <meta property="og:title" content="함께 즐기는 바둑 플랫폼 Balook">
    <meta property="og:description" content="함께 즐기는 바둑 플랫폼 Balook 입니다">

    <!-- favicon 넣기 -->
    <link rel="shortcut icon" href="../img/favicon/다운로드.png">

    <!-- css 연결 -->
    <link rel="stylesheet" type="text/css" href="../css/container.css">
    <link rel="stylesheet" type="text/css" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/footer.css">

    <link rel="stylesheet" type="text/css" href="../css/communityBody.css">

    <!-- js 연결-->
    <script src="../js/menuBtn.js" defer></script>
    <script src="../js/alert.js" defer></script>

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
            <a href="../controller/mainPageController.jsp">balook</a>
        </div>
        <ul class="navbar__menu">
            <li><a href="../controller/mainPageController.jsp">Home</a></li>
            <li><a href="./community.jsp">Community</a></li>
            <li><a href="#" onclick= "tmpMessage()">test</a></li>
            <li><a href="#" onclick= "tmpMessage()">test2</a></li>
            <li><a href="#" onclick= "tmpMessage()">test3</a></li>
        </ul> 
        <ul class="navbar__links">
            <li><%=session.getAttribute("id") %> 님 환영합니다</li>
            <li><a href="../controller/mainPageController.jsp?action=signOut">sign-out</a></li>
        </ul>

        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>    
      </div>
    </header>

    <div class="communityContainer">  
        <div class="div4Absolute">
            <section class="communitySection">
            	<select onchange="if(this.value) location.href=(this.value);" class=articleBatch>
            		<option value="../controller/ArticleController.jsp?action=changeArticleNumber&batchNumber=10">10개</option>
            		<option selected="true" value="../controller/ArticleController.jsp?action=changeArticleNumber&batchNumber=20">20개</option>
            		<option value="../controller/ArticleController.jsp?action=changeArticleNumber&batchNumber=50">50개</option>
            	</select>
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
                    <tbody class="tbody">
                        
                    	<%for(ResponseArticle resArticle: articleList.getArticleList()){%>
                        	
	                        <tr>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>">  <%= resArticle.getNumber() %> </a></td>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>"><%= resArticle.getTitle() %></a></td>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>"><%= resArticle.getAuthor() %></a></td>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>"><%= resArticle.getDate() %></a></td>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>"><%= 0 %></a></td>
	                        	<td><a href="readOneArticle.jsp?action=read&articleNumber=<%= resArticle.getNumber() %>"><%= 0 %></a></td>
							</tr>
							
						
                        <%} %>
                        
                    </tbody>
                    <tfoot></tfoot>
                </table>
                

                <div class="pagenationBox">
                    <ul class="pagenation">
                        <script>
                        	for(var i=1; i<= <%=totPage%> ; i++){
                        		document.write("<li><a href='../controller/ArticleController.jsp?action=pagination&page="+i +"''>"+ i + "</a></li>");
                        	}
                    	</script>
                    </ul>
                </div>
            </section>

            <aside class="communitySideBar">
            	<!-- 현재 구현 안한 관계로 잠시 주석처리 -->
            	<!-- 
                <ul class="articleBoard">
                    <li>전체 게시물</li>
                    <li>인기 게시물</li>
                </ul>
                 -->

                <div class="board">
                    <button class="sideBarBtn" onclick= "location='insertArticle.jsp'"> 글쓰기</button>
                </div>
            </aside>
        </div>
    </div>

    <footer>

        <div class="footerBox">
            <div class="footerLogo">
                <i class="fas fa-dice"></i>
                <a href="../controller/mainPageController.jsp">balook</a>
            </div>

            <ul class="footerMenu">
                <li><a href="../controller/mainPageController.jsp">Home</a></li>
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