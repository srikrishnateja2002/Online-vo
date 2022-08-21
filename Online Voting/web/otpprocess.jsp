<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String user=(String)session.getAttribute("user");
String orgid=(String)session.getAttribute("orgid");
int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);

if(otp==enterOtp)
{
	out.println("<script type=\"text/javascript\">");
        out.println("alert('vote the participant');");
        out.println("</script>");
        RequestDispatcher rd=request.getRequestDispatcher("/vote.jsp");
        rd.include(request, response);
}
else
{
        out.println("<script type=\"text/javascript\">");
        out.println("alert('otp is worng');");
        out.println("</script>");
        RequestDispatcher rd=request.getRequestDispatcher("/");
        rd.include(request, response);
}
session.setAttribute("user",user); 
session.setAttribute("orgid",orgid);
%>