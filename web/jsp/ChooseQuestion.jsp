<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/8/23
  Time: 19:38
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
    <title>选择题目</title>
    <c:if test="${indexLine eq null}">
        <c:redirect url="../Login.jsp?message=fail"/>
    </c:if>
    <c:set var="stage" value="${param.stage}"/>
    <c:if test="${stage eq null}">
        <c:redirect url="TestFormation.jsp"/>
    </c:if>
</head>
<body>
<c:if test="${stage eq 'frist'}">
    <c:set var="examName" value="${param.examName}"/>
    <c:set var="startTime" value="${param.startTime}"/>
    <c:set var="endTime" value="${param.endTime}"/>
    <c:set var="useTime" value="${param.useTime}"/>
    <sql:query var="startRow" dataSource="${onlineSystem}">
        select order_number from examofq;
    </sql:query>
    <c:set var="startId" value="${startRow.rowCount}"/>
    <sql:update dataSource="${onlineSystem}">
        insert into examinfo (exam_name,create_user,start_time,end_time,user_time,start_id) values(?,?,?,?,?,?);
        <sql:param value="${examName}"/>
        <sql:param value="${id}"/>
        <sql:param value="${startTime}"/>
        <sql:param value="${endTime}"/>
        <sql:param value="${useTime}"/>
        <sql:param value="${startId}"/>
    </sql:update>
    //卡在这里，之后再说
</c:if>
</body>
</html>
