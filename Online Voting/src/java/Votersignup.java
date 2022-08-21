import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
public class Votersignup extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("name");
        String username=request.getParameter("user");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String orgid = request.getParameter("orgid");
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
            /*Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from voters where voter_username='"+username+"'");
            while (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username Already used');");
                out.println("</script>");
            }
            ResultSet rs2=st.executeQuery("select * from voters where  voter_email='"+email+"'");
            while (rs2.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('email Already used');");
                out.println("</script>");
            }
            ResultSet rs3=st.executeQuery("select * from voters where  voter_phone='"+phone+"'");
            while (rs3.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('phone Number Already used');");
                out.println("</script>");
            }
            ResultSet rs4=st.executeQuery("select * from voters where  voter_pwd='"+pwd+"'");
            while (rs4.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password Already used');");
                out.println("</script>");
            }*/
            
            
            PreparedStatement ps=con.prepareStatement( "insert into voters values(?,?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,username);
            ps.setString(3,email);
            ps.setString(4,gender);
            ps.setString(5,orgid);
            ps.setString(6,phone);
            ps.setString(7,pwd);
            
            
            int i = ps.executeUpdate();
            if(i>0){
                RequestDispatcher rd=request.getRequestDispatcher("/voterlogin.html");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('successfully registered');");
                out.println("</script>");
            }
        }
        catch(Exception e){
        System.out.println("Error:"+e.getMessage());
        }
        out.close();
        
        }
}
