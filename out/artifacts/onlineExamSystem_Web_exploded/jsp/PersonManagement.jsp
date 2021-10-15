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
    <title>人员信息管理页</title>
</head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/main.css" type="text/css">
<c:set var="page" value="PersonManagement" />
<c:if test="${indexLine eq null}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<c:if test="${role ne 'root'}">
    <c:redirect url="../Login.jsp?message=fail"/>
</c:if>
<body>
<c:set var="isSub" value="${param.isSub}"/>
<c:set var="userId" value="${param.userId}"/>
<c:if test="${isSub ne null}">
    <c:set var="userName" value="${param.userName}"/>
    <c:set var="userClass" value="${param.userClass}"/>
    <c:set var="userSex" value="${param.userSex}"/>
    <c:set var="password" value="${param.password}"/>
    <c:set var="userRole" value="${param.userRole}"/>
    <c:if test="${isSub eq 'update'}">
        <sql:update dataSource="${onlineSystem}">
            update userinfo set user_name=?,class_id=?,sex=?,password=?,role=? where user_id=?;
            <sql:param value="${userName}"/>
            <sql:param value="${userClass}"/>
            <sql:param value="${userSex}"/>
            <sql:param value="${password}"/>
            <sql:param value="${userRole}"/>
            <sql:param value="${userId}"/>
        </sql:update>
        <c:set var="userId" value="${null}"/>
    </c:if>
    <c:if test="${isSub eq 'insert'}">
        <sql:update dataSource="${onlineSystem}">
            insert into userinfo (user_id,user_name,class_id,sex,password,role) values (?,?,?,?,?,?);
            <sql:param value="${userId}"/>
            <sql:param value="${userName}"/>
            <sql:param value="${userClass}"/>
            <sql:param value="${userSex}"/>
            <sql:param value="${password}"/>
            <sql:param value="${userRole}"/>
        </sql:update>
        <c:set var="userId" value="${null}"/>
    </c:if>
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
<div style="width: 85%;float: right;">
    <sql:query var="classRow" dataSource="${onlineSystem}">
        select class_id from unitinfo where unit_type <> 'root';
    </sql:query>
    <div>
        <table style="width: 80%;border: 1px;">
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>用户名所属班级ID</th>
                <th>性别</th>
                <th>登陆密码</th>
                <th>用户身份</th>
                <th>提交</th>
            </tr>
            <tr>
                <form id="subForm" method="post">
                    <td><input type="text" name="userID"></td>
                    <td><label>
                        <input type="text" name="userName">
                    </label></td>
                    <td><label>
                        <select name="userClass">
                            <c:forEach var="cRow" items="${classRow.rows}">
                                <option value="${cRow.class_id}">${cRow.class_id}</option>
                            </c:forEach>
                        </select>
                    </label></td>
                    <td><label>
                        <select name="userSex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </label></td>
                    <td><label>
                        <input type="password" name="password">
                    </label></td>
                    <td><label>
                        <select name="userRole">
                            <option value="student">student</option>
                            <option value="teacher">teacher</option>
                            <option value="root">root</option>
                        </select>
                    </label></td>
                    <td>
                        <input type="hidden" name="isSub" value="insert">
                        <input type="button" value="提交" onclick="(function() {
                                document.getElementById('subForm').submit();
                                })()">
                    </td>
                </form>
            </tr>
        </table>
    </div>
    <sql:query var="userInfo" dataSource="${onlineSystem}">
        select * from userinfo where role <> 'root';
    </sql:query>
    <c:if test="${userInfo.rowCount >= 1}">
        <table style="width: 80%;border: 1px;">
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>用户名所属班级ID</th>
                <th>性别</th>
                <th>登陆密码</th>
                <th>用户身份</th>
                <th>修改</th>
            </tr>
            <c:forEach var="row" items="${userInfo.rows}">
                <c:if test="${userId eq row.user_id}">
                    <tr>
                        <form id="${row.user_id}" method="post">
                            <td><c:out value="${row.user_id}"/></td>
                            <td><label>
                                <input type="text" name="userName" value="${row.user_name}">
                            </label></td>
                            <td><label>
                                <select name="userClass">
                                    <c:forEach var="cRow" items="${classRow.rows}">
                                        <option value="${cRow.class_id}">${cRow.class_id}</option>
                                    </c:forEach>
                                </select>
                            </label></td>
                            <td><label>
                                <select name="userSex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </label></td>
                            <td><label>
                                <input type="password" name="password" value="${row.password}">
                            </label></td>
                            <td><label>
                                <select name="userRole">
                                    <option value="student">student</option>
                                    <option value="teacher">teacher</option>
                                    <option value="root">root</option>
                                </select>
                            </label></td>
                            <td>
                                <input type="hidden" name="userId" value="${row.user_id}">
                                <input type="hidden" name="isSub" value="update">
                                <input type="button" value="修改" onclick="(function() {
                                        document.getElementById('${row.user_id}').submit();
                                        })()">
                            </td>
                        </form>
                    </tr>
                </c:if>
                <c:if test="${userId ne row.user_id}">
                    <tr>
                        <td><c:out value="${row.user_id}"/></td>
                        <td><c:out value="${row.user_name}"/></td>
                        <td><c:out value="${row.class_id}"/></td>
                        <td><c:out value="${row.sex}"/></td>
                        <td><c:out value="保密"/></td>
                        <td><c:out value="${row.role}"/></td>
                        <td><form id="${row.user_id}" method="post">
                            <input type="hidden" name="userId" value="${row.user_id}">
                            <input type="button" value="修改" onclick="(function() {
                                    document.getElementById('${row.user_id}').submit();
                                    })()">
                        </form></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${userInfo.rowCount < 1}">
        <h1>没有可以修改的记录</h1>
    </c:if>
</div>
<a href="#top" style="text-decoration:none"><div class="footer"><b>在线考试系统</b></div></a>
</body>
</html>
