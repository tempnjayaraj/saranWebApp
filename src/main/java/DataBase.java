import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author johns
 */
public class DataBase {

    public static Connection connectDatabase(String database_name) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {

        
       final String DB_URL="jdbc:sqlserver://localhost\\MSSQLSERVER;Database=Archi;portNumber=1433";
       final String USER = "root";
       final String PASS = "root";

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        Connection connection = DriverManager.getConnection(DB_URL,USER,PASS);

        return connection;
    }

    public static Statement createStatement(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement;
    }

    public static ResultSet createResultSet(Connection connection, Statement statement, String sql) throws ClassNotFoundException, SQLException {
        ResultSet result = statement.executeQuery(sql);
        return result;
    }

    public static List createMultipleResultSet(String sql) throws SQLException, ClassNotFoundException, IOException {

        List<ArrayList<String>> wholeList = new ArrayList<>();
        ArrayList<String> columnName = new ArrayList<String>();

        Connection connection = DataBase.connectDatabase("Archi");
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(sql);
        ResultSetMetaData rsmd = result.getMetaData();
        int numberOfColumns = rsmd.getColumnCount();
        for (int i = 1; i <= numberOfColumns; i++) {
            String colName = rsmd.getColumnName(i);
            columnName.add(colName);
        }
        wholeList.add(columnName);
        while (result.next()) {

            ArrayList<String> individualRecord = new ArrayList<String>();
            for (int j = 0; j < numberOfColumns; j++) {

                individualRecord.add(result.getString(columnName.get(j)));

            }
            wholeList.add(individualRecord);

        }
        DataBase.closeConnectionAfterGET(connection, statement, result);
        for (ArrayList obj : wholeList) {
            ArrayList<String> temp = obj;
            for (String string : temp) {
                System.out.print(string + "\t|\t");
            }
            System.out.println();
        }
        return wholeList;
    }

    public static String createSingleResultSet(String sql) throws SQLException, ClassNotFoundException, IOException {
        String password = " ";
        Connection connection = DataBase.connectDatabase("Archi");
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {
            password = result.getString("e_pass");
        }

        DataBase.closeConnectionAfterGET(connection, statement, result);

        return password;
    }

    public static String _createSingleResultSet(String sql) throws SQLException, ClassNotFoundException, IOException {
        String string = "";
        Connection connection = DataBase.connectDatabase("Archi");
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {
            string = result.getString(1);
        }

        DataBase.closeConnectionAfterGET(connection, statement, result);

        return string;
    }

    public static List<String> getImagesList(String sql) throws SQLException, ClassNotFoundException, IOException {
        List<String> imgList = new ArrayList<String>();
        String string = "";
        Connection connection = DataBase.connectDatabase("Archi");
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {
            string = result.getString(1);
            System.out.println(string);
            imgList.add(string);
        }

        DataBase.closeConnectionAfterGET(connection, statement, result);

        return imgList;
    }

    public static String createSingleResultSet_2(String sql) throws SQLException, ClassNotFoundException, IOException {
        String email = " ";
        Connection connection = DataBase.connectDatabase("Archi");
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {
            email = result.getString("e_email");
        }

        DataBase.closeConnectionAfterGET(connection, statement, result);

        return email;
    }

    public static void postintoDB1(List newForm) throws ClassNotFoundException, SQLException, IOException {
        Connection connection = DataBase.connectDatabase("master");
        Statement statement = connection.createStatement();
        String name = newForm.get(0).toString();
        String pass = newForm.get(1).toString();
        String company = newForm.get(2).toString();
        String designation = newForm.get(3).toString();
        System.out.println(name + pass + company + designation);
        // String sql = "insert into users values('"+name+"',"+pass+",'"+company+"',"+"'"+designation+"')";
        String sql = "insert into users values('" + name + "','" + pass + "','" + company + "','" + designation + "')";
        statement.executeUpdate(sql);
        System.out.println("Created a new User -" + name);
        DataBase.closeConnectionAfterPOST(connection, statement);
    }

    public static void postintoDB(String sql) throws ClassNotFoundException, SQLException, IOException {
        Connection connection = DataBase.connectDatabase("Archi");
        Statement statement = connection.createStatement();
        statement.executeUpdate(sql);
        DataBase.closeConnectionAfterPOST(connection, statement);
    }

    public static void closeConnectionAfterGET(Connection connection, Statement statement, ResultSet resultset) throws SQLException {
        connection.close();
        statement.close();
        resultset.close();
    }

    public static void closeConnectionAfterPOST(Connection connection, Statement statement) throws SQLException {
        connection.close();
        statement.close();
    }

}