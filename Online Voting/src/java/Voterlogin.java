import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
public class Voterlogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username=request.getParameter("user");
        String orgid = request.getParameter("orgid");
        String pwd = request.getParameter("pwd");
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from voters where voter_username='"+username+"' and voter_orgid='"+orgid+"' and voter_pwd='"+pwd+"'");
            
            
            if(rs.next())
            {
                HttpSession session = request.getSession();
                session.setAttribute("id", orgid);
                session.setAttribute("user", username);
                RequestDispatcher rd=request.getRequestDispatcher("/voterhome.jsp");
                rd.forward(request, response);
            }
            else
            {  
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Sorry UserName or Password Error!');");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/voterlogin.html");
                rd.include(request, response);
            }
        }
        catch(Exception e){
        System.out.println("Error:"+e.getMessage());
        }
        out.close();
        
        }
}