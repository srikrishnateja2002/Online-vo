<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id = (String)session.getAttribute("id");


try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
Statement stmt=con.createStatement();
String query="select admin_name,admin_username,admin_email,admin_orgid,admin_phoneno from admins where admin_orgid='"+id+"' ";
ResultSet rs=stmt.executeQuery(query);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif:ital,opsz,wght@0,8..144,200;1,8..144,200&display=swap" rel="stylesheet">
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
.detail{
    position: absolute;
    top: 160px;
    left: 110px;
    color: #564a5f;
    
}
    </style>
    
    <title>Admin Home</title>
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
        <h2>Admin Details</h2><br>
        <%
        
        while(rs.next())
        {
     
        %>
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
                <td>E-mail : </td>
                <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
                <td>Org-Id :</td>
                <td><%=rs.getString(4)%></td>
            </tr>
            <tr>
                <td>Phone.no :</td>
                <td><%=rs.getLong(5)%></td>
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
            //response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            //response.setHeader("Pragma","no-cache");
            //response.setHeader("Expires","0");
        %>
</body>
</html>
