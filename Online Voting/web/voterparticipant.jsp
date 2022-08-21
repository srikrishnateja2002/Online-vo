<%@ page import="java.sql.*" %>
<%String id = (String)session.getAttribute("id");%>
<%String user = (String)session.getAttribute("user");%>
<%
String username,username1;
try{
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
.p{
   border: 2px;
    border-radius: 5px;
    height: 40px;
    width: 1000px;
    display: flex;
    align-items: center;
    padding: 10px;
    justify-content: space-between;
    margin: 10px;
    background-color: rgba(212, 105, 128, 0.301);
}
.p1{
   border: 2px;
    border-radius: 5px;
    height: 100px;
    width: 1000px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 10px;
    background-color: rgba(105, 212, 146, 0.301);
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
        <div class="home">
            <div>
         <table cellpadding="10" cellspacing="50" class="p">
                <tr >
                    <td>Logo</td>
                    <td>Name</td>
                    <td>Username</td>
                    <td>Gender</td>
                    <td>E-mail</td>
                    <td>Phone</td>
                    <td>Manifesto</td>
                </tr>
         </table >
             <%
                    String query1="select v.voter_name,v.voter_username,v.voter_gender,v.voter_email,v.voter_phoneno,p.parti_file from voters v ,participants p  where v.voter_orgid='"+id+"' and v.voter_username=p.parti_username and p.parti_verify=1";
                    ResultSet rs1=stmt.executeQuery(query1);
                    while(rs1.next())
                    {
                %>
            <table  cellpadding="10" cellspacing="40" class="p1">
               
                <tr>
                    
                    <td><img src="imgview.jsp?username=<%=rs1.getString(2)%>" width="70" height="70"></td>
                    <td><%=rs1.getString(1)%></td>
                    <td><%=rs1.getString(2)%></td>
                    <td><%=rs1.getString(3)%></td>
                    <td><%=rs1.getString(4)%></td>
                    <td><%=rs1.getString(5)%></td>
                    <td><a href="fileview.jsp?username=<%=rs1.getString(2)%>">Download</a></td>
                </tr> 
                </table >
                <%
                    }
                 %>
                
        </div>
                 <%
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }
        %>
                </div >

            <% session.setAttribute("id", id); %>
            <%session.setAttribute("user", user);%>
</body>
</html>