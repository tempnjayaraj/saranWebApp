import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

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
@WebServlet(urlPatterns = "/upload")
public class upload extends HttpServlet{
    // protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //     String path = new File(".").getCanonicalPath();
    //     System.out.println("Working from "+path);
    //     req.getRequestDispatcher("Pages/index.jsp").
    //                     forward(req, resp);
    // }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String savePath = "C:/Users/johns/Desktop/Images";
        String userID = (String) req.getSession(false).getAttribute("userID");
        // List<String> imgList = (List<String>) req.getSession(false).getAttribute("imgList");
        String firstName = (String) req.getSession(false).getAttribute("username");
        String imgPath = (String) req.getSession(false).getAttribute("filePath");
        Date date = new Date();
        Part part=req.getPart("uploadFile");
        String fileName=userID+date.getTime()+".jpg";
        part.write(savePath + File.separator + fileName);
        String filePath= savePath + File.separator + fileName ;
        try {
            DataBase.postintoDB("insert into imageTable values('"+userID+"','"+filePath+"')");
            String sql = "UPDATE swa_USERS_TABLE SET imgPath = '"+filePath +"'WHERE userID = '"+userID+"'";
            DataBase.postintoDB(sql);
            String uname = (String) req.getSession(false).getAttribute("uname");
            imgPath = DataBase._createSingleResultSet("select imgPath from swa_USERS_TABLE where emailID='"+uname+"'");
            List<String> imgList = DataBase.getImagesList("select imgPath from imageTable where userID='"+userID+"'");

            req.setAttribute("imgList",imgList);
            req.setAttribute("username", firstName);
            req.setAttribute("filePath", imgPath.replace("C:/Users/johns/Desktop/Images", "http://127.0.0.1:8887"));
            req.setAttribute("userID", userID);
            // System.out.println(imgList+firstName+imgPath+userID);
            req.getRequestDispatcher("Pages/mainPage.jsp").
                        forward(req, resp);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}