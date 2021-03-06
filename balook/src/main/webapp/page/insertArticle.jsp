<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balook 게시글 작성</title>

     <!-- og tag 넣기 -->
     <meta property="og:image" content="../img/page/p2Uy3c.jpg"> <!-- check og image 들어가는지 확인해보기-->
     <meta property="og:title" content="함께 즐기는 바둑 플랫폼 Balook">
     <meta property="og:description" content="함께 즐기는 바둑 플랫폼 Balook 게시글 작성 페이지">
 
     <!-- favicon 넣기 -->
     <link rel="shortcut icon" href="../img/favicon/다운로드.png">
 
     <!-- css 연결 -->
     <link rel="stylesheet" type="text/css" href="../css/container.css">
     <link rel="stylesheet" type="text/css" href="../css/header.css">
     <link rel="stylesheet" type="text/css" href="../css/articleInput.css">
     <link rel="stylesheet" type="text/css" href="../css/footer.css">
 
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

    <sction>
        <div class="inputCard">
            <div class="logo">
                <i class="fas fa-dice"></i>
                <a href="../controller/mainPageController.jsp">balook</a>
            </div>
            <form method="POST" action="../controller/ArticleController.jsp">
            	<input type="hidden" name="action" id="action" value="create">
                <div class="titleDiv">
                    <label for="title" >제목</label>
                    <input type="text" class="titleText" name="title" id="title">
                </div>

                <div class="contentsDiv">
                    <label for="contents">내용</label>
                    <textarea name="contents" id="contents" class="contentsArea" placeholder="내용을 입력해주세요"></textarea>
                </div>

                <input type="submit" class="submitBtn" value="글쓰기"> 

            </form>
        </div>
    </sction>

    <footer>

        <div class="footerBox">
            <div class="footerLogo">
                <i class="fas fa-dice"></i>
                <a href="../controller/mainPageController.jsp">balook</a>
            </div>

            <ul class="footerMenu">
                <li><a href="../controller/mainPageController.jsp"></a>Home</a></li>
                <li><a href="./community.jsp"></a>Community</a></li>
                <li><a href="#"></a>test1</a></li>
                <li><a href="#"></a>test2</a></li>
                <li><a href="#"></a>test3</a></li>
            </ul>
            
            <button class="topButton" onclick="topBtnAction()">top</button>

            <ul class="footerTail">
                <li><a href="#">개발자 소개</a></li>
                <li><a href="#">contact</a></li>
                <li><a href="#">광고 안내</a></li>
            </ul>

            <p>Copyright 2021-2021 kanghyeok heo. all rights reserved.</p>
        </div>

    </footer>
</body>
</html>