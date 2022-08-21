import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
public class Adminsignup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("name");
        String username=request.getParameter("user");
        String email = request.getParameter("email");
        String orgid = request.getParameter("orgid");
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
           /* Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from admins where admin_username='"+username+"'");
            ResultSet rs1=st.executeQuery("select * from admins where  admin_orgid='"+orgid+"'");
            ResultSet rs2=st.executeQuery("select * from admins where  admin_email='"+email+"'");
            ResultSet rs3=st.executeQuery("select * from admins where  admin_phone='"+phone+"'");
            ResultSet rs4=st.executeQuery("select * from admins where  admin_pwd='"+pwd+"'");

            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username Already used');");
                out.println("</script>");
            }  
            else if (rs1.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('orgid Already used');");
                out.println("</script>");
            }
            else if (rs2.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('email Already used');");
                out.println("</script>");
            }
            else if (rs3.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('phone Number Already used');");
                out.println("</script>");
            }
            else if (rs4.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password Already used');");
                out.println("</script>");
            }*/

            //else{
            PreparedStatement ps=con.prepareStatement( "insert into admins values(?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,username);
            ps.setString(3,email);
            ps.setString(4,orgid);
            ps.setString(5,phone);
            ps.setString(6,pwd);
            
            
            int i = ps.executeUpdate();
            if(i>0){
                RequestDispatcher rd=request.getRequestDispatcher("/adminlogin.html");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('successfully registered');");
                out.println("</script>");
            }
            }
        //}
        catch(Exception e){
        System.out.println("Error:"+e.getMessage());
        }
        out.close();
        
        }
}


