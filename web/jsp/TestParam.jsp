<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/8/22
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>参数测试页</title>
    <c:if test="${indexLine eq null}">
        <c:redirect url="../Login.jsp?message=fail"/>
    </c:if>
</head>
<body>
<c:set value="${param.examName}" var="name"/>
<c:set value="${param.start}" var="start"/>
<c:set value="${param.num}" var="num"/>
<c:set value="${param.time}" var="time"/>
<h1>exam_name:    <c:out value="${name}"/></h1>
<h1>start_id:    <c:out value="${start}"/></h1>
<h1>num_q:    <c:out value="${num}"/></h1>
<h1>user_time:    <c:out value="${time}"/></h1>
</body>
</html>
