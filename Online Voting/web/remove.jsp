<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%String username1 = (String)session.getAttribute("username1");%>
<% 
System.out.println("Error:"+username1);
try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");    
    Statement stmt=con.createStatement();
    //stmt = con.createStatement("Update participants set parti_verify=1 from participants where parti_username='"+username+"' ");
    int i = stmt.executeUpdate("Update participants set parti_verify=0 where parti_username='"+username1+"' ");
    if(i>0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('This participant is removed');");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/adminparticipant.jsp");
                rd.include(request, response);
            }
        }  
    catch (SQLException e) {
    
    e.printStackTrace();
    
    }

%>