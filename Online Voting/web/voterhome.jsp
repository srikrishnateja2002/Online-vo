
<%String id = (String)session.getAttribute("id");%>
<%String user = (String)session.getAttribute("user");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
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

.voter{
    height: 700px;
}

.home{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 50px;
    padding-left: 10%;
    padding-right: 5%;
}
.detail{
    position: absolute;
    top: 180px;
    left: 110px;
    color: #564a5f;
}
marquee{
    background: linear-gradient(to right, #ccccffb4 0%, #ffccffab 100%);
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
    <div class="voter">
        
        <% String query1="select start_date,end_date from votingdate where date_orgid='"+id+"' ";
        ResultSet rs1=stmt.executeQuery(query1);
        while(rs1.next())
        {
        %>
        <div class="date">
        <marquee behavior="scroll" direction="right" height="25px"  >Voting Starting data-time <%=rs1.getString(1)%> and Ending data-time <%=rs1.getString(2)%> </marquee>
        </div>
        <%
            }
         %>
        
        <%
        String query="select voter_name,voter_username,voter_gender,voter_email,voter_orgid,voter_phoneno from voters where voter_orgid='"+id+"' and voter_username='"+user+"' ";
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
        {
     
        %>
        <div class="home">
        <h2>Voter Details</h2><br>
        <div class="detail">
        <table cellspacing="20" >
            <tr>
                <td>Name :</td>
                <td><%=rs.getString(1)%></td>
            </tr>
            <tr>
                <td>Username :</td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <tr>
                <td>Gender :</td>
                <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
                <td>E-mail : </td>
                <td><%=rs.getString(4)%></td>
            </tr>
            <tr>
                <td>Org-Id :</td>
                <td><%=rs.getString(5)%></td>
            </tr>
            <tr>
                <td>Phone.no :</td>
                <td><%=rs.getLong(6)%></td>
            </tr>
        </table>
        </div>
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
            session.setAttribute("id", id);
        %>
        
    </div>
            <% session.setAttribute("id", id); %>
            <%session.setAttribute("user", user);%>
            
</body>
</html>