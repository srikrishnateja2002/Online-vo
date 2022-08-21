import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.sql.*;
@MultipartConfig(maxFileSize = 16177216)
public class Participant extends HttpServlet {
     @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException,NumberFormatException {
       response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username=request.getParameter("user");
        String orgid = request.getParameter("orgid");
        Part image = request.getPart("img");
        Part file = request.getPart("file");
        System.out.println(image);
        System.out.println(file);

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        String user= (String)session.getAttribute("user");
        int verify=0;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting","root","abcd1234");
            PreparedStatement ps=con.prepareStatement( "insert into participants values(?,?,?,?,?)");
            InputStream  inputfile =file.getInputStream();
            InputStream inputimg =image.getInputStream();
            ps.setString(1,username);
            ps.setString(2,orgid);
            ps.setBlob(3, inputimg);
            ps.setBlob(4, inputfile);
            ps.setInt(5, verify);
            int i = ps.executeUpdate();
            if(i>0){
                RequestDispatcher rd=request.getRequestDispatcher("/voter_part_Reg.jsp");
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
