<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>                                                                     
<%@page import="java.net.URLConnection"%>                                                                                                                                                                                                                                                                                 
<%@page import="java.net.URLEncoder"%> 
<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>                          
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">         
<title>Insert title here</title>
</head>
<body>
<%
String user=request.getParameter("user");
String orgid=request.getParameter("orgid");
session.setAttribute("user",user); 
session.setAttribute("orgid",orgid);
try {
java.util.Date date = new java.util.Date();
java.sql.Timestamp current =new java.sql.Timestamp(date.getTime());
String s ="";
String e ="";
try {
    String phone="";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");    
    Statement stmt=con.createStatement();
    Statement stmt1=con.createStatement();
    Statement stmt2=con.createStatement();
    String query2="select * from votingdate where date_orgid='"+orgid+"' ";
    ResultSet rs2=stmt.executeQuery(query2);
    if (rs2.next()){
       
        s=rs2.getString(2);
        e=rs2.getString(3);
    }
    System.out.println("s "+s);
    System.out.println("e "+e);

    //Timestamp start = new Timestamp(DateUtil.provideDateFormat().parse(s).getTime());
    //Timestamp end = new Timestamp(DateUtil.provideDateFormat().parse(e).getTime());
    
    Timestamp start = Timestamp.valueOf(s);
    Timestamp end = Timestamp.valueOf(e);
    /*java.util.Date sdate = new SimpleDateFormat("YYYY-MM-DD").parse(s);
    java.sql.Timestamp start =new java.sql.Timestamp(sdate.getTime());
    java.util.Date edate = new SimpleDateFormat("YYYY-MM-DD").parse(e);
    java.sql.Timestamp end =new java.sql.Timestamp(edate.getTime());*/

    System.out.println("current "+current);
    System.out.println("start "+start);
    System.out.println("end "+end);
    if((current.before(start))||(current.after(end)) )
    {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Voting is not started yet or completed');");
        out.println("</script>");
        RequestDispatcher rd1=request.getRequestDispatcher("/");
        rd1 .include(request, response);
    }
    else{
    String query="select *  from vote where voter='"+user+"' ";
    ResultSet rs=stmt2.executeQuery(query);
    if(rs.next())
    {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('This participant already voted');");
        out.println("</script>");
        RequestDispatcher rd=request.getRequestDispatcher("/");
        rd.include(request, response);
    }
    else{
    System.out.println("OTP");
    String query1="select voter_phoneno from voters where voter_username='"+user+"' ";
    ResultSet rs1=stmt1.executeQuery(query1);
    if(rs1.next()){
    phone= rs1.getString(1);
    }
    System.out.println(phone);
    
    String mobiles = phone;
    Random rand = new Random();
    int otp = rand.nextInt(900000) + 100000;
    session.setAttribute("otp",otp);
    String senderId = "ABCDEF";
    String message = "Your OTP is "+otp;
    String route="4";
    URLConnection myURLConnection=null;
    URL myURL=null;
    BufferedReader reader=null;                                                    
    String encoded_message=URLEncoder.encode(message);  
    String mainUrl="https://2factor.in/API/V1/0d45a91c-f553-11ec-9c12-0200cd936042/SMS/";    
    StringBuilder sbPostData= new StringBuilder(mainUrl);
    sbPostData.append("/"+phone);                                                            
    sbPostData.append("/"+otp);           
    mainUrl = sbPostData.toString();
    try
    {
        //prepare connection
        myURL = new URL(mainUrl);
        myURLConnection = myURL.openConnection();
        myURLConnection.connect();
        reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
        String success="Your message sent sucessfully"; 
        response.sendRedirect("otp.jsp");

        //finally close connection 
        reader.close();     
    }catch (Exception e1){                   
            e1.printStackTrace();  
    }
    }
    }
    }catch (Exception e2) {
    
    e2.printStackTrace();
    
    }
    } catch (Exception e3) {
    e3.printStackTrace();
}
    %>
    
</body>
</html>
