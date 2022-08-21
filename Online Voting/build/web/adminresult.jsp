<%@ page import="java.sql.*" %>
<%String id = (String)session.getAttribute("id");%>
    <%
try{
String username="";
String username1="";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
Statement stmt=con.createStatement();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif:ital,opsz,wght@0,8..144,200;1,8..144,200&display=swap" rel="stylesheet">
    <title>Admin Home</title>
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
.date{
    height: 300px;
    width: 400px;
    position: absolute;
    top: 155px;
    left: 150px;
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
.org{
    position: absolute;
    top:40px;
    left:35px;
}
.start{
    position: absolute;
    top:95px;
    left:35px;
}
.end{
    position: absolute;
    top:170px;
    left:35px;
}
.but{
    position: absolute;
    top:240px;
    left:120px;
}
.vote{
     position: absolute;
    top:180px;
    left:900px;
    font-size: 20px;
}
.re{
     position: absolute;
    top:160px;
    left:1000px;
    font-size: 20px;
}
.del{
     position: absolute;
    top:500px;
    left:100px;
    font-size: 20px;
}
.but1{
    position: absolute;
    top:0;
    left:950px;
    font-size: 20px;
}
.reg1{
    background-color: #1197cc;
    box-shadow: #094c66 4px 4px 0px;
    border-radius: 8px;
    transition: transform 200ms,box-shadw 200ms;
    height: 40px;
    width: 150px;
    font-family: 'Roboto Serif', serif;
    font-weight: 600;
    font-size: 16px;

}
.reg1:active {
    transform: translateY(4px) translateX(4px);
    box-shadow: #094c66 0px 0px 0px;
}
    </style>
</head>
<body>

    <div class="menu">
        <nav>
            <h2 class="log">Online Voting</h2>
            <ul>
                <li><a href="adminhome.jsp">Home</a></li>
                <li><a href="adminvoters.jsp">Voters</a></li>
                <li><a href="adminparticipant.jsp">Participant</a></li>
                <li><a href="adminresult.jsp">Voting&Result</a></li>
            </ul>
            <form action="/Online_Voting">
            <button type="submit" onclick="<% session.removeAttribute("id"); %>"  class="logout">Logout</a>
            </form>
        </nav>
    </div>
    <div class="home">
         <h2>Enter Date and Time to start your's Online voting portal and ends </h2> 
        <div class="date">
            <form action="Datetime" method="POST">
                <div class="org"><input type="text" name="orgid" placeholder="Org Id*"  required class="inp" ></div>
                <div class="start">Starting Date Time<input type="datetime" name="start" value="yyyy-mm-dd hh:mm:ss" placeholder="Starting Date Time" required class="inp"></div>
                <div class="end">Ending Date Time<input type="datetime" name="end" value="yyyy-mm-dd hh:mm:ss" placeholder="Ending Date Time" required class="inp"></div>
                <div class="but"><button type="submit" class="reg">Submit</button></div>
            </form>
        </div>
         <h2 class="re"><B>VOTING RESULT</B></h2>
             <%
                    String query1="select v1.voter_name,v.parti,count(v.voter) from vote v ,voters v1 where v1.voter_orgid='"+id+"' and  v.parti=v1.voter_username  group by v.voter";
                    ResultSet rs1=stmt.executeQuery(query1);
                    while(rs1.next())
                    {
                %>
                <div class="vote">
                    <table  cellpadding="10" cellspacing="40" class="p2">
                 <tr >
                    <th>Name</th>
                    <th>Username</th>
                    <th>Vote Count</th>   
                </tr>        
                <tr >
                    <td><%=rs1.getString(1)%></td>
                    <td><%=rs1.getString(2)%></td>
                    <td><%=rs1.getString(3)%></td>   
                </tr>  
                
            </table>
                        <%
                    }
                %>
        </div>
         <div class="del">
             <h2>Delete Date and Time to start your's Online voting portal and ends</h2>
             <form action="Deletedate" method="POST"> 
                 <div class="but1"><button type="submit" class="reg1">DELETE DATE & TIME</button></div>
             </form>
         </div>
        <%
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }
        %>
    </div>
     <% session.setAttribute("id", id); %>
</body>
</html>
