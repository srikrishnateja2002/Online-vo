<%@ page import="java.sql.*" %>
<%String user=(String)session.getAttribute("user");
String orgid=(String)session.getAttribute("orgid");%>
<%
try{
System.out.println(user+"  "+orgid);
String username="";
String query="";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
Statement stmt=con.createStatement();
query="select v.voter_name,p.parti_username from voters v ,participants p  where v.voter_orgid='"+orgid+"' and v.voter_username=p.parti_username and p.parti_verify=1";
ResultSet rs=stmt.executeQuery(query);
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

.home{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 50px;
    padding-left: 25%;
    padding-right: 5%;
}
.p{
   border: 2px;
    border-radius: 5px;
    height: 40px;
    width: 600px;
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
    width: 600px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 10px;
    background-color: rgba(105, 212, 146, 0.301);
}
.vote{
    background-color: #11cc5ffc;
    box-shadow: #096642 4px 4px 0px;
    border-radius: 8px;
    transition: transform 200ms,box-shadw 200ms;
    text-align: center;
  text-decoration: none;
  display: inline-block;
    padding: 10px 25px;
    font-family: 'Roboto Serif', serif;
    font-weight: 600;
    font-size: 16px;
    color: black;
}
.vote:active {
    transform: translateY(4px) translateX(4px);
    box-shadow: #096642 0px 0px 0px;
}
    </style>
</head>
<body>
    <div class="home">
    <div>
             <%

                    while(rs.next())
                    {
                    System.out.println(rs.getString(1));
                %>
            <table  cellpadding="10" cellspacing="40" class="p1">
               
                <tr >
                    <%username= rs.getString(2);%>
                    <td><img src="imgview.jsp?username=<%=username%>" width="70" height="70"></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td>
                        <a href="voting.jsp?username=<%=username%>" class="vote">vote</a>
                        
                    </td>
                   
                </tr>  
                
            </table> 
                        <%
                    }
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }
        %>
    </div>
    </div>
       
     <% session.setAttribute("user", user); %>
     <% session.setAttribute("orgid", orgid); %>
</body>
</html>
