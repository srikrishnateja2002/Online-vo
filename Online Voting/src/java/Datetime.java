import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class Datetime extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        session.setAttribute("id", id);
        String orgid = request.getParameter("orgid");
        if(orgid.equals(id)){
           String start= request.getParameter("start");
           String end = request.getParameter("end");
           Timestamp sqlstart = Timestamp.valueOf(start);
           Timestamp sqlend = Timestamp.valueOf(end);
                try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from votingdate where date_orgid='"+orgid+"'");
            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('orgid Already used');");
                out.println("</script>");
            }
            else{
            PreparedStatement ps=con.prepareStatement( "insert into votingdate values(?,?,?)");
            
            ps.setString(1,orgid);
            ps.setTimestamp(2,sqlstart);
            ps.setTimestamp(3,sqlend);
            
        int i = ps.executeUpdate();
            if(i>0){
                RequestDispatcher rd=request.getRequestDispatcher("/adminresult.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('successfully registered');");
                out.println("</script>");
            }
        }
                }
        catch(Exception e){
        System.out.println("Error:"+e.getMessage());
        }
        out.close();
      
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("/adminresult.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Worng Orgid');");
                out.println("</script>");
        }
    }
}
