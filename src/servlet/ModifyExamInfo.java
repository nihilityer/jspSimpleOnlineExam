package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

/**
 * @PackageName servlet
 * @ClassName ModifyExamInfo
 * @Description 组卷页和考试信息修改页都由这个servlet实现
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
        HttpSession session = req.getSession(true);
        Long id = (Long) session.getAttribute("id");

        String examID = req.getParameter("examID");
        String examName = req.getParameter("examName");

        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");

        String useTime = req.getParameter("useTime");
        String operation = req.getParameter("operation");

        String url = this.getServletContext().getInitParameter("url");
        String user = this.getServletContext().getInitParameter("user");
        String pwd = this.getServletContext().getInitParameter("password");
        Connection connection;
        Statement statement;
        int startId = 0;

        try {
            connection = DriverManager.getConnection(url, user, pwd);
            statement = connection.createStatement();
            if (operation.equals("modify")) {
                statement.executeUpdate("update examinfo set exam_name='"+examName+
                                        "', start_time='"+startTime+
                                        "', end_time='"+endTime+
                                        "', user_time='"+useTime+"' where exam_id='"+examID+"';");
                resp.sendRedirect("ExamManagement.jsp");
            } else if (operation.equals("insert")) {
                ResultSet resultSet = statement.executeQuery("select * from examofq;");
                while (resultSet.next()) {
                    startId++;
                }
                statement.executeUpdate("insert into examinfo (exam_name,create_user,start_time,end_time,user_time,start_id) values " +
                        "('" +examName+"','"+id+"','"+startTime+"','"+endTime+"','"+useTime+"','"+startId+"');");
                resp.sendRedirect("ChooseQuestion.jsp");
            }
        } catch (SQLException | IOException exception) {
            exception.printStackTrace();
        }
    }
}
