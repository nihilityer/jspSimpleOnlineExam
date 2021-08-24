<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 19:59
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
    <title>考试管理页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="ExamManagement" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<c:if test="${role eq 'student'}">
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
<div style="width: 85%;float: right">
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
    <c:set var="examID" value="${param.examID}"/>
    <c:set var="examName" value="${param.examName}"/>
    <c:set var="startTime" value="${param.startTime}"/>
    <c:set var="endTime" value="${param.endTime}"/>
    <c:set var="useTime" value="${param.useTime}"/>
    <c:if test="${useTime ne null}">
        <sql:update dataSource="${onlineSystem}">
            update examinfo set exam_name=?,start_time=?,end_time=?,user_time=? where exam_id=?;
            <sql:param value="${examName}"/>
            <sql:param value="${startTime}"/>
            <sql:param value="${endTime}"/>
            <sql:param value="${useTime}"/>
            <sql:param value="${examID}"/>
        </sql:update>
        <c:set var="useTime" value="${null}"/>
    </c:if>
    <c:if test="${examInfo.rowCount >= 1}">
        <div style="text-align: center;">
            <table border="1" width="80%">
                <tr>
                    <th>考试ID</th>
                    <th>考试名</th>
                    <th>可开始考试时间</th>
                    <th>最后可进入时间</th>
                    <th>考试时间</th>
                    <th>总分</th>
                    <th>题量</th>
                    <th>修改</th>
                </tr>
                <c:forEach var="row" items="${examInfo.rows}">
                    <c:if test="${examID eq row.exam_id}">
                        <tr>
                            <td><c:out value="${row.exam_id}"/></td>
                            <td><label>
                                <input type="text" name="examName" value="${row.exam_name}">
                            </label></td>
                            <td><label>
                                <input type="datetime-local" name="startTime" value="${row.start_time}">
                            </label></td>
                            <td><label>
                                <input type="datetime-local" name="endTime" value="${row.end_time}">
                            </label></td>
                            <td><label>
                                <input type="text" name="useTime" value="${row.user_time}">
                            </label></td>
                            <td><c:out value="${row.t_score}"/></td>
                            <td><c:out value="${row.num_q}"/></td
                            <td><form id="${row.exam_id}" method="post">
                                <input type="hidden" value="${row.exam_id}" name="examID">
                                <input type="button" value="修改" onclick="(function() {
                                  document.getElementById('${row.exam_id}').submit();
                                })()">
                            </form></td>
                        </tr>
                    </c:if>
                    <c:if test="${examID ne row.exam_id}">
                        <tr>
                            <td><c:out value="${row.exam_id}"/></td>
                            <td><c:out value="${row.exam_name}"/></td>
                            <td><c:out value="${row.start_time}"/></td>
                            <td><c:out value="${row.end_time}"/></td>
                            <td><c:out value="${row.user_time}"/></td>
                            <td><c:out value="${row.t_score}"/></td>
                            <td><c:out value="${row.num_q}"/></td
                            <td><form id="${row.exam_id}" method="post">
                                <input type="hidden" value="${row.exam_id}" name="examID">
                                <input type="button" value="修改" onclick="(function() {
                                    document.getElementById('${row.exam_id}').submit();
                                })()">
                            </form></td>
                        </tr>
                    </c:if>
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
