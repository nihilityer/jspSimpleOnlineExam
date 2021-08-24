<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon"  href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>主页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="Index" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<body style="overflow-y: hidden">
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
            <a href="<c:out value="${name}.jsp"/>"><li style="${class1}">${name}</li></a>
        </c:forTokens>
    </ul>
</div>
<div>
    <div style="text-align: center;">
        <h1>欢迎来到在线考试系统！</h1>
    </div>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
