<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon"  href="${pageContext.servletContext.contextPath}/image/ExamTitleIcon.ico">
    <title>登陆页面</title>
</head>
<body>

    <fmt:requestEncoding value="utf-8"/>
    <c:set var="userId" scope="page" value="${param.username}"/>  <!--取出登录功能页面输入的信息-->
    <c:set var="password" value="${param.password}"/>
    <sql:setDataSource var="onlineSystem" scope="session" driver="${initParam.driver}" user="${initParam.user}" password="${initParam.password}" url="${initParam.url}"/>
    <c:choose>
        <c:when test="${userId ne null}">  <!--如果角色是管理者角色，查询数据库服务器记录管理者角色的数据表administrators-->
            <sql:query var="users" scope="page" dataSource="${onlineSystem}" >
                select user_id,user_name,class_id,sex,role from userinfo where user_id=? and password=?;
                <sql:param value="${userId}"/>
                <sql:param value="${password}"/>
            </sql:query>
            <c:if test="${users.rowCount==1}"><!--行数等于1，证明存在id和password符合的记录，重定向到管理者角色首页-->
                <c:forEach var="row" items="${users.rows}">
                    <c:set var="id" scope="session" value="${row.user_id}" />
                    <c:set var="name" scope="session" value="${row.user_name}" />
                    <c:set var="classId" scope="session" value="${row.class_id}" />
                    <c:set var="sex" scope="session" value="${row.sex}" />
                    <c:set var="role" scope="session" value="${row.role}" />
                    <c:if test="${role eq 'root'}">
                        <c:set var="indexLine" scope="session" value="7" />
                    </c:if>
                    <c:if test="${role eq 'teacher'}">
                        <c:set var="indexLine" scope="session" value="5" />
                    </c:if>
                    <c:if test="${role eq 'student'}">
                        <c:set var="indexLine" scope="session" value="2" />
                    </c:if>
                </c:forEach>
                <c:redirect url="Index.jsp" />
            </c:if>
            <c:if test="${users.rowCount<1}"><!--行数小于1，证明账号不存在，重定向到登录功能页面-->
                <c:redirect url="../Login.jsp?message=fail"/>
            </c:if>
        </c:when>
        <c:otherwise>
            <c:redirect url="../Login.jsp"/>
        </c:otherwise>
    </c:choose>
</body>
</html>
