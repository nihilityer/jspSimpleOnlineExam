<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2021/7/30
  Time: 20:02
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
    <title>班级/单位管理页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="UnitManagement" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<c:if test="${role ne 'root'}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<body>
<c:set var="isIn" value="${param.isIn}"/>
<c:if test="${isIn ne null}">
    <c:set var="classId" value="${param.classId}"/>
    <c:set var="classType" value="${param.classType}"/>
    <c:set var="classType" value="${param.classType}"/>
    <c:set var="mangeTeacher" value="${param.mangeTeacher}"/>
    <sql:update dataSource="${onlineSystem}">
        insert into unitinfo (class_id,unit_type,mange_teacher) values (?,?,?);
        <sql:param value="${classId}"/>
        <sql:param value="${classType}"/>
        <sql:param value="${mangeTeacher}"/>
    </sql:update>
</c:if>
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
<div style="width: 85%; float: right">
    <div>
        <p>插入</p>
        <sql:query var="teacherRow" dataSource="${onlineSystem}">
            select user_id from userinfo where role='teacher';
        </sql:query>
        <table style="width: 80%;border: 1px;">
            <tr>
                <th>CLASS_ID</th>
                <th>CLASS_TYPE</th>
                <th>mangeTeacher</th>
                <th>插入</th>
            </tr>
            <tr><form>
                <td><label>
                    <input type="text" name="classId">
                </label></td>
                <td><label>
                    <select name="classType">
                        <option value="student">student</option>
                        <option value="teacher">teacher</option>
                        <option value="root">root</option>
                    </select>
                </label></td>
                <td><label>
                    <select name="mangeTeacher">
                        <c:forEach var="crow" items="${teacherRow.rows}">
                            <option value="${crow.user_id}">${crow.user_id}</option>
                        </c:forEach>
                    </select>
                </label></td><input type="hidden" name="isIn" value="notnull">
                <td><input type="submit" value="插入"></td>
            </form></tr>
        </table>
    </div>
    <sql:query var="classRow" dataSource="${onlineSystem}">
        select * from unitinfo where unit_type <> 'root';
    </sql:query>
    <c:if test="${classRow.rowCount < 1}">
        <h1>没有记录可以管理</h1>
    </c:if>
    <c:if test="${classRow.rowCount >= 1}">
        <p>结果</p>
        <table style="width: 80%;border: 1px;">
            <tr>
                <th>CLASS_ID</th>
                <th>CLASS_TYPE</th>
                <th>mangeTeacher</th>
            </tr>
            <c:forEach var="row" items="${classRow.rows}">
                <tr>
                    <td>${row.class_id}</td>
                    <td>${row.unit_type}</td>
                    <td>${row.mange_teacher}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
