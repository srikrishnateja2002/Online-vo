<%String id = (String)session.getAttribute("id");%>
<%String user = (String)session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif:ital,opsz,wght@0,8..144,200;1,8..144,200&display=swap" rel="stylesheet">
    <title>voter Home</title>
    <style>
        *{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-image: url("images/background.png");
    background-repeat: no-repeat;
    background-size: auto;
    font-family: 'Roboto Serif', serif;
}
nav{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 25px;
    padding-left: 2%;
    padding-right: 5%;
}
.log{
    color: #564a5f;
    font-size: 35px;
    letter-spacing: 1px ;
    cursor: pointer;
    text-shadow: #bfbaff 2px 2px,#ffdef7 4px 4px;
}
nav ul li{
    list-style-type: none;
    display: inline-table;
    padding: 10px 25px;
}
nav ul li a{
    color: #564a5f;
    text-decoration: none;
    font-weight: bold;
    text-transform: capitalize;
}
nav ul li a:hover{
    color: #b63e58;
    transition: .4s;
    font-weight: bolder;
}
.logout{
    background-color: #b63e58;
    color: #ffffff;
    text-decoration: none;
    border: 2px solid transparent;
    font-weight: bold;
    padding: 10px 25px;
    border-radius: 30px;
    transition: teansform .4s;
}
.logout:hover{
    transform: scale(1.1);
}


.home{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 50px;
    padding-left: 10%;
    padding-right: 5%;
}


.inp{
    height: 30px;
    width: 320px;
    background-color: rgba(236, 215, 245, 0.342);
    border: 10px;
    border-color: #1a1212;
    border-radius: 5px;
    font-family: 'Roboto Serif', serif;
}
.reg{
    background-color: #1197cc;
    box-shadow: #094c66 4px 4px 0px;
    border-radius: 8px;
    transition: transform 200ms,box-shadw 200ms;
    height: 35px;
    width: 135px;
    font-family: 'Roboto Serif', serif;
    font-weight: 600;
    font-size: 16px;

}
.reg:active {
    transform: translateY(4px) translateX(4px);
    box-shadow: #094c66 0px 0px 0px;
}

.signup{
    height: 400px;
    width: 400px;
    position: absolute;
    top: 130px;
    left: 450px;
    bottom : 50px;
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
.signtxt{
    font-family: 'Roboto Serif', serif;
    text-align: center;
    font-weight: 700;
    color: #564a5f;
    position: absolute;
    top: 10px;
    left: 20px
}
.signuser{
    position: absolute;
    top:100px;
    left:35px;
}
.signorg{
    position: absolute;
    top:160px;
    left:35px;
}
.signpwd{
    position: absolute;
    top:220px;
    left:35px;
}
.signpwdc{
    position: absolute;
    top:270px;
    left:35px;
}
.signbutt{
    position: absolute;
    top:330px;
    left:120px;
}
.box{
    height: 700px;
}
    </style>
</head>
<body>

    <div class="menu">
        <nav>
            <h2 class="log">Online Voting</h2>
            <ul>
                <li><a href="voterhome.jsp">Home</a></li>
                <li><a href="voter_part_Reg.jsp">Participants<br>Registration</a></li>
                <li><a href="voterparticipant.jsp">Participant</a></li>
                <li><a href="voterresult.jsp">Result</a></li>
            </ul>
            <form action="/Online_Voting">
            <button type="submit" onclick="<% session.removeAttribute("id"); %>"  class="logout">Logout</a>
            </form>
        </nav>
    </div>
    <div class="box">
        
    <div class="signup">
        <form method="POST" action="Participant"  enctype="multipart/form-data" >
            <div class="signtxt"><h1>Participants Registration</h1></div>
                <div class="signuser"><input type="text" name="user"  placeholder="Username*" class="inp" required></div>
                <div class="signorg"><input type="text" name="orgid"  placeholder="Organition Id*" class="inp" required></div>
                <div class="signpwd">Upload your logo<input type="file" name="img" accept="image/x-png,image/gif,image/jpeg"  required></div>
                <div class="signpwdc">Upload your manifesto<input type="file" name="file" accept=".txt"   required></div>
                <div class="signbutt"><button type="submit" class="reg">Register</button></div>
        </form>
    </div>
          <% session.setAttribute("id", id); %> 
          <%session.setAttribute("user", user);%>
  </div>
</body>
</html>