<%@page import="java.util.Random"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Serif:ital,opsz,wght@0,8..144,200;1,8..144,200&display=swap" rel="stylesheet">
<style>
        body{
    background-image: url("images/background.png");
    background-size: cover;
    background-repeat: no-repeat;
    font-family: 'Roboto Serif', serif;
}
.login{
    height: 250px;
    width: 300px;
    position: absolute;
    top: 120px;
    left: 500px;
    display: flex;
    flex-direction: column;
    background-color: rgba(255, 255, 255, 0.082);
    box-shadow: 0 8px 32px 0 rgba(8, 8, 8, 0.329);
    border-left: 1px solid rgba(255, 255, 255, 0.24);
    border-top: 1px solid rgba(255, 255, 255, 0.24);
    border-radius: 10px;
    align-items: center;
    box-sizing: border-box;
    padding: 30px;
}
.log{
    text-align: center;
    font-weight: 700;
    color: #564a5f;
    position: absolute;
    top: 20px;
    left: 115px;
}
.inp{
    height: 30px;
    width: 270px;
    background-color: rgba(236, 215, 245, 0.342);
    border: 10px;
    border-color: #1a1212;
    border-radius: 5px;
    font-family: 'Roboto Serif', serif;
}

.submit{
    background-color: #1197cc;
    box-shadow: #094c66 4px 4px 0px;
    border-radius: 8px;
    transition: transform 200ms,box-shadw 200ms;
    height: 35px;
    width: 100px;
    font-family: 'Roboto Serif', serif;
    font-weight: 600;
    font-size: 16px;

}
.submit:active {
    transform: translateY(4px) translateX(4px);
    box-shadow: #094c66 0px 0px 0px;
}
.logorg{
    position: absolute;
    top: 60px;
    left: 15px;
}
.blogotp{
    position: absolute;
   top: 150px;
    left: 100px;
}
</style>

</head>
<body>
    <div class="login">
        <form   action="otpprocess.jsp"  >
            <div class="logorg">
                <input type="text" name="otpvalue" placeholder="otpvalue*" required class="inp">
            </div>
            <div class="blogotp">
                <button class="submit" type="submit">Login</button>
            </div>
        </form>
    </div>
</body>
</html>