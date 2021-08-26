package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

/**
 * @PackageName servlet
 * @ClassName NextQuestion
 * @Description
 * @Author nihilityer
 * @Date 2021/8/22 17:48
 */
public class NextQuestion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Long id = (Long) session.getAttribute("id");
        String examId = (String) session.getAttribute("examId");
        Long start = (Long) session.getAttribute("startOfA");
        String startQ = (String) session.getAttribute("start");
        Date startTime = (Date) session.getAttribute("startTime");
        int questionId = 1;
        try {
            questionId = (int) session.getAttribute("questionID");
        } catch (Exception e) {
            System.out.println(e);
            String questionID = (String) session.getAttribute("questionID");
            questionId = Integer.parseInt(questionID);
        }
        String num = (String) session.getAttribute("num");
        String trueAnswer = (String) session.getAttribute("trueAnswer");
        Long rowNum = (Long) session.getAttribute("rowNum");
        int rowINum = Math.toIntExact(rowNum);

        String user_a = req.getParameter("user_a");
        String q_type = req.getParameter("q_type");
        String bank_name = req.getParameter("bank_name");
        String bankId = req.getParameter("bankid_q");
        String score = req.getParameter("score");
        String isNext = req.getParameter("isNext");
        String surplusTime = req.getParameter("surplusTime");

        resp.setCharacterEncoding("UTF-8");
        if (isNext.equals("up")){
            session.setAttribute("questionID",questionId-1);
            session.setAttribute("surplusTime",surplusTime);
            resp.sendRedirect("Examing.jsp");
        } else if (isNext.equals("down")){
            String url = this.getServletContext().getInitParameter("url");
            String user = this.getServletContext().getInitParameter("user");
            String pwd = this.getServletContext().getInitParameter("password");
            String user_score =null;
            if (!trueAnswer.equals(user_a)) {
                user_score = "0";
            } else {
                user_score = score;
            }
            try {
                Connection connection = DriverManager.getConnection(url,user,pwd);
                Statement statement = connection.createStatement();
                ResultSet resultSet = null;
                int row =0;
                rowINum = (int) (questionId + start - 1);
                resultSet = statement.executeQuery("select order_number from examofa where order_number="+ rowINum + ";");
                if (resultSet.next()) {
                    row = statement.executeUpdate("update examofa set user_a='" + user_a + "' ,user_score='"+user_score+"'where order_number="+rowINum+";");
                } else {
                    row = statement.executeUpdate("insert into examofa (order_number, q_type, true_a, bank_name, bankid_of_q, score, user_a, user_score ) values ('"
                            +rowINum+"','"+q_type+"','"+trueAnswer+"','"+bank_name+"','"+bankId+"','"+score+"','"+user_a+"','"+user_score+"');");
                }
                if (row==1){
                    session.setAttribute("questionID",questionId+1);
                    session.setAttribute("surplusTime",surplusTime);
                    resp.sendRedirect("Examing.jsp");
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            int number = Integer.parseInt(num);
            int startNum = Math.toIntExact((Long) start);

            String url = this.getServletContext().getInitParameter("url");
            String user = this.getServletContext().getInitParameter("user");
            String pwd = this.getServletContext().getInitParameter("password");
            Connection connection = null;
            try {
                connection = DriverManager.getConnection(url,user,pwd);
                Statement statement = connection.createStatement();
                if (rowINum == startNum + number) {
                    getGrade(resp, session, id, examId, startTime, number, startNum, statement, surplusTime);
                } else {
                    String user_score =null;
                    if (!trueAnswer.equals(user_a)) {
                        user_score = "0";
                    } else {
                        user_score = score;
                    }
                    int nowRow = (int) (questionId + start - 1);
                    ResultSet resultSet;
                    resultSet = statement.executeQuery("select order_number from examofa where order_number="+ nowRow + ";");
                    if (resultSet.next()) {
                        statement.executeUpdate("update examofa set user_a='" + user_a + "' ,user_score='"+user_score+"'where order_number="+nowRow+";");
                    } else {
                        statement.executeUpdate("insert into examofa (order_number, q_type, true_a, bank_name, bankid_of_q, score, user_a, user_score ) values ('"
                                + nowRow + "','" + q_type + "','" + trueAnswer + "','" + bank_name + "','" + bankId + "','" + score + "','" + user_a + "','" + user_score + "');");
                    }
                    int orderNum = 0;
                    rowINum++;
                    while (rowINum != startNum + number) {
                        orderNum = rowINum-startNum;
                        int startQuestion = Integer.parseInt(startQ);
                        //没有获取到结果，以后获取结果是一定要先判断是否有next。
                        resultSet = statement.executeQuery("select q_type,true_a,bank_name,bankid_of_q,score from examofq where order_number='" + (startQuestion + orderNum) + "';");
                        String q_type1 = null;
                        String true_a1 = null;
                        String bank_name1 = null;
                        int bankid_of_q1 = 0;
                        int score1 = 0;
                        if (resultSet.next()) {
                            q_type1 = resultSet.getString("q_type");
                            true_a1 = resultSet.getString("true_a");
                            bank_name1 = resultSet.getString("bank_name");
                            bankid_of_q1 = resultSet.getInt("bankid_of_q");
                            score1 = resultSet.getInt("score");
                        }
                        resultSet = statement.executeQuery("select order_number from examofa where order_number="+ rowINum + ";");
                        if (!resultSet.next()) {
                            statement.executeUpdate("insert into examofa (order_number, q_type, true_a, bank_name, bankid_of_q, score, user_a, user_score ) values ('"
                                    +rowINum+"','"+q_type1+"','"+true_a1+"','"+bank_name1+"','"+bankid_of_q1+"','"+score1+"',null,0);");
                        }
                        rowINum++;
                    }
                    getGrade(resp, session, id, examId, startTime, number, startNum, statement, surplusTime);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    private void getGrade(HttpServletResponse resp, HttpSession session, Long id, String examId, Date startTime, int number, int startNum, Statement statement, String surplusTime) throws SQLException, IOException {
        ResultSet resultSet = statement.executeQuery("select user_score from examofa limit "+(startNum-1)+","+(number-1)+";");
        int grade = 0;
        while (resultSet.next()) {
            grade += resultSet.getInt("user_score");
        }
        Date subTime = new Date();
        Instant instant1 = startTime.toInstant();
        Instant instant2 = subTime.toInstant();
        ZoneId zoneId = ZoneId.systemDefault();

        LocalDateTime ldt1 = instant1.atZone(zoneId).toLocalDateTime();
        LocalDateTime ldt2 = instant2.atZone(zoneId).toLocalDateTime();
        long between = ChronoUnit.MINUTES.between(ldt1, ldt2);

        int row = statement.executeUpdate("update usedinfo set test_time=" + between + ", grade=" + grade + " where user_id=" + id + " and exam_id=" + examId + ";");
        if (row>=1) {
            session.setAttribute("startTime",null);
            session.setAttribute("surplusTime",surplusTime);
            resp.sendRedirect("OnlineExam.jsp");
        }
    }
}
