<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>组卷页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="TestFormation" />
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
<div style="width: 80%; float: right">
<form method="post" action="">
    <label>
        考试名<input type="text" name="examName"><br>
    </label>
    <label>
        可开始考试时间<input type="datetime-local" name="start_time" value="<%=new java.util.Date()%>"><br>
    </label>
    <label>
        最后可进入时间<input type="datetime-local" name="end_time" value="<%=new java.util.Date()%>"><br>
    </label>
    <label>
        考试时间<input type="number" name="use_time" min="1" max="180"><br>
    </label>
    <input type="hidden" value="first" name="stage">
    <input type="submit" value="开始选择题目">
</form>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
