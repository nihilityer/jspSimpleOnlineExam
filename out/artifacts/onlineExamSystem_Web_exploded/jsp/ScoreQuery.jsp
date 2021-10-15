<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 20:19
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
    <c:if test="${role eq 'root'}">
        <sql:query var="gradeInfo" scope="page" dataSource="${onlineSystem}">
            select * from usedinfo;
        </sql:query>
    </c:if>
    <c:if test="${role eq 'teacher'}">
        <sql:query var="gradeInfo" scope="page" dataSource="${onlineSystem}">
            select * from findteachermange where mange_teacher=?;
            <sql:param value="${id}" />
        </sql:query>
    </c:if>
    <c:if test="${role eq 'student'}">
        <sql:query var="gradeInfo" scope="page" dataSource="${onlineSystem}">
            select * from usedinfo where user_id=?;
            <sql:param value="${id}" />
        </sql:query>
    </c:if>
    <c:choose>
        <c:when test="${gradeInfo.rowCount >= 1}">
            <div style="text-align: center;">
                <table border="1" width="75%">
                    <tr>
                        <th>考生</th>
                        <th>考试开始时间</th>
                        <th>用时</th>
                        <th>考试名</th>
                        <th>题量</th>
                        <th>成绩</th>
                        <th>详情</th>
                    </tr>
                    <c:forEach var="row" items="${gradeInfo.rows}">
                        <tr>
                            <td><c:out value="${row.user_id}" /></td>
                            <td><c:out value="${row.start_exam_time}" /></td>
                            <td><c:out value="${row.test_time}" /></td>
                            <td><c:out value="${row.exam_name}" /></td>
                            <td><c:out value="${row.question_num}" /></td>
                            <td><c:out value="${row.grade}" /></td>
                            <td><form action="ScoreDetails.jsp" method="post"><input type="hidden" name="start" value="${row.start_id}">
                                <input type="hidden" name="num" value="${row.question_num}">
                                <input type="submit" value="详情">
                            </form> </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div style="text-align: center;">
                <h1><c:out value="没有记录可以查询" /></h1>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
