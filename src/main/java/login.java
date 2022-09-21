import java.io.File;
import java.util.List;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(urlPatterns = "/login")
public class login extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("Pages/index.jsp").
        forward(req, resp);
       
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String uname = req.getParameter("uname");
        String pass = req.getParameter("pass");
        try {
            String isOldUser = DataBase._createSingleResultSet("select emailID from swa_USERS_TABLE where emailID='"+uname+"'");
            if(isOldUser==""){
                req.setAttribute("errorMsg", "Hey dude, seems you are new to Saran Web App");
                req.getRequestDispatcher("Pages/index.jsp").
                        forward(req, resp);
            }else{
                String passFromDB = DataBase._createSingleResultSet("select pass from swa_USERS_TABLE where emailID='"+uname+"'");   
                System.out.println(passFromDB);
                System.out.println(pass);
                if(!pass.equals(passFromDB)){
                    System.out.println("Wrong Password");
                    req.setAttribute("errorMsg", "Hey dude, seems like you entered a wrong password");
                    req.getRequestDispatcher("Pages/index.jsp").
                        forward(req, resp);
                }else{
                    System.out.println("Right Password");
                    HttpSession session = req.getSession();
                    String firstName = DataBase._createSingleResultSet("select firstName from swa_USERS_TABLE where emailID='"+uname+"'");
                    String imgPath = DataBase._createSingleResultSet("select imgPath from swa_USERS_TABLE where emailID='"+uname+"'");
                    String userID = DataBase._createSingleResultSet("select userID from swa_USERS_TABLE where emailID='"+uname+"'");
                    List<String> imgList = DataBase.getImagesList("select imgPath from imageTable where userID='"+userID+"'");
                    session.setAttribute("uname", uname);
                    session.setAttribute("userID", userID);
                    session.setAttribute("imgList",imgList);
                    session.setAttribute("username", firstName);
                    session.setAttribute("filePath", imgPath.replace("C:/Users/johns/Desktop/Images", "http://127.0.0.1:8887"));
                    // req.setAttribute("errorMsg", "Hey dude, we were able to log you in");
                    req.setAttribute("imgList",imgList);
                    req.setAttribute("username", firstName);
                    req.setAttribute("filePath", imgPath.replace("C:/Users/johns/Desktop/Images", "http://127.0.0.1:8887"));
                    req.setAttribute("userID", userID);
                    req.getRequestDispatcher("Pages/mainPage.jsp").
                        forward(req, resp);
                }       
            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
