<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../controller/ArticleController.jsp" %>
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
    <link rel="stylesheet" type="text/css" href="../css/readArticle.css">
    <link rel="stylesheet" type="text/css" href="../css/readOneArticle.css">

    <!-- js 연결-->
    <script src="../js/menuBtn.js" defer></script>
    <script src="../js/alert.js" defer></script>
    <script src="../js/request.js" defer></script>

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

    <section>
        <div class="card">
            <P class="title"><%=responseArticle.getTitle() %></P>
            <P class="author"><%=responseArticle.getAuthor() %></P>
            <P class="author"><%=responseArticle.getDate() %></P>
            <div class="contents">
                <%=responseArticle.getContents() %>
            </div>
            <form type="POST" action="../controller/ArticleController.jsp">
	            <input type="hidden" name="action" value="updatePage">
	            <input type="hidden" name="author" value="<%=responseArticle.getAuthor() %>">
	            <input type="hidden" name="title" value="<%=responseArticle.getTitle()%>">
	            <input type="hidden" name="contents" value="<%=responseArticle.getContents() %>">
	            
	            <script>
	            	var author = "<%=responseArticle.getAuthor()%>";
	            	var sessionId = "<%=session.getAttribute("id")%>";
	            	if(author == sessionId){
	            		document.write("<div class='div4editArticle'>");
	            		
		            		document.write("<input type='submit' value='수정하기' class='editBtn'></input>");
	    	        		document.write("<div class='editBtn'><a href='../controller/ArticleController.jsp?action=delete'>삭제하기</a></div>");
	            		
	            		document.write("</div>");
	            	}
	            </script>
            </form>
        </div>
    </section>

    <footer>

        <div class="footerBox">
            <div class="footerLogo">
                <i class="fas fa-dice"></i>
                <a href="./index.html">balook</a>
            </div>

            <ul class="footerMenu">
                <li><a href="./index.jsp">Home</a></li>
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