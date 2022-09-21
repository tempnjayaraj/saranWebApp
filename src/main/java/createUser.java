import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig(fileSizeThreshold=1024*1024*2,
                 maxFileSize=1024*1024*10,
                 maxRequestSize=1024*1024*50)
@WebServlet(urlPatterns = "/createUser")
public class createUser extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = new File(".").getCanonicalPath();
        System.out.println("Working from "+path);
        req.getRequestDispatcher("Pages/CreateUser.jsp").
                        forward(req, resp);
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("fname");
        String lastName = req.getParameter("lname");
        String gender = req.getParameter("gender");
        String phoneNumber = req.getParameter("phone");
        String address = req.getParameter("dno") +", "+ req.getParameter("l1")+", " + req.getParameter("l2")+", "+req.getParameter("l3");
        String pin = req.getParameter("pin");
        String dateOfBirth = req.getParameter("date")+req.getParameter("month")+req.getParameter("year");
        String email1 = req.getParameter("email1");
        String email2 = req.getParameter("email2");
        String pass1 = req.getParameter("pass1");
        String pass2 = req.getParameter("pass2");
        String userID = java.util.UUID.randomUUID().toString();

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String savePath = "C:/Users/johns/Desktop/Images";
        Part part=req.getPart("uploadFile");
        // String fileName=extractFileName(part);
        Date date = new Date();

        String fileName=userID+date.getTime()+".jpg";
        // Path path = Path.of("C:\\Users\\johns\\Desktop\\Images");
        part.write(savePath + File.separator + fileName);
        
        
        // /*if you may have more than one files with same name then you can calculate some random characters and append that characters in fileName so that it will  make your each image name identical.*/
        String filePath= savePath + File.separator + fileName ;
        // out.print(filePath);
        String imgSQL = "insert into imageTable values('"+userID+"','"+filePath+"');";
        String sql = "insert into swa_USERS_TABLE values('"+userID+"',";
        sql+="'"+email1+"',";
        sql+="'"+pass1+"',";
        sql+="'"+firstName+"',";
        sql+="'"+lastName+"',";
        sql+= gender+",";
        sql+= phoneNumber+",";
        sql+="'"+address+"',";
        sql+= pin+",";
        sql+="'"+dateOfBirth+"',";
        sql+="'"+filePath+"');";
        // System.out.println(sql);
        // out.print(file);
        try {
            DataBase.postintoDB(sql);
            DataBase.postintoDB(imgSQL);
            out.print("<html>");
            out.print("<head><title>Successful</title></head>");
            out.print("<body>");
            out.print("<p>User created successfully, please login with your email ID and password");
            out.print("<form action='login'><input type='submit' value='Go to Login Page'/></form>");
            out.print("</body></html>");
            // out.println(firstName+lastName+gender+phoneNumber+address+pin+dateOfBirth+email1+email2+pass1+pass2);
            // out.println(DataBase.createMultipleResultSet("select * from swa_USERS_TABLE"));
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
      
    }
}
