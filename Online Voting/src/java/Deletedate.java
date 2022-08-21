import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
public class Deletedate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        session.setAttribute("id", id);
         try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
            Statement st=con.createStatement();
           int i= st.executeUpdate("delete from votingdate where date_orgid='"+id+"' ");
            if (i>0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Date and time deleted');");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/adminresult.jsp");
                rd.include(request, response);
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Date and time already deleted');");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/adminresult.jsp");
                rd.include(request, response);
            }
         }  
         catch(Exception e){
        System.out.println("Error:"+e.getMessage());
        }
}
}
