<%@ page import="java.sql.*" %>
<%String user=(String)session.getAttribute("user");
//String username=(String)session.getAttribute("username");
String orgid=(String)session.getAttribute("orgid");
String username = request.getParameter("username");%>
<%
try{
System.out.println("voting.jsp "+user+"  "+orgid+" "+username);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
PreparedStatement ps=con.prepareStatement( "insert into vote values(?,?,?)");
ps.setString(1,orgid);
ps.setString(2,user);
ps.setString(3,username);
int i = ps.executeUpdate();
if(i>0){
    out.println("<script type=\"text/javascript\">");
    out.println("alert('successfully voted');");
    out.println("</script>");
    RequestDispatcher rd=request.getRequestDispatcher("/");
    rd.include(request, response);
}
        }
        catch(Exception e){
        System.out.println("Error:"+e.getMessage());
        }
        out.close();
        


%>