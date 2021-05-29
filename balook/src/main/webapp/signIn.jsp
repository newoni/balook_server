<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>

    <!-- favicon 넣기 -->
    <link rel="shortcut icon" href="./img/favicon/다운로드.png">

    <!-- css 연결 -->
    <link rel="stylesheet" type="text/css" href="css/container.css">
    <link rel="stylesheet" type="text/css" href="css/signIn.css">


    <!-- og tag 넣기 -->
    <meta property="og:image" content="./img/page/p2Uy3c.jpg"> <!-- check og image 들어가는지 확인해보기-->
    <meta property="og:title" content="함께 즐기는 바둑 플랫폼 Balook 로그인">
    <meta property="og:description" content="Balook 로그인 페이지입니다">

    <!-- 구글 폰트 연결-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

    <!-- font awesome 연결-->
    <script src="https://kit.fontawesome.com/1d8780591f.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- color reference: https://in.pinterest.com/pin/28006828920022766/?d=t&mt=login -->


    <div class="signInBody">

        <div class="logo">
            <i class="fas fa-dice"></i>
            <a href="./index.jsp">balook</a>
        </div>
        
            
        <form method="POST" action="UserController.jsp">
            <div class="inputFlex">
                
                <div class="inputUnit">
                    
                    <div class="rowFlex">
                        <label for="id" >ID</label>
                        <input type="text" name="id" id="id" class="inputIDPW" autocomplete="off" required>
                    </div>
                    
                
                    <div class="rowFlex">
                    <label for="password">PASSWORD</label>
                    <input type="password" name="password" id="password" class="inputIDPW" autocomplete="off" required>
                    </div>
                </div>
                

            </div>
            <button id="btn" type="submit" class="logInButton">LOGIN</button>


        </form>
        
        <ul class="checkingUserBox">
            <li>아이디 찾기</li>
            <li>비밀번호 찾기</li>
            <li>회원가입</li>
        </ul>
    
    </div>
</body>
</html>