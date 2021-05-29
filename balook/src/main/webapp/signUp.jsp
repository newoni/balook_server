<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>balook 회원가입</title>

    <!-- favicon 넣기 -->
    <link rel="shortcut icon" href="./img/favicon/다운로드.png">

    <meta name="title" content="balook 회원가입 페이지">
    <meta name="description" content="balook 회원가입 페이지 입니다.">

    <!-- og tag 넣기 -->
    <meta property="og:image" content="./img/page/p2Uy3c.jpg"> <!-- check og image 들어가는지 확인해보기-->
    <meta property="og:title" content="함께 즐기는 바둑 플랫폼 Balook 회원가입">
    <meta property="og:description" content="Balook 회원가입 페이지입니다">

    <!-- css 연결 -->
    <link rel="stylesheet" type="text/css" href="css/container.css">
    <link rel="stylesheet" type="text/css" href="css/signUp.css">

    <!-- 구글 폰트 연결-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

    <!-- font awesome 연결-->
    <script src="https://kit.fontawesome.com/1d8780591f.js" crossorigin="anonymous"></script>
</head>
<body>
	<section>
        <div class="signUpBody">
            <div class="logo">
                <i class="fas fa-dice"></i>
                <a href="./index.jsp">balook</a>
            </div>

            <form method="POST" action="UserController.jsp">
            	<input type="hidden" name="action" id="action" value="signUp">
                <div class="inputClass">
                    <div class="signUpId">
                        <label for="id">ID</label>
                        <input type="text" name="id" id="id" class="inputFormat" autocomplete="off" required>
                    </div>
                    <div class="signUpPassWord">
                        <label for="password">비밀번호</label>
                        <input type="password" name="password" id="password" class="inputFormat" autocomplete="off" required>
                    </div>
                    <div class="signUpUserInfo">
                        <div class="signUpName">
                            <label for="userName">이름</label>
                            <input type="text" name="userName" id="userName" class="inputFormat" autocomplete="off" required> 
                        </div>

                        <div class="phonNumberBox">
                            <label>전화번호</label>
                            <div>
                                <input type="text" name="phoneNumber" placeholder="전화번호 입력('-' 포함)" id="phoneNumber" class="phoneNumber" autocomplete="off" required>
                            </div>
                        </div>

                        <div class="eMail">
                            <label for="email">이메일</label>
                            <div class="eMailInput">
                                <input type="text" name="email" id="email" class="email" autocomplete="off" required>
                                <p>  @  </p>
                                <select name="domain">
                                    <option value="">--이메일 선택--</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="google.com">google.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                            </div> 
                        </div>
                    </div>
                </div>

                <input type="submit" class="signUpButton" value="회원가입"></input>
             </form>
        </div>
    </section>
</body>
</html>