package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @PackageName servlet
 * @ClassName ModifyExamInfo
 * @Description
 * @Author nihilityer
 * @Date 2021/8/29 10:08
 */
public class ModifyExamInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String examID = req.getParameter("examID");
        String examName = req.getParameter("examName");

        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");

        String useTime = req.getParameter("useTime");
        String operation = req.getParameter("operation");

        String format = "yyyy-MM-dd'T'HH:mm";

        String url = this.getServletContext().getInitParameter("url");
        String user = this.getServletContext().getInitParameter("user");
        String pwd = this.getServletContext().getInitParameter("password");
        Connection connection;
        Statement statement;

        try {
            connection = DriverManager.getConnection(url, user, pwd);
            statement = connection.createStatement();
            if (operation.equals("modify")) {
                statement.executeUpdate("update examinfo set exam_name='"+examName+
                                        "', start_time='"+startTime+
                                        "', end_time='"+endTime+
                                        "', user_time='"+useTime+"' where exam_id='"+examID+"';");
                resp.sendRedirect("ExamManagement.jsp");
            }
        } catch (SQLException | IOException exception) {
            System.out.println(exception);
        }
    }
}
