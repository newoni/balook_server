<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <title>함께 즐기는 바둑 플랫폼 Balook</title>

    <meta name="title" content="함께 즐기는 바둑 플랫폼 Balook">
    <meta name="description" content="함께 즐기는 바둑 플랫폼 Balook 메인페이지입니다.">

    <!-- og tag 넣기 -->
    <meta property="og:image" content="./img/page/p2Uy3c.jpg"> <!-- check og image 들어가는지 확인해보기-->
    <meta property="og:title" content="함께 즐기는 바둑 플랫폼 Balook">
    <meta property="og:description" content="함께 즐기는 바둑 플랫폼 Balook 메인페이지입니다..">

    <!-- favicon 넣기 -->
    <link rel="shortcut icon" href="./img/favicon/다운로드.png">

    <!-- css 연결 -->
    <link rel="stylesheet" type="text/css" href="css/container.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/section.css">
    <link rel="stylesheet" type="text/css" href="css/footer.css">

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

    <section>
        
        <div class=middle>
            
            <img src="img/page/cTGA3I.jpg" class="img4pc">
            <img src="img/page/img4M.jpg" class="img4mobile">
            <img src="img/page/img4Pad.jpg" class="img4pad">
            <div class="textBoxOuter">
                <p>Community for Baduk</p>
            </div>

            <div class="overlay"></div>

        </div>
        
    </section>

    <footer>

        <div class="footerBox">
            <div class="footerLogo">
                <i class="fas fa-dice"></i>
                <a href="./mainPageController.jsp">balook</a>
            </div>

            <ul class="footerMenu">
                <li><a href="./mainPageController.jsp"></a>Home</a></li>
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

    <!-- js 연결-->
    <script src="./js/menuBtn.js" defer></script>
    <script src="./js/alert.js" defer></script>
</body>

  
</html>