<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%String username = (String)session.getAttribute("username");%>
<% 
System.out.println("Error:"+username);
try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");    
    Statement stmt=con.createStatement();
    //stmt = con.createStatement("Update participants set parti_verify=1 from participants where parti_username='"+username+"' ");
    int i = stmt.executeUpdate("Update participants set parti_verify=1 where parti_username='"+username+"' ");
    if(i>0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('This participant is allowed');");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/adminparticipant.jsp");
                rd.include(request, response);
            }
        }  
    catch (SQLException e) {
    
    e.printStackTrace();
    
    }

%>
