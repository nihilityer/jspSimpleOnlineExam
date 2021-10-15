<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>考试页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="OnlineExam" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<body>
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
        <sql:query var="examInfo" scope="page" dataSource="${onlineSystem}">
            select exam_id,exam_name,start_time,end_time,user_time,t_score,num_q,start_id from examinfo group by exam_id;
        </sql:query>
    </c:if>
    <c:if test="${role eq 'teacher'}">
        <sql:query var="examInfo" scope="page" dataSource="${onlineSystem}">
            select exam_id,exam_name,start_time,end_time,user_time,t_score,num_q,start_id from findexaminfo where user_id=? group by exam_id;
            <sql:param value="${id}" />
        </sql:query>
    </c:if>
    <c:if test="${role eq 'student'}">
        <sql:query var="examInfo" scope="page" dataSource="${onlineSystem}">
            select exam_id,exam_name,start_time,end_time,user_time,t_score,num_q,start_id from findexaminfo where user_id=? group by exam_id;
            <sql:param value="${id}" />
        </sql:query>
    </c:if>
    <c:set var="now" value="<%=new java.util.Date()%>" />
    <c:if test="${examInfo.rowCount >= 1}">
        <div style="text-align: center;">
            <table border="1" width="75%">
                <tr>
                    <th>考试ID</th>
                    <th>考试名</th>
                    <th>可开始考试时间</th>
                    <th>最后可进入时间</th>
                    <th>考试时间</th>
                    <th>总分</th>
                    <th>题量</th>
                    <th>状态</th>
                </tr>
            <c:forEach var="row" items="${examInfo.rows}">
                <tr>
                    <td><c:out value="${row.exam_id}"/></td>
                    <td><c:out value="${row.exam_name}"/></td>
                    <td><c:out value="${row.start_time}"/></td>
                    <td><c:out value="${row.end_time}"/></td>
                    <td><c:out value="${row.user_time}"/></td>
                    <td><c:out value="${row.t_score}"/></td>
                    <td><c:out value="${row.num_q}"/></td>
                    <sql:query var="isExam" scope="page" dataSource="${onlineSystem}">
                        select info_id from usedinfo where exam_id=? and user_id=?;
                        <sql:param value="${row.exam_id}" />
                        <sql:param value="${id}" />
                    </sql:query>
                    <c:if test="${isExam.rowCount >= 1}">
                        <td><c:out value="已考试" /></td>
                    </c:if>
                    <c:if test="${isExam.rowCount < 1}">
                        <c:choose>
                            <c:when test="${now < row.start_time}">
                                <td><c:out value="未开始考试"/></td>
                            </c:when>
                            <c:when test="${now > row.end_time}">
                                <td><c:out value="考试已结束"/></td>
                            </c:when>
                            <c:otherwise>
                                <td><form action="Examing.jsp" method="post" id="sub<c:out value="${row.exam_id}"/>">
                                    <input type="hidden" value="${row.exam_name}" name="examName">
                                    <input type="hidden" value="${row.exam_id}" name="examId">
                                    <input type="hidden" value="${row.start_id}" name="start">
                                    <input type="hidden" value="1" name="question">
                                    <input type="hidden" value="${row.num_q}" name="num">
                                    <input type="hidden" value="${row.user_time}" name="time">
                                    <input type="button" value="开始考试" onclick="(function() {
                                            const res = confirm('确认开始考试，每个考试只能进入一次，中途退出将无法再进入！');
                                            if (res) {
                                            document.getElementById('sub<c:out value="${row.exam_id}"/>').submit();
                                        }
                                    })();">
                                </form> </td>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </tr>
            </c:forEach>
            </table>
        </div>
    </c:if>
    <c:if test="${examInfo.rowCount < 1}">
        <h1><c:out value="没有记录可以查询" /></h1>
    </c:if>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
