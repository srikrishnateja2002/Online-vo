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
    width: 1050px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 10px;
    background-color: rgba(105, 212, 146, 0.301);
}
.p2{
   border: 2px;
    border-radius: 5px;
    height: 100px;
    width: 1050px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 10px;
    background-color: rgba(105, 182, 212, 0.301); 
}
.add{
    background-color: #11cc5ffc;
    box-shadow: #096642 4px 4px 0px;
    border-radius: 8px;
    transition: transform 200ms,box-shadw 200ms;
    height: 35px;
    width: 80px;
    font-family: 'Roboto Serif', serif;
    font-weight: 600;
    font-size: 16px;

}
.add:active {
    transform: translateY(4px) translateX(4px);
    box-shadow: #096642 0px 0px 0px;
}
.remove{
    background-color: #ec2c56;
    box-shadow: #661209 4px 4px 0px;
    border-radius: 8px;
    transition: transform 200ms,box-shadw 200ms;
    height: 35px;
    width: 100px;
    font-family: 'Roboto Serif', serif;
    font-weight: 600;
    font-size: 16px;

}
.remove:active {
    transform: translateY(4px) translateX(4px);
    box-shadow: #661209 0px 0px 0px;
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
        <div class="part">
            
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
               
                <tr >
                    <%username1= rs1.getString(2);%>
                    <td><img src="imgview.jsp?username=<%=rs1.getString(2)%>" width="70" height="70"></td>
                    <td><%=rs1.getString(1)%></td>
                    <td><%=rs1.getString(2)%></td>
                    <td><%=rs1.getString(3)%></td>
                    <td><%=rs1.getString(4)%></td>
                    <td><%=rs1.getString(5)%></td>
                    <td><a href="fileview.jsp?username=<%=rs1.getString(2)%>">Download</a></td>
                    <td>
                        <form action="remove.jsp">
                            <button type="submit" class="remove">REMOVE</button>
                            <% session.setAttribute("username1", username1); %>
                        </form>
                    </td>
                </tr>  
                
            </table> 
                        <%
                    }
                %>
                <%
                    String query="select v.voter_name,v.voter_username,v.voter_gender,v.voter_email,v.voter_phoneno,p.parti_file from voters v ,participants p  where v.voter_orgid='"+id+"' and v.voter_username=p.parti_username and p.parti_verify=0";
                    ResultSet rs=stmt.executeQuery(query);
                    while(rs.next())
                    {
                %>
            <table  cellpadding="10" cellspacing="40" class="p2">
                
                <tr >
                    <%username= rs.getString(2);%>
                    <td><img src="imgview.jsp?username=<%=rs.getString(2)%>" width="70" height="70"></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><a href="fileview.jsp?username=<%=rs.getString(2)%>">Download</a></td>
                    <td>
                        <form action="add.jsp">
                            <button type="submit" class="add">ADD</button>
                            <% session.setAttribute("username", username); %>
                        </form>
                    </td>
                </tr>  
                
            </table>
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
    </div>
     <% session.setAttribute("id", id); %>
</body>
</html>