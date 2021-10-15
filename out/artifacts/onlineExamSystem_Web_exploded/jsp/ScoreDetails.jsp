<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/8/21
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>成绩查询页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="ScoreQuery" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<body>
<fmt:requestEncoding value="utf-8"/>
<div class="title"><b>在线考试系统</b>
    <span class="userinfo">用户名：<c:out value="${name}"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="ModifyPassword.jsp">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Exit">退出</a> </span>
</div>
<div class="leftBar">
    <ul>
        <c:forTokens items="Index,ScoreQuery,OnlineExam,Questions,TestFormation,ExamManagement,PersonManagement,UnitManagement" begin="0" end="${indexLine}" delims="," var="name">
            <c:if test="${name eq page}" >
                <c:set var="class1" value="background-color: #c8c8dc" />
            </c:if>
            <c:if test="${name ne page}">
                <c:set var="class1" value="background-color: #bff3f3" />
            </c:if>
            <li style="${class1}"><a href="<c:out value="${name}.jsp"/>">${name}</a></li>
        </c:forTokens>
    </ul>
</div>
<div>
    <c:set var="start" value="${param.start}" property="Interger"/>
    <c:set var="num" value="${param.num}" />
    <sql:query var="questionInfo" scope="page" dataSource="${onlineSystem}">
        select * from examofa order by order_number limit ${start-1},${num};
    </sql:query>
    <c:if test="${questionInfo.rowCount >= 1}">
        <c:forEach var="row" items="${questionInfo.rows}">
            <c:if test="${row.q_type eq 'c'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where cq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <p>
                        <c:out value="${row.order_number - start +1}" />&nbsp;<c:out value="${rowP.cq_title}" /><br>
                        <c:out value="${rowP.cq_a}" />&nbsp;&nbsp;<c:out value="${rowP.cq_b}" /><br>
                        <c:out value="${rowP.cq_c}" />&nbsp;&nbsp;<c:out value="${rowP.cq_d}" /><br>
                        <c:out value="${rowP.cq_true}" />&nbsp;&nbsp;<c:out value="${row.user_a}" /><br>
                        <c:out value="${row.score}" />&nbsp;&nbsp;<c:out value="${row.user_score}" /><br><br>
                    </p>
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>没有选择题的记录</p>
                </c:if>
            </c:if>
            <c:if test="${row.q_type eq 'i'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where iq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <p>
                        <c:out value="${row.order_number - start +1}" />&nbsp;<c:out value="${rowP.iq_title}" /><br>
                        <c:out value="${rowP.iq_true}" />&nbsp;&nbsp;<c:out value="${row.user_a}" /><br>
                        <c:out value="${row.score}" />&nbsp;&nbsp;<c:out value="${row.user_score}" /><br><br>
                    </p>
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>没有判断题的记录</p>
                </c:if>
            </c:if>
            <c:if test="${row.q_type eq 'f'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where fq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <p>
                        <c:out value="${row.order_number - start +1}" />&nbsp;<c:out value="${rowP.fq_title}" /><br>
                        <c:out value="${rowP.fq_true}" />&nbsp;&nbsp;<c:out value="${row.user_a}" /><br>
                        <c:out value="${row.score}" />&nbsp;&nbsp;<c:out value="${row.user_score}" /><br><br>
                    </p>
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>没有填空题的记录</p>
                </c:if>
            </c:if>
            <c:if test="${row.q_type eq 'a'}">
                <sql:query var="question" scope="page" dataSource="${onlineSystem}">
                    select * from ${row.bank_name} where aq_id=?;
                    <sql:param value="${row.bankid_of_q}" />
                </sql:query>
                <c:forEach var="rowP" items="${question.rows}">
                    <p>
                        <c:out value="${row.order_number - start +1}" />&nbsp;<c:out value="${rowP.aq_title}" /><br>
                        <c:if test="${row.aq_true eq null}">
                            <c:out value="没有准确答案" />
                        </c:if>
                        <c:if test="${row.aq_true ne null}">
                            <c:out value="${rowP.aq_true}" />
                        </c:if><br>
                        <c:out value="${row.user_a}" /><br>
                        <c:out value="${row.score}" />&nbsp;&nbsp;<c:out value="${row.user_score}" /><br><br>
                    </p>
                </c:forEach>
                <c:if test="${questionInfo.rowCount < 1}">
                    <p>没有问答题题的记录</p>
                </c:if>
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${questionInfo.rowCount < 1}">
        <p>没有记录</p>
    </c:if>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
