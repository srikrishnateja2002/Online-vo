<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
String username = request.getParameter("username");
Blob image = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");    
    stmt = con.createStatement();
    rs = stmt.executeQuery("select parti_file from participants where parti_username='"+username+"' ");
    while (rs.next()) {
    image = rs.getBlob(1);
    imgData = image.getBytes(1,(int)image.length());
    } 

    response.setContentType("text/txt");
    OutputStream o = response.getOutputStream();
    o.write(imgData);
    o.flush();
    o.close();
}  
    catch (SQLException e) {
    
    e.printStackTrace();
    
    }

%>  