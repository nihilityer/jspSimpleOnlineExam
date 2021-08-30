package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.Arrays;

/**
 * @PackageName servlet
 * @ClassName InsertExamQuestion
 * @Description
 * @Author nihilityer
 * @Date 2021/8/29 21:47
 */
public class InsertExamQuestion extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession(true);
        int nowInsertExamSId = (int) session.getAttribute("nowInsertExamSId");
        int startId = nowInsertExamSId;
        String[] questions = req.getParameterValues("question");

        String url = this.getServletContext().getInitParameter("url");
        String user = this.getServletContext().getInitParameter("user");
        String pwd = this.getServletContext().getInitParameter("password");
        Connection connection;
        Statement statement;
        ResultSet resultSet;

        String[] bankInfo;

        try {
            connection = DriverManager.getConnection(url, user, pwd);
            statement = connection.createStatement();
            for (int i = 0; i < questions.length; i++) {
                bankInfo = questions[i].split("@");
                if (bankInfo[0].startsWith("c")) {
                    resultSet = statement.executeQuery("select cq_true from " + bankInfo[0] + " where cq_id='" + bankInfo[1] + "';");
                    if (resultSet.next()) {
                        String cq_true = resultSet.getString("cq_true");
                        statement.executeUpdate("insert into examofq (order_number,q_type,true_a,bank_name,bankid_of_q) values ('" +
                                nowInsertExamSId+"','c','"+cq_true+"','"+bankInfo[0]+"','"+bankInfo[1]+"');");
                        nowInsertExamSId++;
                    }
                } else if (bankInfo[0].startsWith("i")) {
                    resultSet = statement.executeQuery("select * from "+bankInfo[0]+" where iq_id='"+bankInfo[1]+"';");
                    if (resultSet.next()) {
                        String iq_true = resultSet.getString("iq_true");
                        statement.executeUpdate("insert into examofq (order_number,q_type,true_a,bank_name,bankid_of_q) values ('" +
                                nowInsertExamSId+"','c','"+iq_true+"','"+bankInfo[0]+"','"+bankInfo[1]+"');");
                        nowInsertExamSId++;
                    }
                } else if (bankInfo[0].startsWith("f")) {
                    resultSet = statement.executeQuery("select * from "+bankInfo[0]+" where fq_id='"+bankInfo[1]+"';");
                    if (resultSet.next()) {
                        String fq_true = resultSet.getString("fq_true");
                        statement.executeUpdate("insert into examofq (order_number,q_type,true_a,bank_name,bankid_of_q) values ('" +
                                nowInsertExamSId+"','c','"+fq_true+"','"+bankInfo[0]+"','"+bankInfo[1]+"');");
                        nowInsertExamSId++;
                    }
                } else if (bankInfo[0].startsWith("a")) {
                    resultSet = statement.executeQuery("select * from "+bankInfo[0]+" where aq_id='"+bankInfo[1]+"';");
                    if (resultSet.next()) {
                        String aq_true = resultSet.getString("aq_rt");
                        statement.executeUpdate("insert into examofq (order_number,q_type,true_a,bank_name,bankid_of_q) values ('" +
                                nowInsertExamSId+"','c','"+aq_true+"','"+bankInfo[0]+"','"+bankInfo[1]+"');");
                        nowInsertExamSId++;
                    }
                }
            }
            startId = nowInsertExamSId - startId;
            statement.executeUpdate("update examinfo set t_score='"+startId*2+"', num_q='"+startId+"' where 1 ORDER BY exam_id DESC LIMIT 1;");
            resp.sendRedirect("ExamManagement.jsp");
        } catch (SQLException | IOException exception) {
            exception.printStackTrace();
        }
    }
}
